-- Part 6 of 13. Generated from app/data/character_detail.ts.
-- Insert-only and safe to re-run. Run the parts in order in the Supabase SQL editor.
begin;

-- Lisa (10000006)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000006, 'Lisa', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/415cb4af1a402f97aebfcf8edc2ca235.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/c57fd813ced89f1f01b5bc68ab78c53b.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/8120c3760d0ef7553024fc402d3d7a2f.png', 'Electro', 4, 10)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000006, 50, 3, 1, false
    where not exists (select 1 from character_builds where character_id = 10000006);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (14402, 'The Widsith', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/22d2b64c9fd0ab81ef934c8387f72d0c.png', 10, 'Catalyst', 4, 'A heavy notebook filled with musical scores. Though suffering from moth damage and heavy wear-and-tear, there is still much power to be found among the hand-written words within.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000006 order by id limit 1), 14402, 50, 2, 5)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1)), 4, 'main', null, null, 266
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1)), 22, 'sub', null, null, 35.7
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (41, 10000006, 'Infinite Circuit', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/5879369c4e579e11601e5f9f72ad5578.png', 'Lisa regenerates 2 Energy for every opponent hit while holding <color=#FFD780FF>Violet Arc</color>.\nA maximum of 10 Energy can be regenerated in this manner at any one time.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000006 order by id limit 1), 41, true, false, '', false
      where exists (select 1 from constellations where id = 41 and character_id = 10000006)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (42, 10000006, 'Electromagnetic Field', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/7eaab0737d5953b113ed65eff876fd6d.png', 'Holding <color=#FFD780FF>Violet Arc</color> has the following effects:\n·Increases DEF by 25%.\n·Increases Lisa''s resistance to interruption.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000006 order by id limit 1), 42, false, false, '', false
      where exists (select 1 from constellations where id = 42 and character_id = 10000006)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (43, 10000006, 'Resonant Thunder', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/fc2fcac374dbd3f8aa0aae7e676697b3.png', 'Increases the Level of <color=#FFD780FF>Lightning Rose</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000006 order by id limit 1), 43, false, false, '', false
      where exists (select 1 from constellations where id = 43 and character_id = 10000006)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (44, 10000006, 'Plasma Eruption', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/337b81fa0da3ecddb4afc5d530e288bd.png', '<color=#FFD780FF>Lightning Rose</color> now unleashes 1-3 lightning bolts when it attacks.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000006 order by id limit 1), 44, false, false, '', false
      where exists (select 1 from constellations where id = 44 and character_id = 10000006)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (45, 10000006, 'Electrocute', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/5368d06c9dc7706da8e94ffb4fb1b8ad.png', 'Increases the Level of <color=#FFD780FF>Violet Arc</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000006 order by id limit 1), 45, false, false, '', false
      where exists (select 1 from constellations where id = 45 and character_id = 10000006)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (46, 10000006, 'Pulsating Witch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/9182b2711fa14943b8a5f909d2a1cd17.png', 'When Lisa takes the field, she applies 3 stacks of <color=#FFD780FF>Violet Arc</color>''s Conductive status onto nearby opponents.\nThis effect can only occur once every 5s.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000006 order by id limit 1), 46, false, false, '', false
      where exists (select 1 from constellations where id = 46 and character_id = 10000006)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10060, 10000006, 'Lightning Touch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/2c014e6053c4f0d032e1d1ff0c6de0e1.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 4 lightning attacks that deal <color=#FFACFFFF>Electro DMG</color>.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to deal <color=#FFACFFFF>AoE Electro DMG</color> after a short casting time.\n\n<color=#FFD780FF>Plunging Attack</color>\nGathering the might of Electro, Lisa plunges towards the ground from mid-air, damaging all opponents in her path. Deals <color=#FFACFFFF>AoE Electro DMG</color> upon impact with the ground.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10060, '1-Hit DMG', '42.6%', 1
        where exists (select 1 from skills where id = 10060 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10060 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10060, '2-Hit DMG', '38.6%', 2
        where exists (select 1 from skills where id = 10060 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10060 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10060, '3-Hit DMG', '46.0%', 3
        where exists (select 1 from skills where id = 10060 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10060 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10060, '4-Hit DMG', '59.1%', 4
        where exists (select 1 from skills where id = 10060 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10060 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10060, 'Charged Attack DMG', '190%', 5
        where exists (select 1 from skills where id = 10060 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10060 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10060, 'Charged Attack Stamina Cost', '50.0', 6
        where exists (select 1 from skills where id = 10060 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10060 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10060, 'Plunge DMG', '61.5%', 7
        where exists (select 1 from skills where id = 10060 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10060 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10060, 'Low/High Plunge DMG', '123%/153%', 8
        where exists (select 1 from skills where id = 10060 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10060 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000006 order by id limit 1), 10060, 2, true, false, '', false
      where exists (select 1 from skills where id = 10060 and character_id = 10000006)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10061, 10000006, 'Violet Arc', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/d7c487c493d73c4fde0e82d9f63ec49a.png', 1, '#Channels the power of lightning to sweep bothersome matters away.\n\n<color=#FFD780FF>{LAYOUT_MOBILE#Tap}{LAYOUT_PC#Press}{LAYOUT_PS#Press}</color>\nReleases a homing Lightning Orb.\nOn hit, it deals <color=#FFACFFFF>Electro DMG</color> and applies a stack of the Conductive status (max 3 stacks) to opponents in a small AoE.\n\n<color=#FFD780FF>Hold</color>\nAfter an extended casting time, calls down lightning from the heavens, dealing massive <color=#FFACFFFF>Electro DMG</color> to all nearby opponents.\nDeals great amounts of extra damage to opponents based on the number of Conductive stacks applied to them, and clears their Conductive status.\n\n<i>Electro Purple is the raiment of the Witch of Purple Rose.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10061, '#{LAYOUT_MOBILE#Tapping}{LAYOUT_PC#Press}{LAYOUT_PS#Press} DMG', '86.0%', 1
        where exists (select 1 from skills where id = 10061 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10061 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10061, '#{LAYOUT_MOBILE#Tapping}{LAYOUT_PC#Press}{LAYOUT_PS#Press} CD', '1.0s', 2
        where exists (select 1 from skills where id = 10061 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10061 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10061, 'Non-Conductive Hold DMG', '344%', 3
        where exists (select 1 from skills where id = 10061 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10061 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10061, 'Stack 1 Conductive Hold DMG', '396%', 4
        where exists (select 1 from skills where id = 10061 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10061 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10061, 'Stack 2 Conductive Hold DMG', '456%', 5
        where exists (select 1 from skills where id = 10061 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10061 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10061, 'Stack 3 Conductive Hold DMG', '524%', 6
        where exists (select 1 from skills where id = 10061 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10061 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10061, 'Holding CD', '16.0s', 7
        where exists (select 1 from skills where id = 10061 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10061 and position = 7);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000006 order by id limit 1), 10061, 2, true, false, '', false
      where exists (select 1 from skills where id = 10061 and character_id = 10000006)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10062, 10000006, 'Lightning Rose', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/8f7661a460a08278ea8cfa114be3f65c.png', 1, 'Summons a Lightning Rose that unleashes powerful lightning bolts, launching surrounding opponents and dealing <color=#FFACFFFF>Electro DMG</color>.\nThe Lightning Rose will continuously emit lightning to knock back opponents and deal <color=#FFACFFFF>Electro DMG</color> throughout the ability''s duration.\n\n<i>This rose is beautiful, but beware its mortal thorns.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10062, 'Discharge DMG', '39.3%', 1
        where exists (select 1 from skills where id = 10062 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10062 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10062, 'Duration', '15.0s', 2
        where exists (select 1 from skills where id = 10062 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10062 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10062, 'CD', '20.0s', 3
        where exists (select 1 from skills where id = 10062 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10062 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10062, 'Energy Cost', '80', 4
        where exists (select 1 from skills where id = 10062 and character_id = 10000006) and not exists (select 1 from skill_affixes where skill_id = 10062 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000006 order by id limit 1), 10062, 2, true, false, '', false
      where exists (select 1 from skills where id = 10062 and character_id = 10000006)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (421, 10000006, 'Induced Aftershock', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/faae1309f051346372d78df97685d2e0.png', 2, 'Hits by Charged Attacks apply <color=#FFD780FF>Violet Arc</color>''s Conductive status to opponents.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000006 order by id limit 1), 421, 1, true, false, '', false
      where exists (select 1 from skills where id = 421 and character_id = 10000006)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (422, 10000006, 'Static Electricity Field', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/457090017007a1ee92be28370ab70c29.png', 2, 'Opponents hit by <color=#FFD780FF>Lightning Rose</color> have their DEF decreased by 15% for 10s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000006 order by id limit 1), 422, 1, false, false, '', false
      where exists (select 1 from skills where id = 422 and character_id = 10000006)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (423, 10000006, 'General Pharmaceutics', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/97fd86a4d4f2825046e43a2954d2df57.png', 2, 'When Lisa crafts a potion, she has a 20% chance to refund a portion of the crafting materials used.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000006 order by id limit 1), 423, 1, true, false, '', false
      where exists (select 1 from skills where id = 423 and character_id = 10000006)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 2000, 'selected', '5074', '2542', '7616')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 20, 'selected', '21.2%', null, '21.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 2001, 'selected', '389', '300', '688')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 22, 'selected', '96.9%', null, '96.9%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 2002, 'selected', '304', '68', '372')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 28, 'selected', '91', null, '91')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 41, 'selected', '22.8%', null, '22.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 23, 'selected', '120.0%', null, '120.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 2000, 'base', '5074', '2542', '7616')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 2001, 'base', '389', '300', '688')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 2002, 'base', '304', '68', '372')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 28, 'base', '91', null, '91')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 20, 'extra', '21.2%', null, '21.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 22, 'extra', '96.9%', null, '96.9%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 23, 'extra', '120.0%', null, '120.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 41, 'element', '22.8%', null, '22.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000006 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
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
      values ((select id from character_builds where character_id = 10000006 order by id limit 1), 59442, 2100091, 1, 4, 4, 2, '1377', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 1), 20, '2.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 1) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 1), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 1) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 1), 22, '5.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 1) and property_type_id = 22);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47523, 'Glory to Your Legacy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/f60c04735c5a36d349a2802b51e9b6fc.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000006 order by id limit 1), 47523, 2150471, 2, 5, 0, 5, '47', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 2), 2, '269', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 2), 28, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 2) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 2), 6, '5.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 2) and property_type_id = 6);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59452, 'Exile''s Pocket Watch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f9dd8d807eaa9ec5997b9c0e6f7cd48c.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000006 order by id limit 1), 59452, 2100091, 3, 4, 13, 6, '29.5%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 3), 28, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 3) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 3), 2, '478', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 3) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 3), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 3) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 3), 22, '5.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 3) and property_type_id = 22);
insert into relic_sets (id, name) values (2150311, 'Marechaussee Hunter') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150311, 2, 'Normal and Charged Attack DMG +15%'
        where not exists (select 1 from relic_set_affixes where set_id = 2150311 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150311, 4, 'When current HP increases or decreases, CRIT Rate will be increased by 12% for 5s. Max 3 stacks.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150311 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (31513, 'Forgotten Vessel', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/9b8f2f78608d37db8a0a9ec7d7d10c6e.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000006 order by id limit 1), 31513, 2150311, 4, 5, 8, 41, '22.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 4), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 4) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 4), 2, '418', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 4) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 4), 28, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 4) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 4), 6, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 4) and property_type_id = 6);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47432, 'Testament to Your Faith', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/11eeed27d2d7fbb0ab34f03c87325688.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000006 order by id limit 1), 47432, 2150471, 5, 4, 8, 20, '13.7%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 5), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 5), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 5) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 5), 28, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 5) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 5), 9, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000006 order by id limit 1) and position = 5) and property_type_id = 9);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000006, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000006 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000006, 'goblet', 41
          where not exists (select 1 from character_relic_recommendations where character_id = 10000006 and slot = 'goblet' and property_type_id = 41);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000006, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 10000006 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000006, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000006 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000006, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000006 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000006, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000006 and property_type_id = 6);

