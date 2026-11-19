-- Part 4 of 13. Generated from app/data/character_detail.ts.
-- Insert-only and safe to re-run. Run the parts in order in the Supabase SQL editor.
begin;

-- Skirk (10000114)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000114, 'Skirk', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f37b/b3007bcbb99dd9b47af558ecc1bb65ff.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/673d0b8c4578936ace905c344d828f45.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c2/0fa95a8f72a1bae43275808caaf298c0.png', 'Cryo', 5, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000114, 70, 1, 0, true
    where not exists (select 1 from character_builds where character_id = 10000114);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11517, 'Azurelight', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f37b/2b47d934eb09f3926908c37462569291.png', 1, 'Sword', 5, 'This blade was once pure and pristine as a white dawn star, but it has since been tinted a deep, dark blue.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000114 order by id limit 1), 11517, 80, 5, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1)), 4, 'main', null, null, 590
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1)), 20, 'sub', null, null, 20.1
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (1141, 10000114, 'Far to Fall', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c1/7def8edfe9710704048404f717a31884.png', 'Enhances the effects of the Ascension Talent {LINK#N11130007}<color=#FFD780FF>Reason Beyond Reason</color>{/LINK}: Every Void Rift absorbed will summon a crystal blade to attack nearby opponents, dealing 500% of Skirk''s ATK as <color=#99FFFFFF>Cryo DMG</color>. This DMG is considered Charged Attack DMG.\nYou must first unlock the Ascension Talent Reason Beyond Reason.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000114 order by id limit 1), 1141, false, false, '', false
      where exists (select 1 from constellations where id = 1141 and character_id = 10000114)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1142, 10000114, 'Into the Abyss', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c1/88f08da906a2c36e4f9325904e908534.png', 'After unleashing her Elemental Skill <color=#FFD780FF>Havoc: Warp</color>, Skirk will gain 10 additional {LINK#N11130005}<color=#FFD780FF>Serpent''s Subtlety</color>{/LINK} points.\nWhen using her Elemental Burst <color=#FFD780FF>Havoc: Ruin</color>, the DMG of this Elemental Burst instance will be increased by taking up to 10 more Serpent''s Subtlety points into account.\nAdditionally, within 12.5s after Skirk unleashes the special Elemental Burst <color=#FFD780FF>Havoc: Extinction</color> while in her {LINK#N11130006}<color=#FFD780FF>Seven-Phase Flash</color>{/LINK} mode, her ATK is increased by 70%. This effect will be canceled when she leaves the Seven-Phase Flash mode.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000114 order by id limit 1), 1142, false, false, '', false
      where exists (select 1 from constellations where id = 1142 and character_id = 10000114)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1143, 10000114, 'Serendipitous Sin', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c1/87a014c0c8927495a94aaa2cb6d83665.png', 'Increases the Level of {LINK#S11145}<color=#FFD780FF>Havoc: Ruin</color>{/LINK} by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000114 order by id limit 1), 1143, false, false, '', false
      where exists (select 1 from constellations where id = 1143 and character_id = 10000114)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1144, 10000114, 'Fractured Flow', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c1/b4b735a9d509de8d7c81287cac5a8d13.png', 'Enhances the effects of the Ascension Talent {LINK#N11130008}<color=#FFD780FF>Return to Oblivion</color>{/LINK}: Each Death''s Crossing stack also increases Skirk''s ATK by 10%/20%/40%.\nYou must first unlock the Ascension Talent Return to Oblivion.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000114 order by id limit 1), 1144, false, false, '', false
      where exists (select 1 from constellations where id = 1144 and character_id = 10000114)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1145, 10000114, 'End of Wishes', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c1/3b53a7bf2fa5c22b2a900bc191cd8c17.png', 'Increases the Level of {LINK#S11142}<color=#FFD780FF>Havoc: Warp</color>{/LINK} by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000114 order by id limit 1), 1145, false, false, '', false
      where exists (select 1 from constellations where id = 1145 and character_id = 10000114)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1146, 10000114, 'To the Source', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c1/51737f1ed0ebd44cea2978f71d1129d5.png', 'Each Void Rift Skirk absorbs via the effects of the Ascension Talent {LINK#N11130007}<color=#FFD780FF>Reason Beyond Reason</color>{/LINK} will grant her 1 Havoc: Sever stack. She can consume such stacks to initiate coordinated attacks and decrease the DMG she takes while in {LINK#N11130006}<color=#FFD780FF>Seven-Phase Flash</color>{/LINK} mode. These stacks last for 15s, and each stack''s duration is counted independently (max 3 stacks).\nYou must first unlock the Ascension Talent "Reason Beyond Reason."\n\n<color=#FFD780FF>Havoc: Sever</color>\n· When Skirk uses the Elemental Burst <color=#FFD780FF>Havoc: Ruin</color>, she will consume all <color=#FFD780FF>Havoc: Sever</color> stacks to initiate a coordinated attack in which each <color=#FFD780FF>Havoc: Sever</color> stack will deal 750% of Skirk''s ATK as <color=#99FFFFFF>Cryo DMG</color>. This DMG is considered Elemental Burst DMG.\n· When she uses Normal Attacks while in Seven-Phase Flash mode, 1 <color=#FFD780FF>Havoc: Sever</color> stack will be consumed when her third or fifth sequenced attacks hit an opponent to launch 3 coordinated attacks. Each coordinated attack deals 180% of Skirk''s ATK as <color=#99FFFFFF>Cryo DMG</color>. This damage is considered Normal Attack DMG.\n· When Skirk takes DMG while in Seven-Phase Flash mode, 1 <color=#FFD780FF>Havoc: Sever</color> stack will be consumed to decrease this DMG instance by 80% and attack nearby opponents 3 times, with each attack dealing 180% of Skirk''s ATK as <color=#99FFFFFF>Cryo DMG</color>. This DMG is considered Charged Attack DMG.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000114 order by id limit 1), 1146, false, false, '', false
      where exists (select 1 from constellations where id = 1146 and character_id = 10000114)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11141, 10000114, 'Havoc: Sunder', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 consecutive attacks.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to hurl a spinning crystal spear, dealing DMG to opponents ahead.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11141, '1-Hit DMG', '54.5%', 1
        where exists (select 1 from skills where id = 11141 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11141 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11141, '2-Hit DMG', '49.8%', 2
        where exists (select 1 from skills where id = 11141 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11141 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11141, '3-Hit DMG', '32.4%+32.4%', 3
        where exists (select 1 from skills where id = 11141 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11141 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11141, '4-Hit DMG', '60.8%', 4
        where exists (select 1 from skills where id = 11141 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11141 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11141, '5-Hit DMG', '82.9%', 5
        where exists (select 1 from skills where id = 11141 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11141 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11141, 'Charged Attack DMG', '66.8%×2', 6
        where exists (select 1 from skills where id = 11141 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11141 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11141, 'Charged Attack Stamina Cost', '20.0', 7
        where exists (select 1 from skills where id = 11141 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11141 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 11141, 'Plunge DMG', '63.9%', 8
        where exists (select 1 from skills where id = 11141 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11141 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 11141, 'Low/High Plunge DMG', '128%/160%', 9
        where exists (select 1 from skills where id = 11141 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11141 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000114 order by id limit 1), 11141, 1, true, false, '', false
      where exists (select 1 from skills where id = 11141 and character_id = 10000114)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11142, 10000114, 'Havoc: Warp', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3bf/9ff9843045796b5cd4fa6a5eb4d8554a.png', 1, 'Imitates the combat style of "The Foul." Produces different effects depending on whether you Tap or Hold.\n\n<color=#FFD780FF>Tap</color>\nSkirk gains 45 {LINK#N11130005}<color=#FFD780FF>Serpent''s Subtlety</color>{/LINK} and switches to {LINK#N11130006}<color=#FFD780FF>Seven-Phase Flash</color>{/LINK} mode.\n\n<color=#FFD780FF>Hold</color>\nSkirk gains 45 Serpent''s Subtlety and will continuously move at high speed. Her interruption resistance is increased in this state.\nDuring this time, Skirk can control her movement direction and move atop water. She can also use this Skill again to end rapid movement prematurely.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11142, '1-Hit DMG', '132.8%', 1
        where exists (select 1 from skills where id = 11142 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11142 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11142, '2-Hit DMG', '119.8%', 2
        where exists (select 1 from skills where id = 11142 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11142 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11142, '3-Hit DMG', '75.7%+75.7%', 3
        where exists (select 1 from skills where id = 11142 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11142 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11142, '4-Hit DMG', '80.5%+80.5%', 4
        where exists (select 1 from skills where id = 11142 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11142 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11142, '5-Hit DMG', '196.6%', 5
        where exists (select 1 from skills where id = 11142 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11142 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11142, 'Charged Attack DMG', '44.5%×3', 6
        where exists (select 1 from skills where id = 11142 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11142 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11142, 'Charged Attack Stamina Cost', '20.0', 7
        where exists (select 1 from skills where id = 11142 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11142 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 11142, 'Plunge DMG', '63.9%', 8
        where exists (select 1 from skills where id = 11142 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11142 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 11142, 'Low/High Plunge DMG', '128%/160%', 9
        where exists (select 1 from skills where id = 11142 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11142 and position = 9);
insert into skill_affixes (skill_id, name, value, position)
        select 11142, 'Seven-Phase Flash Mode Duration', '12.5s', 10
        where exists (select 1 from skills where id = 11142 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11142 and position = 10);
insert into skill_affixes (skill_id, name, value, position)
        select 11142, 'Max Serpent''s Subtlety', '100.0', 11
        where exists (select 1 from skills where id = 11142 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11142 and position = 11);
insert into skill_affixes (skill_id, name, value, position)
        select 11142, 'CD', '8.0s', 12
        where exists (select 1 from skills where id = 11142 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11142 and position = 12);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000114 order by id limit 1), 11142, 1, true, false, '', false
      where exists (select 1 from skills where id = 11142 and character_id = 10000114)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11145, 10000114, 'Havoc: Ruin', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3bf/70d735422d33599f05089988a6363e27.png', 1, 'Skirk''s Elemental Burst is not reliant on Elemental Energy but instead on {LINK#N11130005}<color=#FFD780FF>Serpent''s Subtlety</color>{/LINK}.\nWhen Skirk has at least 50 Serpent''s Subtlety, she can expend all her Serpent''s Subtlety to unleash her Elemental Burst, ripping the space before her apart and using rapid consecutive slashes that deal <color=#99FFFFFF>AoE Cryo DMG</color>. At the same time, the DMG dealt by an instance of this Elemental Burst will be increased by every point of Serpent''s Subtlety over 50 when it is unleashed. Up to 12 points can be counted for this purpose.\n\nWhen Skirk is in {LINK#N11130006}<color=#FFD780FF>Seven-Phase Flash</color>{/LINK} mode, Havoc: Ruin will be replaced by Havoc: Extinction.\n\n<color=#FFD780FF>Havoc: Extinction</color>\nA special Elemental Burst that can be used even without consuming Serpent''s Subtlety.\nAfter using it, Skirk will gain the "All Shall Wither" effect, which will last until Seven-Phase Flash ends. After unlocking the Ascension Talent {LINK#N11130007}<color=#FFD780FF>Reason Beyond Reason</color>{/LINK}, she can also absorb nearby Void Rifts.\nWhile "All Shall Wither" is active, every 0.1s, after Skirk''s Normal Attack hits an opponent, that Normal Attack will deal increased DMG. If she absorbed any Void Rifts while using <color=#FFD780FF>Havoc: Extinction</color>, this Normal Attack''s DMG will be further increased based on the number of Rifts absorbed.\nThis effect will be canceled when it has triggered 10 times.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11145, 'Slash DMG', '122.8% ×5', 1
        where exists (select 1 from skills where id = 11145 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11145 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11145, 'Final Slash DMG', '204.6%', 2
        where exists (select 1 from skills where id = 11145 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11145 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11145, 'Serpent''s Subtlety Bonus', '19.32% ATK Per Point', 3
        where exists (select 1 from skills where id = 11145 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11145 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11145, '0/1/2/3 Void Rift Absorption DMG Bonus', '3.5%/6.6%/8.8%/11.0%', 4
        where exists (select 1 from skills where id = 11145 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11145 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11145, 'CD', '15.0s', 5
        where exists (select 1 from skills where id = 11145 and character_id = 10000114) and not exists (select 1 from skill_affixes where skill_id = 11145 and position = 5);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000114 order by id limit 1), 11145, 1, true, false, '', false
      where exists (select 1 from skills where id = 11145 and character_id = 10000114)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11421, 10000114, 'Reason Beyond Reason', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c1/b56aa7ef85e13c097d6953923aa87d96.png', 2, 'When nearby party members trigger Frozen, Superconduct, Stellar-Conduct, Cryo Swirl, Stellar Swirl, or Cryo Crystallize reactions against opponents, a Void Rift will be created near this opponent. This effect can be triggered once every 2.5s. 3 Void Rifts created by Skirk herself can exist on the field at once.\n\nSkirk can use the following methods to absorb nearby Void Rifts:\n· When she hits an opponent with a Charged Attack in her {LINK#N11130006}<color=#FFD780FF>Seven-Phase Flash</color>{/LINK} mode.\n· When she uses the special Elemental Burst <color=#FFD780FF>Havoc: Extinction</color> while in Seven-Phase Flash mode.\n· When she Holds her Elemental Skill <color=#FFD780FF>Havoc: Warp</color> to engage in rapid movement.\n\nEach Rift absorbed will grant her 8 {LINK#N11130005}<color=#FFD780FF>Serpent''s Subtlety</color>{/LINK} points.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000114 order by id limit 1), 11421, 1, true, false, '', false
      where exists (select 1 from skills where id = 11421 and character_id = 10000114)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11422, 10000114, 'Return to Oblivion', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c1/eaf53c80a7f65262701245e9ad9947ec.png', 2, 'When nearby <color=#80C0FFFF>Hydro</color> party members'' <color=#80C0FFFF>Hydro</color> attacks hit opponents, or when nearby <color=#99FFFFFF>Cryo</color> party members apart from Skirk hit opponents with <color=#99FFFFFF>Cryo</color> attacks, Skirk will gain the "Death''s Crossing" effect for 20s. Max 3 stacks, each stack''s duration is counted independently.\nEach character can grant Skirk at most 1 "Death''s Crossing" stack by this means.\nEach "Death''s Crossing" stack increases the Normal Attack DMG dealt by Skirk in {LINK#N11130006}<color=#FFD780FF>Seven-Phase Flash</color>{/LINK} mode to 110%/120%/170% of its original DMG and the DMG dealt when using her Elemental Burst <color=#FFD780FF>Havoc: Ruin</color> to 105%/115%/160% of its original DMG.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000114 order by id limit 1), 11422, 1, true, false, '', false
      where exists (select 1 from skills where id = 11422 and character_id = 10000114)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11423, 10000114, 'Mutual Weapons Mentorship', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6851f3c1/1e27b65add2560ef54602c0975e427a9.png', 2, 'When all party members are either <color=#80C0FFFF>Hydro</color> or <color=#99FFFFFF>Cryo</color>, and if there is at least 1 Hydro and 1 Cryo character, your own party members'' <color=#FFD780FF>Elemental Skill</color> Level is increased by 1.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000114 order by id limit 1), 11423, 1, true, false, '', false
      where exists (select 1 from skills where id = 11423 and character_id = 10000114)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 2000, 'selected', '9501', '2490', '11991')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 20, 'selected', '32.3%', null, '32.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 2001, 'selected', '864', '873', '1737')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 22, 'selected', '110.2%', null, '110.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 2002, 'selected', '617', '98', '715')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 28, 'selected', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 46, 'selected', '20.6%', null, '20.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 23, 'selected', '104.1%', null, '104.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 2000, 'base', '9501', '2490', '11991')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 2001, 'base', '864', '873', '1737')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 2002, 'base', '617', '98', '715')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 28, 'base', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 20, 'extra', '32.3%', null, '32.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 22, 'extra', '110.2%', null, '110.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 23, 'extra', '104.1%', null, '104.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 46, 'element', '20.6%', null, '20.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000114 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
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
      values ((select id from character_builds where character_id = 10000114 order by id limit 1), 48442, 2150481, 1, 4, 8, 2, '2108', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 1), 20, '2.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 1) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 1), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 1) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 1), 6, '4.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 1) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 1), 9, '4.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 1) and property_type_id = 9);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48423, 'Foundryman''s Observation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/6d43279928ae731e4199ff123ecd210e.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000114 order by id limit 1), 48423, 2150481, 2, 4, 8, 5, '137', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 2), 6, '7.9%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 2) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 2), 2, '215', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 2), 20, '2.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 2) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 2), 22, '5.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 2) and property_type_id = 22);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47452, 'Time Gifted Unto You', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/f378887dafcdfd8b72457765732a0828.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000114 order by id limit 1), 47452, 2150471, 3, 4, 11, 6, '25.9%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 3), 5, '11', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 3) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 3), 22, '5.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 3) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 3), 2, '167', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 3) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 3), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 3) and property_type_id = 8);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59412, 'Exile''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7847bfdeab60c072ec09b17462505cdc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000114 order by id limit 1), 59412, 2100091, 4, 4, 8, 46, '20.6%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 4), 6, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 4) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 4), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 4) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 4), 23, '4.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 4) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 4), 9, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 4) and property_type_id = 9);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47432, 'Testament to Your Faith', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/11eeed27d2d7fbb0ab34f03c87325688.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000114 order by id limit 1), 47432, 2150471, 5, 4, 9, 22, '29.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 5), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 5), 5, '11', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 5) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 5), 6, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 5) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 5), 20, '2.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000114 order by id limit 1) and position = 5) and property_type_id = 20);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000114, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000114 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000114, 'goblet', 46
          where not exists (select 1 from character_relic_recommendations where character_id = 10000114 and slot = 'goblet' and property_type_id = 46);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000114, 'circlet', 22
          where not exists (select 1 from character_relic_recommendations where character_id = 10000114 and slot = 'circlet' and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000114, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000114 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000114, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000114 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000114, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000114 and property_type_id = 6);

-- Jean (10000003)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000003, 'Jean', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/699e3449/eabf3af20320ed8dc3fed73ab11148cc.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/909badef56b2f351ec9c9f01bb4bbc81.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/2b3f14df19a146efe4295b2f0a55db8b.png', 'Anemo', 5, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000003, 70, 5, 0, true
    where not exists (select 1 from character_builds where character_id = 10000003);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11414, 'Amenoma Kageuchi', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/1aa93cbdddb0444e0eff47b3f84dc5d9.png', 1, 'Sword', 4, 'A blade custom made for a famed samurai who could strike down a tengu warrior, known for their incredible agility, in midair.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000003 order by id limit 1), 11414, 70, 4, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1)), 4, 'main', null, null, 347
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1)), 6, 'sub', null, null, 45.4
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (31, 10000003, 'Spiraling Tempest', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/6c707dc3d379de0c4d774905dffd35eb.png', 'Increases the pulling speed of <color=#FFD780FF>Gale Blade</color> after holding for more than 1s, and increases the DMG dealt by 40%.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000003 order by id limit 1), 31, false, false, '', false
      where exists (select 1 from constellations where id = 31 and character_id = 10000003)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (32, 10000003, 'People''s Aegis', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4b565e4306345ea8033801c4afd9922d.png', 'When Jean picks up an Elemental Orb/Particle, all party members have their Movement SPD and ATK SPD increased by 15% for 15s.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000003 order by id limit 1), 32, false, false, '', false
      where exists (select 1 from constellations where id = 32 and character_id = 10000003)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (33, 10000003, 'When the West Wind Arises', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/e184958f6d61100c47c1b82fceab52f7.png', 'Increases the Level of <color=#FFD780FF>Dandelion Breeze</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000003 order by id limit 1), 33, false, false, '', false
      where exists (select 1 from constellations where id = 33 and character_id = 10000003)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (34, 10000003, 'Lands of Dandelion', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/c6f3fdeaaf2f5a7e21f061bde1c05b89.png', 'Within the Field created by <color=#FFD780FF>Dandelion Breeze</color>, all opponents have their <color=#80FFD7FF>Anemo RES</color> decreased by 40%.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000003 order by id limit 1), 34, false, false, '', false
      where exists (select 1 from constellations where id = 34 and character_id = 10000003)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (35, 10000003, 'Outbursting Gust', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/cef2ee01ba53db39625fb52689b7e0e3.png', 'Increases the Level of <color=#FFD780FF>Gale Blade</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000003 order by id limit 1), 35, false, false, '', false
      where exists (select 1 from constellations where id = 35 and character_id = 10000003)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (36, 10000003, 'Lion''s Fang, Fair Protector of Mondstadt', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/a92446b784fdaf38f331154a32536f9f.png', 'Incoming DMG is decreased by 35% within the Field created by <color=#FFD780FF>Dandelion Breeze</color>. Upon leaving the Dandelion Field, this effect lasts for 3 attacks or 10s.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000003 order by id limit 1), 36, false, false, '', false
      where exists (select 1 from constellations where id = 36 and character_id = 10000003)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10031, 10000003, 'Favonius Bladework', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 consecutive strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of stamina to launch an opponent using the power of wind.\nLaunched opponents will slowly fall to the ground.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10031, '1-Hit DMG', '52.3%', 1
        where exists (select 1 from skills where id = 10031 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10031 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10031, '2-Hit DMG', '49.3%', 2
        where exists (select 1 from skills where id = 10031 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10031 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10031, '3-Hit DMG', '65.2%', 3
        where exists (select 1 from skills where id = 10031 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10031 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10031, '4-Hit DMG', '71.2%', 4
        where exists (select 1 from skills where id = 10031 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10031 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10031, '5-Hit DMG', '85.7%', 5
        where exists (select 1 from skills where id = 10031 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10031 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10031, 'Charged Attack DMG', '175%', 6
        where exists (select 1 from skills where id = 10031 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10031 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10031, 'Charged Attack Stamina Cost', '20.0', 7
        where exists (select 1 from skills where id = 10031 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10031 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10031, 'Plunge DMG', '69.1%', 8
        where exists (select 1 from skills where id = 10031 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10031 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10031, 'Low/High Plunge DMG', '138%/173%', 9
        where exists (select 1 from skills where id = 10031 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10031 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000003 order by id limit 1), 10031, 2, true, false, '', false
      where exists (select 1 from skills where id = 10031 and character_id = 10000003)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10033, 10000003, 'Gale Blade', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/413c48eed7c6e942431c0347bd38044d.png', 1, 'Focusing the might of the formless wind around her blade, Jean releases a miniature storm, launching opponents in the direction she aims at, dealing massive <color=#80FFD7FF>Anemo DMG</color>.\n\n<color=#FFD780FF>Hold</color>\nAt the cost of continued stamina consumption, Jean can command the whirlwind to pull surrounding opponents and objects towards her front.\nDirection can be adjusted.\nCharacter is immobile during skill duration.\n\n<i>That which follows Jean, the wholehearted defender, is a guardian wind that can banish danger from her comrades'' presence.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10033, 'Skill DMG', '336%', 1
        where exists (select 1 from skills where id = 10033 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10033 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10033, 'Stamina Consumption', '20.0/s', 2
        where exists (select 1 from skills where id = 10033 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10033 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10033, 'Max Duration', '5.0s', 3
        where exists (select 1 from skills where id = 10033 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10033 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10033, 'CD', '6.0s', 4
        where exists (select 1 from skills where id = 10033 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10033 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000003 order by id limit 1), 10033, 3, true, false, '', false
      where exists (select 1 from skills where id = 10033 and character_id = 10000003)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10034, 10000003, 'Dandelion Breeze', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/aade4fb5fd68dc40768af63445702357.png', 1, 'Calling upon the wind''s protection, Jean creates a swirling Dandelion Field, launching surrounding opponents and dealing <color=#80FFD7FF>Anemo DMG</color>.\nAt the same time, she instantly regenerates a large amount of HP for all party members. The amount of HP restored scales off Jean''s ATK.\n\n<color=#FFD780FF>Dandelion Field</color>\n·Continuously regenerates HP of characters within the AoE and continuously imbues them with <color=#80FFD7FF>Anemo</color>.\n·Deals <color=#80FFD7FF>Anemo DMG</color> to opponents entering or exiting the Dandelion Field.\n\n<i>Jean''s magnanimity is as vast as the dandelion fields, and it is the root of her wish to protect others.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10034, 'Burst DMG', '531%', 1
        where exists (select 1 from skills where id = 10034 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10034 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10034, 'Field Entering/Exiting DMG', '98.0%', 2
        where exists (select 1 from skills where id = 10034 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10034 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10034, 'Field Activation Healing', '314% ATK+2041', 3
        where exists (select 1 from skills where id = 10034 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10034 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10034, 'Continuous Regeneration', '31.40% ATK+204/s', 4
        where exists (select 1 from skills where id = 10034 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10034 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10034, 'CD', '20.0s', 5
        where exists (select 1 from skills where id = 10034 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10034 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10034, 'Energy Cost', '80', 6
        where exists (select 1 from skills where id = 10034 and character_id = 10000003) and not exists (select 1 from skill_affixes where skill_id = 10034 and position = 6);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000003 order by id limit 1), 10034, 4, true, false, '', false
      where exists (select 1 from skills where id = 10034 and character_id = 10000003)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (321, 10000003, 'Wind Companion', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/003113cd56857c4fe645674da3675520.png', 2, 'On hit, Jean''s Normal Attacks have a 50% chance to regenerate HP equal to 15% of Jean''s ATK for all party members.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000003 order by id limit 1), 321, 1, true, false, '', false
      where exists (select 1 from skills where id = 321 and character_id = 10000003)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (322, 10000003, 'Let the Wind Lead', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/a14a1f78d9a28568ff964bdb861320b8.png', 2, 'Using <color=#FFD780FF>Dandelion Breeze</color> will regenerate 20% of its Energy.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000003 order by id limit 1), 322, 1, true, false, '', false
      where exists (select 1 from skills where id = 322 and character_id = 10000003)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (323, 10000003, 'Guiding Breeze', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/ed691c709fb3d07a56a9534dc48537ec.png', 2, 'When a Perfect Cooking is achieved on a dish with restorative effects, there is a 12% chance to obtain double the product.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000003 order by id limit 1), 323, 1, true, false, '', false
      where exists (select 1 from skills where id = 323 and character_id = 10000003)
      on conflict do nothing;
insert into costumes (id, character_id, name, icon) values (200302, 10000003, 'Gunnhildr''s Legacy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_2/669181fe2f1544fcec9a8d833bca6974.png') on conflict do nothing;
insert into build_costumes (build_id, costume_id) values ((select id from character_builds where character_id = 10000003 order by id limit 1), 200302) on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 2000, 'selected', '11243', '4972', '16215')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 20, 'selected', '21.5%', null, '21.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 2001, 'selected', '530', '628', '1158')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 22, 'selected', '66.2%', null, '66.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 2002, 'selected', '588', '53', '641')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 26, 'selected', '11.1%', null, '11.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 28, 'selected', '30', null, '30')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 44, 'selected', '20.6%', null, '20.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 23, 'selected', '160.4%', null, '160.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 2000, 'base', '11243', '4972', '16215')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 2001, 'base', '530', '628', '1158')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 2002, 'base', '588', '53', '641')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 28, 'base', '30', null, '30')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 20, 'extra', '21.5%', null, '21.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 22, 'extra', '66.2%', null, '66.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 26, 'extra', '11.1%', null, '11.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 23, 'extra', '160.4%', null, '160.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 44, 'element', '20.6%', null, '20.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000003 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150021, 'Viridescent Venerer') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150021, 2, 'Anemo DMG Bonus +15%'
        where not exists (select 1 from relic_set_affixes where set_id = 2150021 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150021, 4, 'Increases Swirl reaction DMG dealt by 60%, and Stellar Swirl reaction DMG dealt by 20%. Decreases opponent''s Elemental RES to the element infused in the Swirl by 40% for 10s. Upon triggering a Stellar Swirl in the opponent, will also decrease their Cryo RES by 40%. RES debuffs of the same elemental type do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150021 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (76442, 'In Remembrance of Viridescent Fields', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/79119f6a441fc37f39b08f225d63034b.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000003 order by id limit 1), 76442, 2150021, 1, 4, 13, 2, '3022', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 1), 9, '5.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 1) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 1), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 1) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 1), 6, '4.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 1) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 1), 23, '8.3%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 1) and property_type_id = 23);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47422, 'Glory to Your Legacy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/f60c04735c5a36d349a2802b51e9b6fc.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000003 order by id limit 1), 47422, 2150471, 2, 4, 12, 5, '185', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 2), 22, '5.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 2) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 2), 23, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 2) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 2), 6, '7.0%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 2) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 2), 20, '2.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 2) and property_type_id = 20);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59453, 'Exile''s Pocket Watch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f9dd8d807eaa9ec5997b9c0e6f7cd48c.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000003 order by id limit 1), 59453, 2100091, 3, 4, 8, 23, '22.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 3), 2, '430', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 3) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 3), 22, '5.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 3) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 3), 28, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 3) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 3), 6, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 3) and property_type_id = 6);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59412, 'Exile''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7847bfdeab60c072ec09b17462505cdc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000003 order by id limit 1), 59412, 2100091, 4, 4, 8, 44, '20.6%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 4), 3, '4.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 4) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 4), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 4), 22, '5.0%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 4) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 4), 28, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 4) and property_type_id = 28);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47432, 'Testament to Your Faith', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/11eeed27d2d7fbb0ab34f03c87325688.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000003 order by id limit 1), 47432, 2150471, 5, 4, 8, 20, '13.7%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 5), 23, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 5) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 5), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 5), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 5) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 5), 5, '12', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000003 order by id limit 1) and position = 5) and property_type_id = 5);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000003, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000003 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000003, 'goblet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000003 and slot = 'goblet' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000003, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 10000003 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000003, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000003 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000003, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000003 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000003, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000003 and property_type_id = 6);

