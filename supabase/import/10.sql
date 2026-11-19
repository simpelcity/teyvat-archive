-- Part 10 of 13. Generated from app/data/character_detail.ts.
-- Insert-only and safe to re-run. Run the parts in order in the Supabase SQL editor.
begin;

-- Valeriy (10000137)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000137, 'Valeriy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6776/2cd496faf46d4727430723b840e61881.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/db2897ea4bb1116cc37252bf2b25dabe.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6782/0486b11cf20a958e13748693f418f5e5.png', 'Electro', 4, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000137, 70, 4, 6, true
    where not exists (select 1 from character_builds where character_id = 10000137);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11425, 'Finale of the Deep', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/3d55aea4fa30254d868ad4fa4720c6b2.png', 1, 'Sword', 4, 'This longsword is as silent as the mysterious ocean depths. It is even more ancient than its stylings might imply.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000137 order by id limit 1), 11425, 70, 4, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1)), 4, 'main', null, null, 429
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1)), 6, 'sub', null, null, 22.7
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (1371, 10000137, 'The Cadence of Suppressive Fire', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/e0a539350977d7005acab7bf39ee3f8b.png', 'Valeriy regenerates 6 Elemental Energy after performing the special Charged Attack <color=#FFD780FF>{LINK#N11370001}Direct-Fire Mortar: Point-Blank Bombardment{/LINK}</color>. For every 10 <color=#FFD780FF>{LINK#N11370003}Impact Momentum{/LINK}</color> consumed beyond 40 when performing this special Charged Attack, he regenerates an additional 1.5 Elemental Energy. Each time he performs <color=#FFD780FF>Direct-Fire Mortar: Point-Blank Bombardment</color>, he can regenerate up to 15 Elemental Energy in this way. This effect can trigger once every 15s.\nAdditionally, each time Valeriy enters combat, the first time he uses his Elemental Skill <color=#FFD780FF>{LINK#S30602}Active Defense: Bastion Charge{/LINK}</color>, he gains an additional amount of <color=#FFD780FF>Impact Momentum</color> equal to 150% of the amount normally gained.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000137 order by id limit 1), 1371, true, false, '', false
      where exists (select 1 from constellations where id = 1371 and character_id = 10000137)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1372, 10000137, 'Ranks That Charge as One', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/5f4683a5fc1ec78dd6f2e397a699d171.png', 'All nearby party members gain 100 Elemental Mastery for 18s after Valeriy uses his Elemental Skill <color=#FFD780FF>{LINK#S30602}Active Defense: Bastion Charge{/LINK}</color>.\nAdditionally, while protected by a Supercharged Shield, if Valeriy is already at maximum <color=#FFD780FF>{LINK#N11370003}Impact Momentum{/LINK}</color>, any further <color=#FFD780FF>Impact Momentum</color> he would gain is instead converted into increased DMG Absorption for the shield. Each point of excess <color=#FFD780FF>Impact Momentum</color> increases the Supercharged Shield''s DMG Absorption by an amount equal to 8% of Valeriy''s ATK. Up to 20 excess <color=#FFD780FF>Impact Momentum</color> can be converted in this way.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000137 order by id limit 1), 1372, true, false, '', false
      where exists (select 1 from constellations where id = 1372 and character_id = 10000137)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1373, 10000137, 'Vigilance at Close Quarters', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/2f3caf2733f6d45e41ea5e635c18068d.png', 'Increases the Level of Normal Attack <color=#FFD780FF>{LINK#S30601}Guard Tactics: Sword and Shield{/LINK}</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000137 order by id limit 1), 1373, true, false, '', false
      where exists (select 1 from constellations where id = 1373 and character_id = 10000137)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1374, 10000137, 'Fortitude Unshaken by Attrition', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/a8729672fbe35b8c8814150f11aa4fdd.png', '<color=#FFD780FF>{LINK#N11370003}Impact Momentum{/LINK}</color>''s limit is increased by 30, and its charging efficiency is increased by 30%.\nAdditionally, the Ascension Talent <color=#FFD780FF>{LINK#P1372101}Advance With the Creeping Barrage{/LINK}</color> is enhanced: The maximum amount of <color=#FFD780FF>Impact Momentum</color> that can be gained from this Talent after using the Elemental Burst is 104. You must unlock the Ascension Talent <color=#FFD780FF>Advance With the Creeping Barrage</color> to gain access to this effect.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000137 order by id limit 1), 1374, true, false, '', false
      where exists (select 1 from constellations where id = 1374 and character_id = 10000137)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1375, 10000137, 'Resolve to Divide and Destroy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/82b37b969867ce5675c24fdcf61519f6.png', 'Increases the Level of the Elemental Skill <color=#FFD780FF>{LINK#S30602}Active Defense: Bastion Charge{/LINK}</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000137 order by id limit 1), 1375, true, false, '', false
      where exists (select 1 from constellations where id = 1375 and character_id = 10000137)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1376, 10000137, 'The Strength to Breach Enemy Lines', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/f46fbaa8f6b2eebef2b9bf8a014d1ec9.png', 'The special Charged Attack <color=#FFD780FF>{LINK#N11370001}Direct-Fire Mortar: Point-Blank Bombardment{/LINK}</color> and <color=#FFD780FF>Thunderburst Shells</color> from Elemental Burst <color=#FFD780FF>{LINK#S30605}Focused Fire: Lightning Salvo{/LINK}</color> are enhanced: Their DMG is increased by 100%, and opponents they hit have the CRIT Rate of <color=#FFACFFFF>Electro DMG</color> they take increased by 10% for 7s. If the <color=#FFACFFFF>Electro DMG</color> taken is Stellar-Conduct reaction DMG, that DMG instance''s CRIT DMG is also increased by 40%.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000137 order by id limit 1), 1376, true, false, '', false
      where exists (select 1 from constellations where id = 1376 and character_id = 10000137)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (30601, 10000137, 'Guard Tactics: Sword and Shield', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 3 consecutive sword strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to leap forward and slam the ground, dealing Physical DMG to nearby opponents.\nWhen Valeriy has at least 40 <color=#FFD780FF>{LINK#N11370003}Impact Momentum{/LINK}</color>, he will consume all <color=#FFD780FF>Impact Momentum</color> to instead perform the special Charged Attack <color=#FFD780FF>{LINK#N11370001}Direct-Fire Mortar: Point-Blank Bombardment{/LINK}</color>.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.{LINK#N11370002}{/LINK}')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 30601, '1-Hit DMG', '47.2%', 1
        where exists (select 1 from skills where id = 30601 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30601 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 30601, '2-Hit DMG', '42.6%', 2
        where exists (select 1 from skills where id = 30601 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30601 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 30601, '3-Hit DMG', '66.0%', 3
        where exists (select 1 from skills where id = 30601 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30601 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 30601, 'Charged Attack DMG', '145.8%', 4
        where exists (select 1 from skills where id = 30601 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30601 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 30601, 'Direct-Fire Mortar: Point-Blank Bombardment DMG', '320.9%', 5
        where exists (select 1 from skills where id = 30601 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30601 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 30601, 'Charged Attack Stamina Cost', '20.0', 6
        where exists (select 1 from skills where id = 30601 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30601 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 30601, 'Electro DMG Bonus', '34.05% ATK', 7
        where exists (select 1 from skills where id = 30601 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30601 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 30601, 'Stellar-Conduct DMG Bonus', '102.14% ATK', 8
        where exists (select 1 from skills where id = 30601 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30601 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 30601, 'Offensive Directive Stacks', '15', 9
        where exists (select 1 from skills where id = 30601 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30601 and position = 9);
insert into skill_affixes (skill_id, name, value, position)
        select 30601, 'Offensive Directive Duration', '18.0s', 10
        where exists (select 1 from skills where id = 30601 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30601 and position = 10);
insert into skill_affixes (skill_id, name, value, position)
        select 30601, 'Plunge DMG', '92.9%', 11
        where exists (select 1 from skills where id = 30601 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30601 and position = 11);
insert into skill_affixes (skill_id, name, value, position)
        select 30601, 'Low/High Plunge DMG', '185.8%/232.1%', 12
        where exists (select 1 from skills where id = 30601 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30601 and position = 12);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000137 order by id limit 1), 30601, 6, true, false, '', false
      where exists (select 1 from skills where id = 30601 and character_id = 10000137)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (30602, 10000137, 'Active Defense: Bastion Charge', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/d467f3ecc10dca42b73d7191984487da.png', 1, 'Valeriy raises his shield cannon and charges forward, dealing <color=#FFACFFFF>AoE Electro DMG</color>, gaining 40 <color=#FFD780FF>{LINK#N11370003}Impact Momentum{/LINK}</color>, and deploying a Supercharged Shield.\nThe Supercharged Shield''s DMG Absorption scales with Valeriy''s ATK, and has 250% absorption efficiency against <color=#FFACFFFF></color>Electro DMG<color=#FFACFFFF></color>.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 30602, 'Skill DMG', '220.0%', 1
        where exists (select 1 from skills where id = 30602 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30602 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 30602, 'Shield DMG Absorption', '276.8% ATK+1899', 2
        where exists (select 1 from skills where id = 30602 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30602 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 30602, 'Shield Duration', '18.0s', 3
        where exists (select 1 from skills where id = 30602 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30602 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 30602, 'CD', '10.0s', 4
        where exists (select 1 from skills where id = 30602 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30602 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000137 order by id limit 1), 30602, 5, true, false, '', false
      where exists (select 1 from skills where id = 30602 and character_id = 10000137)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (30605, 10000137, 'Focused Fire: Lightning Salvo', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/2c5b5cd86a5248c7bf135c7f510b617a.png', 1, 'Deals <color=#FFACFFFF>AoE Electro DMG</color> to nearby opponents and fires a <color=#FFD780FF>Thunderburst Shell</color> high into the air. The <color=#FFD780FF>Thunderburst Shell</color> disperses into a barrage of projectiles that rain down, dealing <color=#FFACFFFF>AoE Electro DMG</color> to nearby opponents.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 30605, 'Skill DMG', '135.1%', 1
        where exists (select 1 from skills where id = 30605 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30605 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 30605, 'Thunderburst Shell DMG', '31.5%', 2
        where exists (select 1 from skills where id = 30605 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30605 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 30605, 'Duration', '12.0s', 3
        where exists (select 1 from skills where id = 30605 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30605 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 30605, 'CD', '15.0s', 4
        where exists (select 1 from skills where id = 30605 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30605 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 30605, 'Energy Cost', '60', 5
        where exists (select 1 from skills where id = 30605 and character_id = 10000137) and not exists (select 1 from skill_affixes where skill_id = 30605 and position = 5);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000137 order by id limit 1), 30605, 1, true, false, '', false
      where exists (select 1 from skills where id = 30605 and character_id = 10000137)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (13721, 10000137, 'Advance With the Creeping Barrage', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/ac2eef97b6d1c2a86d2551bef0815bc3.png', 2, 'Valeriy gains 5 <color=#FFD780FF>{LINK#N11370003}Impact Momentum{/LINK}</color> whenever another nearby active character in the party hits an opponent with an <color=#FFACFFFF>Electro</color> attack while the <color=#FFD780FF>Thunderburst Shells</color> from his Elemental Burst <color=#FFD780FF>{LINK#S30605}Focused Fire: Lightning Salvo{/LINK}</color> are falling. He can gain up to 80 <color=#FFD780FF>Impact Momentum</color> in this way after each use of his Elemental Burst.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000137 order by id limit 1), 13721, 1, true, false, '', false
      where exists (select 1 from skills where id = 13721 and character_id = 10000137)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (13722, 10000137, 'Into the Breach', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/cf830137fcad4349040f4f795aafa150.png', 2, '<color=#FFD780FF>{LINK#N11370002}Offensive Directive{/LINK}</color> is enhanced based on the amount of <color=#FFD780FF>{LINK#N11370003}Impact Momentum{/LINK}</color> consumed when performing his special Charged Attack <color=#FFD780FF>{LINK#N11370001}Direct-Fire Mortar: Point-Blank Bombardment{/LINK}</color>. Each point consumed further increases the DMG Bonus granted by <color=#FFD780FF>Offensive Directive</color>. If Valeriy is:\n·In the <color=#FFD780FF>Radiance: Stellar-Conduct</color> state: Each point of <color=#FFD780FF>Impact Momentum</color> consumed increases this DMG Bonus by an amount equal to 0.9% of Valeriy''s ATK;\n·Not in the <color=#FFD780FF>Radiance: Stellar-Conduct</color> state: Each point of <color=#FFD780FF>Impact Momentum</color> consumed increases this DMG Bonus by an amount equal to 0.3% of Valeriy''s ATK.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000137 order by id limit 1), 13722, 1, true, false, '', false
      where exists (select 1 from skills where id = 13722 and character_id = 10000137)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (13723, 10000137, 'Subzero Conditioning', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/df2038db6df3dbc797f77b7cac3f4018.png', 2, 'Valeriy enters the <color=#FFD780FF>Radiance: Stellar-Conduct</color> state while within a {LINK#N11330003}<color=#FFD780FF>Polestar Field</color>{/LINK}.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000137 order by id limit 1), 13723, 1, true, false, '', false
      where exists (select 1 from skills where id = 13723 and character_id = 10000137)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (13725, 10000137, 'Tundra Operational Intelligence', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6aea6781/6fbab8904bcee5407c519fb14459136f.png', 2, 'Gains 25% more rewards when dispatched on a Snezhnaya (not including Nod-Krai) Expedition for 20 hours.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000137 order by id limit 1), 13725, 1, true, false, '', false
      where exists (select 1 from skills where id = 13725 and character_id = 10000137)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 2000, 'selected', '7729', '3570', '11299')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 20, 'selected', '8.5%', null, '8.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 2001, 'selected', '626', '1100', '1726')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 22, 'selected', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 2002, 'selected', '543', '191', '734')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 28, 'selected', '82', null, '82')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 41, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 23, 'selected', '105.8%', null, '105.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 2000, 'base', '7729', '3570', '11299')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 2001, 'base', '626', '1100', '1726')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 2002, 'base', '543', '191', '734')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 28, 'base', '82', null, '82')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 20, 'extra', '8.5%', null, '8.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 22, 'extra', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 23, 'extra', '105.8%', null, '105.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000137 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150441, 'A Day Carved From Rising Winds') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150441, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150441 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150441, 4, 'After a Normal Attack, Charged Attack, Elemental Skill, or Elemental Burst hits an opponent, gain the Blessing of Pastoral Winds effect for 6s: ATK is increased by 25%. If the equipping character has completed Witch''s Homework, Blessing of Pastoral Winds will be upgraded to Resolve of Pastoral Winds, which additionally increases the CRIT Rate of the equipping character by 20%. This effect can be triggered even when the character is off-field.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150441 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (44544, 'Windborne Flower''s Spruchdichtung', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6966dc8c/f3ce928d25fa416c879c4db18ee546ef.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000137 order by id limit 1), 44544, 2150441, 1, 5, 8, 2, '2342', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 1), 28, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 1) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 1), 8, '21', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 1) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 1), 5, '27', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 1) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 1), 9, '12.4%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 1) and property_type_id = 9);
insert into relic_sets (id, name) values (2150011, 'Gladiator''s Finale') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 4, 'If the wielder of this artifact set uses a Sword, Claymore or Polearm, increases their Normal Attack DMG by 35%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (75523, 'Gladiator''s Destiny', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/5f120cdac0fc7783d0ba6d1452818d5d.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000137 order by id limit 1), 75523, 2150011, 2, 5, 8, 5, '152', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 2), 23, '5.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 2) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 2), 6, '11.1%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 2) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 2), 20, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 2) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 2), 9, '7.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 2) and property_type_id = 9);
insert into relic_sets (id, name) values (2150441, 'A Day Carved From Rising Winds') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150441, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150441 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150441, 4, 'After a Normal Attack, Charged Attack, Elemental Skill, or Elemental Burst hits an opponent, gain the Blessing of Pastoral Winds effect for 6s: ATK is increased by 25%. If the equipping character has completed Witch''s Homework, Blessing of Pastoral Winds will be upgraded to Resolve of Pastoral Winds, which additionally increases the CRIT Rate of the equipping character by 20%. This effect can be triggered even when the character is off-field.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150441 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (44452, 'A Note in Spring''s Leich', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6966dc8c/16c9b0158c4f6090b4eb4db66d6773d7.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000137 order by id limit 1), 44452, 2150441, 3, 4, 10, 6, '24.1%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 3), 28, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 3) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 3), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 3) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 3), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 3) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 3), 9, '5.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 3) and property_type_id = 9);
insert into relic_sets (id, name) values (2150431, 'Aubade of Morningstar and Moon') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150431, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150431 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150431, 4, 'When the equipping character is off-field, Lunar Reaction DMG is increased by 20%. When the party''s Moonsign Level is at least Ascendant Gleam, Lunar Reaction DMG will be further increased by 40%. This effect will disappear after the equipping character is active for 3s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150431 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (43513, 'Moonlit Offering''s Libation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6966dc8c/21e57db986ee92926afef6d4591b8833.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000137 order by id limit 1), 43513, 2150431, 4, 5, 6, 6, '18.9%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 4), 5, '18', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 4), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 4) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 4), 2, '299', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 4) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 4), 28, '23', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 4) and property_type_id = 28);
insert into relic_sets (id, name) values (2150011, 'Gladiator''s Finale') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 4, 'If the wielder of this artifact set uses a Sword, Claymore or Polearm, increases their Normal Attack DMG by 35%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (75534, 'Gladiator''s Triumphus', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/69750e95511b6aed7919f73b1d568ccd.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000137 order by id limit 1), 75534, 2150011, 5, 5, 4, 6, '14.9%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 5), 2, '299', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 5) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 5), 28, '23', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 5) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 5), 3, '8.2%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 5) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 5), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000137 order by id limit 1) and position = 5) and property_type_id = 5);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000137, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000137 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000137, 'goblet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000137 and slot = 'goblet' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000137, 'circlet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000137 and slot = 'circlet' and property_type_id = 6);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000137, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000137 and property_type_id = 6);

