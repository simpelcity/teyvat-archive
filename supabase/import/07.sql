-- Part 7 of 13. Generated from app/data/character_detail.ts.
-- Insert-only and safe to re-run. Run the parts in order in the Supabase SQL editor.
begin;

-- Noelle (10000034)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000034, 'Noelle', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/1eb5023b8ca517a5fe27316b3771a191.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/7aca4472b525f6a6f88024510b04ff51.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/a61ccec5064fe90c87ed3257bc194b19.png', 'Geo', 4, 11)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000034, 40, 2, 2, false
    where not exists (select 1 from character_builds where character_id = 10000034);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (12407, 'Whiteblind', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/b014e2aa23e856e0cf3f802584b26862.png', 11, 'Claymore', 4, 'An exotic sword with one section of the blade left blunt. It made its way into Liyue via the hands of foreign traders. Incredibly powerful in the hands of someone who knows how to use it.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000034 order by id limit 1), 12407, 20, 1, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1)), 4, 'main', null, null, 135
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1)), 9, 'sub', null, null, 19.9
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (341, 10000034, 'I Got Your Back', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/1cb7832408804b91e09a476cc9c6daa7.png', 'While <color=#FFD780FF>Sweeping Time</color> and <color=#FFD780FF>Breastplate</color> are both in effect, the chance of Breastplate''s healing effects activating is increased to 100%.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000034 order by id limit 1), 341, true, false, '', false
      where exists (select 1 from constellations where id = 341 and character_id = 10000034)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (342, 10000034, 'Combat Maid', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/d8e99d0154cb789f4ce845f4253b6085.png', 'Decreases the Stamina Consumption of Noelle''s Charged Attacks by 20% and increases her Charged Attack DMG by 15%.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000034 order by id limit 1), 342, true, false, '', false
      where exists (select 1 from constellations where id = 342 and character_id = 10000034)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (343, 10000034, 'Invulnerable Maid', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/7d6aafac6254b97b5bfae0e6746e21c4.png', 'Increases the Level of <color=#FFD780FF>Breastplate</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000034 order by id limit 1), 343, false, false, '', false
      where exists (select 1 from constellations where id = 343 and character_id = 10000034)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (344, 10000034, 'To Be Cleaned', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/f664d7c3d6418dfccca4843c1d172ecf.png', 'When <color=#FFD780FF>Breastplate</color>''s duration expires or it is destroyed by DMG, it will deal 400% of Noelle''s ATK as <color=#FFE699FF>Geo DMG</color> to surrounding opponents.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000034 order by id limit 1), 344, false, false, '', false
      where exists (select 1 from constellations where id = 344 and character_id = 10000034)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (345, 10000034, 'Favonius Sweeper Master', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/cfc2ee4102a0b283293c6855ade8c48e.png', 'Increases the Level of <color=#FFD780FF>Sweeping Time</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000034 order by id limit 1), 345, false, false, '', false
      where exists (select 1 from constellations where id = 345 and character_id = 10000034)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (346, 10000034, 'Must Be Spotless', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/b6d87ff97f92b8127e7d3dbc0aac0d0d.png', '<color=#FFD780FF>Sweeping Time</color> increases Noelle''s ATK by an additional 50% of her DEF.\nAdditionally, every opponent defeated during the skill''s duration adds 1s to the duration, up to 10s.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000034 order by id limit 1), 346, false, false, '', false
      where exists (select 1 from constellations where id = 346 and character_id = 10000034)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10341, 10000034, 'Favonius Bladework - Maid', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/bf0237fba9d4ab5b47ea86b90711a765.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 4 consecutive strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nDrains Stamina over time to perform continuous spinning attacks against all nearby opponents.\nAt the end of the sequence, performs a more powerful slash. \n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10341, '1-Hit DMG', '79.1%', 1
        where exists (select 1 from skills where id = 10341 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10341 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10341, '2-Hit DMG', '73.4%', 2
        where exists (select 1 from skills where id = 10341 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10341 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10341, '3-Hit DMG', '86.3%', 3
        where exists (select 1 from skills where id = 10341 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10341 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10341, '4-Hit DMG', '113%', 4
        where exists (select 1 from skills where id = 10341 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10341 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10341, 'Charged Attack Cyclic DMG', '50.7%', 5
        where exists (select 1 from skills where id = 10341 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10341 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10341, 'Charged Attack Final DMG', '90.5%', 6
        where exists (select 1 from skills where id = 10341 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10341 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10341, 'Charged Attack Stamina Cost', '40.0/s', 7
        where exists (select 1 from skills where id = 10341 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10341 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10341, 'Max Duration', '5.0s', 8
        where exists (select 1 from skills where id = 10341 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10341 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10341, 'Plunge DMG', '74.6%', 9
        where exists (select 1 from skills where id = 10341 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10341 and position = 9);
insert into skill_affixes (skill_id, name, value, position)
        select 10341, 'Low/High Plunge DMG', '149%/186%', 10
        where exists (select 1 from skills where id = 10341 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10341 and position = 10);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000034 order by id limit 1), 10341, 1, true, false, '', false
      where exists (select 1 from skills where id = 10341 and character_id = 10000034)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10342, 10000034, 'Breastplate', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/7f5e7d90d4e56d5b194dbab2c8b05cd4.png', 1, 'Summons protective stone armor, dealing <color=#FFE699FF>Geo DMG</color> to surrounding opponents and creating a shield. The shield''s DMG Absorption scales based on Noelle''s DEF.\nThe shield has the following properties:\n·When Noelle''s Normal and Charged Attacks hit a target, they have a certain chance to regenerate HP for all characters.\n·Possesses 150% DMG Absorption efficiency against all Elemental and Physical DMG.\n\nThe amount of HP healed when regeneration is triggered scales based on Noelle''s DEF.\n\n<i>Noelle is both a dutiful maid and a valiant knight.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10342, 'Skill DMG', '120% DEF', 1
        where exists (select 1 from skills where id = 10342 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10342 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10342, 'DMG Absorption', '160% DEF+770', 2
        where exists (select 1 from skills where id = 10342 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10342 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10342, 'Healing', '21.3% DEF+103', 3
        where exists (select 1 from skills where id = 10342 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10342 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10342, 'Healing Triggering Chance', '50%', 4
        where exists (select 1 from skills where id = 10342 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10342 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10342, 'Duration', '12.0s', 5
        where exists (select 1 from skills where id = 10342 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10342 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10342, 'CD', '24.0s', 6
        where exists (select 1 from skills where id = 10342 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10342 and position = 6);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000034 order by id limit 1), 10342, 1, true, false, '', false
      where exists (select 1 from skills where id = 10342 and character_id = 10000034)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10343, 10000034, 'Sweeping Time', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/f96db464d0f2ddbda0432b4fb0735e12.png', 1, 'Gathering the strength of stone around her weapon, Noelle strikes the opponents surrounding her within a large AoE, dealing <color=#FFE699FF>Geo DMG</color>.\nAfterwards, Noelle gains the following effects:\n·Larger attack AoE.\n·Converts attack DMG to <color=#FFE699FF>Geo DMG</color> that cannot be overridden by any other elemental infusion.\n·Increased ATK that scales based on her DEF.\n\n<i>Sometimes, it''s not just dust that needs sweeping...</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10343, 'Burst DMG', '67.2%', 1
        where exists (select 1 from skills where id = 10343 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10343 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10343, 'Skill DMG', '92.8%', 2
        where exists (select 1 from skills where id = 10343 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10343 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10343, 'ATK Bonus', '40% DEF', 3
        where exists (select 1 from skills where id = 10343 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10343 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10343, 'Duration', '15.0s', 4
        where exists (select 1 from skills where id = 10343 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10343 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10343, 'CD', '15.0s', 5
        where exists (select 1 from skills where id = 10343 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10343 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10343, 'Energy Cost', '60', 6
        where exists (select 1 from skills where id = 10343 and character_id = 10000034) and not exists (select 1 from skill_affixes where skill_id = 10343 and position = 6);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000034 order by id limit 1), 10343, 1, true, false, '', false
      where exists (select 1 from skills where id = 10343 and character_id = 10000034)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3421, 10000034, 'Devotion', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/f1d78d8f55345b6a18649085fb7e8bc4.png', 2, 'When Noelle is in the party but not on the field, this ability triggers automatically when your active character''s HP falls below 30%:\nCreates a shield for your active character that lasts for 20s and absorbs DMG equal to 400% of Noelle''s DEF.\nThe shield has a 150% DMG Absorption effectiveness against all Elemental and Physical DMG.\nThis effect can only occur once every 60s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000034 order by id limit 1), 3421, 1, true, false, '', false
      where exists (select 1 from skills where id = 3421 and character_id = 10000034)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3422, 10000034, 'Nice and Clean', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/fdf8319f72a0dbc3089739d9a78911f5.png', 2, 'Noelle will decrease the CD of <color=#FFD780FF>Breastplate</color> by 1s for every 4 Normal or Charged Attack hits she scores on opponents.\nOne hit may be counted every 0.1s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000034 order by id limit 1), 3422, 1, false, false, '', false
      where exists (select 1 from skills where id = 3422 and character_id = 10000034)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (3423, 10000034, 'Maid''s Knighthood', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/d974fc07067d8ebae1bab40b6409645e.png', 2, 'When a Perfect Cooking is achieved on a DEF-boosting dish, Noelle has a 12% chance to obtain double the product.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000034 order by id limit 1), 3423, 1, true, false, '', false
      where exists (select 1 from skills where id = 3423 and character_id = 10000034)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 2000, 'selected', '5027', '3803', '8830')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 20, 'selected', '15.1%', null, '15.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 2001, 'selected', '214', '140', '355')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 22, 'selected', '55.4%', null, '55.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 2002, 'selected', '333', '192', '524')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 28, 'selected', '34', null, '34')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 45, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 23, 'selected', '100.0%', null, '100.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 2000, 'base', '5027', '3803', '8830')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 2001, 'base', '214', '140', '355')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 2002, 'base', '333', '192', '524')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 28, 'base', '34', null, '34')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 20, 'extra', '15.1%', null, '15.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 22, 'extra', '55.4%', null, '55.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 23, 'extra', '100.0%', null, '100.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000034 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150011, 'Gladiator''s Finale') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 4, 'If the wielder of this artifact set uses a Sword, Claymore or Polearm, increases their Normal Attack DMG by 35%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (75544, 'Gladiator''s Nostalgia', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f5a1fb5232b2985617002eac1bfea8e6.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000034 order by id limit 1), 75544, 2150011, 1, 5, 8, 2, '2342', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 1), 3, '9.9%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 1) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 1), 20, '2.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 1) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 1), 9, '12.4%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 1) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 1), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 1) and property_type_id = 5);
insert into relic_sets (id, name) values (2150011, 'Gladiator''s Finale') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 4, 'If the wielder of this artifact set uses a Sword, Claymore or Polearm, increases their Normal Attack DMG by 35%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (75423, 'Gladiator''s Destiny', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/5f120cdac0fc7783d0ba6d1452818d5d.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000034 order by id limit 1), 75423, 2150011, 2, 4, 0, 5, '42', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 2), 9, '5.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 2) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 2), 2, '191', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 2), 28, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 2) and property_type_id = 28);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48553, 'Foundryman''s Calculus', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/0119db4ca0f7c650686e2da11b9c6a1d.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000034 order by id limit 1), 48553, 2150481, 3, 5, 0, 9, '8.7%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 3), 20, '2.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 3) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 3), 2, '239', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 3) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 3), 8, '21', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 3) and property_type_id = 8);
insert into relic_sets (id, name) values (2150011, 'Gladiator''s Finale') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 4, 'If the wielder of this artifact set uses a Sword, Claymore or Polearm, increases their Normal Attack DMG by 35%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (75513, 'Gladiator''s Intoxication', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/0c3a5868f5b77bf7bf8ae6c56e016557.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000034 order by id limit 1), 75513, 2150011, 4, 5, 0, 6, '7.0%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 4), 3, '5.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 4) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 4), 5, '18', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 4), 9, '5.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 4) and property_type_id = 9);
insert into relic_sets (id, name) values (2150011, 'Gladiator''s Finale') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 4, 'If the wielder of this artifact set uses a Sword, Claymore or Polearm, increases their Normal Attack DMG by 35%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (75534, 'Gladiator''s Triumphus', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/69750e95511b6aed7919f73b1d568ccd.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000034 order by id limit 1), 75534, 2150011, 5, 5, 0, 20, '4.7%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 5), 2, '269', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 5) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 5), 28, '21', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 5) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 5), 22, '5.4%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 5) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 5), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000034 order by id limit 1) and position = 5) and property_type_id = 5);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000034, 'sand', 9
          where not exists (select 1 from character_relic_recommendations where character_id = 10000034 and slot = 'sand' and property_type_id = 9);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000034, 'goblet', 45
          where not exists (select 1 from character_relic_recommendations where character_id = 10000034 and slot = 'goblet' and property_type_id = 45);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000034, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 10000034 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000034, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000034 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000034, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000034 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000034, 9
        where not exists (select 1 from character_recommended_substats where character_id = 10000034 and property_type_id = 9);

