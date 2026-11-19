-- Part 5 of 13. Generated from app/data/character_detail.ts.
-- Insert-only and safe to re-run. Run the parts in order in the Supabase SQL editor.
begin;

-- Sucrose (10000043)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000043, 'Sucrose', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/27ee1aba588f3e8e42800249fe1047e8.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/d6cfdc6183ec1465fef3261baeba31f0.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/9bc7734e2c50399b56e3ad152d71d159.png', 'Anemo', 4, 10)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000043, 60, 4, 0, false
    where not exists (select 1 from character_builds where character_id = 10000043);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (14302, 'Thrilling Tales of Dragon Slayers', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/aff08755a2149ffb6c0fa7d1d189a222.png', 10, 'Catalyst', 3, 'A fictional story of a band of five heroes who go off on a dragon hunt. It is poorly written and structurally incoherent. Its value lies in the many lessons that can be learned from failure.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000043 order by id limit 1), 14302, 40, 1, 5)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1)), 4, 'main', null, null, 169
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1)), 3, 'sub', null, null, 19.7
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (431, 10000043, 'Clustered Vacuum Field', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/7a12f2e11701bbf205d37d60a35fc2c4.png', '<color=#FFD780FF>Astable Anemohypostasis Creation - 6308</color> gains 1 additional charge.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000043 order by id limit 1), 431, false, false, '', false
      where exists (select 1 from constellations where id = 431 and character_id = 10000043)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (432, 10000043, 'Beth: Unbound Form', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/55b97397635a6a23d6682dd791916440.png', 'The duration of <color=#FFD780FF>Forbidden Creation - Isomer 75 / Type II</color> is increased by 2s.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000043 order by id limit 1), 432, false, false, '', false
      where exists (select 1 from constellations where id = 432 and character_id = 10000043)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (433, 10000043, 'Flawless Alchemistress', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/15f0087a641ca723e0829aec2673f0c8.png', 'Increases the Level of <color=#FFD780FF>Astable Anemohypostasis Creation - 6308</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000043 order by id limit 1), 433, false, false, '', false
      where exists (select 1 from constellations where id = 433 and character_id = 10000043)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (434, 10000043, 'Alchemania', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/e740b424862089b432eeb4326cb4d46e.png', 'Sucrose will reduce the CD of <color=#FFD780FF>Astable Anemohypostasis Creation - 6308</color> by 1-7s for every 7 Normal or Charged Attack hits she scores against opponents.\nOne hit may be counted every 0.1s.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000043 order by id limit 1), 434, false, false, '', false
      where exists (select 1 from constellations where id = 434 and character_id = 10000043)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (435, 10000043, 'Caution: Standard Flask', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/d128c274c881489a41e3468dd721ed90.png', 'Increases the Level of <color=#FFD780FF>Forbidden Creation - Isomer 75 / Type II</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000043 order by id limit 1), 435, false, false, '', false
      where exists (select 1 from constellations where id = 435 and character_id = 10000043)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (436, 10000043, 'Chaotic Entropy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/cc0cb3bcb5c981b413e9f3cc6f39bc5d.png', 'If <color=#FFD780FF>Forbidden Creation - Isomer 75 / Type II</color> triggers an Elemental Absorption, all party members gain a 20% Elemental DMG Bonus for the corresponding absorbed element during its duration.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000043 order by id limit 1), 436, false, false, 'If <color=#FFD780FF>Forbidden Creation - Isomer 75 / Type II</color> triggers an Elemental Absorption, all party members gain a 20% Elemental DMG Bonus for the corresponding absorbed element during the skill''s duration, while nearby Hexerei characters in the party gain an additional 8.57142% Elemental DMG Bonus for the corresponding absorbed element.', true
      where exists (select 1 from constellations where id = 436 and character_id = 10000043)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10431, 10000043, 'Wind Spirit Creation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/2c014e6053c4f0d032e1d1ff0c6de0e1.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 4 attacks using Wind Spirits, dealing <color=#80FFD7FF>Anemo DMG</color>.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina and deals <color=#80FFD7FF>AoE Anemo DMG</color> after a short casting time.\n\n<color=#FFD780FF>Plunging Attack</color>\nCalling upon the power of her Wind Spirits, Sucrose plunges towards the ground from mid-air, damaging all opponents in her path. Deals <color=#80FFD7FF>AoE Anemo DMG</color> upon impact with the ground.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10431, '1-Hit DMG', '38.5%', 1
        where exists (select 1 from skills where id = 10431 and character_id = 10000043) and not exists (select 1 from skill_affixes where skill_id = 10431 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10431, '2-Hit DMG', '35.2%', 2
        where exists (select 1 from skills where id = 10431 and character_id = 10000043) and not exists (select 1 from skill_affixes where skill_id = 10431 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10431, '3-Hit DMG', '44.2%', 3
        where exists (select 1 from skills where id = 10431 and character_id = 10000043) and not exists (select 1 from skill_affixes where skill_id = 10431 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10431, '4-Hit DMG', '55.1%', 4
        where exists (select 1 from skills where id = 10431 and character_id = 10000043) and not exists (select 1 from skill_affixes where skill_id = 10431 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10431, 'Charged Attack DMG', '138%', 5
        where exists (select 1 from skills where id = 10431 and character_id = 10000043) and not exists (select 1 from skill_affixes where skill_id = 10431 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10431, 'Charged Attack Stamina Cost', '50.0', 6
        where exists (select 1 from skills where id = 10431 and character_id = 10000043) and not exists (select 1 from skill_affixes where skill_id = 10431 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10431, 'Plunge DMG', '66.1%', 7
        where exists (select 1 from skills where id = 10431 and character_id = 10000043) and not exists (select 1 from skill_affixes where skill_id = 10431 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10431, 'Low/High Plunge DMG', '132%/165%', 8
        where exists (select 1 from skills where id = 10431 and character_id = 10000043) and not exists (select 1 from skill_affixes where skill_id = 10431 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000043 order by id limit 1), 10431, 3, true, false, '', false
      where exists (select 1 from skills where id = 10431 and character_id = 10000043)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10432, 10000043, 'Astable Anemohypostasis Creation - 6308', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/b21558dd508b89f93b08518193b2f7c5.png', 1, 'Creates a small Wind Spirit that pulls opponents and objects towards its location, launches opponents within its AoE, and deals <color=#80FFD7FF>Anemo DMG</color>.\n\n<i>This is a little embarrassing, but though the elemental lifeforms birthed through this procedure dissipate very rapidly, they are incredibly useful when adventuring. Even failed experiments can have practical applications.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10432, 'Skill DMG', '243%', 1
        where exists (select 1 from skills where id = 10432 and character_id = 10000043) and not exists (select 1 from skill_affixes where skill_id = 10432 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10432, 'CD', '15.0s', 2
        where exists (select 1 from skills where id = 10432 and character_id = 10000043) and not exists (select 1 from skill_affixes where skill_id = 10432 and position = 2);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000043 order by id limit 1), 10432, 3, true, false, '', false
      where exists (select 1 from skills where id = 10432 and character_id = 10000043)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10435, 10000043, 'Forbidden Creation - Isomer 75 / Type II', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/b9b8ae71d40446ad496974984bbcdf3b.png', 1, 'Sucrose hurls an unstable concoction that creates a Large Wind Spirit.\nWhile it persists, the Large Wind Spirit will continuously pull in surrounding opponents and objects, launch nearby opponents, and deal <color=#80FFD7FF>Anemo DMG</color>.\n\n<color=#FFD780FF>Elemental Absorption</color>\nIf the Wind Spirit comes into contact with <color=#80C0FFFF>Hydro</color>/<color=#FF9999FF>Pyro</color>/<color=#99FFFFFF>Cryo</color>/<color=#FFACFFFF>Electro</color> energy, it will deal additional elemental DMG of that type.\nElemental Absorption may only occur once per use.\n\n<i>Sucrose used to give names to her volatile Anemo Hypostases, but their line of heirs quickly grew to surpass Baron Bunny the 893rd.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10435, 'DoT', '185%', 1
        where exists (select 1 from skills where id = 10435 and character_id = 10000043) and not exists (select 1 from skill_affixes where skill_id = 10435 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10435, 'Additional Elemental DMG', '55.0%', 2
        where exists (select 1 from skills where id = 10435 and character_id = 10000043) and not exists (select 1 from skill_affixes where skill_id = 10435 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10435, 'Duration', '6.0s', 3
        where exists (select 1 from skills where id = 10435 and character_id = 10000043) and not exists (select 1 from skill_affixes where skill_id = 10435 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10435, 'CD', '20.0s', 4
        where exists (select 1 from skills where id = 10435 and character_id = 10000043) and not exists (select 1 from skill_affixes where skill_id = 10435 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10435, 'Energy Cost', '80', 5
        where exists (select 1 from skills where id = 10435 and character_id = 10000043) and not exists (select 1 from skill_affixes where skill_id = 10435 and position = 5);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000043 order by id limit 1), 10435, 4, true, false, '', false
      where exists (select 1 from skills where id = 10435 and character_id = 10000043)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (4321, 10000043, 'Catalyst Conversion', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/be5dc569332a4f310a240047a11bfe84.png', 2, 'When Sucrose triggers a Swirl or Stellar Swirl reaction, all characters in the party with the matching element (excluding Sucrose) have their Elemental Mastery increased by 50 for 8s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000043 order by id limit 1), 4321, 1, true, false, '', false
      where exists (select 1 from skills where id = 4321 and character_id = 10000043)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (4322, 10000043, 'Mollis Favonius', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4cf9b32a6db362b408d0b814bd764939.png', 2, 'When <color=#FFD780FF>Astable Anemohypostasis Creation - 6308</color> or <color=#FFD780FF>Forbidden Creation - Isomer 75 / Type II</color> hits an opponent, increases all party members'' (excluding Sucrose) Elemental Mastery by an amount equal to 20% of Sucrose''s Elemental Mastery for 8s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000043 order by id limit 1), 4322, 1, false, false, '', false
      where exists (select 1 from skills where id = 4322 and character_id = 10000043)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (4351, 10000043, 'Witch''s Eve Rite: Sevenfold Transmutation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/692f7dcc/7106f241ab331ea5e949a6347e0a8fb7.png', 3, 'After completing <color=#FFD780FF>Witch''s Homework: Of Wonderland Flowers</color>, Sucrose will become a <color=#FFD780FF>Hexerei</color> character. When the party includes at least 2 Hexerei characters, you will gain the <color=#FFD780FF>Hexerei: Secret Rite</color> effect, which enhances Hexerei characters.\n\n<color=#FFD780FF>Hexerei: Secret Rite</color>\n· After Sucrose creates a Small Wind Spirit, nearby party members'' Normal Attack, Charged Attack, Plunging Attack, Elemental Skill, and Elemental Burst DMG are increased by 5.71428% for 15s.\n· After Sucrose creates a Large Wind Spirit, nearby Hexerei party members'' Normal Attack, Charged Attack, Plunging Attack, Elemental Skill, and Elemental Burst DMG are increased by 7.14285% for 20s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000043 order by id limit 1), 4351, 1, false, false, 'After completing <color=#FFD780FF>Witch''s Homework: Of Wonderland Flowers</color>, Sucrose will become a <color=#FFD780FF>Hexerei</color> character. When the party includes at least 2 Hexerei characters, you will gain the <color=#FFD780FF>Hexerei: Secret Rite</color> effect, which enhances Hexerei characters.\n\n<color=#FFD780FF>Hexerei: Secret Rite</color>\n· After Sucrose creates a Small Wind Spirit, nearby party members'' Normal Attack, Charged Attack, Plunging Attack, Elemental Skill, and Elemental Burst DMG are increased by 5.71428% for 15s.\n· After Sucrose creates a Large Wind Spirit, nearby Hexerei party members'' Normal Attack, Charged Attack, Plunging Attack, Elemental Skill, and Elemental Burst DMG are increased by 7.14285% for 20s.', true
      where exists (select 1 from skills where id = 4351 and character_id = 10000043)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (4323, 10000043, 'Astable Invention', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/ef10892114cf4d903c406a5b2b2346f1.png', 2, 'When Sucrose crafts Character and Weapon Enhancement Materials, she has a 10% chance to obtain double the product.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000043 order by id limit 1), 4323, 1, true, false, '', false
      where exists (select 1 from skills where id = 4323 and character_id = 10000043)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 2000, 'selected', '6090', '3986', '10075')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 20, 'selected', '12.2%', null, '12.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 2001, 'selected', '281', '170', '451')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 22, 'selected', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 2002, 'selected', '463', '76', '539')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 28, 'selected', '312', null, '312')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 44, 'selected', '12.0%', null, '12.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 23, 'selected', '129.3%', null, '129.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 2000, 'base', '6090', '3986', '10075')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 2001, 'base', '281', '170', '451')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 2002, 'base', '463', '76', '539')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 28, 'base', '312', null, '312')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 20, 'extra', '12.2%', null, '12.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 22, 'extra', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 23, 'extra', '129.3%', null, '129.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 44, 'element', '12.0%', null, '12.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000043 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57442, 'Instructor''s Brooch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/ab213bb1abd2a5467d680d5ea9890417.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000043 order by id limit 1), 57442, 2100071, 1, 4, 8, 2, '2108', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 1), 20, '3.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 1) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 1), 28, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 1) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 1), 23, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 1) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 1), 5, '11', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 1) and property_type_id = 5);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59422, 'Exile''s Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/1738ca88f6afa4f1d645e8afb214a7ed.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000043 order by id limit 1), 59422, 2100091, 2, 4, 8, 5, '137', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 2), 20, '2.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 2) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 2), 2, '191', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 2), 8, '15', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 2) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 2), 9, '5.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 2) and property_type_id = 9);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59452, 'Exile''s Pocket Watch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f9dd8d807eaa9ec5997b9c0e6f7cd48c.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000043 order by id limit 1), 59452, 2100091, 3, 4, 8, 28, '82', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 3), 23, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 3) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 3), 3, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 3) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 3), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 3) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 3), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 3) and property_type_id = 5);
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57311, 'Instructor''s Tea Cup', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/43b58997aabfaf68f64bde7bfee0c957.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000043 order by id limit 1), 57311, 2100071, 4, 3, 8, 28, '69', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 4), 8, '8', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 4) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 4), 5, '7', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 4), 2, '115', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 4) and property_type_id = 2);
insert into relic_sets (id, name) values (2100111, 'Lucky Dog') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100111, 2, 'DEF increased by 100.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100111 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100111, 4, 'Picking up Mora restores 300 HP.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100111 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (61331, 'Lucky Dog''s Silver Circlet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/b41981a2d335aff25dca11cb416518df.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000043 order by id limit 1), 61331, 2100111, 5, 3, 8, 28, '69', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 5), 8, '8', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 5), 2, '143', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 5) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 5), 20, '1.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000043 order by id limit 1) and position = 5) and property_type_id = 20);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000043, 'sand', 28
          where not exists (select 1 from character_relic_recommendations where character_id = 10000043 and slot = 'sand' and property_type_id = 28);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000043, 'goblet', 28
          where not exists (select 1 from character_relic_recommendations where character_id = 10000043 and slot = 'goblet' and property_type_id = 28);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000043, 'circlet', 28
          where not exists (select 1 from character_relic_recommendations where character_id = 10000043 and slot = 'circlet' and property_type_id = 28);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000043, 28
        where not exists (select 1 from character_recommended_substats where character_id = 10000043 and property_type_id = 28);

