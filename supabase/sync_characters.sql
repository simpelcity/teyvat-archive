-- sync_characters(payload): makes the database match the `characters` array from
-- genshin-account/characters.json. Only rows whose values changed are written;
-- build rows that are no longer in the JSON (e.g. an unequipped relic) are deleted.
-- Run this file once in the Supabase SQL editor, then use `pnpm sync`.

create or replace function sync_characters(payload jsonb)
returns integer
language plpgsql
set search_path = public
as $$
declare
  c jsonb; b jsonb; w jsonb;
  v_cid bigint; v_build bigint; v_bw bigint;
  v_skill_ids bigint[]; v_relic_ids bigint[]; v_set_ids bigint[];
  n int; total int := 0;
begin
  for c in select * from jsonb_array_elements(payload) loop
    b := c->'base'; w := c->'weapon'; v_cid := (b->>'id')::bigint;

    -- Character
    insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (v_cid, b->>'name', b->>'icon', b->>'image', b->>'side_icon', b->>'element', (b->>'rarity')::int2, (b->>'weapon_type')::int2)
    on conflict (id) do update set name = excluded.name, icon = excluded.icon, image = excluded.image, side_icon = excluded.side_icon,
      element = excluded.element, rarity = excluded.rarity, weapon_type = excluded.weapon_type
    where characters is distinct from excluded;
    get diagnostics n = row_count; total := total + n;

    -- Build (first build of the character)
    select id into v_build from character_builds where character_id = v_cid order by id limit 1;
    if v_build is null then
      insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
      values (v_cid, (b->>'level')::int2, (b->>'fetter')::int2, (b->>'actived_constellation_num')::int2, (b->>'is_chosen')::bool)
      returning id into v_build;
      total := total + 1;
    else
      update character_builds
      set level = (b->>'level')::int2, fetter = (b->>'fetter')::int2,
          active_constellation_num = (b->>'actived_constellation_num')::int2, is_chosen = (b->>'is_chosen')::bool, updated_at = now()
      where id = v_build
        and (level, fetter, active_constellation_num, is_chosen)
            is distinct from ((b->>'level')::int2, (b->>'fetter')::int2, (b->>'actived_constellation_num')::int2, (b->>'is_chosen')::bool);
      get diagnostics n = row_count; total := total + n;
    end if;

    -- Weapon
    insert into weapons (id, name, icon, type, type_name, rarity, description)
    values ((w->>'id')::bigint, w->>'name', w->>'icon', (w->>'type')::int2, w->>'type_name', (w->>'rarity')::int2, w->>'desc')
    on conflict (id) do update set name = excluded.name, icon = excluded.icon, type = excluded.type, type_name = excluded.type_name,
      rarity = excluded.rarity, description = excluded.description
    where weapons is distinct from excluded;
    get diagnostics n = row_count; total := total + n;

    merge into build_weapons t
    using (select (w->>'id')::bigint weapon_id, (w->>'level')::int2 level, (w->>'promote_level')::int2 promote_level, (w->>'affix_level')::int2 affix_level) s
    on t.build_id = v_build
    when matched and (t.weapon_id, t.level, t.promote_level, t.affix_level) is distinct from (s.weapon_id, s.level, s.promote_level, s.affix_level) then
      update set weapon_id = s.weapon_id, level = s.level, promote_level = s.promote_level, affix_level = s.affix_level
    when not matched then
      insert (build_id, weapon_id, level, promote_level, affix_level) values (v_build, s.weapon_id, s.level, s.promote_level, s.affix_level);
    get diagnostics n = row_count; total := total + n;
    select id into v_bw from build_weapons where build_id = v_build;

    merge into build_weapon_properties t
    using (
      select p.slot, (p.v->>'property_type')::bigint pt,
        nullif(replace(p.v->>'base', '%', ''), '')::numeric base_value,
        nullif(replace(p.v->>'add', '%', ''), '')::numeric add_value,
        nullif(p.v->>'final', '') final_value
      from (values ('main', w->'main_property'), ('sub', w->'sub_property')) p(slot, v)
      where jsonb_typeof(p.v) = 'object'
    ) s
    on t.build_weapon_id = v_bw and t.property_slot = s.slot
    when matched and (t.property_type_id, t.base_value, t.add_value, t.final_value) is distinct from (s.pt, s.base_value, s.add_value, s.final_value) then
      update set property_type_id = s.pt, base_value = s.base_value, add_value = s.add_value, final_value = s.final_value
    when not matched then
      insert (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value) values (v_bw, s.pt, s.slot, s.base_value, s.add_value, s.final_value)
    when not matched by source and t.build_weapon_id = v_bw then delete;
    get diagnostics n = row_count; total := total + n;

    -- Constellations
    insert into constellations (id, character_id, name, icon, effect, position)
    select (k->>'id')::bigint, v_cid, k->>'name', k->>'icon', k->>'effect', (k->>'pos')::int2
    from jsonb_array_elements(coalesce(c->'constellations', '[]')) k
    on conflict (id) do update set name = excluded.name, icon = excluded.icon, effect = excluded.effect, position = excluded.position
    where constellations.character_id = excluded.character_id and constellations is distinct from excluded;
    get diagnostics n = row_count; total := total + n;

    merge into build_constellations t
    using (
      select (k->>'id')::bigint cons_id, (k->>'is_actived')::bool is_actived, (k->>'is_enhanced')::bool is_enhanced,
        coalesce(k->>'enhanced_effect', '') enhanced_effect, (k->>'can_enhanced')::bool can_enhanced
      from jsonb_array_elements(coalesce(c->'constellations', '[]')) k
      join constellations x on x.id = (k->>'id')::bigint and x.character_id = v_cid
    ) s
    on t.build_id = v_build and t.constellation_id = s.cons_id
    when matched and (t.is_actived, t.is_enhanced, t.enhanced_effect, t.can_enhanced) is distinct from (s.is_actived, s.is_enhanced, s.enhanced_effect, s.can_enhanced) then
      update set is_actived = s.is_actived, is_enhanced = s.is_enhanced, enhanced_effect = s.enhanced_effect, can_enhanced = s.can_enhanced
    when not matched then
      insert (build_id, constellation_id, is_actived, is_enhanced, enhanced_effect, can_enhanced) values (v_build, s.cons_id, s.is_actived, s.is_enhanced, s.enhanced_effect, s.can_enhanced)
    when not matched by source and t.build_id = v_build then delete;
    get diagnostics n = row_count; total := total + n;

    -- Skills. A skill id that already belongs to another character is left alone (Baizhu / Lan Yan share two ids).
    insert into skills (id, character_id, name, icon, skill_type_id, description)
    select (k->>'skill_id')::bigint, v_cid, k->>'name', k->>'icon', (k->>'skill_type')::int4, k->>'desc'
    from jsonb_array_elements(coalesce(c->'skills', '[]')) k
    on conflict (id) do update set name = excluded.name, icon = excluded.icon, skill_type_id = excluded.skill_type_id, description = excluded.description
    where skills.character_id = excluded.character_id and skills is distinct from excluded;
    get diagnostics n = row_count; total := total + n;
    select coalesce(array_agg(id), '{}') into v_skill_ids from skills where character_id = v_cid;

    merge into skill_affixes t
    using (
      select (k->>'skill_id')::bigint skill_id, a.v->>'name' name, coalesce(a.v->>'value', '') value, a.i::int2 position
      from jsonb_array_elements(coalesce(c->'skills', '[]')) k
      cross join lateral jsonb_array_elements(coalesce(k->'skill_affix_list', '[]')) with ordinality a(v, i)
      where (k->>'skill_id')::bigint = any(v_skill_ids)
    ) s
    on t.skill_id = s.skill_id and t.position = s.position
    when matched and (t.name, t.value) is distinct from (s.name, s.value) then update set name = s.name, value = s.value
    when not matched then insert (skill_id, name, value, position) values (s.skill_id, s.name, s.value, s.position)
    when not matched by source and t.skill_id = any(v_skill_ids) then delete;
    get diagnostics n = row_count; total := total + n;

    merge into build_skills t
    using (
      select (k->>'skill_id')::bigint skill_id, (k->>'level')::int2 level, (k->>'is_unlock')::bool is_unlock, (k->>'is_enhanced')::bool is_enhanced,
        coalesce(k->>'enhanced_desc', '') enhanced_desc, (k->>'can_enhanced')::bool can_enhanced
      from jsonb_array_elements(coalesce(c->'skills', '[]')) k
      where (k->>'skill_id')::bigint = any(v_skill_ids)
    ) s
    on t.build_id = v_build and t.skill_id = s.skill_id
    when matched and (t.level, t.is_unlock, t.is_enhanced, t.enhanced_desc, t.can_enhanced) is distinct from (s.level, s.is_unlock, s.is_enhanced, s.enhanced_desc, s.can_enhanced) then
      update set level = s.level, is_unlock = s.is_unlock, is_enhanced = s.is_enhanced, enhanced_desc = s.enhanced_desc, can_enhanced = s.can_enhanced
    when not matched then
      insert (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced) values (v_build, s.skill_id, s.level, s.is_unlock, s.is_enhanced, s.enhanced_desc, s.can_enhanced)
    when not matched by source and t.build_id = v_build then delete;
    get diagnostics n = row_count; total := total + n;

    -- Costumes
    insert into costumes (id, character_id, name, icon)
    select distinct on ((k->>'id')::bigint) (k->>'id')::bigint, v_cid, k->>'name', k->>'icon'
    from jsonb_array_elements(coalesce(c->'costumes', '[]')) k
    on conflict (id) do update set name = excluded.name, icon = excluded.icon
    where costumes.character_id = excluded.character_id and costumes is distinct from excluded;
    get diagnostics n = row_count; total := total + n;

    merge into build_costumes t
    using (select distinct (k->>'id')::bigint costume_id from jsonb_array_elements(coalesce(c->'costumes', '[]')) k) s
    on t.build_id = v_build and t.costume_id = s.costume_id
    when not matched then insert (build_id, costume_id) values (v_build, s.costume_id)
    when not matched by source and t.build_id = v_build then delete;
    get diagnostics n = row_count; total := total + n;

    -- Stats
    merge into build_properties t
    using (
      select x.category, (p->>'property_type')::bigint pt, nullif(p->>'base', '') base_value, nullif(p->>'add', '') add_value, nullif(p->>'final', '') final_value
      from (values ('selected', 'selected_properties'), ('base', 'base_properties'), ('extra', 'extra_properties'), ('element', 'element_properties')) x(category, key)
      cross join lateral jsonb_array_elements(coalesce(c->x.key, '[]')) p
    ) s
    on t.build_id = v_build and t.property_type_id = s.pt and t.category = s.category
    when matched and (t.base_value, t.add_value, t.final_value) is distinct from (s.base_value, s.add_value, s.final_value) then
      update set base_value = s.base_value, add_value = s.add_value, final_value = s.final_value
    when not matched then
      insert (build_id, property_type_id, category, base_value, add_value, final_value) values (v_build, s.pt, s.category, s.base_value, s.add_value, s.final_value)
    when not matched by source and t.build_id = v_build then delete;
    get diagnostics n = row_count; total := total + n;

    -- Relic sets, relics
    insert into relic_sets (id, name)
    select distinct on ((r->'set'->>'id')::bigint) (r->'set'->>'id')::bigint, r->'set'->>'name'
    from jsonb_array_elements(coalesce(c->'relics', '[]')) r
    on conflict (id) do update set name = excluded.name where relic_sets is distinct from excluded;
    get diagnostics n = row_count; total := total + n;
    select coalesce(array_agg(distinct (r->'set'->>'id')::bigint), '{}') into v_set_ids from jsonb_array_elements(coalesce(c->'relics', '[]')) r;

    merge into relic_set_affixes t
    using (
      select distinct on (set_id, activation_number) set_id, activation_number, effect from (
        select (r->'set'->>'id')::bigint set_id, (a->>'activation_number')::int2 activation_number, a->>'effect' effect
        from jsonb_array_elements(coalesce(c->'relics', '[]')) r
        cross join lateral jsonb_array_elements(coalesce(r->'set'->'affixes', '[]')) a
      ) x
    ) s
    on t.set_id = s.set_id and t.activation_number = s.activation_number
    when matched and t.effect is distinct from s.effect then update set effect = s.effect
    when not matched then insert (set_id, activation_number, effect) values (s.set_id, s.activation_number, s.effect)
    when not matched by source and t.set_id = any(v_set_ids) then delete;
    get diagnostics n = row_count; total := total + n;

    insert into relics (id, name, icon, pos_name)
    select distinct on ((r->>'id')::bigint) (r->>'id')::bigint, r->>'name', r->>'icon', r->>'pos_name'
    from jsonb_array_elements(coalesce(c->'relics', '[]')) r
    on conflict (id) do update set name = excluded.name, icon = excluded.icon, pos_name = excluded.pos_name
    where relics is distinct from excluded;
    get diagnostics n = row_count; total := total + n;

    merge into build_relics t
    using (
      select (r->>'id')::bigint relic_id, (r->'set'->>'id')::bigint set_id, (r->>'pos')::int2 position, (r->>'rarity')::int2 rarity,
        (r->>'level')::int2 level, (r->'main_property'->>'property_type')::bigint main_pt, r->'main_property'->>'value' main_value,
        coalesce((r->'main_property'->>'times')::int2, 0) main_times
      from jsonb_array_elements(coalesce(c->'relics', '[]')) r
    ) s
    on t.build_id = v_build and t.position = s.position
    when matched and (t.relic_id, t.set_id, t.rarity, t.level, t.main_property_type_id, t.main_value, t.main_times)
                     is distinct from (s.relic_id, s.set_id, s.rarity, s.level, s.main_pt, s.main_value, s.main_times) then
      update set relic_id = s.relic_id, set_id = s.set_id, rarity = s.rarity, level = s.level,
        main_property_type_id = s.main_pt, main_value = s.main_value, main_times = s.main_times
    when not matched then
      insert (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values (v_build, s.relic_id, s.set_id, s.position, s.rarity, s.level, s.main_pt, s.main_value, s.main_times)
    when not matched by source and t.build_id = v_build then delete;
    get diagnostics n = row_count; total := total + n;
    select coalesce(array_agg(id), '{}') into v_relic_ids from build_relics where build_id = v_build;

    merge into build_relic_substats t
    using (
      select br.id build_relic_id, (sp->>'property_type')::bigint pt, sp->>'value' value, coalesce((sp->>'times')::int2, 0) times
      from jsonb_array_elements(coalesce(c->'relics', '[]')) r
      join build_relics br on br.build_id = v_build and br.position = (r->>'pos')::int2
      cross join lateral jsonb_array_elements(coalesce(r->'sub_property_list', '[]')) sp
    ) s
    on t.build_relic_id = s.build_relic_id and t.property_type_id = s.pt
    when matched and (t.value, t.times) is distinct from (s.value, s.times) then update set value = s.value, times = s.times
    when not matched then insert (build_relic_id, property_type_id, value, times) values (s.build_relic_id, s.pt, s.value, s.times)
    when not matched by source and t.build_relic_id = any(v_relic_ids) then delete;
    get diagnostics n = row_count; total := total + n;

    -- Recommended main stats and substats
    merge into character_relic_recommendations t
    using (
      select distinct x.slot, v::bigint pt
      from (values ('sand', 'sand_main_property_list'), ('goblet', 'goblet_main_property_list'), ('circlet', 'circlet_main_property_list')) x(slot, key)
      cross join lateral jsonb_array_elements_text(coalesce(c->'recommend_relic_property'->'recommend_properties'->x.key, '[]')) v
    ) s
    on t.character_id = v_cid and t.slot = s.slot and t.property_type_id = s.pt
    when not matched then insert (character_id, slot, property_type_id) values (v_cid, s.slot, s.pt)
    when not matched by source and t.character_id = v_cid then delete;
    get diagnostics n = row_count; total := total + n;

    merge into character_recommended_substats t
    using (
      select distinct v::bigint pt
      from jsonb_array_elements_text(coalesce(c->'recommend_relic_property'->'recommend_properties'->'sub_property_list', '[]')) v
    ) s
    on t.character_id = v_cid and t.property_type_id = s.pt
    when not matched then insert (character_id, property_type_id) values (v_cid, s.pt)
    when not matched by source and t.character_id = v_cid then delete;
    get diagnostics n = row_count; total := total + n;
  end loop;

  return total;
end;
$$;

-- Only the service role key (used by `pnpm sync`) may call it; anon/authenticated could otherwise overwrite data.
revoke execute on function sync_characters(jsonb) from public, anon, authenticated;
grant execute on function sync_characters(jsonb) to service_role;