-- Dehya (10000079)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000079, 'Dehya', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/e7beb9e36337d7f64139ee0c97d1a93a.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/c700870019c97c84e640ea51387f2b19.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/62f2e8efde668b7e5faa0fb1dc173ae6.png', 'Pyro', 5, 11)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000079, 40, 3, 0, false
    where not exists (select 1 from character_builds where character_id = 10000079);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (12402, 'The Bell', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/d7f9ca521e414f63dfe24876b91cc139.png', 11, 'Claymore', 4, 'A heavy greatsword. A clock is embedded within it, though its internal mechanisms have long been damaged.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000079 order by id limit 1), 12402, 40, 1, 2)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1)), 4, 'main', null, null, 205
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1)), 3, 'sub', null, null, 23.2
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (791, 10000079, 'The Flame Incandescent', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/dd95faf27ffff198b05b2814ffe9ba05.png', 'Dehya''s Max HP is increased by 20%, and she deals bonus DMG based on her Max HP when using the following attacks:\n·<color=#FFD780FF>Molten Inferno</color>''s DMG will be increased by 3.6% of her Max HP.\n·<color=#FFD780FF>Leonine Bite</color>''s DMG will be increased by 6% of her Max HP.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000079 order by id limit 1), 791, false, false, '', false
      where exists (select 1 from constellations where id = 791 and character_id = 10000079)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (792, 10000079, 'The Sand-Blades Glittering', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/2744d0c1a5bc18df7f5f2d5755f715f6.png', 'When Dehya uses <color=#FFD780FF>Molten Inferno: Ranging Flame</color>, the duration of the recreated Fiery Sanctum field will be increased by 6s.\nAdditionally, when a Fiery Sanctum exists on the field, DMG dealt by its next coordinated attack will be increased by 50% when active character(s) within the Fiery Sanctum field are attacked.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000079 order by id limit 1), 792, false, false, '', false
      where exists (select 1 from constellations where id = 792 and character_id = 10000079)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (793, 10000079, 'A Rage Swift as Fire', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/abbb6d6541cf5ba522405c1e39641e48.png', 'Increases the Level of <color=#FFD780FF>Leonine Bite</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000079 order by id limit 1), 793, false, false, '', false
      where exists (select 1 from constellations where id = 793 and character_id = 10000079)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (794, 10000079, 'An Oath Abiding', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/9936367e859b473fe6182896260864a9.png', 'When Flame-Mane''s Fist and Incineration Drive attacks unleashed during <color=#FFD780FF>Leonine Bite</color> hit opponents, they will restore 1.5 Energy for Dehya and 2.5% of her Max HP. This effect can be triggered once every 0.2s.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000079 order by id limit 1), 794, false, false, '', false
      where exists (select 1 from constellations where id = 794 and character_id = 10000079)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (795, 10000079, 'The Alpha Unleashed', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/7a2903833a441306e58feb53af0cf843.png', 'Increases the Level of <color=#FFD780FF>Molten Inferno</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000079 order by id limit 1), 795, false, false, '', false
      where exists (select 1 from constellations where id = 795 and character_id = 10000079)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (796, 10000079, 'The Burning Claws Cleaving', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/d961e431f07d47ece8724f241eac6365.png', 'The CRIT Rate of <color=#FFD780FF>Leonine Bite</color> is increased by 10%.\nAdditionally, after a Flame-Mane''s Fist attack hits an opponent and deals CRIT Hits during a single Blazing Lioness state, it will cause the CRIT DMG of Leonine Bite to increase by 15% for the rest of Blazing Lioness''s duration and extend that duration by 0.5s. This effect can be triggered every 0.2s. The duration can be extended for a maximum of 2s and CRIT DMG can be increased by a maximum of 60% this way.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000079 order by id limit 1), 796, false, false, '', false
      where exists (select 1 from constellations where id = 796 and character_id = 10000079)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10791, 10000079, 'Sandstorm Assault', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/bf0237fba9d4ab5b47ea86b90711a765.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 4 consecutive strikes using her Claymore and her martial arts.\n\n<color=#FFD780FF>Charged Attack</color>\nDrains Stamina over time to perform continuous slashes.\nAt the end of the sequence, performs a more powerful slash.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10791, '1-Hit DMG', '62.1%', 1
        where exists (select 1 from skills where id = 10791 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10791 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10791, '2-Hit DMG', '61.7%', 2
        where exists (select 1 from skills where id = 10791 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10791 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10791, '3-Hit DMG', '76.6%', 3
        where exists (select 1 from skills where id = 10791 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10791 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10791, '4-Hit DMG', '95.3%', 4
        where exists (select 1 from skills where id = 10791 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10791 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10791, 'Charged Attack Cyclic DMG', '56.3%', 5
        where exists (select 1 from skills where id = 10791 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10791 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10791, 'Charged Attack Final DMG', '102%', 6
        where exists (select 1 from skills where id = 10791 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10791 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10791, 'Charged Attack Stamina Cost', '40.0/s', 7
        where exists (select 1 from skills where id = 10791 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10791 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10791, 'Max Duration', '5.0s', 8
        where exists (select 1 from skills where id = 10791 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10791 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10791, 'Plunge DMG', '74.6%', 9
        where exists (select 1 from skills where id = 10791 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10791 and position = 9);
insert into skill_affixes (skill_id, name, value, position)
        select 10791, 'Low/High Plunge DMG', '149%/186%', 10
        where exists (select 1 from skills where id = 10791 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10791 and position = 10);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000079 order by id limit 1), 10791, 1, true, false, '', false
      where exists (select 1 from skills where id = 10791 and character_id = 10000079)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10792, 10000079, 'Molten Inferno', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/5030a344d77778ac238b60aa7f6f1a3d.png', 1, 'This art of Dehya''s own invention changes its method of use depending on the combat situation.\n\n<color=#FFD780FF>Indomitable Flame</color>\nThis skill will be unleashed should there be no Fiery Sanctum field created by Dehya herself present at the time.\nDeals <color=#FF9999FF>AoE Pyro DMG</color>, and creates a field known as Fiery Sanctum.\n\n<color=#FFD780FF>Ranging Flame</color>\nThis skill will be unleashed should a Fiery Sanctum field created by Dehya herself already exist.\nDehya will perform a leaping attack, dealing <color=#FF9999FF>AoE Pyro DMG</color> before recreating a Fiery Sanctum field at her new position.\nA Fiery Sanctum field created this way will inherit the remaining duration of the previous field.\n\nRanging Flame can be used only once throughout a single Fiery Sanctum field''s duration.\n\n<color=#FFD780FF>Fiery Sanctum</color>\nWhen an opponent within a Fiery Sanctum field takes DMG, the field will unleash a coordinated attack, dealing <color=#FF9999FF>AoE Pyro DMG</color> to them based on Dehya''s ATK and Max HP. This effect can be triggered once every 2.5s.\nActive characters within this field have their resistance to interruption increased, and when such characters take DMG, a portion of that damage will be mitigated and flow into Redmane''s Blood. Dehya will then take this DMG over 10s. When the mitigated DMG stored by Redmane''s Blood reaches or goes over a certain percentage of Dehya''s Max HP, she will stop mitigating DMG in this way.\n\nOnly 1 Fiery Sanctum created by Dehya herself can exist at the same time.\n\n<i>Walk this fiery ordeal with me and purge all impurity, just as a beast of flames that must descend from the blaze.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10792, 'Indomitable Flame DMG', '112.9%', 1
        where exists (select 1 from skills where id = 10792 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10792 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10792, 'Ranging Flame DMG', '132.8%', 2
        where exists (select 1 from skills where id = 10792 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10792 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10792, 'Field DMG', '60.2% ATK+1.03% Max HP', 3
        where exists (select 1 from skills where id = 10792 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10792 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10792, 'Mitigation', '32%', 4
        where exists (select 1 from skills where id = 10792 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10792 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10792, 'Redmane''s Blood Maximum', '200% Max HP', 5
        where exists (select 1 from skills where id = 10792 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10792 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10792, 'Field Duration', '12.0s', 6
        where exists (select 1 from skills where id = 10792 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10792 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10792, 'CD', '20.0s', 7
        where exists (select 1 from skills where id = 10792 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10792 and position = 7);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000079 order by id limit 1), 10792, 1, true, false, '', false
      where exists (select 1 from skills where id = 10792 and character_id = 10000079)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10795, 10000079, 'Leonine Bite', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/d63dddeba415335c4a721cf671fa75cd.png', 1, 'Unleashing her burning anger and casting her inconvenient blade aside, Dehya enters the Blazing Lioness state and increases her resistance to interruption.\nIn this state, Dehya will automatically and continuously unleash the Flame-Mane''s Fists, dealing <color=#FF9999FF>Pyro DMG</color> based on her ATK and Max HP, and when its duration ends, she will unleash an Incineration Drive, dealing <color=#FF9999FF>AoE Pyro DMG</color> based on her ATK and Max HP.\nIf a Fiery Sanctum field created by Dehya''s own Elemental Skill "Molten Inferno" exists when this ability is unleashed, Dehya will retrieve it, and then create another field once Blazing Lioness''s duration expires. This field will take on the retrieved field''s duration at the moment of its retrieval.\nIn this state, Dehya will be unable to cast her Elemental Skill, or perform Normal, Charged, and Plunging Attacks. "Normal Attack: Sandstorm Assault" and Elemental Skill "Molten Inferno" will be replaced by "Roaring Barrage."\n\n<color=#FFD780FF>Roaring Barrage</color>\nUnleashing Roaring Barrage within 0.4s after each Flame-Mane''s Fist strike will increase the speed at which the next Flame-Mane''s Fist strike will be triggered.\n\n<i>Even the flowing flames must obey her rage and at her command become her fangs and claws.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10795, 'Flame-Mane''s Fist DMG', '98.7% ATK+1.69% Max HP', 1
        where exists (select 1 from skills where id = 10795 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10795 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10795, 'Incineration Drive DMG', '139.3% ATK+2.39% Max HP', 2
        where exists (select 1 from skills where id = 10795 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10795 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10795, 'Duration', '4.0s', 3
        where exists (select 1 from skills where id = 10795 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10795 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10795, 'CD', '18.0s', 4
        where exists (select 1 from skills where id = 10795 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10795 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10795, 'Energy Cost', '70', 5
        where exists (select 1 from skills where id = 10795 and character_id = 10000079) and not exists (select 1 from skill_affixes where skill_id = 10795 and position = 5);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000079 order by id limit 1), 10795, 1, true, false, '', false
      where exists (select 1 from skills where id = 10795 and character_id = 10000079)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (7921, 10000079, 'Unstinting Succor', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/edbc0de245c3f985a4abe073ae19688a.png', 2, 'Within 6 seconds after Dehya retrieves the Fiery Sanctum field through <color=#FFD780FF>Molten Inferno: Ranging Flame</color> or <color=#FFD780FF>Leonine Bite</color>, she will take 60% less DMG when receiving DMG from Redmane''s Blood. This effect can be triggered once every 2s.\nAdditionally, within 9s after Dehya unleashes <color=#FFD780FF>Molten Inferno: Indomitable Flame</color>, she will grant all party members the Gold-Forged Form state. This state will further increase a character''s resistance to interruption when they are within the Fiery Sanctum field. Gold-Forged Form can be activated once every 18s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000079 order by id limit 1), 7921, 1, true, false, '', false
      where exists (select 1 from skills where id = 7921 and character_id = 10000079)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (7922, 10000079, 'Stalwart and True', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4c0807213ed48cc0f3a1ec34d9a83a81.png', 2, 'When her HP is less than 40%, Dehya will recover 20% of her Max HP and will restore 6% of her Max HP every 2s for the next 10s. This effect can be triggered once every 20s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000079 order by id limit 1), 7922, 1, false, false, '', false
      where exists (select 1 from skills where id = 7922 and character_id = 10000079)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (7923, 10000079, 'The Sunlit Way', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4f3d88c7be322e43f55f65d10483b6c7.png', 2, 'During the day (06:00 – 18:00), your party members gain the Swift Stride effect: Movement SPD increased by 10%.\nDoes not take effect in Domains, Trounce Domains, or Spiral Abyss. Swift Stride does not stack.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000079 order by id limit 1), 7923, 1, true, false, '', false
      where exists (select 1 from skills where id = 7923 and character_id = 10000079)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 2000, 'selected', '7045', '5192', '12237')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 20, 'selected', '20.5%', null, '20.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 2001, 'selected', '324', '60', '384')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 22, 'selected', '58.7%', null, '58.7%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 2002, 'selected', '282', '40', '323')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 28, 'selected', '13', null, '13')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 40, 'selected', '5.2%', null, '5.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 23, 'selected', '127.8%', null, '127.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 2000, 'base', '7045', '5192', '12237')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 2001, 'base', '324', '60', '384')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 2002, 'base', '282', '40', '323')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 28, 'base', '13', null, '13')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 20, 'extra', '20.5%', null, '20.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 22, 'extra', '58.7%', null, '58.7%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 23, 'extra', '127.8%', null, '127.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 40, 'element', '5.2%', null, '5.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000079 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150011, 'Gladiator''s Finale') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 4, 'If the wielder of this artifact set uses a Sword, Claymore or Polearm, increases their Normal Attack DMG by 35%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (75443, 'Gladiator''s Nostalgia', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f5a1fb5232b2985617002eac1bfea8e6.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000079 order by id limit 1), 75443, 2150011, 1, 4, 8, 2, '2108', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 1), 28, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 1) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 1), 6, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 1) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 1), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 1) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 1), 22, '8.7%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 1) and property_type_id = 22);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55321, 'Berserker''s Indigo Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/92d2a9153a2f03e1249c17f8530a2aa3.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000079 order by id limit 1), 55321, 2100051, 2, 3, 0, 5, '28', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 2), 6, '2.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 2) and property_type_id = 6);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55452, 'Berserker''s Timepiece', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/72514ea9341bf0db03079d0c02ef78b2.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000079 order by id limit 1), 55452, 2100051, 3, 4, 4, 3, '13.4%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 3), 8, '15', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 3) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 3), 23, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 3) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 3), 5, '12', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 3) and property_type_id = 5);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59311, 'Exile''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7847bfdeab60c072ec09b17462505cdc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000079 order by id limit 1), 59311, 2100091, 4, 3, 0, 40, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 4), 23, '3.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 4) and property_type_id = 23);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59331, 'Exile''s Circlet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/22faf0f5c42ac3652ea2c4a1ca38ac05.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000079 order by id limit 1), 59331, 2100091, 5, 3, 0, 20, '3.5%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 5), 8, '9', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000079 order by id limit 1) and position = 5) and property_type_id = 8);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000079, 'sand', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000079 and slot = 'sand' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000079, 'goblet', 40
          where not exists (select 1 from character_relic_recommendations where character_id = 10000079 and slot = 'goblet' and property_type_id = 40);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000079, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 10000079 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000079, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000079 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000079, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000079 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000079, 3
        where not exists (select 1 from character_recommended_substats where character_id = 10000079 and property_type_id = 3);

-- Candace (10000072)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000072, 'Candace', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/9ef120c399afbf7f136034b68d721d44.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/382344dc8c318305283031611f53412c.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/7e050106377d0f3946fe28b681dc5da4.png', 'Hydro', 4, 13)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000072, 40, 1, 3, false
    where not exists (select 1 from character_builds where character_id = 10000072);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (13407, 'Favonius Lance', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7db45b7a84bb80468aaf0f5f430e9bdc.png', 13, 'Polearm', 4, 'A polearm made in the style of the Knights of Favonius. Its shaft is straight, and its tip flows lightly like the wind.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000072 order by id limit 1), 13407, 40, 2, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1)), 4, 'main', null, null, 252
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1)), 23, 'sub', null, null, 17.2
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (721, 10000072, 'Returning Heiress of the Scarlet Sands', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/285cf782d44f2b01dfd8847259b1da98.png', 'The duration of Prayer of the Crimson Crown effect triggered by <color=#FFD780FF>Sacred Rite: Wagtail''s Tide</color> is increased by 3s.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000072 order by id limit 1), 721, true, false, '', false
      where exists (select 1 from constellations where id = 721 and character_id = 10000072)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (722, 10000072, 'Moon-Piercing Brilliance', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/7ac23018fb58b20e681288d3412f325d.png', 'When <color=#FFD780FF>Sacred Rite: Heron''s Sanctum</color> hits opponents, Candace''s Max HP will be increased by 20% for 15s.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000072 order by id limit 1), 722, true, false, '', false
      where exists (select 1 from constellations where id = 722 and character_id = 10000072)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (723, 10000072, 'Hunter''s Supplication', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/f09001c7ed80c2ffb5bde18d2ab24d15.png', 'Increases the Level of <color=#FFD780FF>Sacred Rite: Wagtail''s Tide</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000072 order by id limit 1), 723, true, false, '', false
      where exists (select 1 from constellations where id = 723 and character_id = 10000072)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (724, 10000072, 'Sentinel Oath', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4a9b47d809b6b9b2a56f48d5a618134f.png', 'Shortens the Hold CD of <color=#FFD780FF>Sacred Rite: Heron''s Sanctum</color> to be the same as that of the Tapping CD.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000072 order by id limit 1), 724, false, false, '', false
      where exists (select 1 from constellations where id = 724 and character_id = 10000072)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (725, 10000072, 'Heterochromatic Gaze', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/b52fa0984578ebc729afb670f93e6c13.png', 'Increases the Level of <color=#FFD780FF>Sacred Rite: Heron''s Sanctum</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000072 order by id limit 1), 725, false, false, '', false
      where exists (select 1 from constellations where id = 725 and character_id = 10000072)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (726, 10000072, 'The Overflow', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/c826c60160f9d96a00a693c8b5dca3ce.png', 'When characters (excluding Candace herself) affected by the Prayer of the Crimson Crown caused by <color=#FFD780FF>Sacred Rite: Wagtail''s Tide</color> deal Elemental DMG to opponents using Normal Attacks, an attack wave will be unleashed that deals <color=#80C0FFFF>AoE Hydro DMG</color> equal to 15% of Candace''s Max HP.\nThis effect can trigger once every 2.3s and is considered Elemental Burst DMG.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000072 order by id limit 1), 726, false, false, '', false
      where exists (select 1 from constellations where id = 726 and character_id = 10000072)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10721, 10000072, 'Gleaming Spear - Guardian Stance', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/0a4af4ecb63b4741aa3e42d18a2a0c21.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 4 consecutive spear strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to lunge forward, dealing damage to opponents along the way.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10721, '1-Hit DMG', '60.8%', 1
        where exists (select 1 from skills where id = 10721 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10721 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10721, '2-Hit DMG', '61.1%', 2
        where exists (select 1 from skills where id = 10721 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10721 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10721, '3-Hit DMG', '35.5%+43.4%', 3
        where exists (select 1 from skills where id = 10721 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10721 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10721, '4-Hit DMG', '94.9%', 4
        where exists (select 1 from skills where id = 10721 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10721 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10721, 'Charged Attack DMG', '124.2%', 5
        where exists (select 1 from skills where id = 10721 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10721 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10721, 'Charged Attack Stamina Cost', '25.0', 6
        where exists (select 1 from skills where id = 10721 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10721 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10721, 'Plunge DMG', '63.9%', 7
        where exists (select 1 from skills where id = 10721 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10721 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10721, 'Low/High Plunge DMG', '128%/160%', 8
        where exists (select 1 from skills where id = 10721 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10721 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000072 order by id limit 1), 10721, 1, true, false, '', false
      where exists (select 1 from skills where id = 10721 and character_id = 10000072)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10722, 10000072, 'Sacred Rite: Heron''s Sanctum', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/ac5bcc220a69258c5b13f78a5f0b1ca2.png', 1, 'Candace''s fighting style is capable of warding off an entire tide of foes.\n\n<color=#FFD780FF>Tap</color>\nRushes forward with her shield, dealing <color=#80C0FFFF>Hydro DMG</color> to opponents in front of her.\n\n<color=#FFD780FF>Hold</color>\nRaises her shield to block incoming attacks from nearby opponents, forming a barrier that absorbs DMG based on her Max HP and absorbs <color=#80C0FFFF>Hydro DMG</color> 250% more effectively. This barrier lasts until the Elemental Skill is unleashed.\nAfter holding for a certain period of time, Candace will finish charging, and when the skill button is released, the skill duration expires, or when the barrier is broken, she will perform a leaping strike that deals <color=#80C0FFFF>Hydro DMG</color> to opponents in front of her.\n\n<i>The oath of the guardians is more stalwart yet than the shields they inherit.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10722, 'Shield DMG Absorption', '12.0% Max HP+1156', 1
        where exists (select 1 from skills where id = 10722 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10722 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10722, 'Basic DMG', '12.0% Max HP', 2
        where exists (select 1 from skills where id = 10722 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10722 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10722, 'Charged Up DMG', '19.0% Max HP', 3
        where exists (select 1 from skills where id = 10722 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10722 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10722, '#{LAYOUT_MOBILE#Tap}{LAYOUT_PC#Press}{LAYOUT_PS#Press} CD', '6.0s', 4
        where exists (select 1 from skills where id = 10722 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10722 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10722, 'Hold CD', '9.0s', 5
        where exists (select 1 from skills where id = 10722 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10722 and position = 5);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000072 order by id limit 1), 10722, 1, true, false, '', false
      where exists (select 1 from skills where id = 10722 and character_id = 10000072)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10725, 10000072, 'Sacred Rite: Wagtail''s Tide', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3dc00336565382109cc1d7e7928b5e51.png', 1, 'Raising her weapon on high, Candace calls upon a divine blessing that deals <color=#80C0FFFF>AoE Hydro DMG</color> based on her Max HP and continuously confers the Prayer of the Crimson Crown on your active character.\n\n<color=#FFD780FF>Prayer of the Crimson Crown</color>\nThis effect has the following properties:\n·Characters deal increased Elemental DMG with their Normal Attacks.\n·Whenever a character takes the field, they will unleash a rippling wave of water that deals <color=#80C0FFFF>Hydro DMG</color> to nearby opponents. There is a limited number of waves that can be triggered in the duration of this skill.\n·Sword, Claymore, and Polearm-wielding characters under this effect will obtain a <color=#80C0FFFF>Hydro Infusion</color>.\n\n<i>This secret rite has been passed down through Candace''s clan from generation to generation. Though the old faiths have become lost over the years, the sands still protect the heirs of the ancient realm.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10725, 'Skill DMG', '8.3% Max HP', 1
        where exists (select 1 from skills where id = 10725 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10725 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10725, 'Duration', '9.0s', 2
        where exists (select 1 from skills where id = 10725 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10725 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10725, 'DMG Bonus', '20.0%', 3
        where exists (select 1 from skills where id = 10725 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10725 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10725, 'Wave Impact DMG', '8.3% Max HP', 4
        where exists (select 1 from skills where id = 10725 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10725 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10725, 'Wave Instances', '3', 5
        where exists (select 1 from skills where id = 10725 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10725 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10725, 'CD', '15.0s', 6
        where exists (select 1 from skills where id = 10725 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10725 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10725, 'Energy Cost', '60', 7
        where exists (select 1 from skills where id = 10725 and character_id = 10000072) and not exists (select 1 from skill_affixes where skill_id = 10725 and position = 7);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000072 order by id limit 1), 10725, 4, true, false, '', false
      where exists (select 1 from skills where id = 10725 and character_id = 10000072)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (7221, 10000072, 'Aegis of Crossed Arrows', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/601cb677da45783fbe7edef0c6390ba2.png', 2, 'If Candace is hit by an attack in the Hold duration of <color=#FFD780FF>Sacred Rite: Heron''s Sanctum</color>, that skill will finish charging instantly.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000072 order by id limit 1), 7221, 1, true, false, '', false
      where exists (select 1 from skills where id = 7221 and character_id = 10000072)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (7222, 10000072, 'Celestial Dome of Sand', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/32f66cd2ceed4ac28f78059e0c326f4b.png', 2, 'Characters affected by the Prayer of the Crimson Crown caused by <color=#FFD780FF>Sacred Rite: Wagtail''s Tide</color> will deal 0.5% increased DMG to opponents for every 1,000 points of Candace''s Max HP when they deal Elemental DMG with their Normal Attacks.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000072 order by id limit 1), 7222, 1, false, false, '', false
      where exists (select 1 from skills where id = 7222 and character_id = 10000072)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (7223, 10000072, 'To Dawn''s First Light', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/a38e173259d1271c843ac5f7c52acd7f.png', 2, 'Decreases climbing Stamina consumption for your own party members by 20%.\nNot stackable with Passive Talents that provide the exact same effects.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000072 order by id limit 1), 7223, 1, true, false, '', false
      where exists (select 1 from skills where id = 7223 and character_id = 10000072)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 2000, 'selected', '4529', '1021', '5550')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 20, 'selected', '20.5%', null, '20.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 2001, 'selected', '382', '69', '451')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 22, 'selected', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 2002, 'selected', '284', '8', '292')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 28, 'selected', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 42, 'selected', '6.3%', null, '6.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 23, 'selected', '144.5%', null, '144.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 2000, 'base', '4529', '1021', '5550')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 2001, 'base', '382', '69', '451')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 2002, 'base', '284', '8', '292')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 28, 'base', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 999999, 'base', '220', null, '220')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 20, 'extra', '20.5%', null, '20.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 22, 'extra', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 23, 'extra', '144.5%', null, '144.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 42, 'element', '6.3%', null, '6.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000072 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
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
      values ((select id from character_builds where character_id = 10000072 order by id limit 1), 59341, 2100091, 1, 3, 0, 2, '430', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1) and position = 1), 5, '9', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1) and position = 1) and property_type_id = 5);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55321, 'Berserker''s Indigo Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/92d2a9153a2f03e1249c17f8530a2aa3.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000072 order by id limit 1), 55321, 2100051, 2, 3, 0, 5, '28', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1) and position = 2), 3, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1) and position = 2) and property_type_id = 3);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55452, 'Berserker''s Timepiece', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/72514ea9341bf0db03079d0c02ef78b2.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000072 order by id limit 1), 55452, 2100051, 3, 4, 0, 3, '6.3%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1) and position = 3), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1) and position = 3) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1) and position = 3), 6, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1) and position = 3) and property_type_id = 6);
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57412, 'Instructor''s Tea Cup', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/43b58997aabfaf68f64bde7bfee0c957.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000072 order by id limit 1), 57412, 2100071, 4, 4, 0, 42, '6.3%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1) and position = 4), 3, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1) and position = 4) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1) and position = 4), 23, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1) and position = 4) and property_type_id = 23);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59331, 'Exile''s Circlet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/22faf0f5c42ac3652ea2c4a1ca38ac05.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000072 order by id limit 1), 59331, 2100091, 5, 3, 0, 20, '3.5%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1) and position = 5), 8, '8', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000072 order by id limit 1) and position = 5) and property_type_id = 8);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000072, 'sand', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000072 and slot = 'sand' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000072, 'goblet', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000072 and slot = 'goblet' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000072, 'circlet', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000072 and slot = 'circlet' and property_type_id = 3);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000072, 3
        where not exists (select 1 from character_recommended_substats where character_id = 10000072 and property_type_id = 3);

-- Collei (10000067)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000067, 'Collei', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/eaf61637b76953695940fe1ceedb18a0.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/6743b943e6a55d1f7a2327292a72bd36.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/54213a15451315dcfc47c040cb46abf4.png', 'Dendro', 4, 12)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000067, 40, 1, 0, false
    where not exists (select 1 from character_builds where character_id = 10000067);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (15403, 'Sacrificial Bow', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/4a03625fdbc739dca379573871a4c2ca.png', 12, 'Bow', 4, 'A ceremonial hunting bow that has become petrified over time. The trinkets on it are still visible. It grants the wielder the power to withstand the winds of time.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000067 order by id limit 1), 15403, 40, 1, 2)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1)), 4, 'main', null, null, 226
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1)), 23, 'sub', null, null, 17.2
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (671, 10000067, 'Deepwood Patrol', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/9c8eeeb3022993ea57c50a30dc3e60f5.png', 'When in the party and not on the field, Collei''s Energy Recharge is increased by 20%.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000067 order by id limit 1), 671, false, false, '', false
      where exists (select 1 from constellations where id = 671 and character_id = 10000067)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (672, 10000067, 'Through Hill and Copse', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/83185faef83615eca06be3d6f023efb6.png', 'The Ascension Talent Floral Sidewinder is changed to this:\nThe <color=#FFD780FF>Floral Ring</color> will grant the character the Sprout effect from Floral Sidewinder upon return, dealing 40% of Collei''s ATK as <color=#99FF88FF>Dendro DMG</color> to nearby opponents for 3s.\nFrom the moment of using <color=#FFD780FF>Floral Brush</color> to the moment when this instance of Sprout effect ends, if any of your party members triggers Burning, Quicken, Aggravate, Spread, Bloom, Hyperbloom, Lunar-Bloom, or Burgeon reactions, the Sprout effect will be extended by 3s.\nThe Sprout effect can only be extended this way once. If another Sprout effect is triggered during its initial duration, the initial effect will be removed. DMG dealt by Sprout is considered Elemental Skill DMG.\nYou must first unlock the Ascension Talent "Floral Sidewinder."', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000067 order by id limit 1), 672, false, false, '', false
      where exists (select 1 from constellations where id = 672 and character_id = 10000067)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (673, 10000067, 'Scent of Summer', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/96bed347661e871a265049749af339dc.png', 'Increases the Level of <color=#FFD780FF>Floral Brush</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000067 order by id limit 1), 673, false, false, '', false
      where exists (select 1 from constellations where id = 673 and character_id = 10000067)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (674, 10000067, 'Gift of the Woods', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/a828f1910d2ea453aeb9841281fbafab.png', 'Using <color=#FFD780FF>Trump-Card Kitty</color> will increase all nearby characters'' Elemental Mastery by 60 for 12s (not including Collei herself).', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000067 order by id limit 1), 674, false, false, '', false
      where exists (select 1 from constellations where id = 674 and character_id = 10000067)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (675, 10000067, 'All Embers', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/d1b4f3da57153557083d357441658cb1.png', 'Increases the Level of <color=#FFD780FF>Trump-Card Kitty</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000067 order by id limit 1), 675, false, false, '', false
      where exists (select 1 from constellations where id = 675 and character_id = 10000067)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (676, 10000067, 'Forest of Falling Arrows', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/d9a5e0887ccff7ab45ddfaf0fc022242.png', 'When the <color=#FFD780FF>Floral Ring</color> hits, it will create a miniature Cuilein-Anbar that will deal 200% of Collei''s ATK as <color=#99FF88FF>Dendro DMG</color>.\nEach <color=#FFD780FF>Floral Brush</color> can only create one such miniature Cuilein-Anbar.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000067 order by id limit 1), 676, false, false, '', false
      where exists (select 1 from constellations where id = 676 and character_id = 10000067)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10671, 10000067, 'Supplicant''s Bowmanship', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/cc29fde34aa6d42f8e110628a4bf2de2.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 4 consecutive shots with a bow.\n\n<color=#FFD780FF>Charged Attack</color>\nPerforms a more precise <color=#FFD780FF>Aimed Shot</color> with increased DMG.\nWhile aiming, Dendro energy will accumulate on the arrowhead. A fully charged arrow will deal <color=#99FF88FF>Dendro DMG</color>.\n\n<color=#FFD780FF>Plunging Attack</color>\nFires off a shower of arrows in mid-air before falling and striking the ground, dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10671, '1-Hit DMG', '43.6%', 1
        where exists (select 1 from skills where id = 10671 and character_id = 10000067) and not exists (select 1 from skill_affixes where skill_id = 10671 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10671, '2-Hit DMG', '42.7%', 2
        where exists (select 1 from skills where id = 10671 and character_id = 10000067) and not exists (select 1 from skill_affixes where skill_id = 10671 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10671, '3-Hit DMG', '54.1%', 3
        where exists (select 1 from skills where id = 10671 and character_id = 10000067) and not exists (select 1 from skill_affixes where skill_id = 10671 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10671, '4-Hit DMG', '68.0%', 4
        where exists (select 1 from skills where id = 10671 and character_id = 10000067) and not exists (select 1 from skill_affixes where skill_id = 10671 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10671, 'Aimed Shot', '43.9%', 5
        where exists (select 1 from skills where id = 10671 and character_id = 10000067) and not exists (select 1 from skill_affixes where skill_id = 10671 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10671, 'Fully-Charged Aimed Shot', '124%', 6
        where exists (select 1 from skills where id = 10671 and character_id = 10000067) and not exists (select 1 from skill_affixes where skill_id = 10671 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10671, 'Plunge DMG', '56.8%', 7
        where exists (select 1 from skills where id = 10671 and character_id = 10000067) and not exists (select 1 from skill_affixes where skill_id = 10671 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10671, 'Low/High Plunge DMG', '114%/142%', 8
        where exists (select 1 from skills where id = 10671 and character_id = 10000067) and not exists (select 1 from skill_affixes where skill_id = 10671 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000067 order by id limit 1), 10671, 1, true, false, '', false
      where exists (select 1 from skills where id = 10671 and character_id = 10000067)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10672, 10000067, 'Floral Brush', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/798cc73d08af1afe72d63cceefc4f277.png', 1, 'Throws out a Floral Ring that deals 1 instance of <color=#99FF88FF>Dendro DMG</color> to targets it comes into contact with.\nThe Floral Ring will return after a set time, dealing <color=#99FF88FF>Dendro DMG</color> once again.\n\n<i>This is Collei''s go-to gadget for dealing with unruly wild beasts. A few good thwacks from this tool will generally improve their behavior. This same principle works just as well on evildoers.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10672, 'Skill DMG', '151.2%', 1
        where exists (select 1 from skills where id = 10672 and character_id = 10000067) and not exists (select 1 from skill_affixes where skill_id = 10672 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10672, 'CD', '12.0s', 2
        where exists (select 1 from skills where id = 10672 and character_id = 10000067) and not exists (select 1 from skill_affixes where skill_id = 10672 and position = 2);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000067 order by id limit 1), 10672, 1, true, false, '', false
      where exists (select 1 from skills where id = 10672 and character_id = 10000067)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10675, 10000067, 'Trump-Card Kitty', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/7be37648c37c44e75f8b196c518e6e16.png', 1, 'Trusty Cuilein-Anbar comes to save the day!\nThrows the doll named Cuilein-Anbar, causing an explosion that deals <color=#99FF88FF>AoE Dendro DMG</color>, creating a Cuilein-Anbar Zone. Cuilein-Anbar will bounce around within this zone, dealing <color=#99FF88FF>AoE Dendro DMG</color>.\n\n<i>"Pretty impressive, huh? ... Eh? You want to know how I came up with the name Cuilein-Anbar? Uh, well, I..."</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10675, 'Explosion DMG', '201.8%', 1
        where exists (select 1 from skills where id = 10675 and character_id = 10000067) and not exists (select 1 from skill_affixes where skill_id = 10675 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10675, 'Leap DMG', '43.2%', 2
        where exists (select 1 from skills where id = 10675 and character_id = 10000067) and not exists (select 1 from skill_affixes where skill_id = 10675 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10675, 'Duration', '6.0s', 3
        where exists (select 1 from skills where id = 10675 and character_id = 10000067) and not exists (select 1 from skill_affixes where skill_id = 10675 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10675, 'CD', '15.0s', 4
        where exists (select 1 from skills where id = 10675 and character_id = 10000067) and not exists (select 1 from skill_affixes where skill_id = 10675 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10675, 'Energy Cost', '60', 5
        where exists (select 1 from skills where id = 10675 and character_id = 10000067) and not exists (select 1 from skill_affixes where skill_id = 10675 and position = 5);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000067 order by id limit 1), 10675, 1, true, false, '', false
      where exists (select 1 from skills where id = 10675 and character_id = 10000067)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (6721, 10000067, 'Floral Sidewinder', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/2f001fc697c64358ae025c12c3855c0b.png', 2, 'If one of your party members has triggered Burning, Quicken, Aggravate, Spread, Bloom, Hyperbloom, Burgeon, or Lunar-Bloom reactions before the <color=#FFD780FF>Floral Ring</color> returns, it will grant the character the Sprout effect upon return, which will continuously deal <color=#99FF88FF>Dendro DMG</color> equivalent to 40% of Collei''s ATK to nearby opponents for 3s.\nIf another Sprout effect is triggered during its initial duration, the initial effect will be removed. DMG dealt by Sprout is considered Elemental Skill DMG.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000067 order by id limit 1), 6721, 1, true, false, '', false
      where exists (select 1 from skills where id = 6721 and character_id = 10000067)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (6722, 10000067, 'The Languid Wood', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/d1badafc2aeacae75a057244f97e24a5.png', 2, 'When a character within the <color=#FFD780FF>Cuilein-Anbar Zone</color> triggers Burning, Quicken, Aggravate, Spread, Bloom, Hyperbloom, Burgeon, or Lunar-Bloom reactions, the Zone''s duration will be increased by 1s.\nA single <color=#FFD780FF>Trump-Card Kitty</color> can be extended this way by up to 3s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000067 order by id limit 1), 6722, 1, false, false, '', false
      where exists (select 1 from skills where id = 6722 and character_id = 10000067)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (6723, 10000067, 'Gliding Champion of Sumeru', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/c7efeccd9d374b3fa238a627d22bedbc.png', 2, 'Decreases gliding Stamina consumption for your own party members by 20%.\nNot stackable with Passive Talents that provide the exact same effects.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000067 order by id limit 1), 6723, 1, true, false, '', false
      where exists (select 1 from skills where id = 6723 and character_id = 10000067)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 2000, 'selected', '4076', '999', '5075')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 20, 'selected', '22.0%', null, '22.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 2001, 'selected', '309', '61', '371')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 22, 'selected', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 2002, 'selected', '250', '17', '267')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 28, 'selected', '49', null, '49')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 43, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 23, 'selected', '120.8%', null, '120.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 2000, 'base', '4076', '999', '5075')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 2001, 'base', '309', '61', '371')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 2002, 'base', '250', '17', '267')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 28, 'base', '49', null, '49')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 20, 'extra', '22.0%', null, '22.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 22, 'extra', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 23, 'extra', '120.8%', null, '120.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000067 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
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
      values ((select id from character_builds where character_id = 10000067 order by id limit 1), 55442, 2100051, 1, 4, 0, 2, '645', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1) and position = 1), 23, '3.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1) and position = 1) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1) and position = 1), 28, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1) and position = 1) and property_type_id = 28);
insert into relic_sets (id, name) values (2140011, 'Blizzard Strayer') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2140011, 2, 'Cryo DMG Bonus +15%'
        where not exists (select 1 from relic_set_affixes where set_id = 2140011 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2140011, 4, 'When a character attacks an opponent affected by Cryo, their CRIT Rate is increased by 20%. If the opponent is Frozen, CRIT Rate is increased by an additional 20%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2140011 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (71422, 'Icebreaker''s Resolve', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/4c8e83f11bd905ad8dd7089b42ad7ad3.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000067 order by id limit 1), 71422, 2140011, 2, 4, 0, 5, '42', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1) and position = 2), 28, '15', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1) and position = 2) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1) and position = 2), 20, '2.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1) and position = 2) and property_type_id = 20);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55351, 'Berserker''s Timepiece', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/72514ea9341bf0db03079d0c02ef78b2.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000067 order by id limit 1), 55351, 2100051, 3, 3, 0, 28, '21', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1) and position = 3), 2, '115', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1) and position = 3) and property_type_id = 2);
insert into relic_sets (id, name) values (2150031, 'Wanderer''s Troupe') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150031, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150031 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150031, 4, 'Increases Charged Attack DMG by 35% if the character uses a Catalyst or a Bow.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150031 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (77412, 'Wanderer''s String-Kettle', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/00068fbfdac5602f0ebd3d6a2b85d0bc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000067 order by id limit 1), 77412, 2150031, 4, 4, 0, 6, '6.3%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1) and position = 4), 2, '239', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1) and position = 4) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1) and position = 4), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000067 order by id limit 1) and position = 4) and property_type_id = 8);
insert into relic_sets (id, name) values (2100111, 'Lucky Dog') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100111, 2, 'DEF increased by 100.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100111 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100111, 4, 'Picking up Mora restores 300 HP.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100111 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (61230, 'Lucky Dog''s Silver Circlet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/b41981a2d335aff25dca11cb416518df.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000067 order by id limit 1), 61230, 2100111, 5, 2, 0, 20, '2.8%', 0)
      on conflict do nothing;
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000067, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000067 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000067, 'goblet', 43
          where not exists (select 1 from character_relic_recommendations where character_id = 10000067 and slot = 'goblet' and property_type_id = 43);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000067, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 10000067 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000067, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000067 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000067, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000067 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000067, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000067 and property_type_id = 6);

commit;
