-- Part 13 of 13. Generated from app/data/character_detail.ts.
-- Insert-only and safe to re-run. Run the parts in order in the Supabase SQL editor.
begin;

-- Chevreuse (10000090)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000090, 'Chevreuse', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/817f1d6da2a3ff6e6bfedeb39104ad71.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/1c1c928d7a9757932c6bdbda89073f46.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/e0186b49ed0d791ee6b1dc0b125f6613.png', 'Pyro', 4, 13)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000090, 1, 1, 0, false
    where not exists (select 1 from character_builds where character_id = 10000090);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (13401, 'Dragon''s Bane', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/cf0f39f3f9fddd9fdcafe921ca8cff1a.png', 13, 'Polearm', 4, 'A polearm decorated with an entwining golden dragon. Light and sharp, this weapon may very well kill dragons with ease.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000090 order by id limit 1), 13401, 7, 0, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1)), 4, 'main', null, null, 60
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1)), 28, 'sub', null, null, 56
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (901, 10000090, 'Stable Front Line''s Resolve', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/821af633e40660c14a8440ff00f42f2a.png', 'When the active character with the "Coordinated Tactics" status (not including Chevreuse herself) triggers the Overloaded reaction, they will recover 6 Energy. This effect can be triggered once every 10s.\nYou must first unlock the Ascension Talent "Vanguard''s Coordinated Tactics."', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000090 order by id limit 1), 901, false, false, '', false
      where exists (select 1 from constellations where id = 901 and character_id = 10000090)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (902, 10000090, 'Sniper Induced Explosion', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/aeb517fc7eed8b39fbdd75fabc82995d.png', 'After Holding <color=#FFD780FF>Short-Range Rapid Interdiction Fire</color> and hitting a target, 2 chain explosions will be triggered near the location where said target is hit. Each explosion deals <color=#FF9999FF>Pyro DMG</color> equal to 120% of Chevreuse''s ATK. This effect can be triggered up to once every 10s, and DMG dealt this way is considered Elemental Skill DMG.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000090 order by id limit 1), 902, false, false, '', false
      where exists (select 1 from constellations where id = 902 and character_id = 10000090)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (903, 10000090, 'Practiced Field Stripping Technique', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/a6bccf563a252fb0c3a5a975be78d4ea.png', 'Increases the Level of <color=#FFD780FF>Short-Range Rapid Interdiction Fire</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000090 order by id limit 1), 903, false, false, '', false
      where exists (select 1 from constellations where id = 903 and character_id = 10000090)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (904, 10000090, 'The Secret to Rapid-Fire Multishots', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/891054f9a2b3ef5c60a8a4e0e60886ed.png', 'After using <color=#FFD780FF>Ring of Bursting Grenades</color>, the Hold mode of <color=#FFD780FF>Short-Range Rapid Interdiction Fire</color> will not go on cooldown when Chevreuse uses it. This effect is removed after Short-Range Rapid Interdiction Fire has been fired twice using Hold or after 6s.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000090 order by id limit 1), 904, false, false, '', false
      where exists (select 1 from constellations where id = 904 and character_id = 10000090)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (905, 10000090, 'Enhanced Incendiary Firepower', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/95b302d0f2c42ebeaec6f2ff7ec4dd5f.png', 'Increases the Level of <color=#FFD780FF>Ring of Bursting Grenades</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000090 order by id limit 1), 905, false, false, '', false
      where exists (select 1 from constellations where id = 905 and character_id = 10000090)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (906, 10000090, 'In Pursuit of Ending Evil', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/aa3572c73c6a8fc90049e3b3dab83cc9.png', 'After 12s of the healing effect from <color=#FFD780FF>Short-Range Rapid Interdiction Fire</color>, all nearby party members recover HP equivalent to 10% of Chevreuse''s Max HP once.\nAfter a party member is healed by Short-Range Rapid Interdiction Fire, they gain a 20% <color=#FF9999FF>Pyro DMG Bonus</color> and <color=#FFACFFFF>Electro DMG Bonus</color> for 8s. Max 3 stacks. Each stack''s duration is counted independently.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000090 order by id limit 1), 906, false, false, '', false
      where exists (select 1 from constellations where id = 906 and character_id = 10000090)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10901, 10000090, 'Line Bayonet Thrust EX', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/0a4af4ecb63b4741aa3e42d18a2a0c21.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 4 consecutive spear strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to lunge forward, dealing damage to opponents along the way.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10901, '1-Hit DMG', '53.1%', 1
        where exists (select 1 from skills where id = 10901 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10901 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10901, '2-Hit DMG', '49.3%', 2
        where exists (select 1 from skills where id = 10901 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10901 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10901, '3-Hit DMG', '27.6%+32.5%', 3
        where exists (select 1 from skills where id = 10901 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10901 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10901, '4-Hit DMG', '77.3%', 4
        where exists (select 1 from skills where id = 10901 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10901 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10901, 'Charged Attack DMG', '121.7%', 5
        where exists (select 1 from skills where id = 10901 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10901 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10901, 'Charged Attack Stamina Cost', '25.0', 6
        where exists (select 1 from skills where id = 10901 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10901 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10901, 'Plunge DMG', '63.9%', 7
        where exists (select 1 from skills where id = 10901 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10901 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10901, 'Low/High Plunge DMG', '128%/160%', 8
        where exists (select 1 from skills where id = 10901 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10901 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000090 order by id limit 1), 10901, 1, true, false, '', false
      where exists (select 1 from skills where id = 10901 and character_id = 10000090)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10902, 10000090, 'Short-Range Rapid Interdiction Fire', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/b76837b1fc1dbac9398d265f3515c2d1.png', 1, 'Chevreuse quickly shoulders her musket and fires at her opponent(s), dealing <color=#FF9999FF>AoE Pyro DMG</color>.\nFor a short duration after Chevreuse fires a shot, she will continuously restore HP to your active character on the field. The amount healed is based on her Max HP.\nHold to fire in a different fashion.\n\n<color=#FFD780FF>Hold</color>\nEnter Aiming Mode, locking a target in her sights to fire a precise interdiction shot. If Chevreuse has an Overcharged Ball, then she will fire the Overcharged Ball instead, dealing greater <color=#FF9999FF>Pyro DMG</color> in a larger area.\nChevreuse gains 1 Overcharged Ball every time a nearby character in the party triggers an Overloaded reaction, and can have up to 1 Overcharged Ball at a time.\n\n<color=#FFD780FF>Arkhe: Ousia</color>\nPeriodically, after Chevreuse''s Short-Range Rapid Interdiction Fire hits, a Surging Blade will be called forth that deals Ousia-aligned <color=#FF9999FF>Pyro DMG</color>.\n\n<i>"Actually, training regulations only had the phrase "interdiction fire," but the protagonist of this novel believes that even how stylish your terminology is can affect how motivated your troops are, which can put your opponents on the back foot right from the get-go... I think that''s a good point, so I changed the regulations!"</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10902, '#{LAYOUT_MOBILE#Tap}{LAYOUT_PC#Press}{LAYOUT_PS#Press} DMG', '115.2%', 1
        where exists (select 1 from skills where id = 10902 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10902 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10902, 'Hold DMG', '172.8%', 2
        where exists (select 1 from skills where id = 10902 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10902 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10902, 'Overcharged Ball DMG', '282.4%', 3
        where exists (select 1 from skills where id = 10902 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10902 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10902, 'HP Regeneration Over Time', '2.67% Max HP+257', 4
        where exists (select 1 from skills where id = 10902 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10902 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10902, 'Healing Duration', '12.0s', 5
        where exists (select 1 from skills where id = 10902 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10902 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10902, 'Surging Blade DMG', '28.8%', 6
        where exists (select 1 from skills where id = 10902 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10902 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10902, 'Surging Blade Interval', '10.0s', 7
        where exists (select 1 from skills where id = 10902 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10902 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10902, 'CD', '15.0s', 8
        where exists (select 1 from skills where id = 10902 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10902 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000090 order by id limit 1), 10902, 1, true, false, '', false
      where exists (select 1 from skills where id = 10902 and character_id = 10000090)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10905, 10000090, 'Ring of Bursting Grenades', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/23ade3ffd0210ceffbe94373d895cd4c.png', 1, 'Chevreuse fires an explosive grenade at opponents with her musket, dealing <color=#FF9999FF>AoE Pyro DMG.</color> After the projectile hits, it will split into many secondary explosive shells.\nThe secondary explosive shells will burst after a short interval, dealing <color=#FF9999FF>Pyro DMG</color> to nearby opponents.\n\n<i>"Theoretically, a rectangular blast would be most efficient at destroying enemy formations. Unfortunately, the cross-section of an explosive shock wave is round, like most cakes. So, the secondary explosive shells can only be arranged like the fruit on a cake, forming a ring around the edge."</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10905, 'Explosive Grenade DMG', '368.2%', 1
        where exists (select 1 from skills where id = 10905 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10905 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10905, 'Secondary Explosive Shell DMG', '49.1%', 2
        where exists (select 1 from skills where id = 10905 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10905 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10905, 'CD', '15.0s', 3
        where exists (select 1 from skills where id = 10905 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10905 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10905, 'Energy Cost', '60', 4
        where exists (select 1 from skills where id = 10905 and character_id = 10000090) and not exists (select 1 from skill_affixes where skill_id = 10905 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000090 order by id limit 1), 10905, 1, true, false, '', false
      where exists (select 1 from skills where id = 10905 and character_id = 10000090)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (9021, 10000090, 'Vanguard''s Coordinated Tactics', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/97511bae044b3637d98316f06e94b7d1.png', 2, 'When all party members are <color=#FF9999FF>Pyro</color> and <color=#FFACFFFF>Electro</color> characters and there is at least one Pyro and one Electro character each in the party:\nChevreuse grants "Coordinated Tactics" to nearby party members: After a character triggers the Overloaded reaction, the <color=#FF9999FF>Pyro</color> and <color=#FFACFFFF>Electro</color> RES of the opponent(s) affected by this Overloaded reaction will be decreased by 40% for 6s.\nThe "Coordinated Tactics" effect will be removed when the Elemental Types of the characters in the party do not meet the basic requirements for the Ascension Talent.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000090 order by id limit 1), 9021, 1, false, false, '', false
      where exists (select 1 from skills where id = 9021 and character_id = 10000090)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (9022, 10000090, 'Vertical Force Coordination', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/2f75df5b0e9270bd71c9224552671ba0.png', 2, 'After Chevreuse fires an Overcharged Ball using <color=#FFD780FF>Short-Range Rapid Interdiction Fire</color>, nearby <color=#FF9999FF>Pyro</color> and <color=#FFACFFFF>Electro</color> characters in the party gain 1% increased ATK for every 1,000 Max HP Chevreuse has for 30s. ATK can be increased by up to 40% in this way.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000090 order by id limit 1), 9022, 1, false, false, '', false
      where exists (select 1 from skills where id = 9022 and character_id = 10000090)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (9023, 10000090, 'Double Time March', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4b0da467386c10aedf3192192dc85d0f.png', 2, 'Decreases sprinting Stamina consumption for your own party members by 20%.\nNot stackable with Passive Talents that provide the exact same effects.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000090 order by id limit 1), 9023, 1, true, false, '', false
      where exists (select 1 from skills where id = 9023 and character_id = 10000090)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 2000, 'selected', '1003', '1291', '2294')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 20, 'selected', '6.9%', null, '6.9%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 2001, 'selected', '76', '56', '132')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 22, 'selected', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 2002, 'selected', '51', '29', '79')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 28, 'selected', '73', null, '73')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 40, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 23, 'selected', '136.2%', null, '136.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 2000, 'base', '1003', '1291', '2294')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 2001, 'base', '76', '56', '132')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 2002, 'base', '51', '29', '79')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 28, 'base', '73', null, '73')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 20, 'extra', '6.9%', null, '6.9%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 22, 'extra', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 23, 'extra', '136.2%', null, '136.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000090 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59442, 'Exile''s Flower', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/e8e8c17bd07ea125961b9d2d6f03b1ba.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000090 order by id limit 1), 59442, 2100091, 1, 4, 0, 2, '645', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 1), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 1) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 1), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 1) and property_type_id = 3);
insert into relic_sets (id, name) values (2100021, 'Brave Heart') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100021, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100021 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100021, 4, 'Increases DMG by 30% against opponents with more than 50% HP.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100021 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (52423, 'Prospect of the Brave', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/859da1624357fdadcceb0a99c58ac495.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000090 order by id limit 1), 52423, 2100021, 2, 4, 0, 5, '42', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 2), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 2) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 2), 28, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 2) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 2), 3, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 2) and property_type_id = 3);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48452, 'Foundryman''s Calculus', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/0119db4ca0f7c650686e2da11b9c6a1d.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000090 order by id limit 1), 48452, 2150481, 3, 4, 0, 3, '6.3%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 3), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 3) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 3), 2, '167', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 3) and property_type_id = 2);
insert into relic_sets (id, name) values (2150011, 'Gladiator''s Finale') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 4, 'If the wielder of this artifact set uses a Sword, Claymore or Polearm, increases their Normal Attack DMG by 35%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (75514, 'Gladiator''s Intoxication', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/0c3a5868f5b77bf7bf8ae6c56e016557.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000090 order by id limit 1), 75514, 2150011, 4, 5, 0, 3, '7.0%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 4), 9, '7.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 4) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 4), 8, '23', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 4) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 4), 23, '5.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 4) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 4), 2, '209', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 4) and property_type_id = 2);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59332, 'Exile''s Circlet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/22faf0f5c42ac3652ea2c4a1ca38ac05.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000090 order by id limit 1), 59332, 2100091, 5, 3, 0, 3, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 5), 20, '1.9%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 5) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 5), 9, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000090 order by id limit 1) and position = 5) and property_type_id = 9);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000090, 'sand', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000090 and slot = 'sand' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000090, 'goblet', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000090 and slot = 'goblet' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000090, 'circlet', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000090 and slot = 'circlet' and property_type_id = 3);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000090, 3
        where not exists (select 1 from character_recommended_substats where character_id = 10000090 and property_type_id = 3);

commit;
