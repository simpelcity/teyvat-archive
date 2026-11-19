-- Part 2 of 13. Generated from app/data/character_detail.ts.
-- Insert-only and safe to re-run. Run the parts in order in the Supabase SQL editor.
begin;

-- Traveler (10000008)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000008, 'Traveler', 'https://fastcdn.hoyoverse.com/static-resource-v2/2023/09/26/10dede5c05005ebb96bbe01f8408e775_7397178366194463086.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/10fcbb4bb21456b3d7b9590543bf3891.png', 'https://webstatic.hoyoverse.com/upload/static-resource/2023/06/15/35263f63879cc4270098b4a03d4fd658_4063129471300368143.png', 'Geo', 5, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000008, 90, 0, 2, false
    where not exists (select 1 from character_builds where character_id = 10000008);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11521, 'Exaiphanes Blade', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/8ec89cd8827583d02662704f5738efc8.png', 1, 'Sword', 5, 'A longsword that once shone with the Pale Star''s light. In the voyager''s hand, it becomes a brand-new light that has nothing to do with any past era.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000008 order by id limit 1), 11521, 80, 5, 3)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1)), 4, 'main', null, null, 532
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1)), 20, 'sub', null, null, 30.2
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (91, 10000008, 'Invincible Stonewall', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/0a3916a32df3739944c141331acd3dc2.png', 'Party members within the radius of <color=#FFD780FF>Wake of Earth</color> have their CRIT Rate increased by 10% and have increased resistance against interruption.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000008 order by id limit 1), 91, true, false, '', false
      where exists (select 1 from constellations where id = 91 and character_id = 10000008)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (92, 10000008, 'Rockcore Meltdown', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/e74220c66d8434fe565ccc975417c72d.png', 'When the meteorite created by <color=#FFD780FF>Starfell Sword</color> is destroyed, it will also explode, dealing additional <color=#FFE699FF>AoE Geo DMG</color> equal to the amount of damage dealt by Starfell Sword.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000008 order by id limit 1), 92, true, false, '', false
      where exists (select 1 from constellations where id = 92 and character_id = 10000008)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (93, 10000008, 'Will of the Rock', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/8b796f77bed320d5ef7092db37a37149.png', 'Increases the Level of <color=#FFD780FF>Wake of Earth</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000008 order by id limit 1), 93, false, false, '', false
      where exists (select 1 from constellations where id = 93 and character_id = 10000008)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (94, 10000008, 'Reaction Force', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/8d9bf7afc531c171ca563677404cb9da.png', 'The shockwave triggered by <color=#FFD780FF>Wake of Earth</color> regenerates 5 Energy for every opponent hit.\nA maximum of 25 Energy can be regenerated in this manner at any one time.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000008 order by id limit 1), 94, false, false, '', false
      where exists (select 1 from constellations where id = 94 and character_id = 10000008)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (95, 10000008, 'Meteorite Impact', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/44ee98aa675f5ef3732882503a93cad1.png', 'Increases the Level of <color=#FFD780FF>Starfell Sword</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000008 order by id limit 1), 95, false, false, '', false
      where exists (select 1 from constellations where id = 95 and character_id = 10000008)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (96, 10000008, 'Everlasting Boulder', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/d5dbb318292b77d2990977743bd7b7e6.png', 'The barrier created by <color=#FFD780FF>Wake of Earth</color> lasts 5s longer.\nThe meteorite created by <color=#FFD780FF>Starfell Sword</color> lasts 10s longer.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000008 order by id limit 1), 96, false, false, '', false
      where exists (select 1 from constellations where id = 96 and character_id = 10000008)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (100555, 10000008, 'Foreign Rockblade', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 rapid strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to unleash 2 rapid sword strikes.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 100555, '1-Hit DMG', '44.5%', 1
        where exists (select 1 from skills where id = 100555 and character_id = 10000008) and not exists (select 1 from skill_affixes where skill_id = 100555 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 100555, '2-Hit DMG', '43.4%', 2
        where exists (select 1 from skills where id = 100555 and character_id = 10000008) and not exists (select 1 from skill_affixes where skill_id = 100555 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 100555, '3-Hit DMG', '53.0%', 3
        where exists (select 1 from skills where id = 100555 and character_id = 10000008) and not exists (select 1 from skill_affixes where skill_id = 100555 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 100555, '4-Hit DMG', '58.3%', 4
        where exists (select 1 from skills where id = 100555 and character_id = 10000008) and not exists (select 1 from skill_affixes where skill_id = 100555 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 100555, '5-Hit DMG', '70.8%', 5
        where exists (select 1 from skills where id = 100555 and character_id = 10000008) and not exists (select 1 from skill_affixes where skill_id = 100555 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 100555, 'Charged Attack DMG', '55.9%+72.2%', 6
        where exists (select 1 from skills where id = 100555 and character_id = 10000008) and not exists (select 1 from skill_affixes where skill_id = 100555 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 100555, 'Charged Attack Stamina Cost', '20.0', 7
        where exists (select 1 from skills where id = 100555 and character_id = 10000008) and not exists (select 1 from skill_affixes where skill_id = 100555 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 100555, 'Plunge DMG', '63.9%', 8
        where exists (select 1 from skills where id = 100555 and character_id = 10000008) and not exists (select 1 from skill_affixes where skill_id = 100555 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 100555, 'Low/High Plunge DMG', '128%/160%', 9
        where exists (select 1 from skills where id = 100555 and character_id = 10000008) and not exists (select 1 from skill_affixes where skill_id = 100555 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000008 order by id limit 1), 100555, 1, true, true, '', false
      where exists (select 1 from skills where id = 100555 and character_id = 10000008)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10077, 10000008, 'Starfell Sword', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/cfdd28e7c4fd8cdd8eae8f6b2f5659df.png', 1, 'You disgorge a meteorite from the depths of the earth, dealing <color=#FFE699FF>AoE Geo DMG</color>.\nThe meteorite is considered a <color=#FFE699FF>Geo Construct</color>, and can be climbed or used to block attacks.\n\n<color=#FFD780FF>Hold</color>\nThis skill''s positioning may be adjusted.\n\n<i>You spoke with Paimon about the final destination of falling stars.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10077, 'Skill DMG', '248%', 1
        where exists (select 1 from skills where id = 10077 and character_id = 10000008) and not exists (select 1 from skill_affixes where skill_id = 10077 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10077, 'Meteorite Duration', '30.0s', 2
        where exists (select 1 from skills where id = 10077 and character_id = 10000008) and not exists (select 1 from skill_affixes where skill_id = 10077 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10077, 'CD', '8.0s', 3
        where exists (select 1 from skills where id = 10077 and character_id = 10000008) and not exists (select 1 from skill_affixes where skill_id = 10077 and position = 3);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000008 order by id limit 1), 10077, 1, true, true, '', false
      where exists (select 1 from skills where id = 10077 and character_id = 10000008)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10078, 10000008, 'Wake of Earth', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/ab086efc3660ffd526c64ba03870c58e.png', 1, 'Energizing the Geo deep underground, you set off expanding shockwaves.\nLaunches surrounding opponents back and deals <color=#FFE699FF>AoE Geo DMG</color>.\nA stone wall is erected at the edges of the shockwave.\nThe stone wall is considered a <color=#FFE699FF>Geo Construct</color>, and may be used to block attacks.\n\n<i>You and Paimon studied the pulse of the mountains.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10078, 'DMG Per Shockwave', '148%', 1
        where exists (select 1 from skills where id = 10078 and character_id = 10000008) and not exists (select 1 from skill_affixes where skill_id = 10078 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10078, 'Stonewall Duration', '15.0s', 2
        where exists (select 1 from skills where id = 10078 and character_id = 10000008) and not exists (select 1 from skill_affixes where skill_id = 10078 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10078, 'CD', '15.0s', 3
        where exists (select 1 from skills where id = 10078 and character_id = 10000008) and not exists (select 1 from skill_affixes where skill_id = 10078 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10078, 'Energy Cost', '60', 4
        where exists (select 1 from skills where id = 10078 and character_id = 10000008) and not exists (select 1 from skill_affixes where skill_id = 10078 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000008 order by id limit 1), 10078, 1, true, true, '', false
      where exists (select 1 from skills where id = 10078 and character_id = 10000008)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (921, 10000008, 'Shattered Darkrock', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/e5db631537e2c1d7a99a0169f9275138.png', 2, 'Reduces <color=#FFD780FF>Starfell Sword</color>''s CD by 2s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000008 order by id limit 1), 921, 1, true, true, '', false
      where exists (select 1 from skills where id = 921 and character_id = 10000008)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (922, 10000008, 'Frenzied Rockslide', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4a3945792ad33738d9a27fd671e236e8.png', 2, 'The final hit of a Normal Attack combo triggers a collapse, dealing 60% of ATK as <color=#FFE699FF>AoE Geo DMG</color>.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000008 order by id limit 1), 922, 1, true, true, '', false
      where exists (select 1 from skills where id = 922 and character_id = 10000008)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (951, 10000008, 'Foreign Adamantine', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6966dce8/990799c88a0a90ee814b5b3388a6d14f.png', 3, 'Draw new strength from journeys past. For every element you have resonated with, you gain additional {LINK#N10050001}<color=#FFD780FF>buffs</color>{/LINK}.\n\nAdditionally, when nearby party members become protected by a shield, when the shield is replaced for any reason, or when <color=#FFE699FF>Geo Constructs</color> are created, the Traveler will receive 1 stack of Blade of Archaic Petra, max 3 stacks. Up to 1 stack may be obtained every second in this way. After obtaining 3 stacks of Blade of Archaic Petra, performing a Charged Attack will consume all stacks of Blade of Archaic Petra and transform into the special <color=#FFD780FF>Charged Attack: Rockfell</color>.\n\n<color=#FFD780FF>Charged Attack: Rockfell</color>\n· Each Charged Attack hit deals increased <color=#FFE699FF>Geo DMG</color>. Increase in DMG is equal to 120% of Traveler''s ATK.\n· For 15s after hitting an opponent, nearby party members will have their shield strength temporarily increased by 20%.\n· <color=#FFD780FF>Charged Attack: Rockfell</color> can be triggered up to once every 15s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000008 order by id limit 1), 951, 1, true, true, 'Draw new strength from journeys past. For every element you have resonated with, you gain additional {LINK#N10050001}<color=#FFD780FF>buffs</color>{/LINK}.\n\nAdditionally, when nearby party members become protected by a shield, when the shield is replaced for any reason, or when <color=#FFE699FF>Geo Constructs</color> are created, the Traveler will receive 1 stack of Blade of Archaic Petra, max 3 stacks. Up to 1 stack may be obtained every second in this way. After obtaining 3 stacks of Blade of Archaic Petra, performing a Charged Attack will consume all stacks of Blade of Archaic Petra and transform into the special <color=#FFD780FF>Charged Attack: Rockfell</color>.\n\n<color=#FFD780FF>Charged Attack: Rockfell</color>\n· Each Charged Attack hit deals increased <color=#FFE699FF>Geo DMG</color>. Increase in DMG is equal to 120% of Traveler''s ATK.\n· For 15s after hitting an opponent, nearby party members will have their shield strength temporarily increased by 20%.\n· <color=#FFD780FF>Charged Attack: Rockfell</color> can be triggered up to once every 15s.', true
      where exists (select 1 from skills where id = 951 and character_id = 10000008)
      on conflict do nothing;
insert into costumes (id, character_id, name, icon) values (200701, 10000008, 'As Heaven and Earth Are Made Anew', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_2/2f91d7c102df0056de11dce08b296624.png') on conflict do nothing;
insert into build_costumes (build_id, costume_id) values ((select id from character_builds where character_id = 10000008 order by id limit 1), 200701) on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 2000, 'selected', '9638', '3903', '13541')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 20, 'selected', '40.8%', null, '40.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 2001, 'selected', '723', '892', '1615')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 22, 'selected', '83.6%', null, '83.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 2002, 'selected', '605', '46', '651')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 28, 'selected', '50', null, '50')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 45, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 23, 'selected', '124.1%', null, '124.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 2000, 'base', '9638', '3903', '13541')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 2001, 'base', '723', '892', '1615')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 2002, 'base', '605', '46', '651')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 28, 'base', '50', null, '50')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 999999, 'base', '227', null, '227')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 20, 'extra', '40.8%', null, '40.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 22, 'extra', '83.6%', null, '83.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 23, 'extra', '124.1%', null, '124.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000008 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48543, 'Foundryman''s Conjecture', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/09729586ce0f78f5111f9ee8d25eb431.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000008 order by id limit 1), 48543, 2150481, 1, 5, 8, 2, '2342', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 1), 22, '6.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 1) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 1), 6, '10.5%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 1) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 1), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 1) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 1), 23, '6.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 1) and property_type_id = 23);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48422, 'Foundryman''s Observation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/6d43279928ae731e4199ff123ecd210e.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000008 order by id limit 1), 48422, 2150481, 2, 4, 8, 5, '137', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 2), 28, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 2) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 2), 20, '2.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 2) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 2), 2, '215', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 2), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 2) and property_type_id = 8);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48553, 'Foundryman''s Calculus', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/0119db4ca0f7c650686e2da11b9c6a1d.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000008 order by id limit 1), 48553, 2150481, 3, 5, 8, 6, '22.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 3), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 3) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 3), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 3) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 3), 2, '448', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 3) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 3), 20, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 3) and property_type_id = 20);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59413, 'Exile''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7847bfdeab60c072ec09b17462505cdc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000008 order by id limit 1), 59413, 2100091, 4, 4, 12, 6, '27.7%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 4), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 4), 23, '8.8%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 4) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 4), 28, '34', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 4) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 4), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 4) and property_type_id = 8);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48432, 'Foundryman''s Legacy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/2aece34359e0f99802feced2f25ee01b.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000008 order by id limit 1), 48432, 2150481, 5, 4, 8, 22, '27.4%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 5), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 5), 6, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 5) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 5), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 5) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 5), 23, '3.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000008 order by id limit 1) and position = 5) and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000008, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000008 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000008, 'goblet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000008 and slot = 'goblet' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000008, 'circlet', 22
          where not exists (select 1 from character_relic_recommendations where character_id = 10000008 and slot = 'circlet' and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000008, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000008 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000008, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000008 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000008, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000008 and property_type_id = 6);

