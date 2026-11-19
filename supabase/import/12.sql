-- Part 12 of 13. Generated from app/data/character_detail.ts.
-- Insert-only and safe to re-run. Run the parts in order in the Supabase SQL editor.
begin;

-- Rosaria (10000045)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000045, 'Rosaria', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7987cb608a5375cdfd1e34dda9455a31.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/1e36f82f68276f97b62e2fbe798ecdc4.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/2964c67bb9181d96e02695a1fc4f5bf9.png', 'Cryo', 4, 13)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000045, 60, 1, 6, true
    where not exists (select 1 from character_builds where character_id = 10000045);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (13407, 'Favonius Lance', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7db45b7a84bb80468aaf0f5f430e9bdc.png', 13, 'Polearm', 4, 'A polearm made in the style of the Knights of Favonius. Its shaft is straight, and its tip flows lightly like the wind.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000045 order by id limit 1), 13407, 50, 3, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1)), 4, 'main', null, null, 319
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1)), 23, 'sub', null, null, 19.9
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (451, 10000045, 'Unholy Revelation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/b3360c92ca84a405a371f8dc87e36b9f.png', 'When Rosaria deals a CRIT Hit, her ATK SPD increases by 10% and her Normal Attack DMG increases by 10% for 4s.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000045 order by id limit 1), 451, true, false, '', false
      where exists (select 1 from constellations where id = 451 and character_id = 10000045)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (452, 10000045, 'Land Without Promise', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/e7cd2de8608d13311533ff0207e0eb70.png', 'The duration of the Ice Lance created by <color=#FFD780FF>Rites of Termination</color> is increased by 4s.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000045 order by id limit 1), 452, true, false, '', false
      where exists (select 1 from constellations where id = 452 and character_id = 10000045)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (453, 10000045, 'The Wages of Sin', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/16c42dc6c7f6c54fe803509c52b391fc.png', 'Increases the Level of <color=#FFD780FF>Ravaging Confession</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000045 order by id limit 1), 453, true, false, '', false
      where exists (select 1 from constellations where id = 453 and character_id = 10000045)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (454, 10000045, 'Painful Grace', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/ece6a2c01ec7fdc845ba91824d9e5d42.png', '<color=#FFD780FF>Ravaging Confession</color>''s CRIT Hits regenerate 5 Energy for Rosaria.\nCan only be triggered once each time Ravaging Confession is cast.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000045 order by id limit 1), 454, true, false, '', false
      where exists (select 1 from constellations where id = 454 and character_id = 10000045)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (455, 10000045, 'Last Rites', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/986cc8a781df3697b1a8c4a95b57ecb4.png', 'Increases the Level of <color=#FFD780FF>Rites of Termination</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000045 order by id limit 1), 455, true, false, '', false
      where exists (select 1 from constellations where id = 455 and character_id = 10000045)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (456, 10000045, 'Divine Retribution', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/9366b8745d43b2db4e66e03542b97464.png', '<color=#FFD780FF>Rites of Termination</color>''s attack decreases opponents'' Physical RES by 20% for 10s.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000045 order by id limit 1), 456, true, false, '', false
      where exists (select 1 from constellations where id = 456 and character_id = 10000045)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10451, 10000045, 'Spear of the Church', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/0a4af4ecb63b4741aa3e42d18a2a0c21.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 consecutive spear strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to lunge forward, dealing damage to opponents along the way.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10451, '1-Hit DMG', '52.5%', 1
        where exists (select 1 from skills where id = 10451 and character_id = 10000045) and not exists (select 1 from skill_affixes where skill_id = 10451 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10451, '2-Hit DMG', '51.6%', 2
        where exists (select 1 from skills where id = 10451 and character_id = 10000045) and not exists (select 1 from skill_affixes where skill_id = 10451 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10451, '3-Hit DMG', '31.8%×2', 3
        where exists (select 1 from skills where id = 10451 and character_id = 10000045) and not exists (select 1 from skill_affixes where skill_id = 10451 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10451, '4-Hit DMG', '69.7%', 4
        where exists (select 1 from skills where id = 10451 and character_id = 10000045) and not exists (select 1 from skill_affixes where skill_id = 10451 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10451, '5-Hit DMG', '41.6%+43.0%', 5
        where exists (select 1 from skills where id = 10451 and character_id = 10000045) and not exists (select 1 from skill_affixes where skill_id = 10451 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10451, 'Charged Attack DMG', '137%', 6
        where exists (select 1 from skills where id = 10451 and character_id = 10000045) and not exists (select 1 from skill_affixes where skill_id = 10451 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10451, 'Charged Attack Stamina Cost', '25.0', 7
        where exists (select 1 from skills where id = 10451 and character_id = 10000045) and not exists (select 1 from skill_affixes where skill_id = 10451 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10451, 'Plunge DMG', '63.9%', 8
        where exists (select 1 from skills where id = 10451 and character_id = 10000045) and not exists (select 1 from skill_affixes where skill_id = 10451 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10451, 'Low/High Plunge DMG', '128%/160%', 9
        where exists (select 1 from skills where id = 10451 and character_id = 10000045) and not exists (select 1 from skill_affixes where skill_id = 10451 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000045 order by id limit 1), 10451, 1, true, false, '', false
      where exists (select 1 from skills where id = 10451 and character_id = 10000045)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10452, 10000045, 'Ravaging Confession', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/64e8692b3502b26da73360f78e3655a1.png', 1, 'Rosaria swiftly shifts her position to appear behind her opponent, then stabs and slashes them with her polearm, dealing <color=#99FFFFFF>Cryo DMG</color>.\nThis ability cannot be used to travel behind opponents of a larger build.\n\n<i>Those who confess to Sister Rosaria will be granted no absolution. All sinners shall be met with the piercing cold of punishment proportionate to the weight of their sins.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10452, 'Skill DMG', '73%+170%', 1
        where exists (select 1 from skills where id = 10452 and character_id = 10000045) and not exists (select 1 from skill_affixes where skill_id = 10452 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10452, 'CD', '6.0s', 2
        where exists (select 1 from skills where id = 10452 and character_id = 10000045) and not exists (select 1 from skill_affixes where skill_id = 10452 and position = 2);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000045 order by id limit 1), 10452, 4, true, false, '', false
      where exists (select 1 from skills where id = 10452 and character_id = 10000045)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10453, 10000045, 'Rites of Termination', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/91ea1f6c2aef43e0427a64183aa3f1a1.png', 1, 'Rosaria''s unique take on this prayer ritual: First, she swings her weapon to slash surrounding opponents; then, she summons a frigid Ice Lance that strikes the ground. Both actions deal <color=#99FFFFFF>Cryo DMG</color>.\nWhile active, the Ice Lance periodically releases a blast of cold air, dealing <color=#99FFFFFF>Cryo DMG</color> to surrounding opponents.\n\n<i>Judgment is such a tedious ordeal — much easier to skip that phase and get straight to the last rites. Rosaria was never very devoted to the Anemo God anyway, which makes performing them all too easy.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10453, 'Skill DMG', '130%+190%', 1
        where exists (select 1 from skills where id = 10453 and character_id = 10000045) and not exists (select 1 from skill_affixes where skill_id = 10453 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10453, 'Ice Lance DoT', '165%', 2
        where exists (select 1 from skills where id = 10453 and character_id = 10000045) and not exists (select 1 from skill_affixes where skill_id = 10453 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10453, 'Duration', '8.0s', 3
        where exists (select 1 from skills where id = 10453 and character_id = 10000045) and not exists (select 1 from skill_affixes where skill_id = 10453 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10453, 'CD', '15.0s', 4
        where exists (select 1 from skills where id = 10453 and character_id = 10000045) and not exists (select 1 from skill_affixes where skill_id = 10453 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10453, 'Energy Cost', '60', 5
        where exists (select 1 from skills where id = 10453 and character_id = 10000045) and not exists (select 1 from skill_affixes where skill_id = 10453 and position = 5);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000045 order by id limit 1), 10453, 4, true, false, '', false
      where exists (select 1 from skills where id = 10453 and character_id = 10000045)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (4521, 10000045, 'Regina Probationum', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/faac01fa094f4000bc73cc037556eaed.png', 2, 'When Rosaria strikes an opponent from behind using <color=#FFD780FF>Ravaging Confession</color>, Rosaria''s CRIT Rate increases by 12% for 5s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000045 order by id limit 1), 4521, 1, true, false, '', false
      where exists (select 1 from skills where id = 4521 and character_id = 10000045)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (4522, 10000045, 'Shadow Samaritan', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/8fcf6f9eefaffd5663b2d407c277829e.png', 2, 'Casting <color=#FFD780FF>Rites of Termination</color> increases CRIT Rate of all nearby party members (except Rosaria herself) by 15% of Rosaria''s CRIT Rate for 10s.\nCRIT Rate Bonus gained this way cannot exceed 15%.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000045 order by id limit 1), 4522, 1, false, false, '', false
      where exists (select 1 from skills where id = 4522 and character_id = 10000045)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (4523, 10000045, 'Night Walk', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/1c0a377fbf4aa8c1f13411781e94a5dd.png', 2, 'At night (18:00 – 06:00), your party members gain the Swift Stride effect: Movement SPD increased by 10%.\nDoes not take effect in Domains, Trounce Domains, or Spiral Abyss. Swift Stride does not stack.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000045 order by id limit 1), 4523, 1, true, false, '', false
      where exists (select 1 from skills where id = 4523 and character_id = 10000045)
      on conflict do nothing;
insert into costumes (id, character_id, name, icon) values (204501, 10000045, 'To the Church''s Free Spirit', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_2/3f8be011f8c01ada30f8f009ec2d26d9.png') on conflict do nothing;
insert into build_costumes (build_id, costume_id) values ((select id from character_builds where character_id = 10000045 order by id limit 1), 204501) on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 2000, 'selected', '8096', '3170', '11266')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 20, 'selected', '20.2%', null, '20.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 2001, 'selected', '477', '265', '742')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 22, 'selected', '61.7%', null, '61.7%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 2002, 'selected', '468', '61', '529')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 28, 'selected', '84', null, '84')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 46, 'selected', '14.9%', null, '14.9%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 23, 'selected', '159.8%', null, '159.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 2000, 'base', '8096', '3170', '11266')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 2001, 'base', '477', '265', '742')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 2002, 'base', '468', '61', '529')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 28, 'base', '84', null, '84')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 20, 'extra', '20.2%', null, '20.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 22, 'extra', '61.7%', null, '61.7%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 23, 'extra', '159.8%', null, '159.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 46, 'element', '14.9%', null, '14.9%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000045 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150071, 'Noblesse Oblige') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150071, 2, 'Elemental Burst DMG +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2150071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150071, 4, 'Using an Elemental Burst increases all party members'' ATK by 20% for 12s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (81543, 'Royal Flora', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/bd80c45d24f484036927eda40339f730.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000045 order by id limit 1), 81543, 2150071, 1, 5, 4, 2, '1530', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 1), 3, '5.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 1) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 1), 5, '18', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 1) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 1), 22, '5.4%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 1) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 1), 6, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 1) and property_type_id = 6);
insert into relic_sets (id, name) values (2150071, 'Noblesse Oblige') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150071, 2, 'Elemental Burst DMG +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2150071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150071, 4, 'Using an Elemental Burst increases all party members'' ATK by 20% for 12s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (81523, 'Royal Plume', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7a7f049517a93e3b317a5c5df8892e60.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000045 order by id limit 1), 81523, 2150071, 2, 5, 4, 5, '100', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 2), 2, '299', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 2), 23, '6.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 2) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 2), 9, '6.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 2) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 2), 6, '5.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 2) and property_type_id = 6);
insert into relic_sets (id, name) values (2150071, 'Noblesse Oblige') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150071, 2, 'Elemental Burst DMG +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2150071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150071, 4, 'Using an Elemental Burst increases all party members'' ATK by 20% for 12s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (81553, 'Royal Pocket Watch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/a0a8d92d6fe1d956d5e1a97d6ffcd78d.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000045 order by id limit 1), 81553, 2150071, 3, 5, 4, 23, '16.6%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 3), 28, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 3) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 3), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 3) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 3), 6, '5.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 3) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 3), 9, '6.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 3) and property_type_id = 9);
insert into relic_sets (id, name) values (2150031, 'Wanderer''s Troupe') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150031, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150031 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150031, 4, 'Increases Charged Attack DMG by 35% if the character uses a Catalyst or a Bow.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150031 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (77513, 'Wanderer''s String-Kettle', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/00068fbfdac5602f0ebd3d6a2b85d0bc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000045 order by id limit 1), 77513, 2150031, 4, 5, 4, 46, '14.9%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 4), 28, '23', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 4) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 4), 3, '4.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 4) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 4), 5, '18', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 4), 23, '4.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 4) and property_type_id = 23);
insert into relic_sets (id, name) values (2150451, 'Celestial Gift') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150451, 2, 'Energy Recharge +20%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150451 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150451, 4, 'If the equipping character has completed Witch''s Homework, after they use an Elemental Skill, they gain "Light''s Guidance" for 20s: All nearby party members gain a 20% Elemental DMG Bonus corresponding to the equipping character''s Elemental Type. The equipping character can trigger this effect while off-field. DMG Bonuses provided by Artifact Sets with the same name do not stack.\n· When your party has the Hexerei: Secret Rite effect, Light''s Guidance is upgraded to "Mortal Hymn": All nearby party members gain a 40% Elemental DMG Bonus corresponding to both the equipping character and the current active party member''s Elemental Type instead. If both characters have the same Elemental Type, these bonuses will not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150451 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (45534, 'Heavensent Crown', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a0cf98d/9ddda9f5ce2a9b32318a2040598cc8f1.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000045 order by id limit 1), 45534, 2150451, 5, 5, 8, 20, '15.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 5), 28, '42', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 5) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 5), 22, '6.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 5) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 5), 2, '209', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 5) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 5), 23, '12.3%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000045 order by id limit 1) and position = 5) and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000045, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000045 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000045, 'goblet', 46
          where not exists (select 1 from character_relic_recommendations where character_id = 10000045 and slot = 'goblet' and property_type_id = 46);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000045, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 10000045 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000045, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000045 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000045, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000045 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000045, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000045 and property_type_id = 6);