-- Jahoda (10000124)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000124, 'Jahoda', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/692f7d8b/8ce70ee6c41e48a78bdb1a17be8b554e.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/766cc154ff5c4c232e7997217b50d4ee.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/692f7dce/0f74abd472d9ed1a60318d9843fc37f0.png', 'Anemo', 4, 12)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000124, 1, 1, 1, false
    where not exists (select 1 from character_builds where character_id = 10000124);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (15403, 'Sacrificial Bow', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/4a03625fdbc739dca379573871a4c2ca.png', 12, 'Bow', 4, 'A ceremonial hunting bow that has become petrified over time. The trinkets on it are still visible. It grants the wielder the power to withstand the winds of time.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000124 order by id limit 1), 15403, 1, 0, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000124 order by id limit 1)), 4, 'main', null, null, 44
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000124 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000124 order by id limit 1)), 23, 'sub', null, null, 6.7
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000124 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (1241, 10000124, 'One More Flask!', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/692f7dcc/e0467ce64af2035e86f0d22762aba59f.png', 'When a <color=#FFD780FF>Fluffy Meowball</color> fired by the {LINK#N11240001}<color=#FFD780FF>Purr-loined Treasure Flask</color>{/LINK} from the Elemental Skill <color=#FFD780FF>Savvy Strategy: Splitting the Spoils</color> hits an enemy, there is a 50% chance for it to bounce, dealing the corresponding Elemental DMG to nearby opponents.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000124 order by id limit 1), 1241, true, false, '', false
      where exists (select 1 from constellations where id = 1241 and character_id = 10000124)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1242, 10000124, 'Rogue''s Quick Thinking', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/692f7dcc/a2404bf58308bba94c5ca2ee6d12d434.png', '<color=#FFD780FF>Moonsign: Ascendant Gleam</color>: In the Ascension Talent {LINK#P1242101}<color=#FFD780FF>"Plan to Get Paid,"</color>{/LINK} Jahoda can secretly track, in addition to the element with the highest number of characters, the element with the next highest number of characters among the remaining types. This allows up to two elemental effects to be active at once. You must first unlock the Ascension Talent "Plan to Get Paid."', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000124 order by id limit 1), 1242, false, false, '', false
      where exists (select 1 from constellations where id = 1242 and character_id = 10000124)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1243, 10000124, 'Desperate Gamble', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/692f7dcc/b8c44dd2750b2f6d7b1bb03fecf5d9ea.png', 'Increases the Level of <color=#FFD780FF>{LINK#S11245}Hidden Aces: Seven Tools of the Hunter{/LINK}</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000124 order by id limit 1), 1243, false, false, '', false
      where exists (select 1 from constellations where id = 1243 and character_id = 10000124)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1244, 10000124, 'Wild Berry Amid the Dust', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/692f7dcc/812ee4bd05891e0e07059076909e91fb.png', 'When a {LINK#N11240002}<color=#FFD780FF>Purrsonal Coordinated Assistance Robot</color>{/LINK} from the Elemental Burst <color=#FFD780FF>Hidden Aces: Seven Tools of the Hunter</color> undergoes an Elemental Conversion, Jahoda will recover 4 Elemental Energy.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000124 order by id limit 1), 1244, false, false, '', false
      where exists (select 1 from constellations where id = 1244 and character_id = 10000124)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1245, 10000124, 'The Greatest Treasure', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/692f7dcc/320d412e46f597c144a2e97473b50eb8.png', 'Increases the Level of <color=#FFD780FF>{LINK#S11242}Savvy Strategy: Splitting the Spoils{/LINK}</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000124 order by id limit 1), 1245, false, false, '', false
      where exists (select 1 from constellations where id = 1245 and character_id = 10000124)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1246, 10000124, 'The Littlest Luck', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/692f7dcc/715dedcfd3e03b446bc81ebe91de4b82.png', '<color=#FFD780FF>Moonsign: Ascendant Gleam</color>: After the {LINK#N11240001}<color=#FFD780FF>Purr-loined Treasure Flask</color>{/LINK} from the Elemental Skill <color=#FFD780FF>Savvy Strategy: Splitting the Spoils</color> is full, nearby Moonsign characters in your party have their CRIT Rate increased by 5% and CRIT DMG increased by 40% for 20s.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000124 order by id limit 1), 1246, false, false, '', false
      where exists (select 1 from constellations where id = 1246 and character_id = 10000124)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11241, 10000124, 'Strike While the Arrow''s Hot', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/cc29fde34aa6d42f8e110628a4bf2de2.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 3 consecutive shots with a bow.\n\n<color=#FFD780FF>Charged Attack</color>\nPerforms a more precise <color=#FFD780FF>Aimed Shot</color> with increased DMG.\nWhile aiming, mighty winds will accumulate on the arrowhead. A fully charged wind arrow will deal <color=#80FFD7FF>Anemo DMG</color>.\n\n<color=#FFD780FF>Plunging Attack</color>\nFires off a shower of arrows in mid-air before falling and striking the ground, hitting opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11241, '1-Hit DMG', '41.7%', 1
        where exists (select 1 from skills where id = 11241 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11241 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11241, '2-Hit DMG', '19.2%×2', 2
        where exists (select 1 from skills where id = 11241 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11241 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11241, '3-Hit DMG', '51.2%', 3
        where exists (select 1 from skills where id = 11241 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11241 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11241, 'Aimed Shot', '43.9%', 4
        where exists (select 1 from skills where id = 11241 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11241 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11241, 'Fully-Charged Aimed Shot', '124%', 5
        where exists (select 1 from skills where id = 11241 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11241 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11241, 'Plunge DMG', '56.8%', 6
        where exists (select 1 from skills where id = 11241 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11241 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11241, 'Low/High Plunge DMG', '114%/142%', 7
        where exists (select 1 from skills where id = 11241 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11241 and position = 7);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000124 order by id limit 1), 11241, 1, true, false, '', false
      where exists (select 1 from skills where id = 11241 and character_id = 10000124)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11242, 10000124, 'Savvy Strategy: Splitting the Spoils', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/692f7dca/2d038a9823acb6c19b9b64a1113d40dd.png', 1, 'Jahoda dashes toward her opponent, entering the Shadow Pursuit state upon contact. While in this state, Jahoda moves continuously and swiftly: If nearby opponents are affected by <color=#FF9999FF>Pyro</color>, <color=#80C0FFFF>Hydro</color>, <color=#FFACFFFF>Electro</color>, or <color=#99FFFFFF>Cryo</color>, she will quietly convert her {LINK#N11240001}<color=#FFD780FF>Purr-loined Treasure Flask</color>{/LINK} to that element, gradually filling it. When the duration ends or the skill is used again, Jahoda drains the <color=#FFD780FF>Purr-loined Treasure Flask</color> and deals a single instance of <color=#80FFD7FF>Anemo DMG</color> to nearby opponents. When the <color=#FFD780FF>Purr-loined Treasure Flask</color> is full, Jahoda immediately drains it, exiting the Shadow Pursuit state and dealing a more powerful instance of <color=#80FFD7FF>Anemo DMG</color>.\nIf her dash fails to make contact with an opponent, Jahoda instead drops a Smoke Bomb at her location, dealing a single instance of <color=#80FFD7FF>Anemo DMG</color> to nearby opponents.\n\n<color=#FFD780FF>Moonsign: Ascendant Gleam</color>: When the <color=#FFD780FF>Purr-loined Treasure Flask</color> becomes full, Jahoda will not immediately discharge it. Instead, for a short duration, she steadily consumes the stored element inside and periodically fires <color=#FFD780FF>Fluffy Meowballs</color> at nearby opponents, dealing DMG of the corresponding element stored in the <color=#FFD780FF>Purr-loined Treasure Flask</color>. When a <color=#FFD780FF>Fluffy Meowball</color> hits an opponent, Jahoda regenerates 2 Elemental Energy. This effect can be triggered once every 3.5s.\n\n<i>There are many ways to divide wealth in this world — but for Nod-Krai''s treasure hunters — and hoarders — only one has ever proven sufficiently effective.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11242, 'Smoke Bomb DMG', '159.0%', 1
        where exists (select 1 from skills where id = 11242 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11242 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11242, 'Unfilled Treasure Flask DMG', '190.8%', 2
        where exists (select 1 from skills where id = 11242 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11242 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11242, 'Filled Treasure Flask DMG', '212.0%', 3
        where exists (select 1 from skills where id = 11242 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11242 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11242, 'Treasure Flask Duration', '20.0s', 4
        where exists (select 1 from skills where id = 11242 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11242 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11242, 'Meowball DMG', '128.0%', 5
        where exists (select 1 from skills where id = 11242 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11242 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11242, 'CD', '15.0s', 6
        where exists (select 1 from skills where id = 11242 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11242 and position = 6);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000124 order by id limit 1), 11242, 1, true, false, '', false
      where exists (select 1 from skills where id = 11242 and character_id = 10000124)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11245, 10000124, 'Hidden Aces: Seven Tools of the Hunter', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/692f7dca/91a01f6036d591562b9ec65e099a62bb.png', 1, 'Time to reveal those pocket aces! Jahoda retrieves 2 {LINK#N11240002}<color=#FFD780FF>Purrsonal Coordinated Assistance Robots</color>{/LINK} and deals a single instance of <color=#80FFD7FF>Anemo DMG</color> to nearby opponents.\n\n<i>"Coordinated assistance? It means you ''assist'' some Mora our way, and we handle the ''coordination.'' Makes purrfect sense, don''t you agree?"</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11245, 'Skill DMG', '207.2%', 1
        where exists (select 1 from skills where id = 11245 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11245 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11245, 'Purrsonal Coordinated Assistance Robot DMG', '17.3%', 2
        where exists (select 1 from skills where id = 11245 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11245 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11245, 'Purrsonal Coordinated Assistance Robot Duration', '12.0s', 3
        where exists (select 1 from skills where id = 11245 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11245 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11245, 'Purrsonal Coordinated Assistance Robot Healing', '79.9% ATK+501', 4
        where exists (select 1 from skills where id = 11245 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11245 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11245, 'Lowest HP Character Additional Healing', '30.7% ATK+193', 5
        where exists (select 1 from skills where id = 11245 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11245 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11245, 'CD', '18.0s', 6
        where exists (select 1 from skills where id = 11245 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11245 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11245, 'Energy Cost', '70', 7
        where exists (select 1 from skills where id = 11245 and character_id = 10000124) and not exists (select 1 from skill_affixes where skill_id = 11245 and position = 7);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000124 order by id limit 1), 11245, 1, true, false, '', false
      where exists (select 1 from skills where id = 11245 and character_id = 10000124)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (12421, 10000124, 'Plan to Get Paid', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/692f7dcc/cb69324610e8365e5fd9aa5130d066bf.png', 2, 'When your team has at least one <color=#FF9999FF>Pyro</color>, <color=#80C0FFFF>Hydro</color>, <color=#FFACFFFF>Electro</color>, or <color=#99FFFFFF>Cryo</color> character, the {LINK#N11240002}<color=#FFD780FF>Purrsonal Coordinated Assistance Robots</color>{/LINK} from the Elemental Burst <color=#FFD780FF>Hidden Aces: Seven Tools of the Hunter</color> will be enhanced based on the number of characters of each corresponding element.\nJahoda secretly keeps track of these characters. Among them, the element with the highest number of characters determines the enhancement effect:\n· <color=#FF9999FF>Pyro</color>: <color=#FFD780FF>Purrsonal Coordinated Assistance Robots</color> deal 130% of their original DMG.\n· <color=#80C0FFFF>Hydro</color>: <color=#FFD780FF>Purrsonal Coordinated Assistance Robots</color> heal for 120% of their original healing amount.\n· <color=#FFACFFFF>Electro</color>: The number of <color=#FFD780FF>Purrsonal Coordinated Assistance Robots</color> increases by one.\n· <color=#99FFFFFF>Cryo</color>: The attack interval of <color=#FFD780FF>Purrsonal Coordinated Assistance Robots</color> is reduced by 10%.\n\nIf there''s a tie between elements, the order of priority that determines which enhancement takes effect is: <color=#FF9999FF>Pyro</color>, <color=#80C0FFFF>Hydro</color>, <color=#FFACFFFF>Electro</color>, then <color=#99FFFFFF>Cryo</color>. Only one elemental effect can initially be triggered.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000124 order by id limit 1), 12421, 1, false, false, '', false
      where exists (select 1 from skills where id = 12421 and character_id = 10000124)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (12422, 10000124, 'Sweet Berry Bounty', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/692f7dcc/8cdf277c74474138cbf46ae077427cc4.png', 2, 'When a {LINK#N11240002}<color=#FFD780FF>Purrsonal Coordinated Assistance Robot</color>{/LINK} from the Elemental Burst <color=#FFD780FF>Hidden Aces: Seven Tools of the Hunter</color> triggers healing on an active team member, if that character''s HP is above 70%, their Elemental Mastery will be increased by 100 for 6s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000124 order by id limit 1), 12422, 1, false, false, '', false
      where exists (select 1 from skills where id = 12422 and character_id = 10000124)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (12423, 10000124, 'Moonsign Benediction: Rooftop Dash', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/692f7dcc/5e0ef1dd19be875f367dc469bb07005f.png', 2, 'When Jahoda is in the party, the party''s <color=#FFD780FF>Moonsign</color> will increase by 1 level.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000124 order by id limit 1), 12423, 1, true, false, '', false
      where exists (select 1 from skills where id = 12423 and character_id = 10000124)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (12425, 10000124, 'Backstreet Guile', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/692f7dcc/32cae087592e733e78ccc346afe6796f.png', 2, 'When dispatched on an expedition in Nod-Krai, time consumed is reduced by 25%.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000124 order by id limit 1), 12425, 1, true, false, '', false
      where exists (select 1 from skills where id = 12425 and character_id = 10000124)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 2000, 'selected', '809', '645', '1454')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 20, 'selected', '5.0%', null, '5.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 2001, 'selected', '62', '49', '111')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 22, 'selected', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 2002, 'selected', '49', '25', '73')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 26, 'selected', '4.0%', null, '4.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 28, 'selected', '80', null, '80')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 44, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 23, 'selected', '136.0%', null, '136.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 2000, 'base', '809', '645', '1454')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 2001, 'base', '62', '49', '111')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 2002, 'base', '49', '25', '73')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 28, 'base', '80', null, '80')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 999999, 'base', '220', null, '220')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 20, 'extra', '5.0%', null, '5.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 22, 'extra', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 26, 'extra', '4.0%', null, '4.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 23, 'extra', '136.0%', null, '136.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000124 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
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
      values ((select id from character_builds where character_id = 10000124 order by id limit 1), 57442, 2100071, 1, 4, 0, 2, '645', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000124 order by id limit 1) and position = 1), 8, '15', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000124 order by id limit 1) and position = 1) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000124 order by id limit 1) and position = 1), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000124 order by id limit 1) and position = 1) and property_type_id = 5);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59321, 'Exile''s Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/1738ca88f6afa4f1d645e8afb214a7ed.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000124 order by id limit 1), 59321, 2100091, 2, 3, 0, 5, '28', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000124 order by id limit 1) and position = 2), 6, '3.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000124 order by id limit 1) and position = 2) and property_type_id = 6);
insert into relic_sets (id, name) values (2100101, 'Adventurer') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100101, 2, 'Max HP increased by 1,000.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100101 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100101, 4, 'Opening a chest regenerates 30% Max HP over 5s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100101 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (60351, 'Adventurer''s Pocket Watch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/28990ea9a4bbd88bcc0585fd5132a622.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000124 order by id limit 1), 60351, 2100101, 3, 3, 0, 23, '5.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000124 order by id limit 1) and position = 3), 9, '4.4%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000124 order by id limit 1) and position = 3) and property_type_id = 9);
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57311, 'Instructor''s Tea Cup', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/43b58997aabfaf68f64bde7bfee0c957.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000124 order by id limit 1), 57311, 2100071, 4, 3, 0, 6, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000124 order by id limit 1) and position = 4), 8, '8', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000124 order by id limit 1) and position = 4) and property_type_id = 8);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59331, 'Exile''s Circlet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/22faf0f5c42ac3652ea2c4a1ca38ac05.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000124 order by id limit 1), 59331, 2100091, 5, 3, 0, 26, '4.0%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000124 order by id limit 1) and position = 5), 23, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000124 order by id limit 1) and position = 5) and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000124, 'sand', 23
          where not exists (select 1 from character_relic_recommendations where character_id = 10000124 and slot = 'sand' and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000124, 'goblet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000124 and slot = 'goblet' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000124, 'circlet', 26
          where not exists (select 1 from character_relic_recommendations where character_id = 10000124 and slot = 'circlet' and property_type_id = 26);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000124, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000124 and property_type_id = 6);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000124, 23
        where not exists (select 1 from character_recommended_substats where character_id = 10000124 and property_type_id = 23);