-- Amber (10000021)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000021, 'Amber', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/9fae2c3ff5862c261c8ad7200084f567.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/2779686571b96e4b4a9993136379f692.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/51a3736103e0bb8fae3dbb5197257f36.png', 'Pyro', 4, 12)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000021, 40, 2, 0, false
    where not exists (select 1 from character_builds where character_id = 10000021);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (15401, 'Favonius Warbow', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f0b8edcc330cd9de1dcf97eccb20cbaf.png', 12, 'Bow', 4, 'A standard-issue recurve bow of the Knights of Favonius. Only the best archers can unleash its full potential.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000021 order by id limit 1), 15401, 50, 3, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1)), 4, 'main', null, null, 264
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1)), 23, 'sub', null, null, 39.7
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (211, 10000021, 'One Arrow to Rule Them All', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/a44c62d9da347f2ec9babed1ac5d2995.png', 'Fires 2 arrows per <color=#FFD780FF>Aimed Shot</color>. The second arrow deals 20% of the first arrow''s DMG.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000021 order by id limit 1), 211, false, false, '', false
      where exists (select 1 from constellations where id = 211 and character_id = 10000021)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (212, 10000021, 'Bunny Triggered', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/81b6ced3e3c6eab87850adc20a353237.png', 'Baron Bunny, new and improved! Hitting Baron Bunny''s foot with a fully-charged Aimed Shot manually detonates it.\nExplosion via manual detonation deals 200% additional DMG.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000021 order by id limit 1), 212, false, false, '', false
      where exists (select 1 from constellations where id = 212 and character_id = 10000021)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (213, 10000021, 'It Burns!', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4ec2f3fe7a6ec0e23005171196e4d43c.png', 'Increases the Level of <color=#FFD780FF>Fiery Rain</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000021 order by id limit 1), 213, false, false, '', false
      where exists (select 1 from constellations where id = 213 and character_id = 10000021)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (214, 10000021, 'It''s Not Just Any Doll...', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/47f20b75460be3878da37b3895b43d93.png', 'Decreases <color=#FFD780FF>Explosive Puppet</color>''s CD by 20%. Adds 1 additional charge.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000021 order by id limit 1), 214, false, false, '', false
      where exists (select 1 from constellations where id = 214 and character_id = 10000021)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (215, 10000021, 'It''s Baron Bunny!', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/c867dae15b997b2e78e099b2ac49f711.png', 'Increases the Level of <color=#FFD780FF>Explosive Puppet</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000021 order by id limit 1), 215, false, false, '', false
      where exists (select 1 from constellations where id = 215 and character_id = 10000021)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (216, 10000021, 'Wildfire', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/789893c22e7949ec8b23872f886e4276.png', '<color=#FFD780FF>Fiery Rain</color> increases all party members'' Movement SPD by 15% and ATK by 15% for 10s.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000021 order by id limit 1), 216, false, false, '', false
      where exists (select 1 from constellations where id = 216 and character_id = 10000021)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10041, 10000021, 'Sharpshooter', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/cc29fde34aa6d42f8e110628a4bf2de2.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 consecutive shots with a bow.\n\n<color=#FFD780FF>Charged Attack</color>\nPerforms a more precise <color=#FFD780FF>Aimed Shot</color> with increased DMG.\nWhile aiming, flames will accumulate on the arrowhead. A fully charged flaming arrow will deal <color=#FF9999FF>Pyro DMG</color>.\n\n<color=#FFD780FF>Plunging Attack</color>\nFires off a shower of arrows in mid-air before falling and striking the ground, dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10041, '1-Hit DMG', '36.1%', 1
        where exists (select 1 from skills where id = 10041 and character_id = 10000021) and not exists (select 1 from skill_affixes where skill_id = 10041 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10041, '2-Hit DMG', '36.1%', 2
        where exists (select 1 from skills where id = 10041 and character_id = 10000021) and not exists (select 1 from skill_affixes where skill_id = 10041 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10041, '3-Hit DMG', '46.4%', 3
        where exists (select 1 from skills where id = 10041 and character_id = 10000021) and not exists (select 1 from skill_affixes where skill_id = 10041 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10041, '4-Hit DMG', '47.3%', 4
        where exists (select 1 from skills where id = 10041 and character_id = 10000021) and not exists (select 1 from skill_affixes where skill_id = 10041 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10041, '5-Hit DMG', '59.3%', 5
        where exists (select 1 from skills where id = 10041 and character_id = 10000021) and not exists (select 1 from skill_affixes where skill_id = 10041 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10041, 'Aimed Shot', '43.9%', 6
        where exists (select 1 from skills where id = 10041 and character_id = 10000021) and not exists (select 1 from skill_affixes where skill_id = 10041 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10041, 'Fully-Charged Aimed Shot', '124%', 7
        where exists (select 1 from skills where id = 10041 and character_id = 10000021) and not exists (select 1 from skill_affixes where skill_id = 10041 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10041, 'Plunge DMG', '56.8%', 8
        where exists (select 1 from skills where id = 10041 and character_id = 10000021) and not exists (select 1 from skill_affixes where skill_id = 10041 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10041, 'Low/High Plunge DMG', '114%/142%', 9
        where exists (select 1 from skills where id = 10041 and character_id = 10000021) and not exists (select 1 from skill_affixes where skill_id = 10041 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000021 order by id limit 1), 10041, 1, true, false, '', false
      where exists (select 1 from skills where id = 10041 and character_id = 10000021)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10032, 10000021, 'Explosive Puppet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/6e5367354b4107ce31660b5a4b0e78ed.png', 1, 'The ever-reliable Baron Bunny takes the stage.\n\n<color=#FFD780FF>Baron Bunny</color>\n·Continuously taunts the enemy, drawing their fire.\n·Baron Bunny''s HP scales with Amber''s Max HP.\n·When destroyed or when its timer expires, Baron Bunny explodes, dealing <color=#FF9999FF>AoE Pyro DMG</color>.\n\n<color=#FFD780FF>Hold</color>\nAdjusts the throwing direction of Baron Bunny.\nThe longer the button is held, the further the throw.\n\n<i>Baron Bunny hails from a storied lineage, but Amber has stopped keeping count since Baron Bunny the 893rd.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10032, 'Inherited HP', '41.4%', 1
        where exists (select 1 from skills where id = 10032 and character_id = 10000021) and not exists (select 1 from skill_affixes where skill_id = 10032 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10032, 'Explosion DMG', '123%', 2
        where exists (select 1 from skills where id = 10032 and character_id = 10000021) and not exists (select 1 from skill_affixes where skill_id = 10032 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10032, 'CD', '15.0s', 3
        where exists (select 1 from skills where id = 10032 and character_id = 10000021) and not exists (select 1 from skill_affixes where skill_id = 10032 and position = 3);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000021 order by id limit 1), 10032, 1, true, false, '', false
      where exists (select 1 from skills where id = 10032 and character_id = 10000021)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10017, 10000021, 'Fiery Rain', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/643f31ce91e992ecc9bcc119387e8f8d.png', 1, 'Fires off a shower of arrows, dealing continuous <color=#FF9999FF>AoE Pyro DMG</color>.\n\n<i>Amber''s passion truly burns hot.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10017, 'Fiery Rain DMG Per Wave', '28.1%', 1
        where exists (select 1 from skills where id = 10017 and character_id = 10000021) and not exists (select 1 from skill_affixes where skill_id = 10017 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10017, 'Total Fiery Rain DMG', '505%', 2
        where exists (select 1 from skills where id = 10017 and character_id = 10000021) and not exists (select 1 from skill_affixes where skill_id = 10017 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10017, 'Duration', '2.0s', 3
        where exists (select 1 from skills where id = 10017 and character_id = 10000021) and not exists (select 1 from skill_affixes where skill_id = 10017 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10017, 'CD', '12.0s', 4
        where exists (select 1 from skills where id = 10017 and character_id = 10000021) and not exists (select 1 from skill_affixes where skill_id = 10017 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10017, 'Energy Cost', '40', 5
        where exists (select 1 from skills where id = 10017 and character_id = 10000021) and not exists (select 1 from skill_affixes where skill_id = 10017 and position = 5);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000021 order by id limit 1), 10017, 1, true, false, '', false
      where exists (select 1 from skills where id = 10017 and character_id = 10000021)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (2121, 10000021, 'Every Arrow Finds Its Target', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/7b0f433f75b71eecff434ac28f78000a.png', 2, 'Increases the CRIT Rate of <color=#FFD780FF>Fiery Rain</color> by 10% and widens its AoE by 30%.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000021 order by id limit 1), 2121, 1, true, false, '', false
      where exists (select 1 from skills where id = 2121 and character_id = 10000021)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (2122, 10000021, 'Precise Shot', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/d6a3f774e3dc448d4eae1dd329a44c51.png', 2, 'Aimed Shot hits on weak points increase ATK by 15% for 10s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000021 order by id limit 1), 2122, 1, false, false, '', false
      where exists (select 1 from skills where id = 2122 and character_id = 10000021)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (2123, 10000021, 'Gliding Champion', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/c7efeccd9d374b3fa238a627d22bedbc.png', 2, 'Decreases gliding Stamina consumption for your own party members by 20%.\nNot stackable with Passive Talents that provide the exact same effects.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000021 order by id limit 1), 2123, 1, true, false, '', false
      where exists (select 1 from skills where id = 2123 and character_id = 10000021)
      on conflict do nothing;
insert into costumes (id, character_id, name, icon) values (202101, 10000021, '100% Outrider', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_2/5cd819e842b269fa260ae49243bf8440.png') on conflict do nothing;
insert into build_costumes (build_id, costume_id) values ((select id from character_builds where character_id = 10000021 order by id limit 1), 202101) on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 2000, 'selected', '3940', '2212', '6152')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 20, 'selected', '10.4%', null, '10.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 2001, 'selected', '331', '223', '554')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 22, 'selected', '76.1%', null, '76.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 2002, 'selected', '250', '33', '283')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 28, 'selected', '33', null, '33')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 40, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 23, 'selected', '169.0%', null, '169.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 2000, 'base', '3940', '2212', '6152')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 2001, 'base', '331', '223', '554')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 2002, 'base', '250', '33', '283')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 28, 'base', '33', null, '33')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 999999, 'base', '220', null, '220')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 20, 'extra', '10.4%', null, '10.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 22, 'extra', '76.1%', null, '76.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 23, 'extra', '169.0%', null, '169.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000021 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47443, 'Honor to Your Devotion', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/80425abeeb96bfefbfcb2b49cd5339db.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000021 order by id limit 1), 47443, 2150471, 1, 4, 4, 2, '1377', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 1), 28, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 1) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 1), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 1) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 1), 8, '15', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 1) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 1), 22, '5.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 1) and property_type_id = 22);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47423, 'Glory to Your Legacy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/f60c04735c5a36d349a2802b51e9b6fc.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000021 order by id limit 1), 47423, 2150471, 2, 4, 4, 5, '90', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 2), 2, '239', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 2), 3, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 2) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 2), 23, '4.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 2) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 2), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 2) and property_type_id = 8);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59352, 'Exile''s Pocket Watch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f9dd8d807eaa9ec5997b9c0e6f7cd48c.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000021 order by id limit 1), 59352, 2100091, 3, 3, 0, 6, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 3), 28, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 3) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 3), 2, '143', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 3) and property_type_id = 2);
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57412, 'Instructor''s Tea Cup', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/43b58997aabfaf68f64bde7bfee0c957.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000021 order by id limit 1), 57412, 2100071, 4, 4, 6, 6, '17.0%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 4), 20, '3.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 4) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 4), 2, '167', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 4) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 4), 22, '5.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 4) and property_type_id = 22);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59331, 'Exile''s Circlet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/22faf0f5c42ac3652ea2c4a1ca38ac05.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000021 order by id limit 1), 59331, 2100091, 5, 3, 4, 22, '14.9%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 5), 20, '2.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 5) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 5), 3, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000021 order by id limit 1) and position = 5) and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000021, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000021 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000021, 'goblet', 40
          where not exists (select 1 from character_relic_recommendations where character_id = 10000021 and slot = 'goblet' and property_type_id = 40);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000021, 'circlet', 22
          where not exists (select 1 from character_relic_recommendations where character_id = 10000021 and slot = 'circlet' and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000021, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000021 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000021, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000021 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000021, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000021 and property_type_id = 6);