-- Diona (10000039)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000039, 'Diona', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/699e3449/3de7b18fbecffbb57a73fe5032d24950.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/afb458c644664272704592885d789945.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/da4ae4bdb927ab20bf6905fdc61eef44.png', 'Cryo', 4, 12)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000039, 1, 1, 5, false
    where not exists (select 1 from character_builds where character_id = 10000039);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (15403, 'Sacrificial Bow', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/4a03625fdbc739dca379573871a4c2ca.png', 12, 'Bow', 4, 'A ceremonial hunting bow that has become petrified over time. The trinkets on it are still visible. It grants the wielder the power to withstand the winds of time.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000039 order by id limit 1), 15403, 1, 0, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1)), 4, 'main', null, null, 44
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1)), 23, 'sub', null, null, 6.7
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (391, 10000039, 'A Lingering Flavor', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/a4e6c9cf4bca243a8f09d274c67fb8b0.png', 'Regenerates 15 Energy for Diona after the effects of <color=#FFD780FF>Signature Mix</color> end.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000039 order by id limit 1), 391, true, false, '', false
      where exists (select 1 from constellations where id = 391 and character_id = 10000039)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (392, 10000039, 'Shaken, Not Purred', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/8bc3dcc4e8ea94dacf5527254d58fbcd.png', 'Increases <color=#FFD780FF>Icy Paws</color>'' DMG by 15%, and increases its shield''s DMG Absorption by 15%.\nAdditionally, when paws hit their targets, creates a shield for other nearby characters on the field with 50% of the <color=#FFD780FF>Icy Paws</color> shield''s DMG Absorption for 5s.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000039 order by id limit 1), 392, true, false, '', false
      where exists (select 1 from constellations where id = 392 and character_id = 10000039)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (393, 10000039, 'A—Another Round?', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/06261e8603b20a43835fe3d26a2aa521.png', 'Increases the Level of <color=#FFD780FF>Signature Mix</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000039 order by id limit 1), 393, true, false, '', false
      where exists (select 1 from constellations where id = 393 and character_id = 10000039)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (394, 10000039, 'Wine Industry Slayer', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/380af7f04bbb573e5d80a9f21e638b50.png', 'Within the radius of <color=#FFD780FF>Signature Mix</color>, Diona''s charge time for aimed shots is reduced by 60%', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000039 order by id limit 1), 394, true, false, '', false
      where exists (select 1 from constellations where id = 394 and character_id = 10000039)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (395, 10000039, 'Double Shot, on the Rocks', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/338b90b4ff6f2e3bcd803ccc143a6360.png', 'Increases the Level of <color=#FFD780FF>Icy Paws</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000039 order by id limit 1), 395, true, false, '', false
      where exists (select 1 from constellations where id = 395 and character_id = 10000039)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (396, 10000039, 'Cat''s Tail Closing Time', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/b138bd10bb1ca65ace0c92f137f83da8.png', 'Characters within <color=#FFD780FF>Signature Mix</color>''s radius will gain the following effects based on their HP amounts:\n·Increases Incoming Healing Bonus by 30% when HP falls below or is equal to 50%.\n·Elemental Mastery increased by 200 when HP is above 50%.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000039 order by id limit 1), 396, false, false, 'Characters within <color=#FFD780FF>Signature Mix</color>''s radius gain the following effects based on their HP levels:\n· The Incoming Healing Bonus is increased by 30% when HP is at, or lower than, 50%.\n· Elemental Mastery is increased by 200 when HP is above 50%.\n\nAdditionally, Diona''s Max HP is increased by 25%. \n<color=#FFD780FF>Radiance: Stellar Glimmer</color>: Characters within the Signature Mix field deal increased DMG for the following reactions: \n<color=#FFD780FF>Radiance: Stellar-Conduct</color>: Superconduct, Stellar-Conduct reaction DMG increased by 40%.\n<color=#FFD780FF>Radiance: Stellar Swirl</color>: Cryo Swirl, Stellar Swirl reaction DMG increased by 40%.', true
      where exists (select 1 from constellations where id = 396 and character_id = 10000039)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10391, 10000039, 'Kätzlein Style', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/cc29fde34aa6d42f8e110628a4bf2de2.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 consecutive shots with a bow.\n\n<color=#FFD780FF>Charged Attack</color>\nPerforms a more precise <color=#FFD780FF>Aimed Shot</color> with increased DMG.\nWhile aiming, biting frost will accumulate on the arrowhead. A fully charged frost arrow will deal <color=#99FFFFFF>Cryo DMG</color>.\n\n<color=#FFD780FF>Plunging Attack</color>\nFires off a shower of arrows in mid-air before falling and striking the ground, dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10391, '1-Hit DMG', '36.1%', 1
        where exists (select 1 from skills where id = 10391 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10391 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10391, '2-Hit DMG', '33.5%', 2
        where exists (select 1 from skills where id = 10391 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10391 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10391, '3-Hit DMG', '45.6%', 3
        where exists (select 1 from skills where id = 10391 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10391 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10391, '4-Hit DMG', '43.0%', 4
        where exists (select 1 from skills where id = 10391 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10391 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10391, '5-Hit DMG', '53.8%', 5
        where exists (select 1 from skills where id = 10391 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10391 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10391, 'Aimed Shot', '43.9%', 6
        where exists (select 1 from skills where id = 10391 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10391 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10391, 'Fully-Charged Aimed Shot', '124%', 7
        where exists (select 1 from skills where id = 10391 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10391 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10391, 'Plunge DMG', '56.8%', 8
        where exists (select 1 from skills where id = 10391 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10391 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10391, 'Low/High Plunge DMG', '114%/142%', 9
        where exists (select 1 from skills where id = 10391 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10391 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000039 order by id limit 1), 10391, 1, true, false, '', false
      where exists (select 1 from skills where id = 10391 and character_id = 10000039)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10392, 10000039, 'Icy Paws', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/dad14dd477d66c9375bb696dbcef6795.png', 1, '#Fires an Icy Paw that deals <color=#99FFFFFF>Cryo DMG</color> to opponents and forms a shield on hit.\nThe shield''s DMG Absorption scales based on Diona''s Max HP, and its duration scales off the number of Icy Paws that hit their target.\n\n<color=#FFD780FF>{LAYOUT_MOBILE#Tap}{LAYOUT_PC#Press}{LAYOUT_PS#Press}</color>\nRapidly fires off 2 Icy Paws.\n\n<color=#FFD780FF>Hold</color>\nDashes back quickly before firing 5 Icy Paws.\nThe shield created by a Hold attack will gain a 75% DMG Absorption Bonus.\n\nThe shield has a 250% <color=#99FFFFFF>Cryo DMG</color> Absorption Bonus, and will cause your active character to become affected by <color=#99FFFFFF>Cryo</color> at the point of formation for a short duration.\n\n<i>When she first started bartending, Diona found that no matter how much ice she put in her cocktails, it would never do a drunkard any harm. That all changed when she received her Vision — now she can form ice cold enough to cause severe brainfreeze. Five out of five stars!</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10392, 'Icy Paw DMG', '52.4% per Paw', 1
        where exists (select 1 from skills where id = 10392 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10392 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10392, 'Base Shield DMG Absorption', '9.0% Max HP+918', 2
        where exists (select 1 from skills where id = 10392 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10392 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10392, 'Duration', '2.1s per Paw', 3
        where exists (select 1 from skills where id = 10392 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10392 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10392, '#{LAYOUT_MOBILE#Tap}{LAYOUT_PC#Press}{LAYOUT_PS#Press} CD', '6.0s', 4
        where exists (select 1 from skills where id = 10392 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10392 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10392, 'Hold CD', '15.0s', 5
        where exists (select 1 from skills where id = 10392 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10392 and position = 5);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000039 order by id limit 1), 10392, 4, true, false, '', false
      where exists (select 1 from skills where id = 10392 and character_id = 10000039)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10395, 10000039, 'Signature Mix', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/88146cde13eec7c747306f8c25f294cd.png', 1, 'Tosses out a special cold brew that deals <color=#99FFFFFF>AoE Cryo DMG</color> and creates a Drunken Mist in an AoE.\n\n<color=#FFD780FF>Drunken Mist</color>\n·Deals continuous <color=#99FFFFFF>Cryo DMG</color> to opponents within the AoE.\n·Continuously regenerates the HP of characters within the AoE.\n\n<i>A horrific mix that even Diona considers inhumane. The horrifying foretaste should be left for one''s opponents. It has a crisp aftertaste, but unfortunately, one can only feel it on one''s nose and skin.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10395, 'Skill DMG', '100%', 1
        where exists (select 1 from skills where id = 10395 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10395 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10395, 'Continuous Field DMG', '65.8%', 2
        where exists (select 1 from skills where id = 10395 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10395 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10395, 'HP Regeneration Over Time', '6.67% Max HP+680', 3
        where exists (select 1 from skills where id = 10395 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10395 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10395, 'Duration', '12.0s', 4
        where exists (select 1 from skills where id = 10395 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10395 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10395, 'CD', '20.0s', 5
        where exists (select 1 from skills where id = 10395 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10395 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10395, 'Energy Cost', '80', 6
        where exists (select 1 from skills where id = 10395 and character_id = 10000039) and not exists (select 1 from skill_affixes where skill_id = 10395 and position = 6);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000039 order by id limit 1), 10395, 4, true, false, '', false
      where exists (select 1 from skills where id = 10395 and character_id = 10000039)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3921, 10000039, 'Cat''s Tail Secret Menu', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4b596f3108531684938558c1c69b1b39.png', 2, 'Characters shielded by <color=#FFD780FF>Icy Paws</color> have their Movement SPD increased by 10% and their Stamina Consumption decreased by 10%.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000039 order by id limit 1), 3921, 1, false, false, '', false
      where exists (select 1 from skills where id = 3921 and character_id = 10000039)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3922, 10000039, 'Drunkards'' Farce', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/890aeeca7df04ca0b971665fa0d2d389.png', 2, 'Opponents who enter the AoE of <color=#FFD780FF>Signature Mix</color> have 10% decreased ATK for 15s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000039 order by id limit 1), 3922, 1, false, false, '', false
      where exists (select 1 from skills where id = 3922 and character_id = 10000039)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3951, 10000039, 'Choice Treasures', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a4458e6/e7a28fdb270a328ac28b803e46fc2e87.png', 3, 'Within 20s after using the Elemental Skill <color=#FFD780FF>Icy Paws</color>, Diona will also fire off three <color=#FFD780FF>Icy Paws</color> when party members trigger Stellar-Conduct, Superconduct, Cryo Swirl, or Stellar Swirl reactions. <color=#FFD780FF>Icy Paws</color> fired this way cannot generate Elemental Particles, nor will they generate a shield upon hitting opponents. This effect can occur once every 3.5s.\nAdditionally, Diona will also enter the <color=#FFD780FF>Radiance: Stellar-Conduct</color> state when she is inside a {LINK#N11330003}<color=#FFD780FF>Polestar Field</color>{/LINK}, or the <color=#FFD780FF>Radiance: Stellar Swirl</color> state for 8s after a nearby party member triggers a Stellar Swirl reaction.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000039 order by id limit 1), 3951, 1, false, false, 'Within 20s after using the Elemental Skill <color=#FFD780FF>Icy Paws</color>, Diona will also fire off three <color=#FFD780FF>Icy Paws</color> when party members trigger Stellar-Conduct, Superconduct, Cryo Swirl, or Stellar Swirl reactions. <color=#FFD780FF>Icy Paws</color> fired this way cannot generate Elemental Particles, nor will they generate a shield upon hitting opponents. This effect can occur once every 3.5s.\nAdditionally, Diona will also enter the <color=#FFD780FF>Radiance: Stellar-Conduct</color> state when she is inside a {LINK#N11330003}<color=#FFD780FF>Polestar Field</color>{/LINK}, or the <color=#FFD780FF>Radiance: Stellar Swirl</color> state for 8s after a nearby party member triggers a Stellar Swirl reaction.', true
      where exists (select 1 from skills where id = 3951 and character_id = 10000039)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3923, 10000039, 'Complimentary Bar Food', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/ed691c709fb3d07a56a9534dc48537ec.png', 2, 'When a Perfect Cooking is achieved on a dish with restorative effects, there is a 12% chance to obtain double the product.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000039 order by id limit 1), 3923, 1, true, false, '', false
      where exists (select 1 from skills where id = 3923 and character_id = 10000039)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 2000, 'selected', '802', '946', '1749')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 20, 'selected', '7.1%', null, '7.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 2001, 'selected', '62', '113', '175')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 22, 'selected', '57.5%', null, '57.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 2002, 'selected', '50', '23', '74')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 28, 'selected', '10', null, '10')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 46, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 23, 'selected', '126.7%', null, '126.7%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 2000, 'base', '802', '946', '1749')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 2001, 'base', '62', '113', '175')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 2002, 'base', '50', '23', '74')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 28, 'base', '10', null, '10')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 20, 'extra', '7.1%', null, '7.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 22, 'extra', '57.5%', null, '57.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 23, 'extra', '126.7%', null, '126.7%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000039 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2100011, 'Resolution of Sojourner') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100011, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100011 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100011, 4, 'Increases Charged Attack CRIT Rate by 30%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100011 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (51341, 'Heart of Comradeship', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/72a97946e22ae54e24de5e92b8fdba7b.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000039 order by id limit 1), 51341, 2100011, 1, 3, 0, 2, '430', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 1), 9, '3.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 1) and property_type_id = 9);
insert into relic_sets (id, name) values (2100011, 'Resolution of Sojourner') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100011, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100011 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100011, 4, 'Increases Charged Attack CRIT Rate by 30%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100011 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (51322, 'Feather of Homecoming', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f6e5274b9ceb03a8bdc15498def6c269.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000039 order by id limit 1), 51322, 2100011, 2, 3, 8, 5, '91', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 2), 8, '9', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 2) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 2), 2, '143', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 2), 28, '10', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 2) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 2), 22, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 2) and property_type_id = 22);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59351, 'Exile''s Pocket Watch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f9dd8d807eaa9ec5997b9c0e6f7cd48c.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000039 order by id limit 1), 59351, 2100091, 3, 3, 0, 3, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 3), 20, '2.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 3) and property_type_id = 20);
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57413, 'Instructor''s Tea Cup', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/43b58997aabfaf68f64bde7bfee0c957.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000039 order by id limit 1), 57413, 2100071, 4, 4, 0, 3, '6.3%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 4), 2, '239', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 4) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 4), 5, '11', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 4), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 4) and property_type_id = 8);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59331, 'Exile''s Circlet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/22faf0f5c42ac3652ea2c4a1ca38ac05.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000039 order by id limit 1), 59331, 2100091, 5, 3, 0, 3, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 5), 22, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000039 order by id limit 1) and position = 5) and property_type_id = 22);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000039, 'sand', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000039 and slot = 'sand' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000039, 'goblet', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000039 and slot = 'goblet' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000039, 'circlet', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000039 and slot = 'circlet' and property_type_id = 3);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000039, 3
        where not exists (select 1 from character_recommended_substats where character_id = 10000039 and property_type_id = 3);

-- Fischl (10000031)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000031, 'Fischl', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/207a0e35e0637a2bcb0a28fdfa61f7a4.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/a07343a21aecb509e849a541c9d72901.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/2ad457efe47f31a54bd683286fd03144.png', 'Electro', 4, 12)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000031, 1, 1, 0, false
    where not exists (select 1 from character_builds where character_id = 10000031);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (15401, 'Favonius Warbow', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f0b8edcc330cd9de1dcf97eccb20cbaf.png', 12, 'Bow', 4, 'A standard-issue recurve bow of the Knights of Favonius. Only the best archers can unleash its full potential.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000031 order by id limit 1), 15401, 1, 0, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1)), 4, 'main', null, null, 41
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1)), 23, 'sub', null, null, 13.3
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (311, 10000031, 'Gaze of the Deep', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/7a1ac0926065f0c67fd0b7c3bb8ec1d6.png', 'Even when Oz is not present in combat, he can still watch over Fischl through his raven eyes. When Fischl performs a Normal Attack against an opponent, Oz fires a coordinated attack, dealing DMG equal to 22% of Fischl''s ATK.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000031 order by id limit 1), 311, false, false, '', false
      where exists (select 1 from constellations where id = 311 and character_id = 10000031)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (312, 10000031, 'Devourer of All Sins', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/1a6ea701bdac4f2ab64b57fe52ff2d53.png', 'When <color=#FFD780FF>Nightrider</color> is used, it deals an additional 200% ATK as DMG, and its AoE is increased by 50%.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000031 order by id limit 1), 312, false, false, '', false
      where exists (select 1 from constellations where id = 312 and character_id = 10000031)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (313, 10000031, 'Wings of Nightmare', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/abc4cac859bb00fb1268c0ddbeded577.png', 'Increases the Level of <color=#FFD780FF>Nightrider</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000031 order by id limit 1), 313, false, false, '', false
      where exists (select 1 from constellations where id = 313 and character_id = 10000031)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (314, 10000031, 'Her Pilgrimage of Bleak', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/fd5da21696b73bc22e7adb3b1b67514f.png', 'When <color=#FFD780FF>Midnight Phantasmagoria</color> is used, it deals 222% of ATK as <color=#FFACFFFF>Electro DMG</color> to surrounding opponents.\nWhen the skill duration ends, Fischl regenerates 20% of her HP.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000031 order by id limit 1), 314, false, false, '', false
      where exists (select 1 from constellations where id = 314 and character_id = 10000031)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (315, 10000031, 'Against the Fleeing Light', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/a5f4223baedccc6c0e2064d49acf10f2.png', 'Increases the Level of <color=#FFD780FF>Midnight Phantasmagoria</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000031 order by id limit 1), 315, false, false, '', false
      where exists (select 1 from constellations where id = 315 and character_id = 10000031)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (316, 10000031, 'Evernight Raven', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/e1c3b53778dcd4d9aa8c98b189506ca4.png', 'Extends the duration of Oz''s presence on the field by 2s. Additionally, Oz performs coordinated attacks with your active character when present, dealing 30% of Fischl''s ATK as <color=#FFACFFFF>Electro DMG</color>.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000031 order by id limit 1), 316, false, false, 'Extends the duration of Oz''s presence on the field by 2s. Additionally, Oz performs coordinated attacks with your active character when present, dealing 30% of Fischl''s ATK as <color=#FFACFFFF>Electro DMG</color>.\nAfter Oz performs a coordinated attack, the increased ATK and Elemental Mastery effects of <color=#FFD780FF>Witch''s Eve Rite: Phantasmal Nocturne</color> are further increased by 100% for 10s.', true
      where exists (select 1 from constellations where id = 316 and character_id = 10000031)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10311, 10000031, 'Bolts of Downfall', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/cc29fde34aa6d42f8e110628a4bf2de2.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 consecutive shots with a bow.\n\n<color=#FFD780FF>Charged Attack</color>\nPerforms a more precise <color=#FFD780FF>Aimed Shot</color> with increased DMG.\nWhile aiming, the dark lightning spirits of Immernachtreich shall heed the call of their Prinzessin and indwell the enchanted arrowhead. When fully indwelt, the Rachsüchtig Blitz shall deal immense <color=#FFACFFFF>Electro DMG</color>.\n\n<color=#FFD780FF>Plunging Attack</color>\nFires off a shower of arrows in mid-air before falling and striking the ground, dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10311, '1-Hit DMG', '44.1%', 1
        where exists (select 1 from skills where id = 10311 and character_id = 10000031) and not exists (select 1 from skill_affixes where skill_id = 10311 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10311, '2-Hit DMG', '46.8%', 2
        where exists (select 1 from skills where id = 10311 and character_id = 10000031) and not exists (select 1 from skill_affixes where skill_id = 10311 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10311, '3-Hit DMG', '58.1%', 3
        where exists (select 1 from skills where id = 10311 and character_id = 10000031) and not exists (select 1 from skill_affixes where skill_id = 10311 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10311, '4-Hit DMG', '57.7%', 4
        where exists (select 1 from skills where id = 10311 and character_id = 10000031) and not exists (select 1 from skill_affixes where skill_id = 10311 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10311, '5-Hit DMG', '72.1%', 5
        where exists (select 1 from skills where id = 10311 and character_id = 10000031) and not exists (select 1 from skill_affixes where skill_id = 10311 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10311, 'Aimed Shot', '43.9%', 6
        where exists (select 1 from skills where id = 10311 and character_id = 10000031) and not exists (select 1 from skill_affixes where skill_id = 10311 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10311, 'Fully-Charged Aimed Shot', '124%', 7
        where exists (select 1 from skills where id = 10311 and character_id = 10000031) and not exists (select 1 from skill_affixes where skill_id = 10311 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10311, 'Plunge DMG', '56.8%', 8
        where exists (select 1 from skills where id = 10311 and character_id = 10000031) and not exists (select 1 from skill_affixes where skill_id = 10311 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10311, 'Low/High Plunge DMG', '114%/142%', 9
        where exists (select 1 from skills where id = 10311 and character_id = 10000031) and not exists (select 1 from skill_affixes where skill_id = 10311 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000031 order by id limit 1), 10311, 1, true, false, '', false
      where exists (select 1 from skills where id = 10311 and character_id = 10000031)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10312, 10000031, 'Nightrider', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/2ccc2ba51e89a17e403310ff5b3a9f49.png', 1, '#Summons Oz. The night raven forged of darkness and lightning descends upon the land, dealing <color=#FFACFFFF>Electro DMG</color> in a small AoE.\nFor the ability''s duration, Oz will continuously attack nearby opponents with <color=#FFACFFFF>Freikugel</color>.\n\nHold to adjust the location Oz will be summoned to.\n{LAYOUT_MOBILE#Tap}{LAYOUT_PC#Press}{LAYOUT_PS#Press} again any time during the ability''s duration to once again summon him to Fischl''s side.\n\n<i>"My time is most precious, and I shall not waste it on the likes of you... Go, Oz, fall upon them, and bring down upon them your Rachsüchtig Blitz, that which tears open the long night."</i>\n<i>—Flowers for Princess Fischl (IV): Farewell Frau Welt</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10312, 'Oz''s ATK DMG', '88.8%', 1
        where exists (select 1 from skills where id = 10312 and character_id = 10000031) and not exists (select 1 from skill_affixes where skill_id = 10312 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10312, 'Summoning DMG', '115%', 2
        where exists (select 1 from skills where id = 10312 and character_id = 10000031) and not exists (select 1 from skill_affixes where skill_id = 10312 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10312, 'Oz''s Duration', '10.0s', 3
        where exists (select 1 from skills where id = 10312 and character_id = 10000031) and not exists (select 1 from skill_affixes where skill_id = 10312 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10312, 'CD', '25.0s', 4
        where exists (select 1 from skills where id = 10312 and character_id = 10000031) and not exists (select 1 from skill_affixes where skill_id = 10312 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000031 order by id limit 1), 10312, 1, true, false, '', false
      where exists (select 1 from skills where id = 10312 and character_id = 10000031)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10313, 10000031, 'Midnight Phantasmagoria', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/911baefbee7754aaa7c23148e941c175.png', 1, 'Summons Oz to spread his twin wings of twilight and defend Fischl.\nHas the following properties during the ability''s duration:\n·Fischl takes on Oz''s form, greatly increasing her Movement Speed.\n·Strikes nearby opponents with lightning, dealing <color=#FFACFFFF>Electro DMG</color> to opponents she comes into contact with. Each opponent can only be struck once.\n·Once this ability''s effects end, Oz will remain on the battlefield and attack his Prinzessin''s foes. If Oz is already on the field, then this will reset the duration of his presence.\n\n<i>"...In the hordes of beasts that follow the cursed blood, only Prince Nachtraben, who bore witness to the extinction of a thousand worlds, knows her true greatness. Thus the night wings he spreads are his eternal promise to protect Her Royal Highness."</i>\n<i>—Flowers for Princess Fischl (I): End Time Zersetzung</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10313, 'Falling Thunder DMG', '208%', 1
        where exists (select 1 from skills where id = 10313 and character_id = 10000031) and not exists (select 1 from skill_affixes where skill_id = 10313 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10313, 'CD', '15.0s', 2
        where exists (select 1 from skills where id = 10313 and character_id = 10000031) and not exists (select 1 from skill_affixes where skill_id = 10313 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10313, 'Energy Cost', '60', 3
        where exists (select 1 from skills where id = 10313 and character_id = 10000031) and not exists (select 1 from skill_affixes where skill_id = 10313 and position = 3);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000031 order by id limit 1), 10313, 1, true, false, '', false
      where exists (select 1 from skills where id = 10313 and character_id = 10000031)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3121, 10000031, 'Stellar Predator', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/3ae6c05f1e75a39b6a48bdb22210ae67.png', 2, 'When Fischl hits Oz with a fully-charged Aimed Shot, Oz brings down Thundering Retribution, dealing <color=#FFACFFFF>AoE Electro DMG</color> equal to 152.7% of the arrow''s DMG.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000031 order by id limit 1), 3121, 1, false, false, '', false
      where exists (select 1 from skills where id = 3121 and character_id = 10000031)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3122, 10000031, 'Undone Be Thy Sinful Hex', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/8221d4ab1b19454352fc062f484d589c.png', 2, 'If your current active character triggers an <color=#FFACFFFF>Electro-related Elemental Reaction</color> when Oz is on the field, the opponent shall be stricken with Thundering Retribution that deals <color=#FFACFFFF>Electro DMG</color> equal to 80% of Fischl''s ATK.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000031 order by id limit 1), 3122, 1, false, false, '', false
      where exists (select 1 from skills where id = 3122 and character_id = 10000031)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3151, 10000031, 'Witch''s Eve Rite: Phantasmal Nocturne', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/692f7dcc/dc9710cff7e8396dbbdb69f9e1e466fc.png', 3, 'After completing <color=#FFD780FF>Witch''s Homework: Of the Unexpected</color>, Fischl will become a <color=#FFD780FF>Hexerei</color> character. When the party includes at least 2 Hexerei characters, you will gain the <color=#FFD780FF>Hexerei: Secret Rite</color> effect, which enhances Hexerei characters.\n\n<color=#FFD780FF>Hexerei: Secret Rite</color>\nHark, Prince Nachtraben, Ozvaldo Hrafnavins, he who has witnessed the fall of countless worlds. Sing now the starry septet for your sovereign, for this is the moment of deepest sin, when the gathered souls at the end of causality shatter the darkness of fate.\nAdditionally, when Oz is on the field, party members will gain additional buff effects:\n· After a nearby party member triggers an Overloaded reaction, Fischl and other nearby active party members have their ATK increased by 22.5% for 10s.\n· After a nearby party member triggers an Electro-Charged or Lunar-Charged reaction, Fischl and other nearby active party members have their Elemental Mastery increased by 90 for 10s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000031 order by id limit 1), 3151, 1, false, false, 'After completing <color=#FFD780FF>Witch''s Homework: Of the Unexpected</color>, Fischl will become a <color=#FFD780FF>Hexerei</color> character. When the party includes at least 2 Hexerei characters, you will gain the <color=#FFD780FF>Hexerei: Secret Rite</color> effect, which enhances Hexerei characters.\n\n<color=#FFD780FF>Hexerei: Secret Rite</color>\nHark, Prince Nachtraben, Ozvaldo Hrafnavins, he who has witnessed the fall of countless worlds. Sing now the starry septet for your sovereign, for this is the moment of deepest sin, when the gathered souls at the end of causality shatter the darkness of fate.\nAdditionally, when Oz is on the field, party members will gain additional buff effects:\n· After a nearby party member triggers an Overloaded reaction, Fischl and other nearby active party members have their ATK increased by 22.5% for 10s.\n· After a nearby party member triggers an Electro-Charged or Lunar-Charged reaction, Fischl and other nearby active party members have their Elemental Mastery increased by 90 for 10s.', true
      where exists (select 1 from skills where id = 3151 and character_id = 10000031)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3123, 10000031, 'Mein Hausgarten', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4ecb4aeefb1a5cf2dcb62a5d84d08858.png', 2, 'When dispatched on an expedition in Mondstadt, time consumed is reduced by 25%.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000031 order by id limit 1), 3123, 1, true, false, '', false
      where exists (select 1 from skills where id = 3123 and character_id = 10000031)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 2000, 'selected', '770', '960', '1731')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 20, 'selected', '19.2%', null, '19.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 2001, 'selected', '62', '90', '152')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 22, 'selected', '82.4%', null, '82.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 2002, 'selected', '50', '58', '108')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 28, 'selected', '59', null, '59')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 41, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 23, 'selected', '113.3%', null, '113.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 2000, 'base', '770', '960', '1731')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 2001, 'base', '62', '90', '152')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 2002, 'base', '50', '58', '108')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 28, 'base', '59', null, '59')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 20, 'extra', '19.2%', null, '19.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 22, 'extra', '82.4%', null, '82.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 23, 'extra', '113.3%', null, '113.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000031 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
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
      values ((select id from character_builds where character_id = 10000031 order by id limit 1), 55443, 2100051, 1, 4, 0, 2, '645', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 1), 8, '15', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 1) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 1), 28, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 1) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 1), 20, '2.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 1) and property_type_id = 20);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47422, 'Glory to Your Legacy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/f60c04735c5a36d349a2802b51e9b6fc.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000031 order by id limit 1), 47422, 2150471, 2, 4, 0, 5, '42', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 2), 6, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 2) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 2), 28, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 2) and property_type_id = 28);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47453, 'Time Gifted Unto You', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/f378887dafcdfd8b72457765732a0828.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000031 order by id limit 1), 47453, 2150471, 3, 4, 0, 28, '25', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 3), 8, '15', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 3) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 3), 6, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 3) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 3), 22, '5.0%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 3) and property_type_id = 22);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55312, 'Berserker''s Bone Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/a1c51bbf393862969fb15640d6a433bd.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000031 order by id limit 1), 55312, 2100051, 4, 3, 4, 6, '11.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 4), 5, '9', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 4), 2, '100', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 4) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 4), 8, '8', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 4) and property_type_id = 8);