-- Iansan (10000110)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000110, 'Iansan', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67e3357c/f44e8b4c7a61a4abb2aa2ccfe9b810cd.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/6c1bec1d5467accd7e4482cf0e1d6238.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67e335b6/b50190b648e39cc559d34dcacbdfb769.png', 'Electro', 4, 13)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000110, 1, 1, 0, false
    where not exists (select 1 from character_builds where character_id = 10000110);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (13303, 'Black Tassel', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/badaa063427a6e3f39d9c031b3dddc24.png', 13, 'Polearm', 3, 'An exceptionally powerful polearm that also offers a simple but elegant solution to the issue of the easily stained white tassel.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000110 order by id limit 1), 13303, 40, 2, 5)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1)), 4, 'main', null, null, 171
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1)), 3, 'sub', null, null, 26.3
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (1101, 10000110, 'Starting''s Never Easy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67e335b4/40793e3fe398c784c4f3cd44474fc081.png', 'When Iansan is in combat and is in the Nightsoul''s Blessing state, she will restore 15 Elemental Energy for every 6 Nightsoul points she consumes. This effect can trigger once every 18s.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000110 order by id limit 1), 1101, false, false, '', false
      where exists (select 1 from constellations where id = 1101 and character_id = 10000110)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1102, 10000110, 'Laziness is the Enemy!', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67e335b4/9fee1ce83f2b6822d592fe9a83d29326.png', 'When using the Elemental Burst <color=#FFD780FF>The Three Principles of Power</color>, Iansan will also gain the Precise Movement effect from her Ascension Talent "Enhanced Resistance Training" for 15s. Additionally, if Iansan is off-field while Precise Movement is active, she will also increase your current active character''s ATK by 30%. You must first unlock the Ascension Talent "Enhanced Resistance Training" to access the above effect.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000110 order by id limit 1), 1102, false, false, '', false
      where exists (select 1 from constellations where id = 1102 and character_id = 10000110)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1103, 10000110, 'Scientific Diet Planning', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67e335b4/74b1f3ab5abd59ace7dc61fa9ff9d710.png', 'Increases the Level of <color=#FFD780FF>Thunderbolt Rush</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000110 order by id limit 1), 1103, false, false, '', false
      where exists (select 1 from constellations where id = 1103 and character_id = 10000110)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1104, 10000110, 'Slow and Steady Wins the Race', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67e335b4/179a31270194149db86fca2b6f0693d7.png', 'When the Kinetic Energy Scale is present, Iansan will gain 2 stacks of Surging Force after your current active character (excluding herself) uses their Elemental Burst. The stacks last until the Scale leaves the field, and Surging Force can be gained once per Scale summoning. Whenever Iansan restores Nightsoul points via the Scale, she will consume 1 Surging Force stack and restore 4 additional Nightsoul points.\nAdditionally, if her Nightsoul restoration from the Scale overflows, Iansan will gain 50% of the overflow the next time she restores Nightsoul points via the Scale.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000110 order by id limit 1), 1104, false, false, '', false
      where exists (select 1 from constellations where id = 1104 and character_id = 10000110)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1105, 10000110, 'We Can Push It Further!', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67e335b4/d7fd7f0068397b251eb12432a943903d.png', 'Increases the Level of <color=#FFD780FF>The Three Principles of Power</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000110 order by id limit 1), 1105, false, false, '', false
      where exists (select 1 from constellations where id = 1105 and character_id = 10000110)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1106, 10000110, 'Teachings of the Collective of Plenty', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67e335b4/0c4895206b4219c7a929be6569dfd4a4.png', 'The Kinetic Energy Scale''s duration is increased by 3s.\nAdditionally, when Iansan triggers Nightsoul point restoration, if there is any overflow, she will gain the Extreme Force effect, which increases the DMG dealt by your current active character by 25% for 3s.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000110 order by id limit 1), 1106, false, false, '', false
      where exists (select 1 from constellations where id = 1106 and character_id = 10000110)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11101, 10000110, 'Weighted Spike', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/0a4af4ecb63b4741aa3e42d18a2a0c21.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 3 consecutive spear strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to lunge forward, dealing damage to opponents along the way.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.\n\n<color=#FFD780FF>Nightsoul State: Swift Stormflight</color>\nWhile in the Nightsoul''s Blessing state: Iansan''s Charged Attack will be transformed into the formidable Swift Stormflight, consuming a certain amount of Stamina to stomp fiercely down, dealing Nightsoul-aligned <color=#FFACFFFF>AoE Electro DMG</color>.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11101, '1-Hit DMG', '47.0%', 1
        where exists (select 1 from skills where id = 11101 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11101 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11101, '2-Hit DMG', '42.8%', 2
        where exists (select 1 from skills where id = 11101 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11101 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11101, '3-Hit DMG', '64.4%', 3
        where exists (select 1 from skills where id = 11101 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11101 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11101, 'Charged Attack DMG', '100.3%', 4
        where exists (select 1 from skills where id = 11101 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11101 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11101, 'Swift Stormflight DMG', '84.2%', 5
        where exists (select 1 from skills where id = 11101 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11101 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11101, 'Charged Attack & Swift Stormflight Stamina Cost', '25.0', 6
        where exists (select 1 from skills where id = 11101 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11101 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11101, 'Plunge DMG', '63.9%', 7
        where exists (select 1 from skills where id = 11101 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11101 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 11101, 'Low/High Plunge DMG', '128%/160%', 8
        where exists (select 1 from skills where id = 11101 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11101 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000110 order by id limit 1), 11101, 1, true, false, '', false
      where exists (select 1 from skills where id = 11101 and character_id = 10000110)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11102, 10000110, 'Thunderbolt Rush', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67e335b2/2a07295528287deae42dc65222840cb0.png', 1, 'Iansan charges forward a certain distance, dealing Nightsoul-aligned <color=#FFACFFFF>Electro DMG</color> to all opponents in her path.\nAfter this Skill is used, Iansan will regain 54 Nightsoul points and enter the Nightsoul''s Blessing state. Within 5s after this is done, using a Normal Attack will trigger 1 quick Swift Stormflight stomp from Iansan that will not consume Stamina.\n\n<color=#FFD780FF>Nightsoul''s Blessing: Iansan</color>\nContinuously consumes Nightsoul points. If she runs out, or uses this Skill again, her Nightsoul''s Blessing state will end. It has the following properties:\n· Increases Iansan''s Movement SPD.\n· Holding sprint will switch Iansan to Rushing Thunderbolt mode, greatly increasing her Movement SPD temporarily. In this mode, Iansan can make flying leaps using terrain, or consume additional Nightsoul points to move on water or liquid Phlogiston while being immune to DMG from the latter.\n\n<i>"Faster, stronger! That''s what all that hard work is for!"</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11102, 'Skill DMG', '286.4%', 1
        where exists (select 1 from skills where id = 11102 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11102 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11102, 'Nightsoul Point Limit', '54.0', 2
        where exists (select 1 from skills where id = 11102 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11102 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11102, 'CD', '16.0s', 3
        where exists (select 1 from skills where id = 11102 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11102 and position = 3);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000110 order by id limit 1), 11102, 1, true, false, '', false
      where exists (select 1 from skills where id = 11102 and character_id = 10000110)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11105, 10000110, 'The Three Principles of Power', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67e335b2/d9660071eae369087f0e2a3f9b2ba2fe.png', 1, 'Iansan''s stomping foot shatters the very earth with "Power," dealing Nightsoul-aligned <color=#FFACFFFF>AoE Electro DMG</color>. She then whips out her "Limited-Edition Kinetic Energy Scale (For Workouts)."\nWhen this Skill is used, Iansan will gain 15 Nightsoul points and enter the Nightsoul''s Blessing state.\nWhen the Kinetic Energy Scale leaves the field, Iansan''s Nightsoul''s Blessing state will end.\n\n<color=#FFD780FF>Kinetic Energy Scale</color>\nThe Kinetic Energy Scale will follow the character around, boosting the ATK of your current active party member in different ways based on Iansan''s Nightsoul points.\n· If Iansan has less than 42 Nightsoul points, the ATK bonus will be based on her Nightsoul points and ATK.\n· If Iansan has at least 42 Nightsoul points, the Kinetic Energy Scale will switch to the "Ardent Support!" state, in which the ATK bonus will be stronger and based on her ATK alone.\nAdditionally, the Scale will log the distance your current active character (excluding Iansan) has moved so long as it is active, restoring Nightsoul points to Iansan every second based on the distance moved in the previous second.\nThe Scale will disappear once her Nightsoul''s Blessing state ends. It will also disappear after 1 second when you are not in a state of combat. While it is active, Iansan''s Nightsoul''s Blessing state will not end even if she is not on the field.\n\n<i>"Power is not about natural talent. Power stems from unceasing practice. Power must be exercised correctly."</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11105, 'Skill DMG', '430.4%', 1
        where exists (select 1 from skills where id = 11105 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11105 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11105, 'High Nightsoul Points ATK Conversion Rate', '27% ATK', 2
        where exists (select 1 from skills where id = 11105 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11105 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11105, 'Low Nightsoul Points ATK Conversion Rate', '0.5% ATK / Nightsoul Point', 3
        where exists (select 1 from skills where id = 11105 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11105 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11105, 'Max ATK Bonus', '330.0', 4
        where exists (select 1 from skills where id = 11105 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11105 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11105, 'Duration', '12.0s', 5
        where exists (select 1 from skills where id = 11105 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11105 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11105, 'Non-Combat State Duration', '1.0s', 6
        where exists (select 1 from skills where id = 11105 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11105 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11105, 'CD', '18.0s', 7
        where exists (select 1 from skills where id = 11105 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11105 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 11105, 'Energy Cost', '70', 8
        where exists (select 1 from skills where id = 11105 and character_id = 10000110) and not exists (select 1 from skill_affixes where skill_id = 11105 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000110 order by id limit 1), 11105, 1, true, false, '', false
      where exists (select 1 from skills where id = 11105 and character_id = 10000110)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11021, 10000110, 'Enhanced Resistance Training', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67e335b4/53b1ec949df4b20d26ef183422a58677.png', 2, 'After Swift Stormflight hits opponents, Iansan will gain the Precise Movement effect for 15s.\nDuring this time, her ATK is increased by 20%, and whenever she regains Nightsoul points through the Kinetic Energy Scale in her Elemental Burst, <color=#FFD780FF>The Three Principles of Power</color>, she will gain 1 extra Nightsoul point. Additionally, when your current active party member consumes or restores Nightsoul points, the extra Nightsoul points Iansan gains the next time she restores Nightsoul points via the Scale will be increased to 4. This effect can occur once every 2.8s.\n"Precise Movement" will expire when Iansan''s Nightsoul''s Blessing state ends.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000110 order by id limit 1), 11021, 1, false, false, '', false
      where exists (select 1 from skills where id = 11021 and character_id = 10000110)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11022, 10000110, 'Kinetic Energy Gradient Test', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67e335b4/b2e4448b6eacb76158498efed7a9df6e.png', 2, 'When a nearby party member triggers a Nightsoul Burst, Iansan will obtain the Warming Up effect for 10s.\nDuring this time, when Iansan restores at least 1 Nightsoul point, she will heal your current active character for 60% of her ATK. This effect can be triggered once every 2.8s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000110 order by id limit 1), 11022, 1, false, false, '', false
      where exists (select 1 from skills where id = 11022 and character_id = 10000110)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11023, 10000110, 'Night Realm''s Gift: Hard Work and Drive', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67e335b4/404d7f48c27a5f4b0103e209d7589fef.png', 2, 'After Nightsoul points have been fully depleted and Iansan is on the field, she will switch to using Phlogiston to maintain her Nightsoul''s Blessing.\nWhile in an area with Phlogiston Mechanics within Natlan, Nightsoul Transmission: Iansan can be used. When the current active character is sprinting or in movement modes caused by certain Talents, or at a certain height in the air, switching to Iansan will trigger the following: Iansan enters the Nightsoul''s Blessing state and obtains 25 Nightsoul points. Nightsoul Transmission can be triggered once every 10s by your own party.\nWhile in an area with Phlogiston Mechanics within Natlan, Iansan will not take fall DMG when using terrain differences to make leaps.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000110 order by id limit 1), 11023, 1, true, false, '', false
      where exists (select 1 from skills where id = 11023 and character_id = 10000110)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11025, 10000110, 'Caloric Balancing Plan', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67e335b4/769cc6ab06778a841e6e011ddbb7d793.png', 2, 'While in an area with Phlogiston Mechanics within Natlan, regain 10 Phlogiston when Phlogiston levels drop below 50%. This can occur once every 10s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000110 order by id limit 1), 11025, 1, true, false, '', false
      where exists (select 1 from skills where id = 11025 and character_id = 10000110)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 2000, 'selected', '894', '919', '1813')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 20, 'selected', '17.0%', null, '17.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 2001, 'selected', '192', '73', '265')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 22, 'selected', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 2002, 'selected', '54', '4', '58')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 28, 'selected', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 41, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 23, 'selected', '103.5%', null, '103.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 2000, 'base', '894', '919', '1813')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 2001, 'base', '192', '73', '265')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 2002, 'base', '54', '4', '58')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 28, 'base', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 20, 'extra', '17.0%', null, '17.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 22, 'extra', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 23, 'extra', '103.5%', null, '103.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000110 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55342, 'Berserker''s Rose', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/105fbe95a8b020b587d75387e5d84854.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000110 order by id limit 1), 55342, 2100051, 1, 3, 0, 2, '430', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1) and position = 1), 6, '2.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1) and position = 1) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1) and position = 1), 5, '9', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1) and position = 1) and property_type_id = 5);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59322, 'Exile''s Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/1738ca88f6afa4f1d645e8afb214a7ed.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000110 order by id limit 1), 59322, 2100091, 2, 3, 0, 5, '28', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1) and position = 2), 23, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1) and position = 2) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1) and position = 2), 9, '4.4%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1) and position = 2) and property_type_id = 9);