-- Kaeya (10000015)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000015, 'Kaeya', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/699e3449/c1d2a8e0948af4942feb5d086500528b.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/bb950d15a14b528e4275f52486339ff8.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/2781c4fee00e263195f4c1f8cc7aa337.png', 'Cryo', 4, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000015, 40, 2, 0, false
    where not exists (select 1 from character_builds where character_id = 10000015);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11301, 'Cool Steel', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/78feee812f5df4c3a886d93a06092da1.png', 1, 'Sword', 3, 'A reliable steel-forged weapon that serves as a testament to the great adventures of its old master.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000015 order by id limit 1), 11301, 40, 1, 5)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1)), 4, 'main', null, null, 169
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1)), 6, 'sub', null, null, 19.7
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (151, 10000015, 'Excellent Blood', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/d09c7cca4b11dc1b205cf1f18879ad17.png', 'The CRIT Rate of Kaeya''s Normal and Charge Attacks against opponents affected by <color=#99FFFFFF>Cryo</color> is increased by 15%.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000015 order by id limit 1), 151, false, false, '', false
      where exists (select 1 from constellations where id = 151 and character_id = 10000015)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (152, 10000015, 'Never-Ending Performance', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/33381232d6bc69c58c424f70362b2df1.png', 'While <color=#FFD780FF>Glacial Waltz</color> is in effect, for each opponent defeated, its duration is increased by 2.5s, up to a maximum of 15s.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000015 order by id limit 1), 152, false, false, '', false
      where exists (select 1 from constellations where id = 152 and character_id = 10000015)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (153, 10000015, 'Dance of Frost', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/04d44bf6362cf691a678cb7f6789ae97.png', 'Increases the Level of <color=#FFD780FF>Frostgnaw</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000015 order by id limit 1), 153, false, false, '', false
      where exists (select 1 from constellations where id = 153 and character_id = 10000015)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (154, 10000015, 'Frozen Kiss', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/e9d007ace9586aa49b6198ef04922965.png', 'Triggers automatically when Kaeya''s HP falls below 20%:\nCreates a shield that absorbs damage equal to 30% of Kaeya''s Max HP. Lasts for 20s.\nThis shield absorbs <color=#99FFFFFF>Cryo DMG</color> with 250% efficiency.\nCan only occur once every 60s.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000015 order by id limit 1), 154, false, false, '', false
      where exists (select 1 from constellations where id = 154 and character_id = 10000015)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (155, 10000015, 'Frostbiting Embrace', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/0bc68bfcc5057f98b048ff5fa4c2a8db.png', 'Increases the Level of <color=#FFD780FF>Glacial Waltz</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000015 order by id limit 1), 155, false, false, '', false
      where exists (select 1 from constellations where id = 155 and character_id = 10000015)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (156, 10000015, 'Glacial Whirlwind', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/5ff88a788fe23d273fea7e1adcc4a66f.png', '<color=#FFD780FF>Glacial Waltz</color> will generate 1 additional icicle, and will regenerate 15 Energy when cast.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000015 order by id limit 1), 156, false, false, '', false
      where exists (select 1 from constellations where id = 156 and character_id = 10000015)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10073, 10000015, 'Ceremonial Bladework', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 rapid strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to unleash 2 rapid sword strikes.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10073, '1-Hit DMG', '53.8%', 1
        where exists (select 1 from skills where id = 10073 and character_id = 10000015) and not exists (select 1 from skill_affixes where skill_id = 10073 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10073, '2-Hit DMG', '51.7%', 2
        where exists (select 1 from skills where id = 10073 and character_id = 10000015) and not exists (select 1 from skill_affixes where skill_id = 10073 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10073, '3-Hit DMG', '65.3%', 3
        where exists (select 1 from skills where id = 10073 and character_id = 10000015) and not exists (select 1 from skill_affixes where skill_id = 10073 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10073, '4-Hit DMG', '70.9%', 4
        where exists (select 1 from skills where id = 10073 and character_id = 10000015) and not exists (select 1 from skill_affixes where skill_id = 10073 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10073, '5-Hit DMG', '88.2%', 5
        where exists (select 1 from skills where id = 10073 and character_id = 10000015) and not exists (select 1 from skill_affixes where skill_id = 10073 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10073, 'Charged Attack DMG', '55.0%+73.1%', 6
        where exists (select 1 from skills where id = 10073 and character_id = 10000015) and not exists (select 1 from skill_affixes where skill_id = 10073 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10073, 'Charged Attack Stamina Cost', '20.0', 7
        where exists (select 1 from skills where id = 10073 and character_id = 10000015) and not exists (select 1 from skill_affixes where skill_id = 10073 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10073, 'Plunge DMG', '63.9%', 8
        where exists (select 1 from skills where id = 10073 and character_id = 10000015) and not exists (select 1 from skill_affixes where skill_id = 10073 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10073, 'Low/High Plunge DMG', '128%/160%', 9
        where exists (select 1 from skills where id = 10073 and character_id = 10000015) and not exists (select 1 from skill_affixes where skill_id = 10073 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000015 order by id limit 1), 10073, 1, true, false, '', false
      where exists (select 1 from skills where id = 10073 and character_id = 10000015)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10074, 10000015, 'Frostgnaw', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/ac76bcfd2cd70131fc5f67c069880e47.png', 1, 'Unleashes a frigid blast, dealing <color=#99FFFFFF>Cryo DMG</color> to opponents in front of Kaeya.\n\n<i>Kaeya seems affable, but his nature is that of unyielding ice.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10074, 'Skill DMG', '191%', 1
        where exists (select 1 from skills where id = 10074 and character_id = 10000015) and not exists (select 1 from skill_affixes where skill_id = 10074 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10074, 'CD', '6.0s', 2
        where exists (select 1 from skills where id = 10074 and character_id = 10000015) and not exists (select 1 from skill_affixes where skill_id = 10074 and position = 2);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000015 order by id limit 1), 10074, 1, true, false, '', false
      where exists (select 1 from skills where id = 10074 and character_id = 10000015)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10075, 10000015, 'Glacial Waltz', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/7a584f34c06bda58b785683c09463831.png', 1, 'Coalescing the frost in the air, Kaeya summons 3 icicles that revolve around him.\nThese icicles will follow the character around and deal <color=#99FFFFFF>Cryo DMG</color> to opponents in their path for the ability''s duration.\n\n<i>A winsome smile, genial words, and the merciless hoarfrost that lies beneath... These are all Kaeya''s weapons.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10075, 'Skill DMG', '77.6%', 1
        where exists (select 1 from skills where id = 10075 and character_id = 10000015) and not exists (select 1 from skill_affixes where skill_id = 10075 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10075, 'CD', '15.0s', 2
        where exists (select 1 from skills where id = 10075 and character_id = 10000015) and not exists (select 1 from skill_affixes where skill_id = 10075 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10075, 'Duration', '8.0s', 3
        where exists (select 1 from skills where id = 10075 and character_id = 10000015) and not exists (select 1 from skill_affixes where skill_id = 10075 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10075, 'Energy Cost', '60', 4
        where exists (select 1 from skills where id = 10075 and character_id = 10000015) and not exists (select 1 from skill_affixes where skill_id = 10075 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000015 order by id limit 1), 10075, 1, true, false, '', false
      where exists (select 1 from skills where id = 10075 and character_id = 10000015)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (1521, 10000015, 'Cold-Blooded Strike', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/73d64999f7f49dd0c02b5c756066aa6b.png', 2, 'Every hit with <color=#FFD780FF>Frostgnaw</color> regenerates HP for Kaeya equal to 15% of his ATK.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000015 order by id limit 1), 1521, 1, true, false, '', false
      where exists (select 1 from skills where id = 1521 and character_id = 10000015)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (1522, 10000015, 'Glacial Heart', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/52607d38cf12f350061ce23a21c9ca08.png', 2, 'Opponents <color=#99FFFFFF>Frozen</color> by <color=#FFD780FF>Frostgnaw</color> will drop additional Elemental Particles.\nFrostgnaw may only produce a maximum of 2 additional Elemental Particles per use.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000015 order by id limit 1), 1522, 1, false, false, '', false
      where exists (select 1 from skills where id = 1522 and character_id = 10000015)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (1523, 10000015, 'Hidden Strength', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4b0da467386c10aedf3192192dc85d0f.png', 2, 'Decreases sprinting Stamina consumption for your own party members by 20%.\nNot stackable with Passive Talents that provide the exact same effects.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000015 order by id limit 1), 1523, 1, true, false, '', false
      where exists (select 1 from skills where id = 1523 and character_id = 10000015)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 2000, 'selected', '4846', '1430', '6276')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 20, 'selected', '7.3%', null, '7.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 2001, 'selected', '262', '101', '363')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 22, 'selected', '58.4%', null, '58.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 2002, 'selected', '330', '58', '387')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 28, 'selected', '33', null, '33')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 46, 'selected', '5.2%', null, '5.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 23, 'selected', '120.0%', null, '120.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 2000, 'base', '4846', '1430', '6276')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 2001, 'base', '262', '101', '363')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 2002, 'base', '330', '58', '387')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 28, 'base', '33', null, '33')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 999999, 'base', '220', null, '220')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 20, 'extra', '7.3%', null, '7.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 22, 'extra', '58.4%', null, '58.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 23, 'extra', '120.0%', null, '120.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 46, 'element', '5.2%', null, '5.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000015 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59341, 'Exile''s Flower', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/e8e8c17bd07ea125961b9d2d6f03b1ba.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000015 order by id limit 1), 59341, 2100091, 1, 3, 0, 2, '430', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1) and position = 1), 6, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1) and position = 1) and property_type_id = 6);
insert into relic_sets (id, name) values (2100101, 'Adventurer') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100101, 2, 'Max HP increased by 1,000.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100101 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100101, 4, 'Opening a chest regenerates 30% Max HP over 5s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100101 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (60321, 'Adventurer''s Tail Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/260c4f71afac2b8d0b57e447687f20ab.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000015 order by id limit 1), 60321, 2100101, 2, 3, 0, 5, '28', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1) and position = 2), 20, '2.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1) and position = 2) and property_type_id = 20);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59452, 'Exile''s Pocket Watch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f9dd8d807eaa9ec5997b9c0e6f7cd48c.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000015 order by id limit 1), 59452, 2100091, 3, 4, 0, 9, '7.9%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1) and position = 3), 28, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1) and position = 3) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1) and position = 3), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1) and position = 3) and property_type_id = 8);
insert into relic_sets (id, name) values (2100101, 'Adventurer') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100101, 2, 'Max HP increased by 1,000.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100101 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100101, 4, 'Opening a chest regenerates 30% Max HP over 5s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100101 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (60311, 'Adventurer''s Golden Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f10753b76fb044aca89b5673aa550f73.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000015 order by id limit 1), 60311, 2100101, 4, 3, 0, 46, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1) and position = 4), 28, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1) and position = 4) and property_type_id = 28);
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57432, 'Instructor''s Cap', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/13dc11a5b26e2890847a8f86e07061a7.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000015 order by id limit 1), 57432, 2100071, 5, 4, 0, 22, '8.4%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1) and position = 5), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1) and position = 5), 6, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000015 order by id limit 1) and position = 5) and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000015, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000015 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000015, 'goblet', 46
          where not exists (select 1 from character_relic_recommendations where character_id = 10000015 and slot = 'goblet' and property_type_id = 46);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000015, 'circlet', 22
          where not exists (select 1 from character_relic_recommendations where character_id = 10000015 and slot = 'circlet' and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000015, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000015 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000015, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000015 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000015, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000015 and property_type_id = 6);