insert into relic_sets (id, name) values (2150451, 'Celestial Gift') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150451, 2, 'Energy Recharge +20%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150451 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150451, 4, 'If the equipping character has completed Witch''s Homework, after they use an Elemental Skill, they gain "Light''s Guidance" for 20s: All nearby party members gain a 20% Elemental DMG Bonus corresponding to the equipping character''s Elemental Type. The equipping character can trigger this effect while off-field. DMG Bonuses provided by Artifact Sets with the same name do not stack.\n· When your party has the Hexerei: Secret Rite effect, Light''s Guidance is upgraded to "Mortal Hymn": All nearby party members gain a 40% Elemental DMG Bonus corresponding to both the equipping character and the current active party member''s Elemental Type instead. If both characters have the same Elemental Type, these bonuses will not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150451 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (45432, 'Heavensent Crown', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a0cf98d/9ddda9f5ce2a9b32318a2040598cc8f1.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000031 order by id limit 1), 45432, 2150451, 5, 4, 8, 22, '27.4%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 5), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 5), 9, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 5) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 5), 2, '215', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 5) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 5), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000031 order by id limit 1) and position = 5) and property_type_id = 5);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000031, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000031 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000031, 'goblet', 41
          where not exists (select 1 from character_relic_recommendations where character_id = 10000031 and slot = 'goblet' and property_type_id = 41);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000031, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 10000031 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000031, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000031 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000031, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000031 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000031, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000031 and property_type_id = 6);