insert into relic_sets (id, name) values (2100111, 'Lucky Dog') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100111, 2, 'DEF increased by 100.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100111 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100111, 4, 'Picking up Mora restores 300 HP.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100111 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (61351, 'Lucky Dog''s Hourglass', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/37dc36c2262a6f6572f212d83aac99e5.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000110 order by id limit 1), 61351, 2100111, 3, 3, 0, 6, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1) and position = 3), 3, '2.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1) and position = 3) and property_type_id = 3);
insert into relic_sets (id, name) values (2100131, 'Traveling Doctor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100131, 2, 'Increases incoming healing by 20%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100131 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100131, 4, 'Using Elemental Burst restores 20% HP.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100131 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (63312, 'Traveling Doctor''s Medicine Pot', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/aea9c1751e0e454042c67703102cb0d8.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000110 order by id limit 1), 63312, 2100131, 4, 3, 0, 6, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1) and position = 4), 9, '3.9%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1) and position = 4) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1) and position = 4), 2, '115', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1) and position = 4) and property_type_id = 2);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55331, 'Berserker''s Battle Mask', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/ab750706998dc9d99ed2067a722f9c52.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000110 order by id limit 1), 55331, 2100051, 5, 3, 0, 6, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1) and position = 5), 2, '115', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000110 order by id limit 1) and position = 5) and property_type_id = 2);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000110, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000110 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000110, 'goblet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000110 and slot = 'goblet' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000110, 'circlet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000110 and slot = 'circlet' and property_type_id = 6);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000110, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000110 and property_type_id = 6);