-- Barbara (10000014)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000014, 'Barbara', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f55430aba2d84b36d64136958c58c93a.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/936c9bf53f1888bd930c43e33a9dc041.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/a3c31e121de86652d1ff2cfd717b60fd.png', 'Hydro', 4, 10)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000014, 40, 1, 0, false
    where not exists (select 1 from character_builds where character_id = 10000014);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (14302, 'Thrilling Tales of Dragon Slayers', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/aff08755a2149ffb6c0fa7d1d189a222.png', 10, 'Catalyst', 3, 'A fictional story of a band of five heroes who go off on a dragon hunt. It is poorly written and structurally incoherent. Its value lies in the many lessons that can be learned from failure.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000014 order by id limit 1), 14302, 1, 0, 5)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1)), 4, 'main', null, null, 39
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1)), 3, 'sub', null, null, 7.7
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (141, 10000014, 'Gleeful Songs', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/869158625ba5f46940c74bbe1b7059ca.png', 'Barbara regenerates 1 Energy every 10s.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000014 order by id limit 1), 141, false, false, '', false
      where exists (select 1 from constellations where id = 141 and character_id = 10000014)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (142, 10000014, 'Vitality Burst', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/ac87cb25a33da66084a3fed671df6fd5.png', 'Decreases the CD of <color=#FFD780FF>Let the Show Begin♪</color> by 15%.\nDuring the ability''s duration, your active character gains a 15% <color=#80C0FFFF>Hydro DMG Bonus</color>.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000014 order by id limit 1), 142, false, false, '', false
      where exists (select 1 from constellations where id = 142 and character_id = 10000014)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (143, 10000014, 'Star of Tomorrow', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/2b0667cf5d56bfc1cf20faa83daac4b3.png', 'Increases the Level of <color=#FFD780FF>Shining Miracle♪</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000014 order by id limit 1), 143, false, false, '', false
      where exists (select 1 from constellations where id = 143 and character_id = 10000014)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (144, 10000014, 'Attentiveness Be My Power', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/cba2a275bbe83dcb89aee86276c6aab7.png', 'Every opponent Barbara hits with her Charged Attack regenerates 1 Energy for her.\nA maximum of 5 energy can be regenerated in this manner with any one Charged Attack.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000014 order by id limit 1), 144, false, false, '', false
      where exists (select 1 from constellations where id = 144 and character_id = 10000014)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (145, 10000014, 'The Purest Companionship', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/2438b4d337267fc69107d095e16c93a1.png', 'Increases the Level of <color=#FFD780FF>Let the Show Begin♪</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000014 order by id limit 1), 145, false, false, '', false
      where exists (select 1 from constellations where id = 145 and character_id = 10000014)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (146, 10000014, 'Dedicating Everything to You', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/de30124c3dba91905a4d9122144f9634.png', 'When Barbara is in the party but not on the field, and one of your own party members falls:\n·Automatically revives the fallen character.\n·Fully restores the revived character''s HP to 100%.\nThis effect can only occur once every 15 mins.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000014 order by id limit 1), 146, false, false, '', false
      where exists (select 1 from constellations where id = 146 and character_id = 10000014)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10070, 10000014, 'Whisper of Water', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/2c014e6053c4f0d032e1d1ff0c6de0e1.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 4 water splash attacks that deal <color=#80C0FFFF>Hydro DMG</color>.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to deal <color=#80C0FFFF>AoE Hydro DMG</color> after a short casting time.\n\n<color=#FFD780FF>Plunging Attack</color>\nGathering the might of Hydro, Barbara plunges towards the ground from mid-air, damaging all opponents in her path. Deals <color=#80C0FFFF>AoE Hydro DMG</color> upon impact with the ground.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10070, '1-Hit DMG', '37.8%', 1
        where exists (select 1 from skills where id = 10070 and character_id = 10000014) and not exists (select 1 from skill_affixes where skill_id = 10070 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10070, '2-Hit DMG', '35.5%', 2
        where exists (select 1 from skills where id = 10070 and character_id = 10000014) and not exists (select 1 from skill_affixes where skill_id = 10070 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10070, '3-Hit DMG', '41.0%', 3
        where exists (select 1 from skills where id = 10070 and character_id = 10000014) and not exists (select 1 from skill_affixes where skill_id = 10070 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10070, '4-Hit DMG', '55.2%', 4
        where exists (select 1 from skills where id = 10070 and character_id = 10000014) and not exists (select 1 from skill_affixes where skill_id = 10070 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10070, 'Charged Attack DMG', '166%', 5
        where exists (select 1 from skills where id = 10070 and character_id = 10000014) and not exists (select 1 from skill_affixes where skill_id = 10070 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10070, 'Charged Attack Stamina Cost', '50.0', 6
        where exists (select 1 from skills where id = 10070 and character_id = 10000014) and not exists (select 1 from skill_affixes where skill_id = 10070 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10070, 'Plunge DMG', '56.8%', 7
        where exists (select 1 from skills where id = 10070 and character_id = 10000014) and not exists (select 1 from skill_affixes where skill_id = 10070 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10070, 'Low/High Plunge DMG', '114%/142%', 8
        where exists (select 1 from skills where id = 10070 and character_id = 10000014) and not exists (select 1 from skill_affixes where skill_id = 10070 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000014 order by id limit 1), 10070, 1, true, false, '', false
      where exists (select 1 from skills where id = 10070 and character_id = 10000014)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10071, 10000014, 'Let the Show Begin♪', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/cca900442eebac2d4d116054556cddd0.png', 1, 'Summons water droplets resembling musical notes that form a Melody Loop, dealing <color=#80C0FFFF>Hydro DMG</color> to surrounding opponents and applying the <color=#80C0FFFF>Wet</color> status to them.\n\n<color=#FFD780FF>Melody Loop</color>\n·On hit, Barbara''s Normal Attacks heal your own party members and nearby teammates for a certain amount of HP, which scales with Barbara''s Max HP.\n·On hit, Barbara''s Charged Attack generates 4 times the amount of healing.\n·Periodically regenerates your own active character''s HP.\n·Applies the <color=#80C0FFFF>Wet</color> status to the character and to opponents who come in contact with them.\n\n<i>Barbara''s music is the magic that heals her companions.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10071, 'HP Regeneration Per Hit', '0.75% Max HP+72', 1
        where exists (select 1 from skills where id = 10071 and character_id = 10000014) and not exists (select 1 from skill_affixes where skill_id = 10071 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10071, 'Continuous Regeneration', '4.00% Max HP+385', 2
        where exists (select 1 from skills where id = 10071 and character_id = 10000014) and not exists (select 1 from skill_affixes where skill_id = 10071 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10071, 'Droplet DMG', '58.4%', 3
        where exists (select 1 from skills where id = 10071 and character_id = 10000014) and not exists (select 1 from skill_affixes where skill_id = 10071 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10071, 'Duration', '15.0s', 4
        where exists (select 1 from skills where id = 10071 and character_id = 10000014) and not exists (select 1 from skill_affixes where skill_id = 10071 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10071, 'CD', '32.0s', 5
        where exists (select 1 from skills where id = 10071 and character_id = 10000014) and not exists (select 1 from skill_affixes where skill_id = 10071 and position = 5);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000014 order by id limit 1), 10071, 1, true, false, '', false
      where exists (select 1 from skills where id = 10071 and character_id = 10000014)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10072, 10000014, 'Shining Miracle♪', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/ce7fc4efa6e7d8c618a01122ac23f37f.png', 1, 'Heals your own party members and nearby teammates for a large amount of HP that scales with Barbara''s Max HP.\n\n<i>Barbara''s desire to heal strengthens her will to fight and sing.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10072, 'Regeneration', '17.6% Max HP+1694', 1
        where exists (select 1 from skills where id = 10072 and character_id = 10000014) and not exists (select 1 from skill_affixes where skill_id = 10072 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10072, 'CD', '20.0s', 2
        where exists (select 1 from skills where id = 10072 and character_id = 10000014) and not exists (select 1 from skill_affixes where skill_id = 10072 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10072, 'Energy Cost', '80', 3
        where exists (select 1 from skills where id = 10072 and character_id = 10000014) and not exists (select 1 from skill_affixes where skill_id = 10072 and position = 3);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000014 order by id limit 1), 10072, 1, true, false, '', false
      where exists (select 1 from skills where id = 10072 and character_id = 10000014)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (1421, 10000014, 'Glorious Season', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/28191f1f23ab8ac28ed1998770f40eb3.png', 2, 'The Stamina Consumption of characters within <color=#FFD780FF>Let the Show Begin♪</color>''s Melody Loop is reduced by 12%.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000014 order by id limit 1), 1421, 1, true, false, '', false
      where exists (select 1 from skills where id = 1421 and character_id = 10000014)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (1422, 10000014, 'Encore', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/5b006ae78cb4fc585c7b8c638caf4aba.png', 2, 'When your active character gains an Elemental Orb/Particle, the duration of the Melody Loop of <color=#FFD780FF>Let the Show Begin♪</color> is extended by 1s.\nThe maximum extension is 5s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000014 order by id limit 1), 1422, 1, false, false, '', false
      where exists (select 1 from skills where id = 1422 and character_id = 10000014)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (1423, 10000014, 'With My Whole Heart♪', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/ed691c709fb3d07a56a9534dc48537ec.png', 2, 'When a Perfect Cooking is achieved on a dish with restorative effects, there is a 12% chance to obtain double the product.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000014 order by id limit 1), 1423, 1, true, false, '', false
      where exists (select 1 from skills where id = 1423 and character_id = 10000014)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 2000, 'selected', '4076', '1223', '5299')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 20, 'selected', '7.2%', null, '7.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 2001, 'selected', '105', '68', '173')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 22, 'selected', '56.2%', null, '56.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 2002, 'selected', '279', '52', '330')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 26, 'selected', '15.0%', null, '15.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 28, 'selected', '17', null, '17')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 42, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 23, 'selected', '100.0%', null, '100.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 2000, 'base', '4076', '1223', '5299')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 2001, 'base', '105', '68', '173')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 2002, 'base', '279', '52', '330')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 28, 'base', '17', null, '17')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 20, 'extra', '7.2%', null, '7.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 22, 'extra', '56.2%', null, '56.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 26, 'extra', '15.0%', null, '15.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 23, 'extra', '100.0%', null, '100.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000014 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2140041, 'Maiden Beloved') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2140041, 2, 'Character Healing Effectiveness +15%'
        where not exists (select 1 from relic_set_affixes where set_id = 2140041 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2140041, 4, 'Using an Elemental Skill or Burst increases healing received by all party members by 20% for 10s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2140041 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (74442, 'Maiden''s Distant Love', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/4c8a4c6d40add9e2437f556163501b83.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000014 order by id limit 1), 74442, 2140041, 1, 4, 0, 2, '645', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 1), 20, '2.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 1) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 1), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 1) and property_type_id = 5);
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57321, 'Instructor''s Feather Accessory', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/239b10d2e54e17572a34ac34156f91fa.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000014 order by id limit 1), 57321, 2100071, 2, 3, 0, 5, '28', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 2), 3, '2.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 2) and property_type_id = 3);
insert into relic_sets (id, name) values (2140041, 'Maiden Beloved') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2140041, 2, 'Character Healing Effectiveness +15%'
        where not exists (select 1 from relic_set_affixes where set_id = 2140041 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2140041, 4, 'Using an Elemental Skill or Burst increases healing received by all party members by 20% for 10s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2140041 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (74452, 'Maiden''s Passing Youth', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/b8dc97d9352fccfe769738e8d9877252.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000014 order by id limit 1), 74452, 2140041, 3, 4, 0, 9, '7.9%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 3), 5, '11', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 3) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 3), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 3) and property_type_id = 8);