-- Keqing (10000042)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000042, 'Keqing', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/89d47da9c1ed3ade59b3c9f7fd00f1e8.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/e93402cd5088ae56d51de8bcc4e1d5d9.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/d12210590f6ba921bc3dc2a573c2f387.png', 'Electro', 5, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000042, 60, 1, 1, false
    where not exists (select 1 from character_builds where character_id = 10000042);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11405, 'Lion''s Roar', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/85dbd526e5a6d0f20af4d0253be63ac0.png', 1, 'Sword', 4, 'A sharp blade with extravagant carvings that somehow does not compromise on durability and sharpness. It roars like a lion as it cuts through the air.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000042 order by id limit 1), 11405, 60, 3, 3)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1)), 4, 'main', null, null, 327
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1)), 6, 'sub', null, null, 30.4
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (421, 10000042, 'Thundering Might', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/c7b7ffdf2dbe89edd546adc1fdfc9a9e.png', 'Recasting <color=#FFD780FF>Stellar Restoration</color> while a Lightning Stiletto is present causes Keqing to deal 50% of her ATK as <color=#FFACFFFF>AoE Electro DMG</color> at the start point and terminus of her Blink.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000042 order by id limit 1), 421, true, false, '', false
      where exists (select 1 from constellations where id = 421 and character_id = 10000042)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (422, 10000042, 'Keen Extraction', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/b1359e0dc4d754fc24a44ea842286721.png', 'When Keqing''s Normal and Charged Attacks hit opponents affected by <color=#FFACFFFF>Electro</color>, they have a 50% chance of producing an Elemental Particle.\nThis effect can only occur once every 5s.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000042 order by id limit 1), 422, false, false, '', false
      where exists (select 1 from constellations where id = 422 and character_id = 10000042)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (423, 10000042, 'Foreseen Reformation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4c2b0e279b847ee73e92706f715be0e1.png', 'Increases the Level of <color=#FFD780FF>Starward Sword</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000042 order by id limit 1), 423, false, false, '', false
      where exists (select 1 from constellations where id = 423 and character_id = 10000042)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (424, 10000042, 'Attunement', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/65f1e34dce51a5f01bf6b08c956393f3.png', 'For 10s after Keqing triggers an <color=#FFACFFFF>Electro-related Elemental Reaction</color>, her ATK is increased by 25%.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000042 order by id limit 1), 424, false, false, '', false
      where exists (select 1 from constellations where id = 424 and character_id = 10000042)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (425, 10000042, 'Beckoning Stars', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/6fb340a66d2709163a308696d4234c00.png', 'Increases the Level of <color=#FFD780FF>Stellar Restoration</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000042 order by id limit 1), 425, false, false, '', false
      where exists (select 1 from constellations where id = 425 and character_id = 10000042)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (426, 10000042, 'Tenacious Star', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/759b5e77937365a07cf804649e20fcad.png', 'When initiating a Normal Attack, a Charged Attack, Elemental Skill or Elemental Burst, Keqing gains a 6% <color=#FFACFFFF>Electro DMG Bonus</color> for 8s.\nEffects triggered by Normal Attacks, Charged Attacks, Elemental Skills and Elemental Bursts are considered independent entities.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000042 order by id limit 1), 426, false, false, '', false
      where exists (select 1 from constellations where id = 426 and character_id = 10000042)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10421, 10000042, 'Yunlai Swordsmanship', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 rapid strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to unleash 2 rapid sword strikes.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10421, '1-Hit DMG', '41.0%', 1
        where exists (select 1 from skills where id = 10421 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10421 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10421, '2-Hit DMG', '41.0%', 2
        where exists (select 1 from skills where id = 10421 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10421 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10421, '3-Hit DMG', '54.4%', 3
        where exists (select 1 from skills where id = 10421 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10421 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10421, '4-Hit DMG', '31.5%+34.4%', 4
        where exists (select 1 from skills where id = 10421 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10421 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10421, '5-Hit DMG', '67.0%', 5
        where exists (select 1 from skills where id = 10421 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10421 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10421, 'Charged Attack DMG', '76.8%+86.0%', 6
        where exists (select 1 from skills where id = 10421 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10421 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10421, 'Charged Attack Stamina Cost', '25.0', 7
        where exists (select 1 from skills where id = 10421 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10421 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10421, 'Plunge DMG', '63.9%', 8
        where exists (select 1 from skills where id = 10421 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10421 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10421, 'Low/High Plunge DMG', '128%/160%', 9
        where exists (select 1 from skills where id = 10421 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10421 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000042 order by id limit 1), 10421, 1, true, false, '', false
      where exists (select 1 from skills where id = 10421 and character_id = 10000042)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10422, 10000042, 'Stellar Restoration', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/a45e50a1fdfa76666c3fca06fb7ef1cd.png', 1, 'Hurls a Lightning Stiletto that annihilates her opponents like the swift thunder.\nWhen the Stiletto hits its target, it deals <color=#FFACFFFF>Electro DMG</color> to opponents in a small AoE, and places a Stiletto Mark on the spot hit.\n\n<color=#FFD780FF>Hold</color>\nHold to adjust the direction in which the Stiletto shall be thrown.\nStilettos thrown by the Hold attack mode can be suspended in mid-air, allowing Keqing to jump to them when using Stellar Restoration a second time.\n\n<color=#FFD780FF>Lightning Stiletto</color>\n If Keqing uses Stellar Restoration again or uses a Charged Attack while its duration lasts, it will clear the Stiletto Mark and produce different effects:\n·If she uses Stellar Restoration again, she will blink to the location of the Mark and unleash one slashing attack that deals <color=#FFACFFFF>AoE Electro DMG</color>. When blinking to a Stiletto that was thrown from a Holding attack, Keqing can leap across obstructing terrain.\n·If Keqing uses a Charged Attack, she will ignite a series of thundering cuts at the Mark''s location, dealing <color=#FFACFFFF>AoE Electro DMG</color>.\n\n<i>"Humans are like moths, endlessly chasing the flame we call gods and adepti. But this light that I have here is my own."</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10422, 'Lightning Stiletto DMG', '50.4%', 1
        where exists (select 1 from skills where id = 10422 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10422 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10422, 'Slashing DMG', '168%', 2
        where exists (select 1 from skills where id = 10422 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10422 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10422, 'Thunderclap Slash DMG', '84.0%×2', 3
        where exists (select 1 from skills where id = 10422 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10422 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10422, 'CD', '7.5s', 4
        where exists (select 1 from skills where id = 10422 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10422 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000042 order by id limit 1), 10422, 1, true, false, '', false
      where exists (select 1 from skills where id = 10422 and character_id = 10000042)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10425, 10000042, 'Starward Sword', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/c4db3a60023b975b6595ee3ef30be43c.png', 1, 'Keqing unleashes the power of lightning, dealing <color=#FFACFFFF>Electro DMG</color> in an AOE.\nShe then blends into the shadow of her blade, striking a series of thunderclap-blows to nearby opponents simultaneously that deal multiple instances of <color=#FFACFFFF>Electro DMG</color>. The final attack deals massive <color=#FFACFFFF>AoE Electro DMG</color>.\n\n<i>The swiftest technique in Keqing''s personal arsenal is fast enough to bring stars crashing down.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10425, 'Skill DMG', '110%', 1
        where exists (select 1 from skills where id = 10425 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10425 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10425, 'Consecutive Slash DMG', '30.0%×8', 2
        where exists (select 1 from skills where id = 10425 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10425 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10425, 'Last Attack DMG', '236%', 3
        where exists (select 1 from skills where id = 10425 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10425 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10425, 'CD', '12.0s', 4
        where exists (select 1 from skills where id = 10425 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10425 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10425, 'Energy Cost', '40', 5
        where exists (select 1 from skills where id = 10425 and character_id = 10000042) and not exists (select 1 from skill_affixes where skill_id = 10425 and position = 5);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000042 order by id limit 1), 10425, 4, true, false, '', false
      where exists (select 1 from skills where id = 10425 and character_id = 10000042)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (4221, 10000042, 'Thundering Penance', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/789d0dc902371fea74ac324e5911b50a.png', 2, 'After recasting <color=#FFD780FF>Stellar Restoration</color> while a Lightning Stiletto is present, Keqing''s weapon gains an <color=#FFACFFFF>Electro Infusion</color> for 5s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000042 order by id limit 1), 4221, 1, true, false, '', false
      where exists (select 1 from skills where id = 4221 and character_id = 10000042)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (4222, 10000042, 'Aristocratic Dignity', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/7d8c0e48b7ecde4f8ef10f3ee757db51.png', 2, 'When casting <color=#FFD780FF>Starward Sword</color>, Keqing''s CRIT Rate is increased by 15%, and her Energy Recharge is increased by 15%. This effect lasts for 8s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000042 order by id limit 1), 4222, 1, false, false, '', false
      where exists (select 1 from skills where id = 4222 and character_id = 10000042)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (4223, 10000042, 'Land''s Overseer', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/0059b26ecbc7d12fdb48b63896eb9f27.png', 2, 'When dispatched on an expedition in Liyue, time consumed is reduced by 25%.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000042 order by id limit 1), 4223, 1, true, false, '', false
      where exists (select 1 from skills where id = 4223 and character_id = 10000042)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 2000, 'selected', '8500', '2638', '11138')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 20, 'selected', '18.7%', null, '18.7%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 2001, 'selected', '536', '649', '1185')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 22, 'selected', '79.8%', null, '79.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 2002, 'selected', '519', '78', '597')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 28, 'selected', '40', null, '40')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 41, 'selected', '20.6%', null, '20.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 23, 'selected', '100.0%', null, '100.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 2000, 'base', '8500', '2638', '11138')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 2001, 'base', '536', '649', '1185')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 2002, 'base', '519', '78', '597')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 28, 'base', '40', null, '40')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 20, 'extra', '18.7%', null, '18.7%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 22, 'extra', '79.8%', null, '79.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 23, 'extra', '100.0%', null, '100.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 41, 'element', '20.6%', null, '20.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000042 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150311, 'Marechaussee Hunter') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150311, 2, 'Normal and Charged Attack DMG +15%'
        where not exists (select 1 from relic_set_affixes where set_id = 2150311 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150311, 4, 'When current HP increases or decreases, CRIT Rate will be increased by 12% for 5s. Max 3 stacks.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150311 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (31543, 'Hunter''s Brooch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/6951d1c3be4a5a7ed69b0a3509f68b03.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000042 order by id limit 1), 31543, 2150311, 1, 5, 0, 2, '717', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 1), 8, '21', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 1) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 1), 28, '21', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 1) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 1), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 1) and property_type_id = 3);
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57422, 'Instructor''s Feather Accessory', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/239b10d2e54e17572a34ac34156f91fa.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000042 order by id limit 1), 57422, 2100071, 2, 4, 12, 5, '185', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 2), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 2) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 2), 6, '7.9%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 2) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 2), 9, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 2) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 2), 28, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 2) and property_type_id = 28);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48452, 'Foundryman''s Calculus', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/0119db4ca0f7c650686e2da11b9c6a1d.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000042 order by id limit 1), 48452, 2150481, 3, 4, 8, 6, '20.6%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 3), 5, '11', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 3) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 3), 22, '5.0%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 3) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 3), 3, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 3) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 3), 2, '167', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 3) and property_type_id = 2);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48412, 'Foundryman''s Magnanimity', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/18d9f6208daf36d98d1a5f2ede22bc6b.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000042 order by id limit 1), 48412, 2150481, 4, 4, 8, 41, '20.6%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 4), 22, '5.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 4) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 4), 3, '4.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 4) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 4), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 4), 2, '191', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 4) and property_type_id = 2);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48432, 'Foundryman''s Legacy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/2aece34359e0f99802feced2f25ee01b.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000042 order by id limit 1), 48432, 2150481, 5, 4, 8, 20, '13.7%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 5), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 5), 3, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 5) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 5), 2, '215', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 5) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 5), 6, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000042 order by id limit 1) and position = 5) and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000042, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000042 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000042, 'goblet', 41
          where not exists (select 1 from character_relic_recommendations where character_id = 10000042 and slot = 'goblet' and property_type_id = 41);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000042, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 10000042 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000042, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000042 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000042, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000042 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000042, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000042 and property_type_id = 6);