-- Chongyun (10000036)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000036, 'Chongyun', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/38b5bd856ea9fff842477a77265da49b.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/d8cb92b3a21a45ac20173a276d305656.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/db95c5527a3b0f1a59743180e531be63.png', 'Cryo', 4, 11)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000036, 60, 4, 4, false
    where not exists (select 1 from character_builds where character_id = 10000036);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (12403, 'Sacrificial Greatsword', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/b79312ddc86e05133b8a8d984f9931e1.png', 11, 'Claymore', 4, 'A ceremonial greatsword that has become petrified over time. The trinkets on it are still visible. It grants the wielder the power to withstand the winds of time.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000036 order by id limit 1), 12403, 40, 1, 4)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1)), 4, 'main', null, null, 226
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1)), 23, 'sub', null, null, 17.2
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (361, 10000036, 'Ice Unleashed', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/b890624172221c6bd56a4f79181474bd.png', 'The last attack of Chongyun''s Normal Attack combo releases 3 ice blades. Each blade deals 50% of Chongyun''s ATK as <color=#99FFFFFF>Cryo DMG</color> to all opponents in its path.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000036 order by id limit 1), 361, true, false, '', false
      where exists (select 1 from constellations where id = 361 and character_id = 10000036)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (362, 10000036, 'Atmospheric Revolution', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/bf85699f86a9776fcc9f4c8af6c2cd5d.png', 'Elemental Skills and Elemental Bursts cast within the Frost Field created by <color=#FFD780FF>Spirit Blade: Chonghua''s Layered Frost</color> have their CD time decreased by 15%.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000036 order by id limit 1), 362, true, false, '', false
      where exists (select 1 from constellations where id = 362 and character_id = 10000036)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (363, 10000036, 'Cloudburst', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/28fee57d7a076b1b2bda228e5268193e.png', 'Increases the Level of <color=#FFD780FF>Spirit Blade: Cloud-Parting Star</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000036 order by id limit 1), 363, true, false, '', false
      where exists (select 1 from constellations where id = 363 and character_id = 10000036)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (364, 10000036, 'Frozen Skies', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/2629420fa98261da28e901dc5974e228.png', 'Chongyun regenerates 1 Energy every time he hits an opponent affected by <color=#99FFFFFF>Cryo</color>.\nThis effect can only occur once every 2s.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000036 order by id limit 1), 364, true, false, '', false
      where exists (select 1 from constellations where id = 364 and character_id = 10000036)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (365, 10000036, 'The True Path', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/20a00c86f44c9af9eae5fb1b3c2f3aac.png', 'Increases the Level of <color=#FFD780FF>Spirit Blade: Chonghua''s Layered Frost</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000036 order by id limit 1), 365, false, false, '', false
      where exists (select 1 from constellations where id = 365 and character_id = 10000036)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (366, 10000036, 'Rally of Four Blades', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/f733f1cf436a84628f92dc37aad4cd9e.png', '<color=#FFD780FF>Spirit Blade: Cloud-Parting Star</color> deals 15% more DMG to opponents with a lower percentage of their Max HP remaining than Chongyun.\nThis skill will also summon 1 additional spirit blade.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000036 order by id limit 1), 366, false, false, '', false
      where exists (select 1 from constellations where id = 366 and character_id = 10000036)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10401, 10000036, 'Demonbane', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/bf0237fba9d4ab5b47ea86b90711a765.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 4 consecutive strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nDrains Stamina over time to perform continuous spinning attacks against all nearby opponents.\nAt the end of the sequence, performs a more powerful slash. \n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10401, '1-Hit DMG', '75.7%', 1
        where exists (select 1 from skills where id = 10401 and character_id = 10000036) and not exists (select 1 from skill_affixes where skill_id = 10401 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10401, '2-Hit DMG', '68.3%', 2
        where exists (select 1 from skills where id = 10401 and character_id = 10000036) and not exists (select 1 from skill_affixes where skill_id = 10401 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10401, '3-Hit DMG', '86.9%', 3
        where exists (select 1 from skills where id = 10401 and character_id = 10000036) and not exists (select 1 from skill_affixes where skill_id = 10401 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10401, '4-Hit DMG', '109%', 4
        where exists (select 1 from skills where id = 10401 and character_id = 10000036) and not exists (select 1 from skill_affixes where skill_id = 10401 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10401, 'Charged Attack Cyclic DMG', '60.9%', 5
        where exists (select 1 from skills where id = 10401 and character_id = 10000036) and not exists (select 1 from skill_affixes where skill_id = 10401 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10401, 'Charged Attack Final DMG', '110%', 6
        where exists (select 1 from skills where id = 10401 and character_id = 10000036) and not exists (select 1 from skill_affixes where skill_id = 10401 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10401, 'Charged Attack Stamina Cost', '40.0/s', 7
        where exists (select 1 from skills where id = 10401 and character_id = 10000036) and not exists (select 1 from skill_affixes where skill_id = 10401 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10401, 'Max Duration', '5.0s', 8
        where exists (select 1 from skills where id = 10401 and character_id = 10000036) and not exists (select 1 from skill_affixes where skill_id = 10401 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10401, 'Plunge DMG', '80.7%', 9
        where exists (select 1 from skills where id = 10401 and character_id = 10000036) and not exists (select 1 from skill_affixes where skill_id = 10401 and position = 9);
insert into skill_affixes (skill_id, name, value, position)
        select 10401, 'Low/High Plunge DMG', '161%/201%', 10
        where exists (select 1 from skills where id = 10401 and character_id = 10000036) and not exists (select 1 from skill_affixes where skill_id = 10401 and position = 10);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000036 order by id limit 1), 10401, 2, true, false, '', false
      where exists (select 1 from skills where id = 10401 and character_id = 10000036)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10402, 10000036, 'Spirit Blade: Chonghua''s Layered Frost', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/499f6e70d01a8dbfd6794dffa7b27ac4.png', 1, 'Chongyun strikes the ground with his greatsword, causing a Cryo explosion in a circular AoE in front of him that deals <color=#99FFFFFF>Cryo DMG</color>.\nAfter a short delay, the cold air created by the Cryo explosion will coalesce into a Chonghua Frost Field, within which all Sword, Claymore and Polearm-wielding characters'' weapons will be infused with <color=#99FFFFFF>Cryo</color>.\n\n<i>"A crystal-clear ring, and all is silent. The rivers move not, and the clouds are heavy with frost. The altar gates open, and evil is banished."</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10402, 'Skill DMG', '185%', 1
        where exists (select 1 from skills where id = 10402 and character_id = 10000036) and not exists (select 1 from skill_affixes where skill_id = 10402 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10402, 'Infusion Duration', '2.1s', 2
        where exists (select 1 from skills where id = 10402 and character_id = 10000036) and not exists (select 1 from skill_affixes where skill_id = 10402 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10402, 'Field Duration', '10.0s', 3
        where exists (select 1 from skills where id = 10402 and character_id = 10000036) and not exists (select 1 from skill_affixes where skill_id = 10402 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10402, 'CD', '15.0s', 4
        where exists (select 1 from skills where id = 10402 and character_id = 10000036) and not exists (select 1 from skill_affixes where skill_id = 10402 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000036 order by id limit 1), 10402, 2, true, false, '', false
      where exists (select 1 from skills where id = 10402 and character_id = 10000036)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10403, 10000036, 'Spirit Blade: Cloud-Parting Star', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/b677d246bd3bca29b4c7be238a5488b1.png', 1, 'Performing the secret hand seals, Chongyun summons 3 giant spirit blades in mid-air that fall to the earth one by one after a short delay, exploding as they hit the ground.\nWhen the spirit blades explode, they will deal <color=#99FFFFFF>AoE Cryo DMG</color> and launch opponents.\n\n<i>"As ice doth give the biting frost birth, My transcendent blade shakes heaven and earth. Heed my summons and come hence!"</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10403, 'Skill DMG', '189%', 1
        where exists (select 1 from skills where id = 10403 and character_id = 10000036) and not exists (select 1 from skill_affixes where skill_id = 10403 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10403, 'CD', '12.0s', 2
        where exists (select 1 from skills where id = 10403 and character_id = 10000036) and not exists (select 1 from skill_affixes where skill_id = 10403 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10403, 'Energy Cost', '40', 3
        where exists (select 1 from skills where id = 10403 and character_id = 10000036) and not exists (select 1 from skill_affixes where skill_id = 10403 and position = 3);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000036 order by id limit 1), 10403, 5, true, false, '', false
      where exists (select 1 from skills where id = 10403 and character_id = 10000036)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3621, 10000036, 'Steady Breathing', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/33c276d3d7fafcf07a93c414e80dc7aa.png', 2, 'Sword, Claymore, or Polearm-wielding characters within the field created by <color=#FFD780FF>Spirit Blade: Chonghua''s Layered Frost</color> have their Normal ATK SPD increased by 8%.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000036 order by id limit 1), 3621, 1, true, false, '', false
      where exists (select 1 from skills where id = 3621 and character_id = 10000036)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3622, 10000036, 'Rimechaser Blade', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/5d64a3b2e32b3637a9fc1500b3c4f7c5.png', 2, 'When the field created by <color=#FFD780FF>Spirit Blade: Chonghua''s Layered Frost</color> disappears, another spirit blade will be summoned to strike nearby opponents, dealing 100% of Chonghua''s Layered Frost''s Skill DMG as <color=#99FFFFFF>AoE Cryo DMG</color>. Opponents hit by this blade will have their <color=#99FFFFFF>Cryo RES</color> decreased by 10% for 8s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000036 order by id limit 1), 3622, 1, false, false, '', false
      where exists (select 1 from skills where id = 3622 and character_id = 10000036)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3623, 10000036, 'Gallant Journey', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/0059b26ecbc7d12fdb48b63896eb9f27.png', 2, 'When dispatched on an expedition in Liyue, time consumed is reduced by 25%.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000036 order by id limit 1), 3623, 1, true, false, '', false
      where exists (select 1 from skills where id = 3623 and character_id = 10000036)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 2000, 'selected', '7236', '3521', '10758')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 20, 'selected', '19.2%', null, '19.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 2001, 'selected', '373', '414', '787')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 22, 'selected', '56.2%', null, '56.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 2002, 'selected', '427', '52', '479')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 28, 'selected', '121', null, '121')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 46, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 23, 'selected', '125.7%', null, '125.7%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 2000, 'base', '7236', '3521', '10758')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 2001, 'base', '373', '414', '787')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 2002, 'base', '427', '52', '479')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 28, 'base', '121', null, '121')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 20, 'extra', '19.2%', null, '19.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 22, 'extra', '56.2%', null, '56.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 23, 'extra', '125.7%', null, '125.7%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000036 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55442, 'Berserker''s Rose', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/105fbe95a8b020b587d75387e5d84854.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000036 order by id limit 1), 55442, 2100051, 1, 4, 8, 2, '2108', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 1), 3, '4.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 1) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 1), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 1) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 1), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 1) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 1), 28, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 1) and property_type_id = 28);
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57422, 'Instructor''s Feather Accessory', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/239b10d2e54e17572a34ac34156f91fa.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000036 order by id limit 1), 57422, 2100071, 2, 4, 8, 5, '137', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 2), 28, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 2) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 2), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 2) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 2), 22, '6.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 2) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 2), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 2) and property_type_id = 8);
insert into relic_sets (id, name) values (2100061, 'Martial Artist') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100061, 2, 'Normal and Charged Attack DMG +15%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100061 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100061, 4, 'After using Elemental Skill, increases Normal Attack and Charged Attack DMG by 25% for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100061 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (56352, 'Martial Artist''s Water Hourglass', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/34ce361cc5a4049ac54e07a20845f4cf.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000036 order by id limit 1), 56352, 2100061, 3, 3, 8, 6, '17.1%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 3), 23, '3.9%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 3) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 3), 2, '100', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 3) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 3), 5, '7', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 3) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 3), 28, '11', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 3) and property_type_id = 28);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55412, 'Berserker''s Bone Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/a1c51bbf393862969fb15640d6a433bd.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000036 order by id limit 1), 55412, 2100051, 4, 4, 8, 6, '20.6%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 4), 23, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 4) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 4), 3, '4.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 4) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 4), 20, '2.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 4) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 4), 8, '15', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 4) and property_type_id = 8);
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57331, 'Instructor''s Cap', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/13dc11a5b26e2890847a8f86e07061a7.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000036 order by id limit 1), 57331, 2100071, 5, 3, 8, 6, '17.1%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 5), 5, '7', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 5) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 5), 3, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 5) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 5), 2, '115', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000036 order by id limit 1) and position = 5) and property_type_id = 2);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000036, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000036 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000036, 'goblet', 46
          where not exists (select 1 from character_relic_recommendations where character_id = 10000036 and slot = 'goblet' and property_type_id = 46);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000036, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 10000036 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000036, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000036 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000036, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000036 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000036, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000036 and property_type_id = 6);