-- Beidou (10000024)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000024, 'Beidou', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/bc2903d1a46616c871d5108d033a463d.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/f6389d7277894b1cc1677402a3c64d90.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/d0d7146418af643964a4bc7f8cf9671f.png', 'Electro', 4, 11)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000024, 1, 1, 0, false
    where not exists (select 1 from character_builds where character_id = 10000024);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (12401, 'Favonius Greatsword', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7646388f158d62d56f368631a37427c3.png', 11, 'Claymore', 4, 'A heavy ceremonial sword of the Knights of Favonius. It channels elemental power easily and is highly destructive.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000024 order by id limit 1), 12401, 60, 3, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1)), 4, 'main', null, null, 293
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1)), 23, 'sub', null, null, 45.1
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (241, 10000024, 'Sea Beast''s Scourge', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/234ee4bac61e84650bf3121ea09257ea.png', 'When <color=#FFD780FF>Stormbreaker</color> is used:\nCreates a shield that absorbs up to 16% of Beidou''s Max HP for 15s.\nThis shield absorbs <color=#FFACFFFF>Electro DMG</color> 250% more effectively.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000024 order by id limit 1), 241, false, false, '', false
      where exists (select 1 from constellations where id = 241 and character_id = 10000024)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (242, 10000024, 'Upon the Turbulent Sea, the Thunder Arises', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/c0fe9e21c6813fa1ecc9be4d7b6ec927.png', '<color=#FFD780FF>Stormbreaker</color>''s arc lightning can jump to 2 additional targets.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000024 order by id limit 1), 242, false, false, '', false
      where exists (select 1 from constellations where id = 242 and character_id = 10000024)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (243, 10000024, 'Summoner of Storm', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/d9701bbf947e1d7986b6edb39a49060b.png', 'Increases the Level of <color=#FFD780FF>Tidecaller</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000024 order by id limit 1), 243, false, false, '', false
      where exists (select 1 from constellations where id = 243 and character_id = 10000024)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (244, 10000024, 'Stunning Revenge', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/d90e8f88813fa10a84edb6561c85b569.png', 'Upon being attacked, Beidou''s Normal Attacks gain an additional instance of 20% <color=#FFACFFFF>Electro DMG</color> for 10s.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000024 order by id limit 1), 244, false, false, '', false
      where exists (select 1 from constellations where id = 244 and character_id = 10000024)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (245, 10000024, 'Crimson Tidewalker', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/ab55a6e7aa3af33ba7210e61a37fcc4c.png', 'Increases the Level of <color=#FFD780FF>Stormbreaker</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000024 order by id limit 1), 245, false, false, '', false
      where exists (select 1 from constellations where id = 245 and character_id = 10000024)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (246, 10000024, 'Bane of Evil', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/de2d6b809b7ed9c756a3f4de819967bb.png', 'During the duration of <color=#FFD780FF>Stormbreaker</color>, the <color=#FFACFFFF>Electro RES</color> of surrounding opponents is decreased by 15%.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000024 order by id limit 1), 246, false, false, 'While <color=#FFD780FF>Stormbreaker</color> is active, nearby opponents'' <color=#FFACFFFF>Electro RES</color> is reduced by 15%.\n\n<color=#FFD780FF>Radiance: Stellar-Conduct</color>: The <color=#99FFFFFF>Cryo RES</color> of nearby opponents is decreased by 15%, and the Elemental Mastery of the current active character is increased by 200, while Stormbreaker is active.', true
      where exists (select 1 from constellations where id = 246 and character_id = 10000024)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10241, 10000024, 'Oceanborne', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/bf0237fba9d4ab5b47ea86b90711a765.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 consecutive strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nDrains Stamina over time to perform continuous slashes.\nAt the end of the sequence, performs a more powerful slash.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10241, '1-Hit DMG', '71.1%', 1
        where exists (select 1 from skills where id = 10241 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10241 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10241, '2-Hit DMG', '70.9%', 2
        where exists (select 1 from skills where id = 10241 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10241 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10241, '3-Hit DMG', '88.3%', 3
        where exists (select 1 from skills where id = 10241 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10241 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10241, '4-Hit DMG', '86.5%', 4
        where exists (select 1 from skills where id = 10241 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10241 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10241, '5-Hit DMG', '112%', 5
        where exists (select 1 from skills where id = 10241 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10241 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10241, 'Charged Attack Cyclic DMG', '56.2%', 6
        where exists (select 1 from skills where id = 10241 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10241 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10241, 'Charged Attack Final DMG', '102%', 7
        where exists (select 1 from skills where id = 10241 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10241 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10241, 'Charged Attack Stamina Cost', '40.0/s', 8
        where exists (select 1 from skills where id = 10241 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10241 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10241, 'Max Duration', '5.0s', 9
        where exists (select 1 from skills where id = 10241 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10241 and position = 9);
insert into skill_affixes (skill_id, name, value, position)
        select 10241, 'Plunge DMG', '74.6%', 10
        where exists (select 1 from skills where id = 10241 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10241 and position = 10);
insert into skill_affixes (skill_id, name, value, position)
        select 10241, 'Low/High Plunge DMG', '149%/186%', 11
        where exists (select 1 from skills where id = 10241 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10241 and position = 11);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000024 order by id limit 1), 10241, 1, true, false, '', false
      where exists (select 1 from skills where id = 10241 and character_id = 10000024)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10242, 10000024, 'Tidecaller', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/f5a9b52b9c820a414b1bd94d90598d86.png', 1, '#Nothing to worry about. Should anyone raise a hand against her or her men, she will avenge it ten-fold with sword and thunder.\n\n<color=#FFD780FF>{LAYOUT_MOBILE#Tap}{LAYOUT_PC#Press}{LAYOUT_PS#Press}</color>\nAccumulating the power of lightning, Beidou swings her blade forward fiercely, dealing <color=#FFACFFFF>Electro DMG</color>.\n\n<color=#FFD780FF>Hold</color>\nLifts her weapon up as a shield. Max DMG absorbed scales off Beidou''s Max HP.\nAttacks using the energy stored within the greatsword upon release or once this ability''s duration expires, dealing <color=#FFACFFFF>Electro DMG</color>. DMG dealt scales with the number of times Beidou is attacked in the skill''s duration. The greatest DMG Bonus will be attained once this effect is triggered twice.\nThe shield possesses the following properties:\n·Has 250% <color=#FFACFFFF>Electro DMG</color> Absorption Efficiency.\n·Applies the <color=#FFACFFFF>Electro element</color> to Beidou upon activation.\n\n<i>Conquer the high seas! Pursue the waves and chase the storm!</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10242, 'Shield DMG Absorption', '14.4% Max HP+1386', 1
        where exists (select 1 from skills where id = 10242 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10242 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10242, 'Base DMG', '122%', 2
        where exists (select 1 from skills where id = 10242 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10242 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10242, 'DMG Bonus on Hit Taken', '160%', 3
        where exists (select 1 from skills where id = 10242 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10242 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10242, 'CD', '7.5s', 4
        where exists (select 1 from skills where id = 10242 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10242 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000024 order by id limit 1), 10242, 1, true, false, '', false
      where exists (select 1 from skills where id = 10242 and character_id = 10000024)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10245, 10000024, 'Stormbreaker', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3d31d96efd3a06161cf2994fd8baf164.png', 1, 'Recalling her slaying of the great beast Haishan, Beidou calls upon that monstrous strength and the lightning to create a Thunderbeast''s Targe around herself, dealing <color=#FFACFFFF>Electro DMG</color> to nearby opponents.\n\n<color=#FFD780FF>Thunderbeast''s Targe</color>\n·When Normal and Charged Attacks hit, they create a lightning discharge that can jump between opponents, dealing <color=#FFACFFFF>Electro DMG</color>.\n·Increases the character''s resistance to interruption, and decreases DMG taken.\n\nA maximum of 1 lightning discharge can be triggered per second.\n\n<i>With a peal of thunder, Haishan is slain.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10245, 'Skill DMG', '122%', 1
        where exists (select 1 from skills where id = 10245 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10245 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10245, 'Lightning DMG', '96.0%', 2
        where exists (select 1 from skills where id = 10245 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10245 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10245, 'DMG Reduction', '20%', 3
        where exists (select 1 from skills where id = 10245 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10245 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10245, 'Duration', '15.0s', 4
        where exists (select 1 from skills where id = 10245 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10245 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10245, 'CD', '20.0s', 5
        where exists (select 1 from skills where id = 10245 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10245 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10245, 'Energy Cost', '80', 6
        where exists (select 1 from skills where id = 10245 and character_id = 10000024) and not exists (select 1 from skill_affixes where skill_id = 10245 and position = 6);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000024 order by id limit 1), 10245, 1, true, false, '', false
      where exists (select 1 from skills where id = 10245 and character_id = 10000024)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (2421, 10000024, 'Retribution', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/674f8b751fe2e0f5886fc4e963222d2a.png', 2, 'Counterattacking with <color=#FFD780FF>Tidecaller</color> at the precise moment when the character is hit grants the maximum DMG Bonus.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000024 order by id limit 1), 2421, 1, false, false, '', false
      where exists (select 1 from skills where id = 2421 and character_id = 10000024)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (2422, 10000024, 'Lightning Storm', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/1e3d0189d2ac6c9cae5fe5fa91263d90.png', 2, 'Gain the following effects for 10s after unleashing <color=#FFD780FF>Tidecaller</color> with its maximum DMG Bonus: \n·DMG dealt by Normal and Charged Attacks is increased by 15%. ATK SPD of Normal and Charged Attacks is increased by 15%.\n·Greatly reduced delay before unleashing Charged Attacks.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000024 order by id limit 1), 2422, 1, false, false, '', false
      where exists (select 1 from skills where id = 2422 and character_id = 10000024)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (2424, 10000024, 'Polaris', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a4458e6/d9bb8559dc7e06eee94f1e74efbeebe5.png', 3, 'When holding down on the Elemental Skill <color=#FFD780FF>Tidecaller</color>, 1 stack of power will accumulate every 0.8s, even when not under attack. This increases the DMG dealt at the point of unleashing.\nAdditionally, holding down to unleash <color=#FFD780FF>Tidecaller</color> and hitting the opponent also gives extra boosts based on the power accumulated: every stack active decreases Beidou''s Elemental Skill CD by 4s, as well as regenerates 8 Elemental Energy for her. This effect can trigger once every 15s.\nAdditionally, when inside a {LINK#N11330003}<color=#FFD780FF>Polestar Field</color>{/LINK}, Beidou will enter the <color=#FFD780FF>Radiance: Stellar-Conduct</color> state.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000024 order by id limit 1), 2424, 1, false, false, 'When holding down on the Elemental Skill <color=#FFD780FF>Tidecaller</color>, 1 stack of power will accumulate every 0.8s, even when not under attack. This increases the DMG dealt at the point of unleashing.\nAdditionally, holding down to unleash <color=#FFD780FF>Tidecaller</color> and hitting the opponent also gives extra boosts based on the power accumulated: every stack active decreases Beidou''s Elemental Skill CD by 4s, as well as regenerates 8 Elemental Energy for her. This effect can trigger once every 15s.\nAdditionally, when inside a {LINK#N11330003}<color=#FFD780FF>Polestar Field</color>{/LINK}, Beidou will enter the <color=#FFD780FF>Radiance: Stellar-Conduct</color> state.', true
      where exists (select 1 from skills where id = 2424 and character_id = 10000024)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (2423, 10000024, 'Conqueror of Tides', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/085f7cab766c6f3576ef0aaa52c798c7.png', 2, 'Decreases swimming Stamina consumption for your own party members by 20%.\nNot stackable with Passive Talents that provide the exact same effects.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000024 order by id limit 1), 2423, 1, true, false, '', false
      where exists (select 1 from skills where id = 2423 and character_id = 10000024)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 2000, 'selected', '1094', '2613', '3707')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 20, 'selected', '24.0%', null, '24.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 2001, 'selected', '311', '254', '566')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 22, 'selected', '59.9%', null, '59.9%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 2002, 'selected', '54', '18', '73')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 28, 'selected', '32', null, '32')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 41, 'selected', '6.3%', null, '6.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 23, 'selected', '167.9%', null, '167.9%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 2000, 'base', '1094', '2613', '3707')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 2001, 'base', '311', '254', '566')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 2002, 'base', '54', '18', '73')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 28, 'base', '32', null, '32')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 20, 'extra', '24.0%', null, '24.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 22, 'extra', '59.9%', null, '59.9%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 23, 'extra', '167.9%', null, '167.9%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 41, 'element', '6.3%', null, '6.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000024 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48442, 'Foundryman''s Conjecture', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/09729586ce0f78f5111f9ee8d25eb431.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000024 order by id limit 1), 48442, 2150481, 1, 4, 8, 2, '2108', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 1), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 1) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 1), 22, '5.0%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 1) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 1), 20, '3.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 1) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 1), 6, '4.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 1) and property_type_id = 6);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47422, 'Glory to Your Legacy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/f60c04735c5a36d349a2802b51e9b6fc.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000024 order by id limit 1), 47422, 2150471, 2, 4, 4, 5, '90', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 2), 20, '2.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 2) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 2), 2, '215', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 2), 3, '4.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 2) and property_type_id = 3);
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57452, 'Instructor''s Pocket Watch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/76419f505a01e33f9aa12349802e1d1d.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000024 order by id limit 1), 57452, 2100071, 3, 4, 8, 23, '22.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 3), 9, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 3) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 3), 22, '5.0%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 3) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 3), 3, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 3) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 3), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 3) and property_type_id = 8);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47412, 'Chalice of Your Blood and Sorrow', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/d653c3aa684c882bbf09757f695ab533.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000024 order by id limit 1), 47412, 2150471, 4, 4, 0, 41, '6.3%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 4), 3, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 4) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 4), 5, '11', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 4) and property_type_id = 5);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48433, 'Foundryman''s Legacy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/2aece34359e0f99802feced2f25ee01b.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000024 order by id limit 1), 48433, 2150481, 5, 4, 8, 20, '13.7%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 5), 2, '167', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 5) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 5), 28, '32', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 5) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 5), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 5) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 5), 9, '5.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000024 order by id limit 1) and position = 5) and property_type_id = 9);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000024, 'sand', 23
          where not exists (select 1 from character_relic_recommendations where character_id = 10000024 and slot = 'sand' and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000024, 'goblet', 41
          where not exists (select 1 from character_relic_recommendations where character_id = 10000024 and slot = 'goblet' and property_type_id = 41);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000024, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 10000024 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000024, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000024 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000024, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000024 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000024, 23
        where not exists (select 1 from character_recommended_substats where character_id = 10000024 and property_type_id = 23);

commit;
