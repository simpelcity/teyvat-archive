-- Part 9 of 13. Generated from app/data/character_detail.ts.
-- Insert-only and safe to re-run. Run the parts in order in the Supabase SQL editor.
begin;

-- Xiangling (10000023)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000023, 'Xiangling', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/c836c2dc7d71fe8065ae2798d360167b.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/9958d58bde859327052bab638b0003d9.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/b5d779f06e660962dff9009eb58a90f8.png', 'Pyro', 4, 13)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000023, 20, 1, 1, false
    where not exists (select 1 from character_builds where character_id = 10000023);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (13427, 'Prospector''s Drill', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6ab31686/d27fd73308eb0def75127b4aac89e6ea.png', 13, 'Polearm', 4, 'A long-handled drill that you can rarely find nowadays. It was often used in delving and in carving stones.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000023 order by id limit 1), 13427, 1, 0, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1)), 4, 'main', null, null, 44
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1)), 6, 'sub', null, null, 6
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (231, 10000023, 'Crispy Outside, Tender Inside', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/17238358afde1f68cbf12b07f99cc8cc.png', 'Opponents hit by Guoba''s attacks have their <color=#FF9999FF>Pyro RES</color> reduced by 15% for 6s.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000023 order by id limit 1), 231, true, false, '', false
      where exists (select 1 from constellations where id = 231 and character_id = 10000023)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (232, 10000023, 'Oil Meets Fire', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/bf594f707e347f9a5deede2c43fb7882.png', 'The last attack in a Normal Attack sequence applies the Implode status onto the opponent for 2s. An explosion will occur once this duration ends, dealing 75% of Xiangling''s ATK as <color=#FF9999FF>AoE Pyro DMG</color>.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000023 order by id limit 1), 232, false, false, '', false
      where exists (select 1 from constellations where id = 232 and character_id = 10000023)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (233, 10000023, 'Deepfry', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/722ed06f51f9689eb0d75a5dd552f487.png', 'Increases the Level of <color=#FFD780FF>Pyronado</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000023 order by id limit 1), 233, false, false, '', false
      where exists (select 1 from constellations where id = 233 and character_id = 10000023)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (234, 10000023, 'Slowbake', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/09682139fe5e0e18232e104ae596aef9.png', '<color=#FFD780FF>Pyronado</color>''s duration is increased by 40%.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000023 order by id limit 1), 234, false, false, '', false
      where exists (select 1 from constellations where id = 234 and character_id = 10000023)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (235, 10000023, 'Guoba Mad', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/369660caf4222c0a1b281956385f89c1.png', 'Increases the Level of <color=#FFD780FF>Guoba Attack</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000023 order by id limit 1), 235, false, false, '', false
      where exists (select 1 from constellations where id = 235 and character_id = 10000023)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (236, 10000023, 'Condensed Pyronado', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/35584a4e81abcf209fe7c27cc64608e0.png', 'For the duration of <color=#FFD780FF>Pyronado</color>, all party members receive a 15% <color=#FF9999FF>Pyro DMG Bonus</color>.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000023 order by id limit 1), 236, false, false, '', false
      where exists (select 1 from constellations where id = 236 and character_id = 10000023)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10231, 10000023, 'Dough-Fu', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/0a4af4ecb63b4741aa3e42d18a2a0c21.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 consecutive spear strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to lunge forward, dealing damage to opponents along the way.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10231, '1-Hit DMG', '42.1%', 1
        where exists (select 1 from skills where id = 10231 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10231 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10231, '2-Hit DMG', '42.1%', 2
        where exists (select 1 from skills where id = 10231 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10231 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10231, '3-Hit DMG', '26.1%+26.1%', 3
        where exists (select 1 from skills where id = 10231 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10231 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10231, '4-Hit DMG', '14.1%*4', 4
        where exists (select 1 from skills where id = 10231 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10231 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10231, '5-Hit DMG', '71.0%', 5
        where exists (select 1 from skills where id = 10231 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10231 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10231, 'Charged Attack DMG', '122%', 6
        where exists (select 1 from skills where id = 10231 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10231 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10231, 'Charged Attack Stamina Cost', '25.0', 7
        where exists (select 1 from skills where id = 10231 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10231 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10231, 'Plunge DMG', '63.9%', 8
        where exists (select 1 from skills where id = 10231 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10231 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10231, 'Low/High Plunge DMG', '128%/160%', 9
        where exists (select 1 from skills where id = 10231 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10231 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000023 order by id limit 1), 10231, 1, true, false, '', false
      where exists (select 1 from skills where id = 10231 and character_id = 10000023)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10232, 10000023, 'Guoba Attack', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/371a8a5afa7cb52c2f5829de7ea5d278.png', 1, 'Summons Guoba, who will continuously breathe fire at opponents, dealing <color=#FF9999FF>AoE Pyro DMG</color>.\n\n<i>Guoba loves to eat spicy food. Problem is, his stomach can''t handle something this spicy.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10232, 'Flame DMG', '111%', 1
        where exists (select 1 from skills where id = 10232 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10232 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10232, 'CD', '12.0s', 2
        where exists (select 1 from skills where id = 10232 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10232 and position = 2);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000023 order by id limit 1), 10232, 1, true, false, '', false
      where exists (select 1 from skills where id = 10232 and character_id = 10000023)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10235, 10000023, 'Pyronado', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/e2aa46b0ea41643d9758fe653b0b5f4b.png', 1, 'Displaying her mastery over both fire and polearms, Xiangling sends a Pyronado whirling around her.\nThe Pyronado will move with your character for the ability''s duration, dealing <color=#FF9999FF>Pyro DMG</color> to all opponents in its path.\n\n<i>There will never be enough heat. Never.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10235, '1-Hit Swing DMG', '72.0%', 1
        where exists (select 1 from skills where id = 10235 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10235 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10235, '2-Hit Swing DMG', '88.0%', 2
        where exists (select 1 from skills where id = 10235 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10235 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10235, '3-Hit Swing DMG', '110%', 3
        where exists (select 1 from skills where id = 10235 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10235 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10235, 'Pyronado DMG', '112%', 4
        where exists (select 1 from skills where id = 10235 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10235 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10235, 'Duration', '10.0s', 5
        where exists (select 1 from skills where id = 10235 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10235 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10235, 'CD', '20.0s', 6
        where exists (select 1 from skills where id = 10235 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10235 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10235, 'Energy Cost', '80', 7
        where exists (select 1 from skills where id = 10235 and character_id = 10000023) and not exists (select 1 from skill_affixes where skill_id = 10235 and position = 7);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000023 order by id limit 1), 10235, 1, true, false, '', false
      where exists (select 1 from skills where id = 10235 and character_id = 10000023)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (2321, 10000023, 'Crossfire', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/dddde0d238bff23e02c8c02974475278.png', 2, 'Increases the flame range of Guoba by 20%.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000023 order by id limit 1), 2321, 1, true, false, '', false
      where exists (select 1 from skills where id = 2321 and character_id = 10000023)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (2322, 10000023, 'Beware, It''s Super Hot!', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/a97d835f2bc79f6eaede166e27e3e5b3.png', 2, 'When <color=#FFD780FF>Guoba Attack</color>''s effect ends, Guoba leaves a chili pepper on the spot where it disappeared. Picking up a chili pepper increases ATK by 10% for 10s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000023 order by id limit 1), 2322, 1, false, false, '', false
      where exists (select 1 from skills where id = 2322 and character_id = 10000023)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (2323, 10000023, 'Chef de Cuisine', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4adbcd6525196f48730897ded57c8ca1.png', 2, 'When Xiangling cooks an ATK-boosting dish perfectly, she has a 12% chance to receive double the product.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000023 order by id limit 1), 2323, 1, true, false, '', false
      where exists (select 1 from skills where id = 2323 and character_id = 10000023)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 2000, 'selected', '3024', '1179', '4202')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 20, 'selected', '7.7%', null, '7.7%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 2001, 'selected', '106', '94', '201')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 22, 'selected', '67.9%', null, '67.9%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 2002, 'selected', '186', '41', '227')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 28, 'selected', '35', null, '35')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 40, 'selected', '6.3%', null, '6.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 23, 'selected', '137.4%', null, '137.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 2000, 'base', '3024', '1179', '4202')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 2001, 'base', '106', '94', '201')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 2002, 'base', '186', '41', '227')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 28, 'base', '35', null, '35')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 20, 'extra', '7.7%', null, '7.7%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 22, 'extra', '67.9%', null, '67.9%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 23, 'extra', '137.4%', null, '137.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 40, 'element', '6.3%', null, '6.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000023 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
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
      values ((select id from character_builds where character_id = 10000023 order by id limit 1), 47543, 2150471, 1, 5, 0, 2, '717', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 1), 28, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 1) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 1), 6, '5.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 1) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 1), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 1) and property_type_id = 5);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59422, 'Exile''s Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/1738ca88f6afa4f1d645e8afb214a7ed.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000023 order by id limit 1), 59422, 2100091, 2, 4, 0, 5, '42', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 2), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 2) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 2), 3, '4.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 2) and property_type_id = 3);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47553, 'Time Gifted Unto You', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/f378887dafcdfd8b72457765732a0828.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000023 order by id limit 1), 47553, 2150471, 3, 5, 2, 23, '12.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 3), 6, '5.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 3) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 3), 20, '2.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 3) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 3), 8, '21', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 3) and property_type_id = 8);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47412, 'Chalice of Your Blood and Sorrow', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/d653c3aa684c882bbf09757f695ab533.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000023 order by id limit 1), 47412, 2150471, 4, 4, 0, 40, '6.3%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 4), 2, '167', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 4) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 4), 28, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 4) and property_type_id = 28);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59432, 'Exile''s Circlet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/22faf0f5c42ac3652ea2c4a1ca38ac05.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000023 order by id limit 1), 59432, 2100091, 5, 4, 4, 22, '17.9%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 5), 9, '4.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 5) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 5), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 5), 2, '167', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000023 order by id limit 1) and position = 5) and property_type_id = 2);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000023, 'sand', 23
          where not exists (select 1 from character_relic_recommendations where character_id = 10000023 and slot = 'sand' and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000023, 'goblet', 40
          where not exists (select 1 from character_relic_recommendations where character_id = 10000023 and slot = 'goblet' and property_type_id = 40);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000023, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 10000023 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000023, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000023 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000023, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000023 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000023, 23
        where not exists (select 1 from character_recommended_substats where character_id = 10000023 and property_type_id = 23);

-- Mitya (10000136)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000136, 'Mitya', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6776/a024f93489bf998b23dd8a41746bbc17.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/3737799e7624da61da147e5727774470.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6782/3c0a0dabc8a92dd8b3a3ac227f1eba39.png', 'Electro', 5, 10)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000136, 79, 4, 1, true
    where not exists (select 1 from character_builds where character_id = 10000136);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (14525, 'Starsealed Edict', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6776/ec4643eca7890833b5b415f7ad5dc79b.png', 10, 'Catalyst', 5, 'A hefty tome containing the Royal Energy Commission''s internal rules and procedures, with numerous entries dating back many years.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000136 order by id limit 1), 14525, 70, 4, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1)), 4, 'main', null, null, 408
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1)), 22, 'sub', null, null, 72.7
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (1361, 10000136, 'The Observer Seeking What Is Missing', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/48861d3a1c49b6b8ee042d1f596d7de9.png', 'The maximum number of <color=#FFD780FF>{LINK#N11360001}Gradient Beacons{/LINK}</color> Mitya can carry is increased to 5. Using the Elemental Skill <color=#FFD780FF>Principle: Variable Detection</color> additionally creates 1 <color=#FFD780FF>Gradient Beacon</color>.\nWhile the <color=#FFD780FF>{LINK#N11360002}Detection Core{/LINK}</color> is present, your own active character''s CRIT DMG is increased by 40%.\nAdditionally, Mitya regenerates 10 Elemental Energy when a <color=#FFD780FF>Gradient Beacon</color> is created. This effect can be triggered once every 8s.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000136 order by id limit 1), 1361, true, false, '', false
      where exists (select 1 from constellations where id = 1361 and character_id = 10000136)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1362, 10000136, 'The Matter That Slumbers Beyond Inertness', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/aa963db4b8e62e53be4e6f30b2cf7d65.png', 'While the <color=#FFD780FF>{LINK#N11360002}Detection Core{/LINK}</color> is present, all opponents within the <color=#FFD780FF>Polestar Field</color> have their <color=#99FFFFFF>Cryo RES</color> and <color=#FFACFFFF>Electro RES</color> decreased by 20%.\nAdditionally, if the <color=#FFD780FF>Detection Core</color> created is:\n·Steady State: All nearby party members gain 123 Elemental Mastery;\n·Overloaded: Your own active character gains 234 Elemental Mastery.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000136 order by id limit 1), 1362, false, false, '', false
      where exists (select 1 from constellations where id = 1362 and character_id = 10000136)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1363, 10000136, 'The Knotted String of Invariant Topology', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/4f10c0f3bf94103994d6b837b618ac32.png', 'Increases the Level of the Elemental Skill {LINK#S11362}<color=#FFD780FF>Principle: Variable Detection</color>{/LINK} by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000136 order by id limit 1), 1363, false, false, '', false
      where exists (select 1 from constellations where id = 1363 and character_id = 10000136)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1364, 10000136, 'The Isotopes Born of Decay', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/482ba5325152159b73a99c6a64942584.png', '<color=#FFD780FF>{LINK#N11360002}Detection Cores{/LINK}</color> created by Mitya himself deals 1 instance of <color=#FFACFFFF>AoE Electro DMG</color> equal to 300% of Mitya''s Elemental Mastery to nearby opponents for every 5 <color=#FFD780FF>{LINK#N11360001}Gradient Beacons{/LINK}</color> consumed while it is on the field. This DMG is considered Stellar-Conduct reaction DMG.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000136 order by id limit 1), 1364, false, false, '', false
      where exists (select 1 from constellations where id = 1364 and character_id = 10000136)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1365, 10000136, 'The Periodic Law That Orders All', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/60e7f8319cc2598b1f5f081b1826ec5a.png', 'Increases the Level of Normal Attack: {LINK#S11361}<color=#FFD780FF>Chain Reaction</color>{/LINK} by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000136 order by id limit 1), 1365, false, false, '', false
      where exists (select 1 from constellations where id = 1365 and character_id = 10000136)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1366, 10000136, 'Elemental Transition at the Gate of Reason', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/9e83c17680d3798201ec21917005e097.png', '<color=#FFD780FF>{LINK#N11360002}Detection Core{/LINK}</color> is enhanced. If the <color=#FFD780FF>Detection Core</color>:\n · Is in the Steady State: <color=#FFD780FF>Detection Core</color> deals 115% of its original DMG.\n· Is Overloaded: There is a 34% chance to create 1 new <color=#FFD780FF>{LINK#N11360001}Gradient Beacon{/LINK}</color> whenever Mitya consumes a <color=#FFD780FF>Gradient Beacon</color> with the <color=#FFD780FF>{LINK#N11360002}Detection Core{/LINK}</color>.\nAdditionally, Stellar-Conduct reaction DMG dealt by all nearby party members is <color=#FFD780FF>{LINK#N11190007}Elevated{/LINK}</color> by 20%.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000136 order by id limit 1), 1366, false, false, '', false
      where exists (select 1 from constellations where id = 1366 and character_id = 10000136)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11361, 10000136, 'Chain Reaction', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/2c014e6053c4f0d032e1d1ff0c6de0e1.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms a maximum of 3 attacks that deal <color=#FFACFFFF>Electro DMG</color>.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to deal <color=#FFACFFFF>AoE Electro DMG</color> to the area in front after a short casting time.\nMitya will instead perform the special Charged Attack <color=#FFD780FF>Gradient Detonation</color>, which consumes no Stamina, if a <color=#FFD780FF>{LINK#N11360002}Detection Core: Overload{/LINK}</color> created by Mitya himself is currently on the field and he has at least 1 <color=#FFD780FF>{LINK#N11360001}Gradient Beacon{/LINK}</color>: Deals 1 instance of <color=#FFACFFFF>AoE Electro DMG</color> to the area in front and continuously consumes <color=#FFD780FF>Gradient Beacons</color> while held. Each <color=#FFD780FF>Gradient Beacon</color> consumed deals 1 instance of <color=#FFACFFFF>AoE Electro DMG</color> to the area in front that is considered Stellar-Conduct reaction DMG.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing <color=#FFACFFFF>AoE Electro DMG</color> upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11361, '1-Hit DMG', '67.6%', 1
        where exists (select 1 from skills where id = 11361 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11361 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11361, '2-Hit DMG', '55.5%', 2
        where exists (select 1 from skills where id = 11361 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11361 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11361, '3-Hit DMG', '79.4%', 3
        where exists (select 1 from skills where id = 11361 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11361 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11361, 'Charged Attack DMG', '157.4%', 4
        where exists (select 1 from skills where id = 11361 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11361 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11361, 'Charged Attack Stamina Cost', '50.0', 5
        where exists (select 1 from skills where id = 11361 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11361 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11361, 'Plunge DMG', '66.1%', 6
        where exists (select 1 from skills where id = 11361 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11361 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11361, 'Low/High Plunge DMG', '132.1%/165.0%', 7
        where exists (select 1 from skills where id = 11361 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11361 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 11361, 'Gradient Detonation DMG', '193.2%', 8
        where exists (select 1 from skills where id = 11361 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11361 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 11361, 'Gradient Detonation Stellar-Conduct DMG', '257.6% Elemental Mastery', 9
        where exists (select 1 from skills where id = 11361 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11361 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000136 order by id limit 1), 11361, 3, true, false, '', false
      where exists (select 1 from skills where id = 11361 and character_id = 10000136)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11362, 10000136, 'Principle: Variable Detection', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/45c23c30660f2233155cc19a5a41533c.png', 1, 'Conducts a theoretically relatively safe experiment at a theoretically relatively safe yield, dealing <color=#FFACFFFF>AoE Electro DMG</color> and creating a <color=#FFD780FF>{LINK#N11360002}Detection Core{/LINK}</color> in different ways depending on whether the Skill is tapped or held.\n\nTapping the Elemental Skill <color=#FFD780FF>Principle: Variable Detection</color> again within 6s after using it changes the <color=#FFD780FF>Detection Core</color>''s state. The Detection Core''s state can be changed in this way every 1.5s.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11362, 'Tap Skill DMG', '120.2%', 1
        where exists (select 1 from skills where id = 11362 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11362 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11362, 'Hold Skill DMG', '171.7%', 2
        where exists (select 1 from skills where id = 11362 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11362 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11362, 'Steady State Core DMG', '95.4%', 3
        where exists (select 1 from skills where id = 11362 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11362 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11362, 'Steady State Core Gradient Beacon Consumption DMG', '106.0% Elemental Mastery', 4
        where exists (select 1 from skills where id = 11362 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11362 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11362, 'Steady State Core Detonation DMG', '121.9% Elemental Mastery/Beacon', 5
        where exists (select 1 from skills where id = 11362 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11362 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11362, 'Detection Core Duration', '25.0s', 6
        where exists (select 1 from skills where id = 11362 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11362 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11362, 'CD', '18.0s', 7
        where exists (select 1 from skills where id = 11362 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11362 and position = 7);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000136 order by id limit 1), 11362, 5, true, false, '', false
      where exists (select 1 from skills where id = 11362 and character_id = 10000136)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11364, 10000136, 'Analysis: Gradient Theory', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/eaac736026a0b95617aef92c119322a4.png', 1, 'Let the elements burst forth like inspiration itself! Deals <color=#FFACFFFF>AoE Electro DMG</color> and creates 3 <color=#FFD780FF>{LINK#N11360001}Gradient Beacons{/LINK}</color>.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11364, 'Skill DMG', '383.6% ATK+767.3% Elemental Mastery', 1
        where exists (select 1 from skills where id = 11364 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11364 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11364, 'Gradient Beacons Generated', '3.0', 2
        where exists (select 1 from skills where id = 11364 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11364 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11364, 'CD', '15.0s', 3
        where exists (select 1 from skills where id = 11364 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11364 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11364, 'Energy Cost', '60', 4
        where exists (select 1 from skills where id = 11364 and character_id = 10000136) and not exists (select 1 from skill_affixes where skill_id = 11364 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000136 order by id limit 1), 11364, 3, true, false, '', false
      where exists (select 1 from skills where id = 11364 and character_id = 10000136)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (13621, 10000136, 'Baseline Stress Test', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/9982ba92dcbbb6aecff60bd663bdc1c4.png', 2, 'The <color=#FFD780FF>{LINK#N11360002}Detection Core{/LINK}</color> created by the Elemental Skill <color=#FFD780FF>Principle: Variable Detection</color> is enhanced. Depending on the state of the <color=#FFD780FF>Detection Core</color> created:\n·Steady State: All nearby party members gain 30 Elemental Mastery for each <color=#FFD780FF>{LINK#N11360001}Gradient Beacon{/LINK}</color> Mitya has;\n·Overloaded: After nearby party members trigger Stellar-Conduct reactions, instead obtain 1 <color=#FFD780FF>Gradient Beacon</color> every 1.5s for 6s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000136 order by id limit 1), 13621, 1, true, false, '', false
      where exists (select 1 from skills where id = 13621 and character_id = 10000136)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (13622, 10000136, 'Explosive Reagent: Safe Limits Exceeded', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/73d6f0a8f460d63b8d16aaa9aa0345a3.png', 2, 'The duration of <color=#FFD780FF>{LINK#N11360001}Gradient Beacons{/LINK}</color> is increased to 10s. Additionally, Mitya''s CRIT Rate increases by 5% for 15s after creating a <color=#FFD780FF>Gradient Beacon</color>. This effect can stack up to 4 times.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000136 order by id limit 1), 13622, 1, true, false, '', false
      where exists (select 1 from skills where id = 13622 and character_id = 10000136)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (13623, 10000136, 'Stellar Jubilee: Top-Secret Protocol', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/2ba9db87bebbc301696f1374b5d7ab14.png', 2, 'When party members trigger Superconduct, it will be changed to Stellar-Conduct. Stellar-Conduct reactions will no longer create <color=#FFD780FF>Starlight Prisms</color>, and will instead create 1 <color=#FFD780FF>{LINK#N11360001}Gradient Beacon{/LINK}</color> nearby every 1.5s for 3s. These Beacons can be carried by Mitya and transform the area around them into an even larger <color=#FFD780FF>Polestar Field</color>. Triggering another Stellar-Conduct reaction will refresh the duration of the aforementioned effects.\nAdditionally, the Base Stellar-Conduct DMG dealt by all nearby party members will be increased based on Mitya''s Elemental Mastery: Every point of Elemental Mastery he has increases Base Stellar-Conduct DMG by 0.028%. The maximum Base DMG increase that can be gained this way is 14%. While within a <color=#FFD780FF>Polestar Field</color>, Mitya will also enter the <color=#FFD780FF>Radiance: Stellar-Conduct</color> state.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000136 order by id limit 1), 13623, 1, true, false, '', false
      where exists (select 1 from skills where id = 13623 and character_id = 10000136)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (13625, 10000136, 'Energy Catalysis', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/a71b9e91989ba333310ba7de1b5fc983.png', 2, 'When destructible rocks are nearby, <color=#FFD780FF>{LINK#N11360002}Detection Core: Steady State{/LINK}</color> can quickly clear them.\nAdditionally, when Mitya is in the party, creating <color=#FFD780FF>Prime Ice Construct: Basic Heat Source</color> does not consume Kresnik Energy.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000136 order by id limit 1), 13625, 1, true, false, '', false
      where exists (select 1 from skills where id = 13625 and character_id = 10000136)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 2000, 'selected', '10183', '3918', '14100')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 20, 'selected', '26.6%', null, '26.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 2001, 'selected', '638', '211', '849')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 22, 'selected', '203.5%', null, '203.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 2002, 'selected', '693', '244', '937')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 28, 'selected', '452', null, '452')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 41, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 23, 'selected', '105.2%', null, '105.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 2000, 'base', '10183', '3918', '14100')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 2001, 'base', '638', '211', '849')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 2002, 'base', '693', '244', '937')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 28, 'base', '452', null, '452')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 20, 'extra', '26.6%', null, '26.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 22, 'extra', '203.5%', null, '203.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 23, 'extra', '105.2%', null, '105.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000136 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150031, 'Wanderer''s Troupe') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150031, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150031 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150031, 4, 'Increases Charged Attack DMG by 35% if the character uses a Catalyst or a Bow.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150031 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (77544, 'Troupe''s Dawnlight', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/5ff2da2140ec40936c57a7e3c00368c8.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000136 order by id limit 1), 77544, 2150031, 1, 5, 10, 2, '2749', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 1), 22, '12.4%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 1) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 1), 28, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 1) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 1), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 1) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 1), 8, '42', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 1) and property_type_id = 8);
insert into relic_sets (id, name) values (2150261, 'Gilded Dreams') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150261, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150261 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150261, 4, 'Within 8s of triggering an Elemental Reaction, the character equipping this will obtain buffs based on the Elemental Type of the other party members. ATK is increased by 14% for each party member whose Elemental Type is the same as the equipping character, and Elemental Mastery is increased by 50 for every party member with a different Elemental Type. Each of the aforementioned buffs will count up to 3 characters. This effect can be triggered once every 8s. The character who equips this can still trigger its effects when not on the field.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150261 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (21422, 'Feather of Judgment', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f6c8890ea69ba66c882603f03ea20322.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000136 order by id limit 1), 21422, 2150261, 2, 4, 8, 5, '137', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 2), 22, '4.4%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 2) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 2), 3, '4.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 2) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 2), 2, '167', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 2), 20, '3.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 2) and property_type_id = 20);
insert into relic_sets (id, name) values (2150031, 'Wanderer''s Troupe') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150031, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150031 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150031, 4, 'Increases Charged Attack DMG by 35% if the character uses a Catalyst or a Bow.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150031 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (77553, 'Concert''s Final Hour', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/00cfc809485c04ff1092838901c8c413.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000136 order by id limit 1), 77553, 2150031, 3, 5, 8, 28, '91', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 3), 8, '21', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 3) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 3), 9, '13.9%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 3) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 3), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 3) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 3), 6, '5.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 3) and property_type_id = 6);
insert into relic_sets (id, name) values (2150261, 'Gilded Dreams') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150261, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150261 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150261, 4, 'Within 8s of triggering an Elemental Reaction, the character equipping this will obtain buffs based on the Elemental Type of the other party members. ATK is increased by 14% for each party member whose Elemental Type is the same as the equipping character, and Elemental Mastery is increased by 50 for every party member with a different Elemental Type. Each of the aforementioned buffs will count up to 3 characters. This effect can be triggered once every 8s. The character who equips this can still trigger its effects when not on the field.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150261 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (21412, 'Honeyed Final Feast', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/b3ad7ec5ac0a0deb2ebee69dc07400fd.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000136 order by id limit 1), 21412, 2150261, 4, 4, 8, 28, '82', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 4), 22, '5.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 4) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 4), 9, '4.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 4) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 4), 2, '167', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 4) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 4), 6, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 4) and property_type_id = 6);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47432, 'Testament to Your Faith', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/11eeed27d2d7fbb0ab34f03c87325688.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000136 order by id limit 1), 47432, 2150471, 5, 4, 12, 20, '18.5%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 5), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 5), 22, '5.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 5) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 5), 9, '5.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 5) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 5), 2, '406', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000136 order by id limit 1) and position = 5) and property_type_id = 2);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000136, 'sand', 28
          where not exists (select 1 from character_relic_recommendations where character_id = 10000136 and slot = 'sand' and property_type_id = 28);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000136, 'goblet', 28
          where not exists (select 1 from character_relic_recommendations where character_id = 10000136 and slot = 'goblet' and property_type_id = 28);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000136, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 10000136 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000136, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000136 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000136, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000136 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000136, 28
        where not exists (select 1 from character_recommended_substats where character_id = 10000136 and property_type_id = 28);