-- Dahlia (10000115)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000115, 'Dahlia', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f37b/9e5b1c5805948358c656e702e5eecae2.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/5acce39a6836f6dee4743735edf6361e.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c2/e01c3f4178782c24eef631ac13d308ea.png', 'Hydro', 4, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000115, 50, 1, 4, false
    where not exists (select 1 from character_builds where character_id = 10000115);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11427, 'The Dockhand''s Assistant', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/137e6ee9d36a6af76d67718713859bbd.png', 1, 'Sword', 4, 'A convenient cutting tool that you can rarely find nowadays. You can replace the blades as they are dulled by usage.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000115 order by id limit 1), 11427, 1, 0, 3)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1)), 4, 'main', null, null, 42
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1)), 3, 'sub', null, null, 9
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (1151, 10000115, 'Infallible Procession', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c1/a73a5c2efcf8043f7d0ad807a6e3ca78.png', 'Each time Dahlia gains 1 of his Elemental Burst <color=#FFD780FF>{LINK#S11155}Radiant Psalter{/LINK}</color>''s Benison stacks, he will regain 2.5 Elemental Energy.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000115 order by id limit 1), 1151, true, false, '', false
      where exists (select 1 from constellations where id = 1151 and character_id = 10000115)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1152, 10000115, 'Revelation of Mercy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c1/f8d077cd73c85fdc0ae775d29d4445c5.png', 'After Dahlia consumes his Elemental Burst <color=#FFD780FF>{LINK#S11155}Radiant Psalter{/LINK}</color>''s Benison stacks to summon a Shield of Sacred Favor, the character protected by said Shield will gain 25% increased Shield Strength for 12s.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000115 order by id limit 1), 1152, true, false, '', false
      where exists (select 1 from constellations where id = 1152 and character_id = 10000115)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1153, 10000115, 'Windblume Offertory', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c1/f5240dc1c1e4199e8504d0bc5b465900.png', 'Increases the Level of <color=#FFD780FF>{LINK#S11155}Radiant Psalter{/LINK}</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000115 order by id limit 1), 1153, true, false, '', false
      where exists (select 1 from constellations where id = 1153 and character_id = 10000115)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1154, 10000115, 'Collect of the Assembly', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c1/7545e80973af90214134f5c375435a38.png', 'The Favonian Favor from Dahlia''s Elemental Burst <color=#FFD780FF>{LINK#S11155}Radiant Psalter{/LINK}</color> lasts 3 more seconds.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000115 order by id limit 1), 1154, true, false, '', false
      where exists (select 1 from constellations where id = 1154 and character_id = 10000115)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1155, 10000115, 'Let It Be Subtly So', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c1/a9153ad852935d535ccf810c8fa313d9.png', 'Increases the Level of <color=#FFD780FF>{LINK#S11152}Immersive Ordinance{/LINK}</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000115 order by id limit 1), 1155, false, false, '', false
      where exists (select 1 from constellations where id = 1155 and character_id = 10000115)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1156, 10000115, 'You Shall Go Out With Joy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c1/b9be7a54a2a913ee862b74f85f7fcae6.png', 'The current active character affected by the Elemental Burst <color=#FFD780FF>{LINK#S11155}Radiant Psalter{/LINK}</color>''s Favonian Favor has their ATK SPD increased by 10%.\nAdditionally, when an active character affected by Favonian Favor falls, immediately:\n· Revive them.\n· Restore their HP to 100%.\nThis effect can trigger once every 15 minutes.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000115 order by id limit 1), 1156, false, false, '', false
      where exists (select 1 from constellations where id = 1156 and character_id = 10000115)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11151, 10000115, 'Favonius Bladework - Ritual', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 4 rapid strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to unleash 2 rapid sword strikes.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11151, '1-Hit DMG', '43.5%', 1
        where exists (select 1 from skills where id = 11151 and character_id = 10000115) and not exists (select 1 from skill_affixes where skill_id = 11151 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11151, '2-Hit DMG', '40.1%', 2
        where exists (select 1 from skills where id = 11151 and character_id = 10000115) and not exists (select 1 from skill_affixes where skill_id = 11151 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11151, '3-Hit DMG', '23.7%+29.0%', 3
        where exists (select 1 from skills where id = 11151 and character_id = 10000115) and not exists (select 1 from skill_affixes where skill_id = 11151 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11151, '4-Hit DMG', '65.7%', 4
        where exists (select 1 from skills where id = 11151 and character_id = 10000115) and not exists (select 1 from skill_affixes where skill_id = 11151 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11151, 'Charged Attack DMG', '39.9%+55.1%', 5
        where exists (select 1 from skills where id = 11151 and character_id = 10000115) and not exists (select 1 from skill_affixes where skill_id = 11151 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11151, 'Charged Attack Stamina Cost', '20.0', 6
        where exists (select 1 from skills where id = 11151 and character_id = 10000115) and not exists (select 1 from skill_affixes where skill_id = 11151 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11151, 'Plunge DMG', '63.9%', 7
        where exists (select 1 from skills where id = 11151 and character_id = 10000115) and not exists (select 1 from skill_affixes where skill_id = 11151 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 11151, 'Low/High Plunge DMG', '128%/160%', 8
        where exists (select 1 from skills where id = 11151 and character_id = 10000115) and not exists (select 1 from skill_affixes where skill_id = 11151 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000115 order by id limit 1), 11151, 1, true, false, '', false
      where exists (select 1 from skills where id = 11151 and character_id = 10000115)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11152, 10000115, 'Immersive Ordinance', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3bf/d35b2faee503b4a5802dd6f8bf926b96.png', 1, 'Time for a fun little trick! Summons the Sacramental Shower in different ways depending on whether you Tap or Hold it.\n\n<color=#FFD780FF>Tap</color>\nAfter a short prayer, summons the Sacramental Shower in front.\n\n<color=#FFD780FF>Hold</color>\nEngages in continuous prayer, and when done, summons forth a Sacramental Shower in the designated position.\n\n<color=#FFD780FF>Sacramental Shower</color>\nWhen opponents or nearby party members touch the Sacramental Shower, different effects will occur depending on the one who touches it:\nIf an opponent touches the Shower, it will explode and deal <color=#80C0FFFF>AoE Hydro DMG</color> to nearby opponents.\nIf a nearby party member touches it, it will bounce the one who touches it high in the air.\n\nOnly 1 Sacramental Shower summoned by Dahlia himself can be on the field at once.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11152, 'Skill DMG', '232.8%', 1
        where exists (select 1 from skills where id = 11152 and character_id = 10000115) and not exists (select 1 from skill_affixes where skill_id = 11152 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11152, 'Skill CD', '9.0s', 2
        where exists (select 1 from skills where id = 11152 and character_id = 10000115) and not exists (select 1 from skill_affixes where skill_id = 11152 and position = 2);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000115 order by id limit 1), 11152, 1, true, false, '', false
      where exists (select 1 from skills where id = 11152 and character_id = 10000115)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11155, 10000115, 'Radiant Psalter', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3bf/9882228cc022728e9d365bbefeb34ca3.png', 1, 'Appeals to the divine with earnestness and song, dealing <color=#80C0FFFF>AoE Hydro DMG</color> to nearby opponents and granting his party members Favonian Favor, summoning a Shield of Sacred Favor.\nThe Shield of Sacred Favor''s DMG absorption is based on Dahlia''s Max HP, and it will absorb <color=#80C0FFFF>Hydro DMG</color> with 250% effectiveness.\n\n<color=#FFD780FF>Favonian Favor</color>\nWhile this effect is active, 1 Benison stack may be consumed to summon a new Shield of Sacred Favor when an existing Shield is broken via DMG.\n\nDahlia can obtain Benison via the following methods:\n· He will gain 1 Benison stack when his own active party member hits opponents 4 times with Normal Attacks while affected by Favonian Favor.\n· After triggering the effect of his Ascension Talent, "The Wind''s Gentle Grace" (You must first unlock this Ascension Talent.)\nDahlia can gain a maximum of 4 Benison stacks per Favonian Favor duration.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11155, 'Skill DMG', '508.0%', 1
        where exists (select 1 from skills where id = 11155 and character_id = 10000115) and not exists (select 1 from skill_affixes where skill_id = 11155 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11155, 'Shield of Sacred Favor DMG Absorption', '4.2% Max HP+429', 2
        where exists (select 1 from skills where id = 11155 and character_id = 10000115) and not exists (select 1 from skill_affixes where skill_id = 11155 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11155, 'Favonian Favor Duration', '12.0s', 3
        where exists (select 1 from skills where id = 11155 and character_id = 10000115) and not exists (select 1 from skill_affixes where skill_id = 11155 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11155, 'Energy Cost', '60', 4
        where exists (select 1 from skills where id = 11155 and character_id = 10000115) and not exists (select 1 from skill_affixes where skill_id = 11155 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11155, 'CD', '15.0s', 5
        where exists (select 1 from skills where id = 11155 and character_id = 10000115) and not exists (select 1 from skill_affixes where skill_id = 11155 and position = 5);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000115 order by id limit 1), 11155, 4, true, false, '', false
      where exists (select 1 from skills where id = 11155 and character_id = 10000115)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11521, 10000115, 'The Wind''s Gentle Grace', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c1/1013e79749094d0bac7151ce78d185fd.png', 2, 'When characters affected by the Favonian Favor effect of the Elemental Burst <color=#FFD780FF>{LINK#S11155}Radiant Psalter{/LINK}</color> trigger Frozen reactions on opponents, they will grant Dahlia 2 Benison stacks. This effect can trigger once every 8s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000115 order by id limit 1), 11521, 1, true, false, '', false
      where exists (select 1 from skills where id = 11521 and character_id = 10000115)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11522, 10000115, 'Prayer of Well-Wrought Joy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c1/d24a6da2f92e8d8570f5f9eac32b60d2.png', 2, 'When your active party member is affected by the Favonian Favor effect of the Elemental Burst <color=#FFD780FF>{LINK#S11155}"Radiant Psalter,"{/LINK}</color> their ATK SPD will increase based on Dahlia''s Max HP: Every 1,000 Max HP will cause an increase of 0.5%, up to a maximum of 20%.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000115 order by id limit 1), 11522, 1, false, false, '', false
      where exists (select 1 from skills where id = 11522 and character_id = 10000115)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11523, 10000115, 'Pilgrimage Upon Returning Winds', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4f3d88c7be322e43f55f65d10483b6c7.png', 2, 'During the day (06:00 – 18:00), your party members gain the Swift Stride effect: Movement SPD increased by 10%.\nDoes not take effect in Domains, Trounce Domains, or the Spiral Abyss. Swift Stride does not stack.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000115 order by id limit 1), 11523, 1, true, false, '', false
      where exists (select 1 from skills where id = 11523 and character_id = 10000115)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 2000, 'selected', '6631', '5399', '12030')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 20, 'selected', '17.0%', null, '17.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 2001, 'selected', '143', '183', '325')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 22, 'selected', '55.6%', null, '55.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 2002, 'selected', '297', '80', '377')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 28, 'selected', '13', null, '13')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 42, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 23, 'selected', '120.0%', null, '120.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 2000, 'base', '6631', '5399', '12030')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 2001, 'base', '143', '183', '325')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 2002, 'base', '297', '80', '377')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 28, 'base', '13', null, '13')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 20, 'extra', '17.0%', null, '17.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 22, 'extra', '55.6%', null, '55.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 23, 'extra', '120.0%', null, '120.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000115 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55443, 'Berserker''s Rose', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/105fbe95a8b020b587d75387e5d84854.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000115 order by id limit 1), 55443, 2100051, 1, 4, 8, 2, '2108', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 1), 8, '31', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 1) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 1), 28, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 1) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 1), 3, '4.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 1) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 1), 5, '12', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 1) and property_type_id = 5);
insert into relic_sets (id, name) values (2100121, 'Scholar') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100121, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100121 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100121, 4, 'Gaining Elemental Particles or Orbs gives 3 Energy to all party members who have a bow or a catalyst equipped. Can only occur once every 3s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100121 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (62422, 'Scholar''s Quill Pen', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/5836c0d899ea0ced561c8ed348b72389.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000115 order by id limit 1), 62422, 2100121, 2, 4, 8, 5, '137', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 2), 2, '167', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 2), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 2) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 2), 22, '5.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 2) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 2), 9, '5.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 2) and property_type_id = 9);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55452, 'Berserker''s Timepiece', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/72514ea9341bf0db03079d0c02ef78b2.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000115 order by id limit 1), 55452, 2100051, 3, 4, 0, 3, '6.3%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 3), 2, '167', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 3) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 3), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 3) and property_type_id = 5);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59412, 'Exile''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7847bfdeab60c072ec09b17462505cdc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000115 order by id limit 1), 59412, 2100091, 4, 4, 0, 3, '6.3%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 4), 2, '239', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 4) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 4), 6, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 4) and property_type_id = 6);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59433, 'Exile''s Circlet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/22faf0f5c42ac3652ea2c4a1ca38ac05.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000115 order by id limit 1), 59433, 2100091, 5, 4, 0, 3, '6.3%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 5), 2, '191', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 5) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 5), 5, '12', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 5) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 5), 8, '15', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000115 order by id limit 1) and position = 5) and property_type_id = 8);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000115, 'sand', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000115 and slot = 'sand' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000115, 'goblet', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000115 and slot = 'goblet' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000115, 'circlet', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000115 and slot = 'circlet' and property_type_id = 3);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000115, 3
        where not exists (select 1 from character_recommended_substats where character_id = 10000115 and property_type_id = 3);