-- Kachina (10000100)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000100, 'Kachina', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/2c4b6f3e78da44cbe10f9cbc37a50fe1.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/edfc5dbf65ee36356f9e2f64b5c171f6.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/06daf41434926868981682a72bf6e82f.png', 'Geo', 4, 13)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000100, 1, 1, 0, false
    where not exists (select 1 from character_builds where character_id = 10000100);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (13303, 'Black Tassel', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/badaa063427a6e3f39d9c031b3dddc24.png', 13, 'Polearm', 3, 'An exceptionally powerful polearm that also offers a simple but elegant solution to the issue of the easily stained white tassel.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000100 order by id limit 1), 13303, 1, 0, 5)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1)), 4, 'main', null, null, 38
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1)), 3, 'sub', null, null, 10.2
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (1001, 10000100, 'Shards Are Gems Too', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/bd02712ca3805427749aff8b5b0fc4a0.png', 'When Kachina mounts or dismounts <color=#FFD780FF>Turbo Twirly</color>, she will absorb nearby Elemental Shards created by Crystallize.\nAdditionally, when a party member picks up such a Shard, or triggers Lunar-Crystallize reactions, 3 Energy will be restored to Kachina. Energy can be restored this way once every 5s.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000100 order by id limit 1), 1001, false, false, '', false
      where exists (select 1 from constellations where id = 1001 and character_id = 10000100)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1002, 10000100, 'Never Leave Home Without... Turbo Twirly', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/2c6675526eb1db45a621eddea48a396c.png', 'When Kachina uses <color=#FFD780FF>"Time to Get Serious!"</color>, she will regain 20 Nightsoul points. If there is no <color=#FFD780FF>Turbo Twirly</color> belonging to her on the field, she will enter Nightsoul''s Blessing and summon one.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000100 order by id limit 1), 1002, false, false, '', false
      where exists (select 1 from constellations where id = 1002 and character_id = 10000100)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1003, 10000100, 'Improved Stabilizer', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/2a56d120577780ed4a2fca88015c1ce2.png', 'Increases the Level of <color=#FFD780FF>Go, Go Turbo Twirly!</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000100 order by id limit 1), 1003, false, false, '', false
      where exists (select 1 from constellations where id = 1003 and character_id = 10000100)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1004, 10000100, 'More Foes, More Caution', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/47ed9df8983a7ef6fb9da98e517688a0.png', 'When there are 1/2/3/4 (or more) opponents within the Turbo Drill Field created by <color=#FFD780FF>"Time to Get Serious!"</color>, the active character within the field gains 8%/12%/16%/20% increased DEF.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000100 order by id limit 1), 1004, false, false, '', false
      where exists (select 1 from constellations where id = 1004 and character_id = 10000100)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1005, 10000100, 'All I''ve Collected Till Now', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/94691851f9dc0dc8763d6c7612a96712.png', 'Increases the Level of <color=#FFD780FF>Time to Get Serious!</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000100 order by id limit 1), 1005, false, false, '', false
      where exists (select 1 from constellations where id = 1005 and character_id = 10000100)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1006, 10000100, 'This Time, I''ve Gotta Win', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/f525247a5b22173845f2b881b874b220.png', 'When your active character''s Shield is replaced or destroyed for any reason, Kachina will deal 200% of her DEF as <color=#FFE699FF>AoE Geo DMG</color>. This effect can be triggered once every 5s.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000100 order by id limit 1), 1006, false, false, '', false
      where exists (select 1 from constellations where id = 1006 and character_id = 10000100)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11001, 10000100, 'Cragbiter', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/0a4af4ecb63b4741aa3e42d18a2a0c21.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 4 consecutive spear strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to lunge forward, dealing damage to opponents along the way.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11001, '1-Hit DMG', '49.4%', 1
        where exists (select 1 from skills where id = 11001 and character_id = 10000100) and not exists (select 1 from skill_affixes where skill_id = 11001 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11001, '2-Hit DMG', '27.6%+30.6%', 2
        where exists (select 1 from skills where id = 11001 and character_id = 10000100) and not exists (select 1 from skill_affixes where skill_id = 11001 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11001, '3-Hit DMG', '70.4%', 3
        where exists (select 1 from skills where id = 11001 and character_id = 10000100) and not exists (select 1 from skill_affixes where skill_id = 11001 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11001, '4-Hit DMG', '77.4%', 4
        where exists (select 1 from skills where id = 11001 and character_id = 10000100) and not exists (select 1 from skill_affixes where skill_id = 11001 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11001, 'Charged Attack DMG', '112.7%', 5
        where exists (select 1 from skills where id = 11001 and character_id = 10000100) and not exists (select 1 from skill_affixes where skill_id = 11001 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11001, 'Charged Attack Stamina Cost', '25.0', 6
        where exists (select 1 from skills where id = 11001 and character_id = 10000100) and not exists (select 1 from skill_affixes where skill_id = 11001 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11001, 'Plunge DMG', '63.9%', 7
        where exists (select 1 from skills where id = 11001 and character_id = 10000100) and not exists (select 1 from skill_affixes where skill_id = 11001 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 11001, 'Low/High Plunge DMG', '128%/160%', 8
        where exists (select 1 from skills where id = 11001 and character_id = 10000100) and not exists (select 1 from skill_affixes where skill_id = 11001 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000100 order by id limit 1), 11001, 1, true, false, '', false
      where exists (select 1 from skills where id = 11001 and character_id = 10000100)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11002, 10000100, 'Go, Go Turbo Twirly!', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/06f4b330b99a38aeb73b3ea2ce7e2d99.png', 1, 'Fight alongside the turbo trusty Turbo Twirly!\nSummons Turbo Twirly. When the skill is Held and released, Kachina will summon and ride Turbo Twirly.\nAfter the Skill is used, Kachina will gain 60 Nightsoul points and enter the Nightsoul''s Blessing state.\n\n<color=#FFD780FF>Nightsoul''s Blessing: Kachina</color>\nTurbo Twirly''s various actions consume Kachina''s Nightsoul points.\nThe Nightsoul''s Blessing state will end when these points have been depleted.\n\n<color=#FFD780FF>Turbo Twirly</color>\nCan exist independently or be ridden and operated by Kachina. When Turbo Twirly is present, Kachina''s Elemental Skill, "Go, Go Turbo Twirly!", will change to an option to Mount/Dismount Turbo Twirly.\n·When present independent of Kachina, it will slam the ground at intervals, dealing Nightsoul-aligned <color=#FFE699FF>AoE Geo DMG</color> based on Kachina''s DEF.\n·When Kachina is riding Turbo Twirly, she can control it to move and climb swiftly, and use Normal Attacks to slam the ground, dealing Nightsoul-aligned <color=#FFE699FF>AoE Geo DMG</color> based on Kachina''s DEF.\n\nTurbo Twirly will disappear once Kachina''s Nightsoul''s Blessing state ends, and it is considered a Geo Construct. Only 1 Turbo Twirly created by Kachina herself can exist on the field at any one time.\n\n<i>Turbo Twirly only looks like a top — it is, in fact, a drill that can split even the strongest rock asunder!</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11002, 'Turbo Twirly Mounted DMG', '87.8% DEF', 1
        where exists (select 1 from skills where id = 11002 and character_id = 10000100) and not exists (select 1 from skill_affixes where skill_id = 11002 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11002, 'Turbo Twirly Independent DMG', '63.8% DEF', 2
        where exists (select 1 from skills where id = 11002 and character_id = 10000100) and not exists (select 1 from skill_affixes where skill_id = 11002 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11002, 'Nightsoul Point Limit', '60.0', 3
        where exists (select 1 from skills where id = 11002 and character_id = 10000100) and not exists (select 1 from skill_affixes where skill_id = 11002 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11002, 'CD', '20.0s', 4
        where exists (select 1 from skills where id = 11002 and character_id = 10000100) and not exists (select 1 from skill_affixes where skill_id = 11002 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000100 order by id limit 1), 11002, 1, true, false, '', false
      where exists (select 1 from skills where id = 11002 and character_id = 10000100)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11005, 10000100, 'Time to Get Serious!', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3a5feaa81ac1f3b08921255bcbb9437e.png', 1, 'Striking the ground, Kachina deals <color=#FFE699FF>AoE Geo DMG</color> based on her DEF and creates a Turbo Drill Field.\nThe Field increases Turbo Twirly''s attack AoE and its Movement SPD when Kachina is riding it.\n\nIf Kachina''s own Turbo Twirly is present when this is used, the Turbo Twirly will be summoned to her side.\n\n<i>Just as nervous performers might imagine audience members as wooden puppets, Kachina imagines that her opponents are the loveliest of gem-bearing ores — the kind you''d be proud to bring home and hoard.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11005, 'Skill DMG', '380.6% DEF', 1
        where exists (select 1 from skills where id = 11005 and character_id = 10000100) and not exists (select 1 from skill_affixes where skill_id = 11005 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11005, 'Field Duration', '12.0s', 2
        where exists (select 1 from skills where id = 11005 and character_id = 10000100) and not exists (select 1 from skill_affixes where skill_id = 11005 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11005, 'CD', '18.0s', 3
        where exists (select 1 from skills where id = 11005 and character_id = 10000100) and not exists (select 1 from skill_affixes where skill_id = 11005 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11005, 'Energy Cost', '70', 4
        where exists (select 1 from skills where id = 11005 and character_id = 10000100) and not exists (select 1 from skill_affixes where skill_id = 11005 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000100 order by id limit 1), 11005, 1, true, false, '', false
      where exists (select 1 from skills where id = 11005 and character_id = 10000100)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10021, 10000100, 'Mountain Echoes', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/960512f2cdc8eb185ec4d8f20eef5633.png', 2, 'After nearby party members trigger a Nightsoul Burst, Kachina''s <color=#FFE699FF>Geo DMG Bonus</color> increases by 20% for 12s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000100 order by id limit 1), 10021, 1, false, false, '', false
      where exists (select 1 from skills where id = 10021 and character_id = 10000100)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10022, 10000100, 'The Weight of Stone', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/edc391b7aa5eff47aa9a36ef30e3c28e.png', 2, '<color=#FFD780FF>Turbo Twirly</color>''s DMG is increased by 20% of Kachina''s DEF.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000100 order by id limit 1), 10022, 1, false, false, '', false
      where exists (select 1 from skills where id = 10022 and character_id = 10000100)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10023, 10000100, 'Night Realm''s Gift: Heart of Unity', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/011e40b06dc145c0d097b6f171dd9fbf.png', 2, 'After her Nightsoul points are depleted, Kachina will switch to consuming Phlogiston to maintain her Nightsoul''s Blessing.\nWhile in an area with Phlogiston Mechanics within Natlan, she can use Nightsoul Transmission: Kachina. When the active character is currently sprinting, climbing, in a movement mode caused by certain Talents, or at a certain height in the air, the following will trigger when switching to Kachina: Kachina will enter the Nightsoul''s Blessing state and ride <color=#FFD780FF>Turbo Twirly</color> when taking the field while gaining 30 Nightsoul points. Nightsoul Transmission can be triggered once every 10s by your own team.\n\nAdditionally, while in Natlan, Kachina will consume 90% less Stamina when climbing while riding <color=#FFD780FF>Turbo Twirly</color>.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000100 order by id limit 1), 10023, 1, true, false, '', false
      where exists (select 1 from skills where id = 10023 and character_id = 10000100)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10025, 10000100, 'Boon of Crystal Flame', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4ff353d0b704ef85522fb520f554204d.png', 2, 'While in an area with Phlogiston Mechanics within Natlan, 20 Stamina will be restored when interacting with some harvestable items. Additionally, the location of nearby <color=#FFD780FF>resources unique to Natlan</color> will appear on your mini-map.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000100 order by id limit 1), 10025, 1, true, false, '', false
      where exists (select 1 from skills where id = 10025 and character_id = 10000100)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 2000, 'selected', '989', '3028', '4017')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 20, 'selected', '20.5%', null, '20.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 2001, 'selected', '56', '217', '273')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 22, 'selected', '83.4%', null, '83.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 2002, 'selected', '66', '64', '130')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 28, 'selected', '27', null, '27')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 45, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 23, 'selected', '129.8%', null, '129.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 2000, 'base', '989', '3028', '4017')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 2001, 'base', '56', '217', '273')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 2002, 'base', '66', '64', '130')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 28, 'base', '27', null, '27')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 20, 'extra', '20.5%', null, '20.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 22, 'extra', '83.4%', null, '83.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 23, 'extra', '129.8%', null, '129.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000100 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
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
      values ((select id from character_builds where character_id = 10000100 order by id limit 1), 59442, 2100091, 1, 4, 12, 2, '2839', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 1), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 1) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 1), 5, '12', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 1) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 1), 23, '9.8%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 1) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 1), 22, '5.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 1) and property_type_id = 22);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59422, 'Exile''s Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/1738ca88f6afa4f1d645e8afb214a7ed.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000100 order by id limit 1), 59422, 2100091, 2, 4, 12, 5, '185', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 2), 6, '8.4%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 2) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 2), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 2) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 2), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 2) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 2), 28, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 2) and property_type_id = 28);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55452, 'Berserker''s Timepiece', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/72514ea9341bf0db03079d0c02ef78b2.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000100 order by id limit 1), 55452, 2100051, 3, 4, 0, 9, '7.9%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 3), 3, '4.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 3) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 3), 22, '5.0%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 3) and property_type_id = 22);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48513, 'Foundryman''s Magnanimity', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/18d9f6208daf36d98d1a5f2ede22bc6b.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000100 order by id limit 1), 48513, 2150481, 4, 5, 0, 9, '8.7%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 4), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 4) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 4), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 4), 20, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 4) and property_type_id = 20);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55331, 'Berserker''s Battle Mask', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/ab750706998dc9d99ed2067a722f9c52.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000100 order by id limit 1), 55331, 2100051, 5, 3, 8, 22, '22.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 5), 28, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 5) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 5), 9, '4.4%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 5) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 5), 6, '2.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000100 order by id limit 1) and position = 5) and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000100, 'sand', 9
          where not exists (select 1 from character_relic_recommendations where character_id = 10000100 and slot = 'sand' and property_type_id = 9);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000100, 'goblet', 45
          where not exists (select 1 from character_relic_recommendations where character_id = 10000100 and slot = 'goblet' and property_type_id = 45);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000100, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 10000100 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000100, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000100 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000100, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000100 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000100, 9
        where not exists (select 1 from character_recommended_substats where character_id = 10000100 and property_type_id = 9);

commit;