-- Alyosha (10000148)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000148, 'Alyosha', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/faa96b61235674d245e3134c4175f684.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/ea2fee72f722bdb49324ec6335f4bc8e.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba983/7b99f01a4934a5ea2d386e8afa4dcf01.png', 'Electro', 4, 13)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000148, 60, 1, 1, false
    where not exists (select 1 from character_builds where character_id = 10000148);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (13407, 'Favonius Lance', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7db45b7a84bb80468aaf0f5f430e9bdc.png', 13, 'Polearm', 4, 'A polearm made in the style of the Knights of Favonius. Its shaft is straight, and its tip flows lightly like the wind.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000148 order by id limit 1), 13407, 70, 5, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1)), 4, 'main', null, null, 455
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1)), 23, 'sub', null, null, 25.2
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (1481, 10000148, 'Frostvale Thunderclap', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/e9479f666d2843e97e2b3861610510fd.png', 'Alyosha regenerates 15 Elemental Energy when nearby party members trigger an <color=#FFACFFFF>Electro-related reaction</color> on an opponent. This effect can trigger once every 18s.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000148 order by id limit 1), 1481, true, false, '', false
      where exists (select 1 from constellations where id = 1481 and character_id = 10000148)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1482, 10000148, 'Howl From Afar', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/42c5b2bbcf0587b84aa2d650a84b6d85.png', 'The duration of the Elemental Burst <color=#FFD780FF>Hunter''s Advance</color> is extended by 6s.\nAdditionally, each time {LINK#N11480002}<color=#FFD780FF>Tugarin</color>{/LINK} attacks the opponent, he will also apply the {LINK#N11480001}<color=#FFD780FF>Hunter''s Mark</color>{/LINK} to a target. This effect does not activate existing <color=#FFD780FF>Hunter''s Marks</color>.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000148 order by id limit 1), 1482, false, false, '', false
      where exists (select 1 from constellations where id = 1482 and character_id = 10000148)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1483, 10000148, 'Friendly Call', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/de4dd34364ccf9746db49239f02932f4.png', 'Increases the Level of the Elemental Skill <color=#FFD780FF>Thunderbolt Strike</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000148 order by id limit 1), 1483, false, false, '', false
      where exists (select 1 from constellations where id = 1483 and character_id = 10000148)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1484, 10000148, 'Harvest the Spoils', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/be292d4039d64f843abc51a0efbe3790.png', 'When {LINK#N11480002}<color=#FFD780FF>Tugarin</color>{/LINK} attacks, he will also restore 60% of Alyosha''s ATK as HP to the nearby party member with the lowest HP by percentage.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000148 order by id limit 1), 1484, false, false, '', false
      where exists (select 1 from constellations where id = 1484 and character_id = 10000148)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1485, 10000148, 'When the Nightbird Falls Silent', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/4e9b1ed07e5226baa004f3c8325728b1.png', 'Increases the Level of the Elemental Burst <color=#FFD780FF>Hunter''s Advance</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000148 order by id limit 1), 1485, false, false, '', false
      where exists (select 1 from constellations where id = 1485 and character_id = 10000148)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1486, 10000148, 'Standard Reclaimed', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/09eaf3c7771a54cdbbe2e01b2465275a.png', 'The <color=#FFD780FF>Hunter''s Precision</color> effect obtained from activating a {LINK#N11480001}<color=#FFD780FF>Hunter''s Mark</color>{/LINK} can now stack, max 2 stacks. When the stack count reaches 2, characters affected by <color=#FFD780FF>Hunter''s Precision</color> will also have their Elemental Mastery increased by 100 if they are on the field.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000148 order by id limit 1), 1486, false, false, '', false
      where exists (select 1 from constellations where id = 1486 and character_id = 10000148)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11481, 10000148, 'Skirmishing Spear', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/0a4af4ecb63b4741aa3e42d18a2a0c21.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 4 consecutive spear strikes and applies the {LINK#N11480001}<color=#FFD780FF>Hunter''s Mark</color>{/LINK} to the opponent hit by the final strike.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to lunge forward, dealing damage to opponents in his path.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11481, '1-Hit DMG', '51.7%', 1
        where exists (select 1 from skills where id = 11481 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11481 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11481, '2-Hit DMG', '52.1%', 2
        where exists (select 1 from skills where id = 11481 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11481 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11481, '3-Hit DMG', '37.0%+34.4%', 3
        where exists (select 1 from skills where id = 11481 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11481 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11481, '4-Hit DMG', '82.0%', 4
        where exists (select 1 from skills where id = 11481 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11481 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11481, 'Charged Attack DMG', '120.1%', 5
        where exists (select 1 from skills where id = 11481 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11481 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11481, 'Charged Attack Stamina Cost', '25.0', 6
        where exists (select 1 from skills where id = 11481 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11481 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11481, 'Plunge DMG', '69.1%', 7
        where exists (select 1 from skills where id = 11481 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11481 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 11481, 'Low/High Plunge DMG', '138.2%/172.7%', 8
        where exists (select 1 from skills where id = 11481 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11481 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000148 order by id limit 1), 11481, 2, true, false, '', false
      where exists (select 1 from skills where id = 11481 and character_id = 10000148)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11482, 10000148, 'Thunderbolt Strike', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/f379eefb1c5e1b319e70b5abd66bc91f.png', 1, 'Follows his hunter''s instincts. Tap or hold to produce different effects as well as apply the {LINK#N11480001}<color=#FFD780FF>Hunter''s Mark</color>{/LINK} effect to the hit opponents.\n\n<color=#FFD780FF>Tapping</color>\nFires at opponents in front of him, dealing <color=#FFACFFFF>AoE Electro DMG</color>.\n\n<color=#FFD780FF>Holding</color>\nEnters aiming mode, then targets opponents within a certain area in front of him. Alyosha''s Interruption RES is enhanced when in this mode.\nAt the end of the button hold, he deals <color=#FFACFFFF>Electro DMG</color> to the targeted opponents.\n\n<i>The reckless hunter once reached for the spear''s edge, and it was only after they survived a lesson paid in blood that they came to understand the harsh truths of survival on the frozen plains.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11482, '#{LAYOUT_MOBILE#Tap}{LAYOUT_PC#Press}{LAYOUT_PS#Press} DMG', '329.7%', 1
        where exists (select 1 from skills where id = 11482 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11482 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11482, 'Hold DMG', '412.2%', 2
        where exists (select 1 from skills where id = 11482 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11482 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11482, 'CD', '15.0s', 3
        where exists (select 1 from skills where id = 11482 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11482 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11482, 'Hunter''s Mark Duration', '15.0s', 4
        where exists (select 1 from skills where id = 11482 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11482 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11482, 'Hunter''s Precision ATK Bonus', '13.8%', 5
        where exists (select 1 from skills where id = 11482 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11482 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11482, 'Hunter''s Precision Duration', '15.0s', 6
        where exists (select 1 from skills where id = 11482 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11482 and position = 6);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000148 order by id limit 1), 11482, 3, true, false, '', false
      where exists (select 1 from skills where id = 11482 and character_id = 10000148)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11485, 10000148, 'Hunter''s Advance', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/09c772d12eb05ca265681eb20ecb781b.png', 1, 'Summons his trusted companion <color=#FFD780FF>Tugarin</color> to fight alongside him on the field. This also turns an area in front of him into a <color=#FFD780FF>Fulgurite Hunting Field</color> for a short time.\n\n<color=#FFD780FF>Fulgurite Hunting Field</color>\n· Continuously taunts nearby opponents to incite them to attack.\n· Every 2s, deals an instance of <color=#FFACFFFF>AoE Electro DMG</color> to any opponent that enters the field.\n\n<color=#FFD780FF>Tugarin</color>\n· If there are any opponents nearby, Tugarin will quickly move close to an opponent and maul them every 2s, dealing <color=#FFACFFFF>Electro DMG</color>.\n· If an opponent affected by the <color=#FFD780FF>Hunter''s Mark</color> effect is hit, the <color=#FFD780FF>Hunter''s Mark</color> will also be activated.\n· Where there are multiple opponents, Tugarin will attack those affected by the <color=#FFD780FF>Hunter''s Mark</color> effect first.\n\n<i>Wait. Keep waiting until the impatience fades. That''s when the red-bellied plover shall sweep across the birch grove and present itself before one''s arrow.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11485, 'Fulgurite Hunting Field DMG', '86.2%', 1
        where exists (select 1 from skills where id = 11485 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11485 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11485, 'Tugarin DMG', '57.8%', 2
        where exists (select 1 from skills where id = 11485 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11485 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11485, 'Duration', '14.0s', 3
        where exists (select 1 from skills where id = 11485 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11485 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11485, 'CD', '18.0s', 4
        where exists (select 1 from skills where id = 11485 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11485 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11485, 'Energy Cost', '70', 5
        where exists (select 1 from skills where id = 11485 and character_id = 10000148) and not exists (select 1 from skill_affixes where skill_id = 11485 and position = 5);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000148 order by id limit 1), 11485, 3, true, false, '', false
      where exists (select 1 from skills where id = 11485 and character_id = 10000148)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (14821, 10000148, 'Awakened by the Baying Hounds', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/e28394c6fed50dfb3c76055d529ae766.png', 2, 'When {LINK#N11480002}<color=#FFD780FF>Tugarin</color>{/LINK} attacks, it will also restore HP to nearby active characters at 120% of Alyosha''s ATK.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000148 order by id limit 1), 14821, 1, true, false, '', false
      where exists (select 1 from skills where id = 14821 and character_id = 10000148)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (14822, 10000148, 'Suffer the Winter Wheat Will', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/c3d558ebc8c167a5571ba12f88dc10d4.png', 2, 'Increases the DMG Alyosha deals with his Elemental Skill and Elemental Burst by 0.35% for every 1% of his Energy Recharge. Up to a 70% increase can be obtained in this way.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000148 order by id limit 1), 14822, 1, false, false, '', false
      where exists (select 1 from skills where id = 14822 and character_id = 10000148)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (14823, 10000148, 'Into the Fray', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/3f9de1fda41eb1dcbb5c337225c5d758.png', 2, 'Alyosha will enter the <color=#FFD780FF>Radiance: Stellar-Conduct</color> state when inside a {LINK#N11330003}<color=#FFD780FF>Polestar Field</color>{/LINK}.\n<color=#FFD780FF>Radiance: Stellar-Conduct</color>: The <color=#FFD780FF>Hunter''s Precision</color> effect obtained when the {LINK#N11480001}<color=#FFD780FF>Hunter''s Mark</color>{/LINK} is activated will also increase Stellar-Conduct reaction DMG dealt by the character when on the field by 20%.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000148 order by id limit 1), 14823, 1, true, false, '', false
      where exists (select 1 from skills where id = 14823 and character_id = 10000148)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (14825, 10000148, 'Treetop Watch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/73027f5bfb473d0558788ffaf777fed3.png', 2, 'Displays the location of nearby <color=#FFD780FF>resources unique to Snezhnaya</color> on the mini-map, and this effect also applies in the Shadow Realm.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000148 order by id limit 1), 14825, 1, true, false, '', false
      where exists (select 1 from skills where id = 14825 and character_id = 10000148)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 2000, 'selected', '7881', '4237', '12118')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 20, 'selected', '15.5%', null, '15.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 2001, 'selected', '630', '583', '1213')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 22, 'selected', '61.8%', null, '61.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 2002, 'selected', '463', '43', '506')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 28, 'selected', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 41, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 23, 'selected', '174.3%', null, '174.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 2000, 'base', '7881', '4237', '12118')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 2001, 'base', '630', '583', '1213')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 2002, 'base', '463', '43', '506')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 28, 'base', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 20, 'extra', '15.5%', null, '15.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 22, 'extra', '61.8%', null, '61.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 23, 'extra', '174.3%', null, '174.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000148 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
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
      values ((select id from character_builds where character_id = 10000148 order by id limit 1), 48543, 2150481, 1, 5, 8, 2, '2342', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 1), 22, '6.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 1) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 1), 23, '13.0%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 1) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 1), 3, '4.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 1) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 1), 5, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 1) and property_type_id = 5);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48422, 'Foundryman''s Observation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/6d43279928ae731e4199ff123ecd210e.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000148 order by id limit 1), 48422, 2150481, 2, 4, 4, 5, '90', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 2), 9, '5.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 2) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 2), 6, '4.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 2) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 2), 2, '191', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 2) and property_type_id = 2);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48453, 'Foundryman''s Calculus', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/0119db4ca0f7c650686e2da11b9c6a1d.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000148 order by id limit 1), 48453, 2150481, 3, 4, 8, 23, '22.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 3), 6, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 3) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 3), 2, '382', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 3) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 3), 5, '12', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 3) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 3), 3, '4.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 3) and property_type_id = 3);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59412, 'Exile''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7847bfdeab60c072ec09b17462505cdc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000148 order by id limit 1), 59412, 2100091, 4, 4, 8, 6, '20.6%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 4), 5, '12', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 4), 20, '3.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 4) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 4), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 4) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 4), 22, '5.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 4) and property_type_id = 22);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48533, 'Foundryman''s Legacy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/2aece34359e0f99802feced2f25ee01b.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000148 order by id limit 1), 48533, 2150481, 5, 5, 8, 6, '22.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 5), 20, '7.4%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 5) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 5), 3, '5.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 5) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 5), 2, '209', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 5) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 5), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000148 order by id limit 1) and position = 5) and property_type_id = 5);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000148, 'sand', 23
          where not exists (select 1 from character_relic_recommendations where character_id = 10000148 and slot = 'sand' and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000148, 'goblet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000148 and slot = 'goblet' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000148, 'circlet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000148 and slot = 'circlet' and property_type_id = 6);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000148, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000148 and property_type_id = 6);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000148, 23
        where not exists (select 1 from character_recommended_substats where character_id = 10000148 and property_type_id = 23);

commit;