-- Furina (10000089)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000089, 'Furina', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/0a024f0f2e06e99d67f112cd12eef4af.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/58caba691327772ae49b7b008f1802d4.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/1111b471573254806ab26b00445c887c.png', 'Hydro', 5, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000089, 70, 1, 0, true
    where not exists (select 1 from character_builds where character_id = 10000089);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11513, 'Splendor of Tranquil Waters', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/a0c785ee7bcfa4e7dd19032b8c28c7fa.png', 1, 'Sword', 5, 'A scepter around which swirls pure water. In days long past, it once symbolized the highest authority over the seas.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000089 order by id limit 1), 11513, 70, 4, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1)), 4, 'main', null, null, 408
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1)), 22, 'sub', null, null, 72.7
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (891, 10000089, '"Love Is a Rebellious Bird That None Can Tame"', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4b40280ad1aafd607fffdb5ef002d5e4.png', 'When using <color=#FFD780FF>Let the People Rejoice</color>, Furina will gain 150 Fanfare.\nAdditionally, Furina''s Fanfare limit is increased by 100.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000089 order by id limit 1), 891, false, false, '', false
      where exists (select 1 from constellations where id = 891 and character_id = 10000089)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (892, 10000089, '"A Woman Adapts Like Duckweed in Water"', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/eedde82310959b43981f48c07b956144.png', 'While <color=#FFD780FF>Let the People Rejoice</color> lasts, Furina''s Fanfare gain from increases or decreases in nearby characters'' HP is increased by 250%. Each point of Fanfare above the limit will increase Furina''s Max HP by 0.35%. Her maximum Max HP increase is 140%.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000089 order by id limit 1), 892, false, false, '', false
      where exists (select 1 from constellations where id = 892 and character_id = 10000089)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (893, 10000089, '"My Secret Is Hidden Within Me, No One Will Know My Name"', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/57a6608d0046afb4c8f0772af78c7421.png', 'Increases the Level of <color=#FFD780FF>Let the People Rejoice</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000089 order by id limit 1), 893, false, false, '', false
      where exists (select 1 from constellations where id = 893 and character_id = 10000089)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (894, 10000089, '"They Know Not Life, Who Dwelt in the Netherworld Not!"', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/b0d0b52299de826df77e79a1ac91d104.png', 'When the Salon Members from <color=#FFD780FF>Salon Solitaire</color> hit an opponent, or the Singer of Many Waters restores HP to nearby active characters, Furina will restore 4 Energy. This effect can be triggered once every 5s.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000089 order by id limit 1), 894, false, false, '', false
      where exists (select 1 from constellations where id = 894 and character_id = 10000089)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (895, 10000089, '"His Name I Now Know, It Is...!"', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/8fdd9d5439e0a827e156eb172460e2a1.png', 'Increases the Level of <color=#FFD780FF>Salon Solitaire</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000089 order by id limit 1), 895, false, false, '', false
      where exists (select 1 from constellations where id = 895 and character_id = 10000089)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (896, 10000089, '"Hear Me — Let Us Raise the Chalice of Love!"', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/db0c0527afda99a4e0ca73cc66347809.png', 'When using <color=#FFD780FF>Salon Solitaire</color>, Furina gains "Center of Attention" for 10s.\nThroughout the duration, Furina''s Normal Attacks, Charged Attacks, and Plunging Attacks are converted into <color=#80C0FFFF>Hydro DMG</color> which cannot be overridden by any other elemental infusion. DMG is also increased by an amount equivalent to 18% of Furina''s max HP.\nThroughout the duration, Furina''s Normal Attacks (not including Arkhe: Seats Sacred and Secular Attacks), Charged Attacks, and the impact of Plunging Attacks will cause different effects up to every 0.1s after hitting opponents depending on her current Arkhe alignment:\n\nArkhe: Ousia\nEvery 1s, all nearby characters in the party will be healed by 4% of Furina''s max HP, for a duration of 2.9s. Triggering this effect again will extend its duration.\nArkhe: Pneuma\nThis Normal Attack (not including Arkhe: Seats Sacred and Secular Attacks), Charged Attack, or Plunging Attack ground impact DMG will be further increased by an amount equivalent to 25% of Furina''s max HP. When any of the attacks mentioned previously hit an opponent, all nearby characters in the party will consume 1% of their current HP.\n\nDuring the duration of each instance of "Center of Attention," the above effects can be triggered up to 6 times. "Center of Attention" will end when its effects have triggered 6 times or when the duration expires.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000089 order by id limit 1), 896, false, false, '', false
      where exists (select 1 from constellations where id = 896 and character_id = 10000089)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10891, 10000089, 'Soloist''s Solicitation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 4 consecutive strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to unleash a solo dance, dealing Physical DMG to nearby opponents and changing her Arkhe alignment. If Salon Members or the Singer of Many Waters summoned by her Elemental Skill "Salon Solitaire" is present, their lineup will switch in response.\n\n<color=#FFD780FF>Arkhe: Seats Sacred and Secular</color>\nAt intervals, when Furina''s Normal Attacks hit, a Spiritbreath Thorn or a Surging Blade will descend based on her current Arkhe alignment, dealing Pneuma- or Ousia-aligned <color=#80C0FFFF>Hydro DMG</color>.\nWhen Furina takes the field, her starting Arkhe alignment will be Ousia.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10891, '1-Hit DMG', '48.4%', 1
        where exists (select 1 from skills where id = 10891 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10891 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10891, '2-Hit DMG', '43.7%', 2
        where exists (select 1 from skills where id = 10891 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10891 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10891, '3-Hit DMG', '55.1%', 3
        where exists (select 1 from skills where id = 10891 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10891 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10891, '4-Hit DMG', '73.3%', 4
        where exists (select 1 from skills where id = 10891 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10891 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10891, 'Charged Attack DMG', '74.2%', 5
        where exists (select 1 from skills where id = 10891 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10891 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10891, 'Charged Attack Stamina Cost', '20.0', 6
        where exists (select 1 from skills where id = 10891 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10891 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10891, 'Plunge DMG', '63.9%', 7
        where exists (select 1 from skills where id = 10891 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10891 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10891, 'Low/High Plunge DMG', '128%/160%', 8
        where exists (select 1 from skills where id = 10891 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10891 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10891, 'Spiritbreath Thorn/Surging Blade DMG', '9.5%', 9
        where exists (select 1 from skills where id = 10891 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10891 and position = 9);
insert into skill_affixes (skill_id, name, value, position)
        select 10891, 'Spiritbreath Thorn/Surging Blade DMG Interval', '6s/6s', 10
        where exists (select 1 from skills where id = 10891 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10891 and position = 10);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000089 order by id limit 1), 10891, 1, true, false, '', false
      where exists (select 1 from skills where id = 10891 and character_id = 10000089)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10892, 10000089, 'Salon Solitaire', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/110d5e7530baab96d79a32a786e35836.png', 1, 'Invites the guests of the Salon Solitaire to come forth and aid in Furina''s performance. Will summon either the Salon Members or the Singer of Many Waters based on Furina''s current <color=#FFD780FF>Arkhe alignment</color>.\n\n<color=#FFD780FF>Ousia</color>\nFoaming bubbles like celebrants shall dance, dealing <color=#80C0FFFF>AoE Hydro DMG</color> based on Furina''s Max HP and summoning 3 Salon Members: the Ball Octopus-shaped Gentilhomme Usher, the Bubbly Seahorse-shaped Surintendante Chevalmarin, and the Armored Crab-shaped Mademoiselle Crabaletta.\nThey will attack nearby opponents at intervals, prioritizing the target of the active character, dealing <color=#80C0FFFF>Hydro</color> DMG based on Max HP.\nWhen they attack, if character(s) with more than 50% HP are nearby, the Members will increase their current attack''s power based on the number of such characters, and consume said characters'' HP. If 1/2/3/4 (or more) characters meet these requirements, the Members'' attacks will deal 110%/120%/130%/140% of their original DMG.\n\n<color=#FFD780FF>Pneuma</color>\nSummons the Singer of Many Waters, who will heal nearby active character(s) based on Max HP at intervals.\n\nThe Salon Members and Singer of Many Waters share a duration, and when Furina uses her Charged Attack to change the guest type, the new guests will inherit the remaining duration.\nWhile the Salon Members or the Singer of Many Waters is on the field, Furina can move on the water''s surface.\n\n<i>A fixed roster of regulars frequent Furina''s Salon Solitaire. At other times, Mademoiselle Crabaletta, Surintendante Chevalmarin, and Gentilhomme Usher shall visit, and on gloomy Wednesdays, it is the singer who comes by.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10892, 'Ousia Bubble DMG', '7.9% Max HP', 1
        where exists (select 1 from skills where id = 10892 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10892 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10892, 'Duration', '30.0s', 2
        where exists (select 1 from skills where id = 10892 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10892 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10892, 'Gentilhomme Usher DMG', '5.96% Max HP', 3
        where exists (select 1 from skills where id = 10892 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10892 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10892, 'Surintendante Chevalmarin DMG', '3.23% Max HP', 4
        where exists (select 1 from skills where id = 10892 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10892 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10892, 'Mademoiselle Crabaletta DMG', '8.29% Max HP', 5
        where exists (select 1 from skills where id = 10892 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10892 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10892, 'Gentilhomme Usher HP Consumption', '2.4% Max HP', 6
        where exists (select 1 from skills where id = 10892 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10892 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10892, 'Surintendante Chevalmarin HP Consumption', '1.6% Max HP', 7
        where exists (select 1 from skills where id = 10892 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10892 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10892, 'Mademoiselle Crabaletta HP Consumption', '3.6% Max HP', 8
        where exists (select 1 from skills where id = 10892 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10892 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10892, 'Singer of Many Waters Healing', '4.80% Max HP+462', 9
        where exists (select 1 from skills where id = 10892 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10892 and position = 9);
insert into skill_affixes (skill_id, name, value, position)
        select 10892, 'CD', '20.0s', 10
        where exists (select 1 from skills where id = 10892 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10892 and position = 10);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000089 order by id limit 1), 10892, 1, true, false, '', false
      where exists (select 1 from skills where id = 10892 and character_id = 10000089)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10895, 10000089, 'Let the People Rejoice', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/1d9a1d4c51a92de341bd29e6faa829e9.png', 1, 'Rouses the impulse to revel, creating a stage of foam that will deal <color=#80C0FFFF>AoE Hydro DMG</color> based on Furina''s Max HP and cause nearby party members to enter the Universal Revelry state: During this time, when nearby party members'' HP increases or decreases, 1 Fanfare point will be granted to Furina for each percentage point of their Max HP by which their HP changes.\nAt the same time, Furina will increase the DMG dealt by and Incoming Healing Bonus of all nearby party members based on the amount of Fanfare she has.\nWhen the duration ends, Furina''s Fanfare points will be cleared.\n\n<i>"Cheer! Give praise! Be awed! Raise your glasses! Every night bereft of banqueting is a sordid squandering of sore, sober daylight... And, uh, those who are not yet of age may have grape juice instead!"</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10895, 'Skill DMG', '11.4% Max HP', 1
        where exists (select 1 from skills where id = 10895 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10895 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10895, 'Duration', '18.0s', 2
        where exists (select 1 from skills where id = 10895 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10895 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10895, 'Maximum Fanfare', '300', 3
        where exists (select 1 from skills where id = 10895 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10895 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10895, 'Fanfare to DMG Increase Conversion Ratio', '0.07%', 4
        where exists (select 1 from skills where id = 10895 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10895 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10895, 'Fanfare to Incoming Healing Bonus Conversion Ratio', '0.01%', 5
        where exists (select 1 from skills where id = 10895 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10895 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10895, 'CD', '15.0s', 6
        where exists (select 1 from skills where id = 10895 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10895 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10895, 'Energy Cost', '60', 7
        where exists (select 1 from skills where id = 10895 and character_id = 10000089) and not exists (select 1 from skill_affixes where skill_id = 10895 and position = 7);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000089 order by id limit 1), 10895, 1, true, false, '', false
      where exists (select 1 from skills where id = 10895 and character_id = 10000089)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (8921, 10000089, 'Endless Waltz', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/59dfd1bd7560dc2168740d0dc3852266.png', 2, 'When the active character in your party receives healing, if the source of the healing is not Furina herself and the healing overflows, then Furina will heal nearby party members for 2% of their Max HP once every 2s for the next 4s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000089 order by id limit 1), 8921, 1, true, false, '', false
      where exists (select 1 from skills where id = 8921 and character_id = 10000089)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (8922, 10000089, 'Unheard Confession', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/481251fd1a7a1fed715c48c88e5181f8.png', 2, 'Every 1,000 points of Furina''s Max HP can buff the different Arkhe-aligned <color=#FFD780FF>Salon Solitaire</color> in the following ways:\nWill increase Salon Members'' DMG dealt by 0.7%, up to a maximum of 28%.\nWill decrease the Singer of Many Waters'' healing interval for nearby active characters by 0.4%, up to a maximum of 16%.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000089 order by id limit 1), 8922, 1, true, false, '', false
      where exists (select 1 from skills where id = 8922 and character_id = 10000089)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (8923, 10000089, 'The Sea Is My Stage', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/d7169ebe7de29905a02d34c38e961a17.png', 2, 'Xenochromatic Fontemer Aberrant ability CD decreased by 30%.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000089 order by id limit 1), 8923, 1, true, false, '', false
      where exists (select 1 from skills where id = 8923 and character_id = 10000089)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 2000, 'selected', '11712', '8443', '20155')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 20, 'selected', '17.1%', null, '17.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 2001, 'selected', '594', '222', '816')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 22, 'selected', '172.6%', null, '172.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 2002, 'selected', '532', '94', '626')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 28, 'selected', '61', null, '61')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 42, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 23, 'selected', '138.0%', null, '138.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 2000, 'base', '11712', '8443', '20155')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 2001, 'base', '594', '222', '816')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 2002, 'base', '532', '94', '626')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 28, 'base', '61', null, '61')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 20, 'extra', '17.1%', null, '17.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 22, 'extra', '172.6%', null, '172.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 23, 'extra', '138.0%', null, '138.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000089 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150321, 'Golden Troupe') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150321, 2, 'Increases Elemental Skill DMG by 20%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150321 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150321, 4, 'Increases Elemental Skill DMG by 25%. Additionally, when not on the field, Elemental Skill DMG will be further increased by 25%. This effect will be cleared 2s after taking the field.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150321 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (32543, 'Golden Song''s Variation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/0387d4668712fff33d58fb63596cc4df.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000089 order by id limit 1), 32543, 2150321, 1, 5, 8, 2, '2342', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 1), 6, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 1) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 1), 28, '44', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 1) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 1), 22, '6.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 1) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 1), 5, '18', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 1) and property_type_id = 5);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59422, 'Exile''s Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/1738ca88f6afa4f1d645e8afb214a7ed.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000089 order by id limit 1), 59422, 2100091, 2, 4, 8, 5, '137', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 2), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 2) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 2), 23, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 2) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 2), 3, '4.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 2) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 2), 9, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 2) and property_type_id = 9);
insert into relic_sets (id, name) values (2150321, 'Golden Troupe') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150321, 2, 'Increases Elemental Skill DMG by 20%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150321 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150321, 4, 'Increases Elemental Skill DMG by 25%. Additionally, when not on the field, Elemental Skill DMG will be further increased by 25%. This effect will be cleared 2s after taking the field.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150321 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (32553, 'Golden Era''s Prelude', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/623e4ec8f219b8ba5c198444a61ca224.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000089 order by id limit 1), 32553, 2150321, 3, 5, 8, 3, '22.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 3), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 3) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 3), 22, '5.4%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 3) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 3), 8, '39', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 3) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 3), 2, '269', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 3) and property_type_id = 2);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47513, 'Chalice of Your Blood and Sorrow', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/d653c3aa684c882bbf09757f695ab533.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000089 order by id limit 1), 47513, 2150471, 4, 5, 8, 3, '22.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 4), 6, '4.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 4) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 4), 28, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 4) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 4), 22, '10.9%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 4) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 4), 23, '4.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 4) and property_type_id = 23);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59432, 'Exile''s Circlet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/22faf0f5c42ac3652ea2c4a1ca38ac05.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000089 order by id limit 1), 59432, 2100091, 5, 4, 8, 22, '27.4%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 5), 20, '2.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 5) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 5), 23, '3.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 5) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 5), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 5) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 5), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000089 order by id limit 1) and position = 5) and property_type_id = 8);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000089, 'sand', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000089 and slot = 'sand' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000089, 'goblet', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000089 and slot = 'goblet' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000089, 'circlet', 22
          where not exists (select 1 from character_relic_recommendations where character_id = 10000089 and slot = 'circlet' and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000089, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000089 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000089, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000089 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000089, 3
        where not exists (select 1 from character_recommended_substats where character_id = 10000089 and property_type_id = 3);

-- Qiqi (10000035)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000035, 'Qiqi', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/2825ff5127afc078dd1bd3e1b2e39996.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/3a92a219f25c707f3acb2f3dac2d5ffd.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/fa562739ce3ca2fd49ca3aa15415392a.png', 'Cryo', 5, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000035, 1, 1, 0, false
    where not exists (select 1 from character_builds where character_id = 10000035);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11416, 'Kagotsurube Isshin', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/d0bc1a9d160a598e7cfe669f71402662.png', 1, 'Sword', 4, 'This famed blade was born in a nation to the far north. But in the name of "Isshin," it was stained with many a dark deed on its home-bound journey.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000035 order by id limit 1), 11416, 20, 0, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1)), 4, 'main', null, null, 109
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1)), 6, 'sub', null, null, 15.9
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (351, 10000035, 'Ascetics of Frost', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/73f183f0c1cbf45ddcd071bfaf7bf5fd.png', 'When the Herald of Frost hits an opponent marked by a Fortune-Preserving Talisman, Qiqi regenerates 2 Energy.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000035 order by id limit 1), 351, false, false, 'Qiqi regenerates 2 Energy when the Herald of Frost hits an opponent marked by a Fortune-Preserving Talisman.\n{LINK#N11500004}<color=#FFD780FF>Radiance: Stellar Glimmer</color>{/LINK}: Qiqi also regenerates 6 Elemental Energy when the Herald of Frost''s attacks and coordinated attacks hit opponents. This effect can trigger once every 6s.', true
      where exists (select 1 from constellations where id = 351 and character_id = 10000035)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (352, 10000035, 'Frozen to the Bone', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/aa28bad0f2cdaa527524515d0bb7eb8c.png', 'Qiqi''s Normal and Charged Attack DMG against opponents affected by <color=#99FFFFFF>Cryo</color> is increased by 15%.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000035 order by id limit 1), 352, false, false, 'Qiqi''s Normal and Charged Attack DMG against opponents affected by <color=#99FFFFFF>Cryo</color> is increased by 15%.\n{LINK#N11500004}<color=#FFD780FF>Radiance: Stellar Glimmer</color>{/LINK}: Qiqi''s ATK is increased by 50%.', true
      where exists (select 1 from constellations where id = 352 and character_id = 10000035)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (353, 10000035, 'Ascendant Praise', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/e52b91a082b381dbe7e75197af1135c4.png', 'Increases the Level of <color=#FFD780FF>Adeptus Art: Preserver of Fortune</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000035 order by id limit 1), 353, false, false, '', false
      where exists (select 1 from constellations where id = 353 and character_id = 10000035)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (354, 10000035, 'Divine Suppression', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/d53c7ae470ae8379c64f74abe618d748.png', 'Targets marked by the Fortune-Preserving Talisman have their ATK decreased by 20%.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000035 order by id limit 1), 354, false, false, 'Targets marked by a Fortune-Preserving Talisman have their ATK reduced by 20%.\nAdditionally, when the healing effect of Fortune-Preserving Talisman triggers, the nearby party member with the lowest HP percentage remaining will also receive an additional instance of healing for 180% of Qiqi''s ATK.', true
      where exists (select 1 from constellations where id = 354 and character_id = 10000035)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (355, 10000035, 'Crimson Lotus Bloom', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/d7190fa4b24a8ebb3cfcecf59f088d2b.png', 'Increases the Level of <color=#FFD780FF>Adeptus Art: Herald of Frost</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000035 order by id limit 1), 355, false, false, '', false
      where exists (select 1 from constellations where id = 355 and character_id = 10000035)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (356, 10000035, 'Rite of Resurrection', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/8a6d23687737c0b03dc4eb13b44cc271.png', 'Using <color=#FFD780FF>Adeptus Art: Preserver of Fortune</color> revives all fallen party members nearby and regenerates 50% of their HP.\nThis effect can only occur once every 15 mins.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000035 order by id limit 1), 356, false, false, 'Using <color=#FFD780FF>Adeptus Art: Preserver of Fortune</color> revives all fallen party members nearby and regenerates 50% of their HP.\nThis effect can only occur once every 15 mins.\nAdditionally, after using <color=#FFD780FF>Adeptus Art: Preserver of Fortune</color>, Qiqi will also gain 4 stacks of <color=#FFD780FF>Glimpse of Mystery</color>, and when your current active character (other than Qiqi) deals Stellar-Conduct or Stellar Swirl reaction DMG with their Talent or skill, 1 stack of <color=#FFD780FF>Glimpse of Mystery</color> is consumed, and DMG dealt is increased by 600% of Qiqi''s ATK. The <color=#FFD780FF>Glimpse of Mystery</color> effect lasts up to 12s, and unleashing <color=#FFD780FF>Adeptus Art: Preserver of Fortune</color> refreshes the stack count.', true
      where exists (select 1 from constellations where id = 356 and character_id = 10000035)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10351, 10000035, 'Ancient Sword Art', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 rapid strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to unleash 2 rapid sword strikes.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10351, '1-Hit DMG', '37.8%', 1
        where exists (select 1 from skills where id = 10351 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10351 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10351, '2-Hit DMG', '38.9%', 2
        where exists (select 1 from skills where id = 10351 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10351 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10351, '3-Hit DMG', '24.2%+24.2%', 3
        where exists (select 1 from skills where id = 10351 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10351 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10351, '4-Hit DMG', '24.7%+24.7%', 4
        where exists (select 1 from skills where id = 10351 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10351 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10351, '5-Hit DMG', '63.0%', 5
        where exists (select 1 from skills where id = 10351 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10351 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10351, 'Charged Attack DMG', '64.3%+64.3%', 6
        where exists (select 1 from skills where id = 10351 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10351 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10351, 'Charged Attack Stamina Cost', '20.0', 7
        where exists (select 1 from skills where id = 10351 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10351 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10351, 'Plunge DMG', '63.9%', 8
        where exists (select 1 from skills where id = 10351 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10351 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10351, 'Low/High Plunge DMG', '128%/160%', 9
        where exists (select 1 from skills where id = 10351 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10351 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000035 order by id limit 1), 10351, 1, true, false, '', false
      where exists (select 1 from skills where id = 10351 and character_id = 10000035)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10352, 10000035, 'Adeptus Art: Herald of Frost', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/ceee0225fb25033340f5b6e647ab0482.png', 1, 'Using the Icevein Talisman, Qiqi brings forth the Herald of Frost, dealing <color=#99FFFFFF>Cryo DMG</color> to surrounding opponents.\n\n<color=#FFD780FF>Herald of Frost</color>\n·On hit, Qiqi''s Normal and Charged Attacks regenerate HP for your own party members and nearby teammates. Healing scales based on Qiqi''s ATK.\n·Periodically regenerates your active character''s HP.\n·Follows the character around, dealing <color=#99FFFFFF>Cryo DMG</color> to opponents in their path.\n\n<i>I use this to prevent warming and rot... of Dr. Bai''s precious ingredients. Yes.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10352, 'Skill DMG', '96%', 1
        where exists (select 1 from skills where id = 10352 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10352 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10352, 'Regeneration on Hit', '10.56% ATK+67', 2
        where exists (select 1 from skills where id = 10352 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10352 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10352, 'Continuous Regeneration', '69.60% ATK+451', 3
        where exists (select 1 from skills where id = 10352 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10352 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10352, 'Herald of Frost DMG', '36.0%', 4
        where exists (select 1 from skills where id = 10352 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10352 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10352, 'Duration', '15.0s', 5
        where exists (select 1 from skills where id = 10352 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10352 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10352, 'CD', '30.0s', 6
        where exists (select 1 from skills where id = 10352 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10352 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10352, 'Herald of Frost Coordinated Attack DMG', '24.0%', 7
        where exists (select 1 from skills where id = 10352 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10352 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10352, 'Herald of Frost Coordinated Attack CD', '2.2s', 8
        where exists (select 1 from skills where id = 10352 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10352 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10352, 'CD', '15.0s', 9
        where exists (select 1 from skills where id = 10352 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10352 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000035 order by id limit 1), 10352, 1, true, false, 'Using the Icevein Talisman, Qiqi brings forth the Herald of Frost, dealing <color=#99FFFFFF>Cryo DMG</color> to surrounding opponents.\n\n<color=#FFD780FF>Herald of Frost</color>\n· On hit, Qiqi''s Normal and Charged Attacks regenerate HP for your own party members and nearby teammates, with healing scaled based on Qiqi''s ATK.\n· Periodically regenerates your active character''s HP.\n· Follows the character around, dealing <color=#99FFFFFF>Cryo DMG</color> to opponents in the character''s path.\nIf your current active character hits an opponent with an attack, the Herald of Frost will perform a coordinated attack on the opponent, dealing <color=#99FFFFFF>Cryo DMG</color>.\n\n<i>"I use this to prevent warming and rot... of Dr. Bai''s precious ingredients. Yes."</i>', true
      where exists (select 1 from skills where id = 10352 and character_id = 10000035)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10353, 10000035, 'Adeptus Art: Preserver of Fortune', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/d49244c4d59897926a5dfb289245dd66.png', 1, 'Qiqi releases the adeptus power sealed within her body, marking nearby opponents with a Fortune-Preserving Talisman that deals <color=#99FFFFFF>Cryo DMG</color>.\n\n<color=#FFD780FF>Fortune-Preserving Talisman</color>\nWhen opponents affected by this Talisman take DMG, the character that dealt this DMG regenerates HP.\n\n<i>"I am the Fortune Preserver, the Maiden of Resurrection."</i>\n<i>— Qiqi does not remember these words.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10353, 'Skill DMG', '285%', 1
        where exists (select 1 from skills where id = 10353 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10353 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10353, 'Healing', '90.0% ATK+577', 2
        where exists (select 1 from skills where id = 10353 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10353 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10353, 'Duration', '15.0s', 3
        where exists (select 1 from skills where id = 10353 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10353 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10353, 'CD', '20.0s', 4
        where exists (select 1 from skills where id = 10353 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10353 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10353, 'Energy Cost', '80', 5
        where exists (select 1 from skills where id = 10353 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10353 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10353, 'Stellar-Conduct DMG', '297.3%', 6
        where exists (select 1 from skills where id = 10353 and character_id = 10000035) and not exists (select 1 from skill_affixes where skill_id = 10353 and position = 6);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000035 order by id limit 1), 10353, 1, true, false, 'Qiqi releases the Adeptal power sealed within her body, marking nearby opponents with a Fortune-Preserving Talisman that deals <color=#99FFFFFF>Cryo DMG</color>.\n<color=#FFD780FF>Radiance: Stellar-Conduct</color>: Deals an additional instance of <color=#99FFFFFF>Cryo DMG</color> that is also considered Stellar-Conduct DMG.\n\n<color=#FFD780FF>Fortune-Preserving Talisman</color>\nWhen opponents affected by this Talisman take DMG, the character that dealt this DMG regenerates HP.\n\n<i>"I am the Fortune Preserver, the Maiden of Resurrection."</i>\n<i>— Qiqi does not remember these words.</i>', true
      where exists (select 1 from skills where id = 10353 and character_id = 10000035)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3521, 10000035, 'Life-Prolonging Methods', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/ac0ab5759327c337cbe76401f5098b94.png', 2, 'When a character under the effects of <color=#FFD780FF>Adeptus Art: Herald of Frost</color> triggers an Elemental Reaction, their Incoming Healing Bonus is increased by 20% for 8s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000035 order by id limit 1), 3521, 1, false, false, '', false
      where exists (select 1 from skills where id = 3521 and character_id = 10000035)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3522, 10000035, 'A Glimpse Into Arcanum', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/1402056665548daeda567ee15f52b7c1.png', 2, 'When Qiqi hits opponents with her Normal and Charged Attacks, she has a 50% chance to apply a Fortune-Preserving Talisman to them for 6s. This effect can only occur once every 30s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000035 order by id limit 1), 3522, 1, false, false, 'When Qiqi hits opponents with her Normal and Charged Attacks, she has a 50% chance to apply a Fortune-Preserving Talisman to them for 6s. This effect can only occur once every 30s.\n<color=#FFD780FF>{LINK#N11500004}Radiance: Stellar Glimmer</color>{/LINK}: The effect now has a 100% chance to trigger, and cooldown time is reduced to 15s.', true
      where exists (select 1 from skills where id = 3522 and character_id = 10000035)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3551, 10000035, 'Seven Sacred Treasures', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a4458e6/fff679946b48026ed33a153d31a10a3e.png', 3, 'The cooldown of the Elemental Skill <color=#FFD780FF>Adeptus Art: Herald of Frost</color> is reduced to 15s.\n<color=#FFD780FF>Radiance: Stellar Glimmer</color>: While the Herald of Frost is on the field, Qiqi''s own party members will have the DMG they deal via the corresponding reactions enhanced:\n<color=#FFD780FF>Radiance: Stellar-Conduct</color>: Superconduct and Stellar-Conduct reaction DMG is increased by 50%.\n<color=#FFD780FF>Radiance: Stellar Swirl</color>: Cryo Swirl and Stellar Swirl reaction DMG dealt is increased by 50%.\nAdditionally, Qiqi will also enter the <color=#FFD780FF>Radiance: Stellar-Conduct</color> state when she is inside a {LINK#N11330003}<color=#FFD780FF>Polestar Field</color>{/LINK}, or the <color=#FFD780FF>Radiance: Stellar Swirl</color> state for 8s after a nearby party character triggers a Stellar Swirl reaction.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000035 order by id limit 1), 3551, 1, false, false, 'The cooldown of the Elemental Skill <color=#FFD780FF>Adeptus Art: Herald of Frost</color> is reduced to 15s.\n<color=#FFD780FF>Radiance: Stellar Glimmer</color>: While the Herald of Frost is on the field, Qiqi''s own party members will have the DMG they deal via the corresponding reactions enhanced:\n<color=#FFD780FF>Radiance: Stellar-Conduct</color>: Superconduct and Stellar-Conduct reaction DMG is increased by 50%.\n<color=#FFD780FF>Radiance: Stellar Swirl</color>: Cryo Swirl and Stellar Swirl reaction DMG dealt is increased by 50%.\nAdditionally, Qiqi will also enter the <color=#FFD780FF>Radiance: Stellar-Conduct</color> state when she is inside a {LINK#N11330003}<color=#FFD780FF>Polestar Field</color>{/LINK}, or the <color=#FFD780FF>Radiance: Stellar Swirl</color> state for 8s after a nearby party character triggers a Stellar Swirl reaction.', true
      where exists (select 1 from skills where id = 3551 and character_id = 10000035)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3523, 10000035, 'Former Life Memories', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/6deef6ecf8a0b93bfe5d5323f255898c.png', 2, 'Displays the location of nearby <color=#FFD780FF>resources unique to Liyue</color> on the mini-map.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000035 order by id limit 1), 3523, 1, true, false, '', false
      where exists (select 1 from skills where id = 3523 and character_id = 10000035)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 2000, 'selected', '963', '2782', '3745')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 20, 'selected', '7.8%', null, '7.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 2001, 'selected', '131', '157', '288')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 22, 'selected', '55.0%', null, '55.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 2002, 'selected', '72', '30', '102')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 28, 'selected', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 46, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 23, 'selected', '130.4%', null, '130.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 2000, 'base', '963', '2782', '3745')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 2001, 'base', '131', '157', '288')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 2002, 'base', '72', '30', '102')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 28, 'base', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 20, 'extra', '7.8%', null, '7.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 22, 'extra', '55.0%', null, '55.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 23, 'extra', '130.4%', null, '130.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000035 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47442, 'Honor to Your Devotion', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/80425abeeb96bfefbfcb2b49cd5339db.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000035 order by id limit 1), 47442, 2150471, 1, 4, 10, 2, '2474', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 1), 20, '2.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 1) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 1), 9, '5.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 1) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 1), 6, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 1) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 1), 22, '5.0%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 1) and property_type_id = 22);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59422, 'Exile''s Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/1738ca88f6afa4f1d645e8afb214a7ed.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000035 order by id limit 1), 59422, 2100091, 2, 4, 0, 5, '42', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 2), 6, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 2) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 2), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 2) and property_type_id = 3);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47452, 'Time Gifted Unto You', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/f378887dafcdfd8b72457765732a0828.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000035 order by id limit 1), 47452, 2150471, 3, 4, 4, 6, '13.4%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 3), 3, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 3) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 3), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 3) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 3), 9, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 3) and property_type_id = 9);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59412, 'Exile''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7847bfdeab60c072ec09b17462505cdc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000035 order by id limit 1), 59412, 2100091, 4, 4, 0, 6, '6.3%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 4), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 4) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 4), 2, '191', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 4) and property_type_id = 2);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47433, 'Testament to Your Faith', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/11eeed27d2d7fbb0ab34f03c87325688.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000035 order by id limit 1), 47433, 2150471, 5, 4, 4, 6, '13.4%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 5), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 5), 9, '5.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 5) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 5), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 5) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 5), 3, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000035 order by id limit 1) and position = 5) and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000035, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000035 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000035, 'goblet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000035 and slot = 'goblet' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000035, 'circlet', 26
          where not exists (select 1 from character_relic_recommendations where character_id = 10000035 and slot = 'circlet' and property_type_id = 26);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000035, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000035 and property_type_id = 6);

commit;