insert into relic_sets (id, name) values (2140041, 'Maiden Beloved') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2140041, 2, 'Character Healing Effectiveness +15%'
        where not exists (select 1 from relic_set_affixes where set_id = 2140041 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2140041, 4, 'Using an Elemental Skill or Burst increases healing received by all party members by 20% for 10s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2140041 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (74412, 'Maiden''s Fleeting Leisure', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/979e1957d22f002ffa7d16d1659107d8.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000014 order by id limit 1), 74412, 2140041, 4, 4, 0, 6, '6.3%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 4), 22, '6.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 4) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 4), 28, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 4) and property_type_id = 28);
insert into relic_sets (id, name) values (2140041, 'Maiden Beloved') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2140041, 2, 'Character Healing Effectiveness +15%'
        where not exists (select 1 from relic_set_affixes where set_id = 2140041 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2140041, 4, 'Using an Elemental Skill or Burst increases healing received by all party members by 20% for 10s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2140041 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (74432, 'Maiden''s Fading Beauty', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/37fe25ed4ab1c52a54e0c26017b1cf54.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000014 order by id limit 1), 74432, 2140041, 5, 4, 0, 6, '6.3%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 5), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 5), 3, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000014 order by id limit 1) and position = 5) and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000014, 'sand', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000014 and slot = 'sand' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000014, 'goblet', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000014 and slot = 'goblet' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000014, 'circlet', 26
          where not exists (select 1 from character_relic_recommendations where character_id = 10000014 and slot = 'circlet' and property_type_id = 26);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000014, 3
        where not exists (select 1 from character_recommended_substats where character_id = 10000014 and property_type_id = 3);

commit;