-- Xingqiu (10000025)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000025, 'Xingqiu', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/699e3449/cf352253ba22524007154d6d6fc66b55.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/86d17ffd272051cdca2527ec47ad5f35.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/0c63018b6beced753116e3d7c9447188.png', 'Hydro', 4, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000025, 50, 3, 0, false
    where not exists (select 1 from character_builds where character_id = 10000025);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11403, 'Sacrificial Sword', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/8d40dcb0e8e25ad6c5940095fa6984ab.png', 1, 'Sword', 4, 'A ceremonial sword that has become petrified over time. The trinkets on it are still visible. It grants the wielder the power to withstand the winds of time.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000025 order by id limit 1), 11403, 70, 4, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1)), 4, 'main', null, null, 347
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1)), 23, 'sub', null, null, 50.5
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (251, 10000025, 'The Scent Remained', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/52e4ab45a2c5814470528028b5e12d41.png', 'Increases the maximum number of Rain Swords by 1.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000025 order by id limit 1), 251, false, false, '', false
      where exists (select 1 from constellations where id = 251 and character_id = 10000025)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (252, 10000025, 'Rainbow Upon the Azure Sky', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/657d94b3940f1b09d8a8835e35bd8a74.png', 'Extends the duration of <color=#FFD780FF>Guhua Sword: Raincutter</color> by 3s.\nDecreases the <color=#80C0FFFF>Hydro RES</color> of opponents hit by sword rain attacks by 15% for 4s.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000025 order by id limit 1), 252, false, false, '', false
      where exists (select 1 from constellations where id = 252 and character_id = 10000025)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (253, 10000025, 'Weaver of Verses', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/7d0952dc3f90e33212a94e784b737bf3.png', 'Increases the Level of <color=#FFD780FF>Guhua Sword: Raincutter</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000025 order by id limit 1), 253, false, false, '', false
      where exists (select 1 from constellations where id = 253 and character_id = 10000025)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (254, 10000025, 'Evilsoother', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/230c492a90efd16864226e20ac91bd10.png', 'Throughout the duration of <color=#FFD780FF>Guhua Sword: Raincutter</color>, the DMG dealt by <color=#FFD780FF>Guhua Sword: Fatal Rainscreen</color> is increased by 50%.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000025 order by id limit 1), 254, false, false, '', false
      where exists (select 1 from constellations where id = 254 and character_id = 10000025)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (255, 10000025, 'Embrace of Rain', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/1199821075863caaa5ddb30ed176626f.png', 'Increases the Level of <color=#FFD780FF>Guhua Sword: Fatal Rainscreen</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000025 order by id limit 1), 255, false, false, '', false
      where exists (select 1 from constellations where id = 255 and character_id = 10000025)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (256, 10000025, 'Hence, Call Them My Own Verses', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/ca1347deeb3ea1ac47ee92ba84f7311e.png', 'Activating 2 of <color=#FFD780FF>Guhua Sword: Raincutter</color>''s sword rain attacks greatly enhances the third sword rain attack. On hit, the third sword rain attack also regenerates 3 Energy for Xingqiu.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000025 order by id limit 1), 256, false, false, '', false
      where exists (select 1 from constellations where id = 256 and character_id = 10000025)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10381, 10000025, 'Guhua Style', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 rapid strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to unleash 2 rapid sword strikes.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10381, '1-Hit DMG', '46.6%', 1
        where exists (select 1 from skills where id = 10381 and character_id = 10000025) and not exists (select 1 from skill_affixes where skill_id = 10381 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10381, '2-Hit DMG', '47.6%', 2
        where exists (select 1 from skills where id = 10381 and character_id = 10000025) and not exists (select 1 from skill_affixes where skill_id = 10381 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10381, '3-Hit DMG', '28.6%+28.6%', 3
        where exists (select 1 from skills where id = 10381 and character_id = 10000025) and not exists (select 1 from skill_affixes where skill_id = 10381 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10381, '4-Hit DMG', '56.0%', 4
        where exists (select 1 from skills where id = 10381 and character_id = 10000025) and not exists (select 1 from skill_affixes where skill_id = 10381 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10381, '5-Hit DMG', '35.9%+35.9%', 5
        where exists (select 1 from skills where id = 10381 and character_id = 10000025) and not exists (select 1 from skill_affixes where skill_id = 10381 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10381, 'Charged Attack DMG', '47.3%+56.2%', 6
        where exists (select 1 from skills where id = 10381 and character_id = 10000025) and not exists (select 1 from skill_affixes where skill_id = 10381 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10381, 'Charged Attack Stamina Cost', '20.0', 7
        where exists (select 1 from skills where id = 10381 and character_id = 10000025) and not exists (select 1 from skill_affixes where skill_id = 10381 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10381, 'Plunge DMG', '63.9%', 8
        where exists (select 1 from skills where id = 10381 and character_id = 10000025) and not exists (select 1 from skill_affixes where skill_id = 10381 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10381, 'Low/High Plunge DMG', '128%/160%', 9
        where exists (select 1 from skills where id = 10381 and character_id = 10000025) and not exists (select 1 from skill_affixes where skill_id = 10381 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000025 order by id limit 1), 10381, 1, true, false, '', false
      where exists (select 1 from skills where id = 10381 and character_id = 10000025)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10382, 10000025, 'Guhua Sword: Fatal Rainscreen', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/6bdf1a137facbc5200806063847db95f.png', 1, 'Xingqiu performs twin strikes with his sword, dealing <color=#80C0FFFF>Hydro DMG</color>. At the same time, this ability creates the maximum number of Rain Swords, which will orbit your active character.\nThe Rain Swords have the following properties:\n·When a character takes DMG, the Rain Sword will shatter, reducing the amount of DMG taken.\n·Increases the character''s resistance to interruption.\n\n20% of Xingqiu''s <color=#80C0FFFF>Hydro DMG Bonus</color> will be converted to additional DMG Reduction for the Rain Swords.\n\nThe maximum amount of additional DMG Reduction that can be gained this way is 24%.\nThe initial maximum number of Rain Swords is 3.\nUsing this ability applies the <color=#80C0FFFF>Wet</color> status onto the character.\n\n<i>"Easier to slay a rain dragon than to sever the rain."</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10382, 'Skill DMG', '181%+206%', 1
        where exists (select 1 from skills where id = 10382 and character_id = 10000025) and not exists (select 1 from skill_affixes where skill_id = 10382 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10382, 'Damage Reduction Ratio', '21%', 2
        where exists (select 1 from skills where id = 10382 and character_id = 10000025) and not exists (select 1 from skill_affixes where skill_id = 10382 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10382, 'Duration', '15.0s', 3
        where exists (select 1 from skills where id = 10382 and character_id = 10000025) and not exists (select 1 from skill_affixes where skill_id = 10382 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10382, 'CD', '21.0s', 4
        where exists (select 1 from skills where id = 10382 and character_id = 10000025) and not exists (select 1 from skill_affixes where skill_id = 10382 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000025 order by id limit 1), 10382, 2, true, false, '', false
      where exists (select 1 from skills where id = 10382 and character_id = 10000025)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10385, 10000025, 'Guhua Sword: Raincutter', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/7712c50959068354399d955ef5f1c685.png', 1, 'Initiate Rainbow Bladework and fight using an illusory sword rain, while creating the maximum number of Rain Swords.\n\n<color=#FFD780FF>Rainbow Bladework</color>\n·Your active character''s Normal Attacks will trigger consecutive sword rain attacks, dealing <color=#80C0FFFF>Hydro DMG</color>.\n·Rain Swords will remain at the maximum number throughout the ability''s duration.\n\n<i>The "Way of the Rain Cutter" is one of the esoteric secret techniques of the Guhua Sect.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10385, 'Sword Rain DMG', '58.3%', 1
        where exists (select 1 from skills where id = 10385 and character_id = 10000025) and not exists (select 1 from skill_affixes where skill_id = 10385 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10385, 'Duration', '15.0s', 2
        where exists (select 1 from skills where id = 10385 and character_id = 10000025) and not exists (select 1 from skill_affixes where skill_id = 10385 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10385, 'CD', '20.0s', 3
        where exists (select 1 from skills where id = 10385 and character_id = 10000025) and not exists (select 1 from skill_affixes where skill_id = 10385 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10385, 'Energy Cost', '80', 4
        where exists (select 1 from skills where id = 10385 and character_id = 10000025) and not exists (select 1 from skill_affixes where skill_id = 10385 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000025 order by id limit 1), 10385, 2, true, false, '', false
      where exists (select 1 from skills where id = 10385 and character_id = 10000025)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (2521, 10000025, 'Hydropathic', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/bfab78a31522a567b590b218e916d708.png', 2, 'When a Rain Sword is shattered or when its duration expires, it regenerates the current character''s HP based on 6% of Xingqiu''s Max HP.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000025 order by id limit 1), 2521, 1, true, false, '', false
      where exists (select 1 from skills where id = 2521 and character_id = 10000025)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (2522, 10000025, 'Blades Amidst Raindrops', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/d170ce583e7a64d75b8dcfe129a5d44c.png', 2, 'Xingqiu gains a 20% <color=#80C0FFFF>Hydro DMG Bonus</color>.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000025 order by id limit 1), 2522, 1, false, false, '', false
      where exists (select 1 from skills where id = 2522 and character_id = 10000025)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (2523, 10000025, 'Flash of Genius', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/68ad160b4d943ffaf5a88ceded335010.png', 2, 'When Xingqiu crafts Character Talent Materials, he has a 25% chance to refund a portion of the crafting materials used.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000025 order by id limit 1), 2523, 1, true, false, '', false
      where exists (select 1 from skills where id = 2523 and character_id = 10000025)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 2000, 'selected', '5420', '1064', '6484')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 20, 'selected', '7.5%', null, '7.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 2001, 'selected', '454', '446', '899')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 22, 'selected', '77.4%', null, '77.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 2002, 'selected', '402', '107', '509')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 28, 'selected', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 42, 'selected', '6.3%', null, '6.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 23, 'selected', '189.5%', null, '189.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 2000, 'base', '5420', '1064', '6484')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 2001, 'base', '454', '446', '899')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 2002, 'base', '402', '107', '509')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 28, 'base', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 20, 'extra', '7.5%', null, '7.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 22, 'extra', '77.4%', null, '77.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 23, 'extra', '189.5%', null, '189.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 42, 'element', '6.3%', null, '6.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000025 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47543, 'Honor to Your Devotion', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/80425abeeb96bfefbfcb2b49cd5339db.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000025 order by id limit 1), 47543, 2150471, 1, 5, 0, 2, '717', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 1), 6, '4.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 1) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 1), 5, '18', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 1) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 1), 23, '6.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 1) and property_type_id = 23);
insert into relic_sets (id, name) values (2150051, 'Thundering Fury') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150051, 2, 'Electro DMG Bonus +15%'
        where not exists (select 1 from relic_set_affixes where set_id = 2150051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150051, 4, 'Increases the DMG caused by Overloaded, Electro-Charged, Superconduct, and Hyperbloom by 40%, the DMG Bonus conferred by Aggravate by 20%, and the DMG caused by Lunar-Charged and Stellar-Conduct by 20%. When Quicken or the aforementioned Elemental Reactions are triggered, Elemental Skill CD is decreased by 1s. Can only occur once every 0.8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (79422, 'Survivor of Catastrophe', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/531cdc6e8c3a5f8b7798e90d57d8bc60.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000025 order by id limit 1), 79422, 2150051, 2, 4, 12, 5, '185', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 2), 3, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 2) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 2), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 2) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 2), 8, '33', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 2) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 2), 6, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 2) and property_type_id = 6);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59351, 'Exile''s Pocket Watch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f9dd8d807eaa9ec5997b9c0e6f7cd48c.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000025 order by id limit 1), 59351, 2100091, 3, 3, 8, 6, '17.1%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 3), 23, '2.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 3) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 3), 3, '3.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 3) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 3), 8, '9', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 3) and property_type_id = 8);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59412, 'Exile''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7847bfdeab60c072ec09b17462505cdc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000025 order by id limit 1), 59412, 2100091, 4, 4, 0, 42, '6.3%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 4), 8, '15', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 4) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 4), 20, '2.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 4) and property_type_id = 20);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47433, 'Testament to Your Faith', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/11eeed27d2d7fbb0ab34f03c87325688.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000025 order by id limit 1), 47433, 2150471, 5, 4, 8, 22, '27.4%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 5), 23, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 5) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 5), 6, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 5) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 5), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 5), 9, '9.3%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000025 order by id limit 1) and position = 5) and property_type_id = 9);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000025, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000025 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000025, 'goblet', 42
          where not exists (select 1 from character_relic_recommendations where character_id = 10000025 and slot = 'goblet' and property_type_id = 42);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000025, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 10000025 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000025, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000025 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000025, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000025 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000025, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000025 and property_type_id = 6);

commit;