-- Traveler (10000009)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000009, 'Traveler', 'https://fastcdn.hoyoverse.com/static-resource-v2/2023/09/26/10dede5c05005ebb96bbe01f8408e775_7397178366194463086.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/10fcbb4bb21456b3d7b9590543bf3891.png', 'https://webstatic.hoyoverse.com/upload/static-resource/2023/06/15/35263f63879cc4270098b4a03d4fd658_4063129471300368143.png', 'Electro', 5, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000009, 90, 0, 2, false
    where not exists (select 1 from character_builds where character_id = 10000009);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11521, 'Exaiphanes Blade', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/8ec89cd8827583d02662704f5738efc8.png', 1, 'Sword', 5, 'A longsword that once shone with the Pale Star''s light. In the voyager''s hand, it becomes a brand-new light that has nothing to do with any past era.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000009 order by id limit 1), 11521, 80, 5, 3)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1)), 4, 'main', null, null, 532
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1)), 20, 'sub', null, null, 30.2
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (101, 10000009, 'Spring Thunder of Fertility', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/e60353519782f2d7ee05193d1bca1a84.png', 'The number of Abundance Amulets that can be generated using <color=#FFD780FF>Lightning Blade</color> is increased to 3.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000009 order by id limit 1), 101, true, false, '', false
      where exists (select 1 from constellations where id = 101 and character_id = 10000009)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (102, 10000009, 'Violet Vehemence', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/d6fd4398261a688195cc7d0d6dd235b3.png', 'When Falling Thunder created by <color=#FFD780FF>Bellowing Thunder</color> hits an opponent, it will decrease their <color=#FFACFFFF>Electro RES</color> by 15% for 8s.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000009 order by id limit 1), 102, true, false, '', false
      where exists (select 1 from constellations where id = 102 and character_id = 10000009)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (103, 10000009, 'Distant Crackling', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/591044550f1e399c721b9d813f8f0ded.png', 'Increases the Level of <color=#FFD780FF>Bellowing Thunder</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000009 order by id limit 1), 103, false, false, '', false
      where exists (select 1 from constellations where id = 103 and character_id = 10000009)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (104, 10000009, 'Fickle Cloudstrike', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/c642ea7e2d52a95c3d7e9d9434ab9069.png', 'When a character obtains Abundance Amulets generated by <color=#FFD780FF>Lightning Blade</color>, if this character''s Energy is less than 35%, the Energy restored by the Abundance Amulets is increased by 100%.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000009 order by id limit 1), 104, false, false, '', false
      where exists (select 1 from constellations where id = 104 and character_id = 10000009)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (105, 10000009, 'Clamor in the Wilds', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/982283f1c2bfb849b89cda002e6cb774.png', 'Increases the Level of <color=#FFD780FF>Lightning Blade</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000009 order by id limit 1), 105, false, false, '', false
      where exists (select 1 from constellations where id = 105 and character_id = 10000009)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (106, 10000009, 'World-Shaker', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/94f52be9fc346bcb97c1373f55ffbcb3.png', 'Every 2 Falling Thunder attacks triggered by <color=#FFD780FF>Bellowing Thunder</color> will greatly increase the DMG dealt by the next Falling Thunder, which will deal 200% of its original DMG and will restore an additional 1 Energy to the current character.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000009 order by id limit 1), 106, false, false, '', false
      where exists (select 1 from constellations where id = 106 and character_id = 10000009)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (100556, 10000009, 'Foreign Thundershock', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 rapid strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to unleash 2 rapid sword strikes.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 100556, '1-Hit DMG', '44.5%', 1
        where exists (select 1 from skills where id = 100556 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 100556 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 100556, '2-Hit DMG', '43.4%', 2
        where exists (select 1 from skills where id = 100556 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 100556 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 100556, '3-Hit DMG', '53.0%', 3
        where exists (select 1 from skills where id = 100556 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 100556 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 100556, '4-Hit DMG', '58.3%', 4
        where exists (select 1 from skills where id = 100556 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 100556 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 100556, '5-Hit DMG', '70.8%', 5
        where exists (select 1 from skills where id = 100556 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 100556 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 100556, 'Charged Attack DMG', '55.9%+72.2%', 6
        where exists (select 1 from skills where id = 100556 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 100556 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 100556, 'Charged Attack Stamina Cost', '20.0', 7
        where exists (select 1 from skills where id = 100556 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 100556 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 100556, 'Plunge DMG', '63.9%', 8
        where exists (select 1 from skills where id = 100556 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 100556 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 100556, 'Low/High Plunge DMG', '128%/160%', 9
        where exists (select 1 from skills where id = 100556 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 100556 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000009 order by id limit 1), 100556, 1, true, true, '', false
      where exists (select 1 from skills where id = 100556 and character_id = 10000009)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10602, 10000009, 'Lightning Blade', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/d3451504dcbed82909d261463c950ba0.png', 1, 'Unleashes three swift thunder shadows that deal <color=#FFACFFFF>Electro DMG</color> to opponents and leave an Abundance Amulet behind after hitting an opponent.\n2 Abundance Amulets can be created initially. Using this skill will reset any Abundance Amulets that were generated.\n\n<color=#FFD780FF>Abundance Amulets</color>\nWhen a character is near an Abundance Amulet, they will absorb it and obtain the following effects:\n·Restores Elemental Energy\n·Increases Energy Recharge during the Abundance Amulet''s duration.\n\n<i>You and Paimon discuss the paths by which electricity might flow.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10602, 'Skill DMG', '79%', 1
        where exists (select 1 from skills where id = 10602 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 10602 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10602, 'Energy Regeneration', '3.0 Per Amulet', 2
        where exists (select 1 from skills where id = 10602 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 10602 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10602, 'Energy Recharge Increase', '20%', 3
        where exists (select 1 from skills where id = 10602 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 10602 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10602, 'Duration', '6.0s', 4
        where exists (select 1 from skills where id = 10602 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 10602 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10602, 'Abundance Amulet Duration', '15.0s', 5
        where exists (select 1 from skills where id = 10602 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 10602 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10602, 'CD', '13.5s', 6
        where exists (select 1 from skills where id = 10602 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 10602 and position = 6);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000009 order by id limit 1), 10602, 1, true, true, '', false
      where exists (select 1 from skills where id = 10602 and character_id = 10000009)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10605, 10000009, 'Bellowing Thunder', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/c778d3165ed59388bdfdfdfba5bfdf0e.png', 1, 'You call upon the protection of lightning, knocking nearby opponents back and dealing <color=#FFACFFFF>Electro DMG</color> to them.\n\n<color=#FFD780FF>Lightning Shroud</color>\nWhen your active character''s Normal or Charged Attacks hit opponents, they will call Falling Thunder forth, dealing <color=#FFACFFFF>Electro DMG.</color>\nWhen Falling Thunder hits opponents, it will regenerate Energy for that character.\nOne instance of Falling Thunder can be generated every 0.5s.\n\n<i>You and Paimon studied the light that flashes through the clouds.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10605, 'Skill DMG', '114.4%', 1
        where exists (select 1 from skills where id = 10605 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 10605 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10605, 'Falling Thunder DMG', '32.8%', 2
        where exists (select 1 from skills where id = 10605 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 10605 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10605, 'Energy Regeneration', '0.8', 3
        where exists (select 1 from skills where id = 10605 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 10605 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10605, 'Duration', '12.0s', 4
        where exists (select 1 from skills where id = 10605 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 10605 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10605, 'CD', '20.0s', 5
        where exists (select 1 from skills where id = 10605 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 10605 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10605, 'Energy Cost', '80', 6
        where exists (select 1 from skills where id = 10605 and character_id = 10000009) and not exists (select 1 from skill_affixes where skill_id = 10605 and position = 6);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000009 order by id limit 1), 10605, 1, true, true, '', false
      where exists (select 1 from skills where id = 10605 and character_id = 10000009)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (1021, 10000009, 'Thunderflash', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/17d474db38c54d074689909d84730b3f.png', 2, 'When another nearby character in the party obtains an Abundance Amulet created by <color=#FFD780FF>Lightning Blade</color>, <color=#FFD780FF>Lightning Blade''s</color> CD is decreased by 1.5s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000009 order by id limit 1), 1021, 1, true, true, '', false
      where exists (select 1 from skills where id = 1021 and character_id = 10000009)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (1022, 10000009, 'Resounding Roar', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/8745840a2296a66784a124d3d4f477db.png', 2, 'Increases the Energy Recharge effect granted by <color=#FFD780FF>Lightning Blade</color>''s Abundance Amulet by 10% of the Traveler''s Energy Recharge.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000009 order by id limit 1), 1022, 1, true, true, '', false
      where exists (select 1 from skills where id = 1022 and character_id = 10000009)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (1051, 10000009, 'Foreign Thundertrail', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6966dce8/c021c664370233c9ebd5e55e9c9c5f30.png', 3, 'Draw new strength from journeys past. For every element you have resonated with, you gain additional {LINK#N10050001}<color=#FFD780FF>buffs</color>{/LINK}.\n\nIn addition, when nearby party members unleash an Elemental Burst, Traveler will receive 1 stack of Blade of Resounding Thunder, max 3 stacks. After obtaining 3 stacks of Blade of Resounding Thunder, performing a Charged Attack will consume all stacks of Blade of Resounding Thunder and transform into the special <color=#FFD780FF>Charged Attack: Detonate</color>.\n\n<color=#FFD780FF>Charged Attack: Detonate</color>\n· Each Charged Attack hit deals increased <color=#FFACFFFF>Electro DMG</color>. Increase in DMG is equal to 100% of Traveler''s ATK. \n· 3s after hitting the enemy, 1 additional lightning strike will be triggered, dealing <color=#FFACFFFF>Electro DMG</color> equal to 200% of Traveler''s ATK. 1 Abundance Amulet will also be created. This DMG is considered Charged Attack DMG.\n· <color=#FFD780FF>Charged Attack: Detonate</color> can be triggered up to once every 15s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000009 order by id limit 1), 1051, 1, true, true, 'Draw new strength from journeys past. For every element you have resonated with, you gain additional {LINK#N10050001}<color=#FFD780FF>buffs</color>{/LINK}.\n\nIn addition, when nearby party members unleash an Elemental Burst, Traveler will receive 1 stack of Blade of Resounding Thunder, max 3 stacks. After obtaining 3 stacks of Blade of Resounding Thunder, performing a Charged Attack will consume all stacks of Blade of Resounding Thunder and transform into the special <color=#FFD780FF>Charged Attack: Detonate</color>.\n\n<color=#FFD780FF>Charged Attack: Detonate</color>\n· Each Charged Attack hit deals increased <color=#FFACFFFF>Electro DMG</color>. Increase in DMG is equal to 100% of Traveler''s ATK. \n· 3s after hitting the enemy, 1 additional lightning strike will be triggered, dealing <color=#FFACFFFF>Electro DMG</color> equal to 200% of Traveler''s ATK. 1 Abundance Amulet will also be created. This DMG is considered Charged Attack DMG.\n· <color=#FFD780FF>Charged Attack: Detonate</color> can be triggered up to once every 15s.', true
      where exists (select 1 from skills where id = 1051 and character_id = 10000009)
      on conflict do nothing;
insert into costumes (id, character_id, name, icon) values (200701, 10000009, 'As Heaven and Earth Are Made Anew', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_2/2f91d7c102df0056de11dce08b296624.png') on conflict do nothing;
insert into build_costumes (build_id, costume_id) values ((select id from character_builds where character_id = 10000009 order by id limit 1), 200701) on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 2000, 'selected', '9638', '3903', '13541')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 20, 'selected', '40.8%', null, '40.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 2001, 'selected', '723', '892', '1615')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 22, 'selected', '83.6%', null, '83.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 2002, 'selected', '605', '46', '651')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 28, 'selected', '50', null, '50')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 41, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 23, 'selected', '124.1%', null, '124.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 2000, 'base', '9638', '3903', '13541')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 2001, 'base', '723', '892', '1615')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 2002, 'base', '605', '46', '651')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 28, 'base', '50', null, '50')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 999999, 'base', '227', null, '227')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 20, 'extra', '40.8%', null, '40.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 22, 'extra', '83.6%', null, '83.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 23, 'extra', '124.1%', null, '124.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000009 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48543, 'Foundryman''s Conjecture', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/09729586ce0f78f5111f9ee8d25eb431.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000009 order by id limit 1), 48543, 2150481, 1, 5, 8, 2, '2342', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 1), 22, '6.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 1) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 1), 6, '10.5%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 1) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 1), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 1) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 1), 23, '6.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 1) and property_type_id = 23);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48422, 'Foundryman''s Observation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/6d43279928ae731e4199ff123ecd210e.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000009 order by id limit 1), 48422, 2150481, 2, 4, 8, 5, '137', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 2), 28, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 2) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 2), 20, '2.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 2) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 2), 2, '215', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 2), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 2) and property_type_id = 8);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48553, 'Foundryman''s Calculus', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/0119db4ca0f7c650686e2da11b9c6a1d.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000009 order by id limit 1), 48553, 2150481, 3, 5, 8, 6, '22.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 3), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 3) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 3), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 3) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 3), 2, '448', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 3) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 3), 20, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 3) and property_type_id = 20);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59413, 'Exile''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7847bfdeab60c072ec09b17462505cdc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000009 order by id limit 1), 59413, 2100091, 4, 4, 12, 6, '27.7%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 4), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 4), 23, '8.8%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 4) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 4), 28, '34', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 4) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 4), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 4) and property_type_id = 8);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48432, 'Foundryman''s Legacy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/2aece34359e0f99802feced2f25ee01b.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000009 order by id limit 1), 48432, 2150481, 5, 4, 8, 22, '27.4%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 5), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 5), 6, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 5) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 5), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 5) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 5), 23, '3.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000009 order by id limit 1) and position = 5) and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000009, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000009 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000009, 'goblet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000009 and slot = 'goblet' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000009, 'circlet', 22
          where not exists (select 1 from character_relic_recommendations where character_id = 10000009 and slot = 'circlet' and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000009, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000009 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000009, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000009 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000009, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000009 and property_type_id = 6);

-- Traveler (100000010)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (100000010, 'Traveler', 'https://fastcdn.hoyoverse.com/static-resource-v2/2023/09/26/10dede5c05005ebb96bbe01f8408e775_7397178366194463086.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/10fcbb4bb21456b3d7b9590543bf3891.png', 'https://webstatic.hoyoverse.com/upload/static-resource/2023/06/15/35263f63879cc4270098b4a03d4fd658_4063129471300368143.png', 'Dendro', 5, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 100000010, 90, 0, 3, false
    where not exists (select 1 from character_builds where character_id = 100000010);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11521, 'Exaiphanes Blade', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/8ec89cd8827583d02662704f5738efc8.png', 1, 'Sword', 5, 'A longsword that once shone with the Pale Star''s light. In the voyager''s hand, it becomes a brand-new light that has nothing to do with any past era.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 100000010 order by id limit 1), 11521, 80, 5, 3)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1)), 4, 'main', null, null, 532
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1)), 20, 'sub', null, null, 30.2
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (111, 100000010, 'Symbiotic Creeper', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/fe11a89f97be18e67f1c0315213dbf16.png', 'After <color=#FFD780FF>Razorgrass Blade</color> hits an opponent, it will regenerate 3.5 Energy for the Traveler.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000010 order by id limit 1), 111, true, false, '', false
      where exists (select 1 from constellations where id = 111 and character_id = 100000010)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (112, 100000010, 'Green Resilience', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/fdd56f7ab7dd667b47fedbb6a71a1b52.png', '<color=#FFD780FF>Lea Lotus Lamp</color>''s duration is increased by 3s.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000010 order by id limit 1), 112, true, false, '', false
      where exists (select 1 from constellations where id = 112 and character_id = 100000010)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (113, 100000010, 'Whirling Weeds', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/b0c6ea70322a439db9e8c7755fa7e89a.png', 'Increases the Level of <color=#FFD780FF>Razorgrass Blade</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000010 order by id limit 1), 113, true, false, '', false
      where exists (select 1 from constellations where id = 113 and character_id = 100000010)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (114, 100000010, 'Treacle Grass', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/ec4b235481fb4038f69b1b3196c977bb.png', 'After the <color=#FFD780FF>Lea Lotus Lamp</color> triggers a Lotuslight Transfiguration, it will obtain 5 stacks of the Overflowing Lotuslight effect from the Ascension Talent "Verdant Overgrowth."\nYou must first unlock the Ascension Talent "Verdant Overgrowth."', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000010 order by id limit 1), 114, false, false, '', false
      where exists (select 1 from constellations where id = 114 and character_id = 100000010)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (115, 100000010, 'Viridian Transience', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/f0cdbe5518de26a41fe968d1d2af2825.png', 'Increases the Level of <color=#FFD780FF>Surgent Manifestation</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000010 order by id limit 1), 115, false, false, '', false
      where exists (select 1 from constellations where id = 115 and character_id = 100000010)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (116, 100000010, 'Withering Aggregation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/533c264f7b5d61153d59f60f2a11a526.png', 'The <color=#99FF88FF>Dendro DMG Bonus</color> of the character under the effect of Overflowing Lotuslight as created by the <color=#FFD780FF>Lea Lotus Lamp</color> is increased by 12%. If the Lamp has experienced a Lotuslight Transfiguration previously, the character will also gain 12% DMG Bonus for the corresponding element.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000010 order by id limit 1), 116, false, false, '', false
      where exists (select 1 from constellations where id = 116 and character_id = 100000010)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (100557, 100000010, 'Foreign Fieldcleaver', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 rapid strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to unleash 2 rapid sword strikes.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 100557, '1-Hit DMG', '51.7%', 1
        where exists (select 1 from skills where id = 100557 and character_id = 100000010) and not exists (select 1 from skill_affixes where skill_id = 100557 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 100557, '2-Hit DMG', '50.5%', 2
        where exists (select 1 from skills where id = 100557 and character_id = 100000010) and not exists (select 1 from skill_affixes where skill_id = 100557 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 100557, '3-Hit DMG', '61.6%', 3
        where exists (select 1 from skills where id = 100557 and character_id = 100000010) and not exists (select 1 from skill_affixes where skill_id = 100557 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 100557, '4-Hit DMG', '67.8%', 4
        where exists (select 1 from skills where id = 100557 and character_id = 100000010) and not exists (select 1 from skill_affixes where skill_id = 100557 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 100557, '5-Hit DMG', '82.3%', 5
        where exists (select 1 from skills where id = 100557 and character_id = 100000010) and not exists (select 1 from skill_affixes where skill_id = 100557 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 100557, 'Charged Attack DMG', '65.0%+84.0%', 6
        where exists (select 1 from skills where id = 100557 and character_id = 100000010) and not exists (select 1 from skill_affixes where skill_id = 100557 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 100557, 'Charged Attack Stamina Cost', '20.0', 7
        where exists (select 1 from skills where id = 100557 and character_id = 100000010) and not exists (select 1 from skill_affixes where skill_id = 100557 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 100557, 'Plunge DMG', '74.3%', 8
        where exists (select 1 from skills where id = 100557 and character_id = 100000010) and not exists (select 1 from skill_affixes where skill_id = 100557 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 100557, 'Low/High Plunge DMG', '149%/186%', 9
        where exists (select 1 from skills where id = 100557 and character_id = 100000010) and not exists (select 1 from skill_affixes where skill_id = 100557 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000010 order by id limit 1), 100557, 3, true, true, '', false
      where exists (select 1 from skills where id = 100557 and character_id = 100000010)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10117, 100000010, 'Razorgrass Blade', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/eb816eaa48274dc38acb34b0ed9fe522.png', 1, 'With a flourish of your blade, you unleash a spray of razor-sharp leaves that go before you and deal <color=#99FF88FF>Dendro DMG</color>.\n\n<i>You and Paimon observed the flowing edges of grass and leaf.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10117, 'Skill DMG', '346%', 1
        where exists (select 1 from skills where id = 10117 and character_id = 100000010) and not exists (select 1 from skill_affixes where skill_id = 10117 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10117, 'CD', '8.0s', 2
        where exists (select 1 from skills where id = 10117 and character_id = 100000010) and not exists (select 1 from skill_affixes where skill_id = 10117 and position = 2);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000010 order by id limit 1), 10117, 7, true, true, '', false
      where exists (select 1 from skills where id = 10117 and character_id = 100000010)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10118, 100000010, 'Surgent Manifestation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/9a32b25a212e772e7c8a6d47daf99eee.png', 1, 'Calling upon the might of the flora all around you, you create a Lea Lotus Lamp.\nThis Lamp will deal continuous <color=#99FF88FF>Dendro DMG</color> to opponents within its AoE.\n\n<color=#FFD780FF>Lotuslight Transfiguration</color>\nThe Lea Lotus Lamp will undergo the following changes after it comes into contact with <color=#80C0FFFF>Hydro</color>/<color=#FFACFFFF>Electro</color>/<color=#FF9999FF>Pyro</color>:\n·<color=#80C0FFFF>Hydro</color>: the Lamp''s AoE and the AoE of its attacks are increased.\n·<color=#FFACFFFF>Electro</color>: the Lamp''s ATK SPD is increased.\n·<color=#FF9999FF>Pyro</color>: the Lamp will explode after a short delay and then disappear, dealing <color=#99FF88FF>AoE Dendro DMG</color>.\nThe Lea Lotus Lamp can only undergo one Lotuslight Transfiguration in its duration.\n\nOnly one Lamp created by the Traveler can exist at any one time.\n\n<i>You and Paimon studied the sounds of plants that sprout after the rain.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10118, 'Lea Lotus Lamp Attack DMG', '100.2%', 1
        where exists (select 1 from skills where id = 10118 and character_id = 100000010) and not exists (select 1 from skill_affixes where skill_id = 10118 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10118, 'Explosion DMG', '501.0%', 2
        where exists (select 1 from skills where id = 10118 and character_id = 100000010) and not exists (select 1 from skill_affixes where skill_id = 10118 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10118, 'Lea Lotus Lamp Duration', '12.0s', 3
        where exists (select 1 from skills where id = 10118 and character_id = 100000010) and not exists (select 1 from skill_affixes where skill_id = 10118 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10118, 'CD', '20.0s', 4
        where exists (select 1 from skills where id = 10118 and character_id = 100000010) and not exists (select 1 from skill_affixes where skill_id = 10118 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10118, 'Energy Cost', '80', 5
        where exists (select 1 from skills where id = 10118 and character_id = 100000010) and not exists (select 1 from skill_affixes where skill_id = 10118 and position = 5);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000010 order by id limit 1), 10118, 4, true, true, '', false
      where exists (select 1 from skills where id = 10118 and character_id = 100000010)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (1121, 100000010, 'Verdant Overgrowth', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/7b88187465a4047910e699152ac81be6.png', 2, '<color=#FFD780FF>Lea Lotus Lamp</color> will obtain one level of Overflowing Lotuslight every second it is on the field, increasing the Elemental Mastery of active character(s) within its AoE by 6. Overflowing Lotuslight has a maximum of 10 stacks.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000010 order by id limit 1), 1121, 1, true, true, '', false
      where exists (select 1 from skills where id = 1121 and character_id = 100000010)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (1122, 100000010, 'Verdant Luxury', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4ea9dffead0bdaac672ba7cf3a1d41b4.png', 2, 'Every point of Elemental Mastery the Traveler possesses increases the DMG dealt by <color=#FFD780FF>Razorgrass Blade</color> by 0.15% and the DMG dealt by <color=#FFD780FF>Surgent Manifestation</color> by 0.1%.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000010 order by id limit 1), 1122, 1, true, true, '', false
      where exists (select 1 from skills where id = 1122 and character_id = 100000010)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (1151, 100000010, 'Foreign Verdalume', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6966dce8/c4d64061d31313ebeaf05314966c86e3.png', 3, 'Draw new strength from journeys past. For every element you have resonated with, you gain additional {LINK#N10050001}<color=#FFD780FF>buffs</color>{/LINK}. \n\nAdditionally, when Dendro Cores (including Bountiful Cores, Seeds of Deceit) appear nearby on the field, or when the party obtains Verdant Dew, Traveler will receive 1 stack of Blade of Verdant Viridis. These two methods can each grant the Traveler up to 1 stack of Blade of Verdant Viridis every 4s, max 3 stacks. After obtaining 3 stacks of Blade of Verdant Viridis, performing a Charged Attack will consume all stacks of Blade of Verdant Viridis and transform into the special <color=#FFD780FF>Charged Attack: Verdessence</color>.\n\n<color=#FFD780FF>Charged Attack: Verdessence</color>\n· Each Charged Attack hit deals increased <color=#99FF88FF>Dendro DMG</color>. The increase in DMG is equal to 80% of Traveler''s ATK. Two <color=#FFD780FF>Vinecores</color> will also be created on the spot, which will explode after 4/8s respectively, inflicting <color=#99FF88FF>Dendro DMG</color> equal to 120% of Traveler''s ATK. This DMG is considered Charged Attack DMG.\n· <color=#FFD780FF>Charged Attack: Verdessence</color> can be triggered up to once every 15s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000010 order by id limit 1), 1151, 1, true, true, 'Draw new strength from journeys past. For every element you have resonated with, you gain additional {LINK#N10050001}<color=#FFD780FF>buffs</color>{/LINK}. \n\nAdditionally, when Dendro Cores (including Bountiful Cores, Seeds of Deceit) appear nearby on the field, or when the party obtains Verdant Dew, Traveler will receive 1 stack of Blade of Verdant Viridis. These two methods can each grant the Traveler up to 1 stack of Blade of Verdant Viridis every 4s, max 3 stacks. After obtaining 3 stacks of Blade of Verdant Viridis, performing a Charged Attack will consume all stacks of Blade of Verdant Viridis and transform into the special <color=#FFD780FF>Charged Attack: Verdessence</color>.\n\n<color=#FFD780FF>Charged Attack: Verdessence</color>\n· Each Charged Attack hit deals increased <color=#99FF88FF>Dendro DMG</color>. The increase in DMG is equal to 80% of Traveler''s ATK. Two <color=#FFD780FF>Vinecores</color> will also be created on the spot, which will explode after 4/8s respectively, inflicting <color=#99FF88FF>Dendro DMG</color> equal to 120% of Traveler''s ATK. This DMG is considered Charged Attack DMG.\n· <color=#FFD780FF>Charged Attack: Verdessence</color> can be triggered up to once every 15s.', true
      where exists (select 1 from skills where id = 1151 and character_id = 100000010)
      on conflict do nothing;
insert into costumes (id, character_id, name, icon) values (200701, 100000010, 'As Heaven and Earth Are Made Anew', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_2/2f91d7c102df0056de11dce08b296624.png') on conflict do nothing;
insert into build_costumes (build_id, costume_id) values ((select id from character_builds where character_id = 100000010 order by id limit 1), 200701) on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 2000, 'selected', '9638', '3903', '13541')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 20, 'selected', '40.8%', null, '40.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 2001, 'selected', '723', '892', '1615')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 22, 'selected', '83.6%', null, '83.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 2002, 'selected', '605', '46', '651')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 28, 'selected', '50', null, '50')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 43, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 23, 'selected', '124.1%', null, '124.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 2000, 'base', '9638', '3903', '13541')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 2001, 'base', '723', '892', '1615')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 2002, 'base', '605', '46', '651')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 28, 'base', '50', null, '50')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 999999, 'base', '227', null, '227')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 20, 'extra', '40.8%', null, '40.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 22, 'extra', '83.6%', null, '83.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 23, 'extra', '124.1%', null, '124.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000010 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48543, 'Foundryman''s Conjecture', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/09729586ce0f78f5111f9ee8d25eb431.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000010 order by id limit 1), 48543, 2150481, 1, 5, 8, 2, '2342', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 1), 22, '6.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 1) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 1), 6, '10.5%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 1) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 1), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 1) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 1), 23, '6.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 1) and property_type_id = 23);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48422, 'Foundryman''s Observation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/6d43279928ae731e4199ff123ecd210e.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000010 order by id limit 1), 48422, 2150481, 2, 4, 8, 5, '137', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 2), 28, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 2) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 2), 20, '2.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 2) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 2), 2, '215', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 2), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 2) and property_type_id = 8);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48553, 'Foundryman''s Calculus', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/0119db4ca0f7c650686e2da11b9c6a1d.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000010 order by id limit 1), 48553, 2150481, 3, 5, 8, 6, '22.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 3), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 3) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 3), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 3) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 3), 2, '448', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 3) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 3), 20, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 3) and property_type_id = 20);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59413, 'Exile''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7847bfdeab60c072ec09b17462505cdc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000010 order by id limit 1), 59413, 2100091, 4, 4, 12, 6, '27.7%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 4), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 4), 23, '8.8%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 4) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 4), 28, '34', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 4) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 4), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 4) and property_type_id = 8);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48432, 'Foundryman''s Legacy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/2aece34359e0f99802feced2f25ee01b.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000010 order by id limit 1), 48432, 2150481, 5, 4, 8, 22, '27.4%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 5), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 5), 6, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 5) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 5), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 5) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 5), 23, '3.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000010 order by id limit 1) and position = 5) and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 100000010, 'sand', 23
          where not exists (select 1 from character_relic_recommendations where character_id = 100000010 and slot = 'sand' and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 100000010, 'goblet', 43
          where not exists (select 1 from character_relic_recommendations where character_id = 100000010 and slot = 'goblet' and property_type_id = 43);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 100000010, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 100000010 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 100000010, 20
        where not exists (select 1 from character_recommended_substats where character_id = 100000010 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 100000010, 22
        where not exists (select 1 from character_recommended_substats where character_id = 100000010 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 100000010, 23
        where not exists (select 1 from character_recommended_substats where character_id = 100000010 and property_type_id = 23);

commit;
