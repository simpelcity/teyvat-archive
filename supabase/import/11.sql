-- Part 11 of 13. Generated from app/data/character_detail.ts.
-- Insert-only and safe to re-run. Run the parts in order in the Supabase SQL editor.
begin;

-- Charlotte (10000088)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000088, 'Charlotte', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f4e68e94225fa95112ae03c0a6d10938.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/1d3fd45b4793e3ac84b71f5495249332.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/bee59717b62a91c6863009a394ca7e4c.png', 'Cryo', 4, 10)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000088, 60, 1, 3, true
    where not exists (select 1 from character_builds where character_id = 10000088);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (14401, 'Favonius Codex', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/bb4ff947d3649e393b6ca2e117b072d6.png', 10, 'Catalyst', 4, 'A secret tome that belonged to the scholars of the Knights of Favonius. It describes the logic and power of elements and matter.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000088 order by id limit 1), 14401, 60, 4, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1)), 4, 'main', null, null, 353
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1)), 23, 'sub', null, null, 33.8
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (881, 10000088, 'A Need to Verify Facts', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/c6de5a2dd093ec4b2a67ce85c09548cb.png', 'After <color=#FFD780FF>Still Photo: Comprehensive Confirmation</color> heals a character, it will mark them with Verification, which will heal them once every 2s for 80% of Charlotte''s ATK. This effect lasts 6s.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000088 order by id limit 1), 881, true, false, '', false
      where exists (select 1 from constellations where id = 881 and character_id = 10000088)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (882, 10000088, 'A Duty to Pursue Truth', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/eb61a7d3f016d263da2da6078b7079bb.png', 'When using <color=#FFD780FF>Framing: Freezing Point Composition</color>, when Monsieur Verite hits 1/2/3 (or more) opponents, Charlotte''s own ATK will be increased by 10%/20%/30% for 12s.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000088 order by id limit 1), 882, true, false, '', false
      where exists (select 1 from constellations where id = 882 and character_id = 10000088)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (883, 10000088, 'An Imperative to Independence', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/002b05b29749a159253c085e7f412939.png', 'Increases the Level of <color=#FFD780FF>Still Photo: Comprehensive Confirmation</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000088 order by id limit 1), 883, true, false, '', false
      where exists (select 1 from constellations where id = 883 and character_id = 10000088)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (884, 10000088, 'A Responsibility to Oversee', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/704a9614244ca858a6476c40affce5b7.png', 'When <color=#FFD780FF>Still Photo: Comprehensive Confirmation</color> hits an opponent marked by Snappy Silhouette or Focused Impression, it will deal 10% more DMG and restore 2 Energy to Charlotte. This restoration can be triggered 5 times every 20s.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000088 order by id limit 1), 884, false, false, '', false
      where exists (select 1 from constellations where id = 884 and character_id = 10000088)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (885, 10000088, 'A Principle of Conscience', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/95ae0963a968564a69c417bd37486656.png', 'Increases the Level of <color=#FFD780FF>Framing: Freezing Point Composition</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000088 order by id limit 1), 885, false, false, '', false
      where exists (select 1 from constellations where id = 885 and character_id = 10000088)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (886, 10000088, 'A Summation of Interest', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/58fe988928fc162b92a574529cb65103.png', 'When the active character''s Normal and Charged Attacks hit an opponent marked by <color=#FFD780FF>Framing: Freezing Point Composition</color>''s Focused Impression, Monsieur Verite will initiate a coordinated attack that deals 180% of Charlotte''s ATK as <color=#99FFFFFF>AoE Cryo DMG</color> and heals active character(s) within the AoE for 42% of Charlotte''s ATK. This effect can be triggered once every 6s and both DMG and healing dealt in this way will be considered as having been done by Charlotte''s Elemental Burst.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000088 order by id limit 1), 886, false, false, '', false
      where exists (select 1 from constellations where id = 886 and character_id = 10000088)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10881, 10000088, 'Cool-Color Capture', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/2c014e6053c4f0d032e1d1ff0c6de0e1.png', 1, '<color=#FFD780FF>Normal Attack</color>\nTaking aim at targets using Monsieur Verite, her custom Kamera, Charlotte performs up to 3 consecutive attacks, dealing <color=#99FFFFFF>Cryo DMG</color>.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a fixed amount of Stamina, and after a moment''s preparation, will deploy Monsieur Verite to deal <color=#99FFFFFF>AoE Cryo DMG</color>.\n\n<color=#FFD780FF>Plunging Attack</color>\nGathering the power of Cryo, Charlotte plunges toward the ground, dealing DMG to all opponents in her path and dealing <color=#99FFFFFF>AoE Cryo DMG</color> upon landing.\n\n<color=#FFD780FF>Arkhe: Pneuma</color>\nAt certain intervals, upon using a Charged Attack, Charlotte will cause a Spiritbreath Thorn to descend and pierce opponents, dealing Pneuma-aligned <color=#99FFFFFF>AoE Cryo DMG</color>.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10881, '1-Hit DMG', '49.8%', 1
        where exists (select 1 from skills where id = 10881 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10881 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10881, '2-Hit DMG', '43.4%', 2
        where exists (select 1 from skills where id = 10881 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10881 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10881, '3-Hit DMG', '64.6%', 3
        where exists (select 1 from skills where id = 10881 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10881 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10881, 'Charged Attack DMG', '100.5%', 4
        where exists (select 1 from skills where id = 10881 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10881 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10881, 'Charged Attack Stamina Cost', '50.0', 5
        where exists (select 1 from skills where id = 10881 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10881 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10881, 'Plunge DMG', '56.8%', 6
        where exists (select 1 from skills where id = 10881 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10881 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10881, 'Low/High Plunge DMG', '114%/142%', 7
        where exists (select 1 from skills where id = 10881 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10881 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10881, 'Spiritbreath Thorn DMG', '11.2%', 8
        where exists (select 1 from skills where id = 10881 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10881 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10881, 'Spiritbreath Thorn DMG Interval', '6.0s', 9
        where exists (select 1 from skills where id = 10881 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10881 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000088 order by id limit 1), 10881, 1, true, false, '', false
      where exists (select 1 from skills where id = 10881 and character_id = 10000088)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10882, 10000088, 'Framing: Freezing Point Composition', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/54b2def21d88ae1df5e373d4b38c5f7a.png', 1, 'Using the keen instincts of an ace reporter, Charlotte uses her photography skills to produce different effects based on whether the ability is Tapped or Held.\n\n<color=#FFD780FF>Tap</color>\nTakes a snapshot using Monsieur Verite, dealing <color=#99FFFFFF>AoE Cryo DMG</color> to opponents in front of her and applying Snappy Silhouette to a maximum of 5 opponents. During this effect''s duration, it will deal <color=#99FFFFFF>Cryo DMG</color> to affected opponents at intervals.\n\n<color=#FFD780FF>Hold</color>\nPopping Monsieur Verite''s viewfinder open, Charlotte enters Composition Mode, and during this time, the viewfinder will expand as you hold until you reach a Finisher Frame state. In this state, Charlotte can move and change direction freely.\nWhen the hold state ends, Monsieur Verite will deal <color=#99FFFFFF>Cryo DMG</color> to all opponents locked on within the viewfinder, and apply the same Snappy Silhouette as Tap Mode does to them. If you unleash this ability only after reaching Finisher Frame, you will instead apply Focused Impression, which lasts longer and deals more DMG, although the Skill CD will be longer.\nComposition Mode lasts a maximum of 15s and allows a maximum of 5 opponents to be selected.\n\n<i>"Press photography requires simple shots with exceptional theming, but most of all, you need to have a knack for capturing the moment!"</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10882, '#Photo DMG ({LAYOUT_MOBILE#Tap}{LAYOUT_PC#Press}{LAYOUT_PS#Press})', '67.2%', 1
        where exists (select 1 from skills where id = 10882 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10882 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10882, 'Photo DMG (Hold)', '139.2%', 2
        where exists (select 1 from skills where id = 10882 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10882 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10882, '"Snappy Silhouette" Mark DMG', '39.2%', 3
        where exists (select 1 from skills where id = 10882 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10882 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10882, '"Snappy Silhouette" Mark Trigger Interval', '1.5s', 4
        where exists (select 1 from skills where id = 10882 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10882 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10882, '"Snappy Silhouette" Mark Duration', '6.0s', 5
        where exists (select 1 from skills where id = 10882 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10882 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10882, '"Focused Impression" Mark DMG', '40.6%', 6
        where exists (select 1 from skills where id = 10882 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10882 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10882, '"Focused Impression" Mark Trigger Interval', '1.5s', 7
        where exists (select 1 from skills where id = 10882 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10882 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10882, '"Focused Impression" Mark Duration', '12.0s', 8
        where exists (select 1 from skills where id = 10882 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10882 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10882, 'CD', '12.0s', 9
        where exists (select 1 from skills where id = 10882 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10882 and position = 9);
insert into skill_affixes (skill_id, name, value, position)
        select 10882, 'Finisher Frame Cast CD', '18.0s', 10
        where exists (select 1 from skills where id = 10882 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10882 and position = 10);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000088 order by id limit 1), 10882, 1, true, false, '', false
      where exists (select 1 from skills where id = 10882 and character_id = 10000088)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10885, 10000088, 'Still Photo: Comprehensive Confirmation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3e985015499290a57a5b14279ff626da.png', 1, 'Condensing ice to create The Steambird''s signature, Charlotte creates a Newsflash Field that will deal <color=#99FFFFFF>AoE Cryo DMG</color> and restores HP for all nearby party members based on Charlotte''s ATK.\n<color=#FFD780FF>Newsflash Field</color>\n·While the ability is active, Monsieur Verite will deal <color=#99FFFFFF>Cryo DMG</color> at intervals to opponents within its AoE.\n·Will continuously restore HP to active character(s) within its AoE based on Charlotte''s ATK.\n\n<i>"Hearing stories from multiple perspectives to recreate what really happened is key to a good report... I mean, that''s how you can pick the best angle for your article!"</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10885, 'Cast Healing', '320.7% ATK+2131', 1
        where exists (select 1 from skills where id = 10885 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10885 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10885, 'Skill DMG', '97.0%', 2
        where exists (select 1 from skills where id = 10885 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10885 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10885, 'Kamera Continuous Regeneration', '11.5% ATK+76', 3
        where exists (select 1 from skills where id = 10885 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10885 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10885, 'Kamera DMG', '8.1%', 4
        where exists (select 1 from skills where id = 10885 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10885 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10885, 'Newsflash Field Duration', '4.0s', 5
        where exists (select 1 from skills where id = 10885 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10885 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10885, 'CD', '20.0s', 6
        where exists (select 1 from skills where id = 10885 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10885 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10885, 'Energy Cost', '80', 7
        where exists (select 1 from skills where id = 10885 and character_id = 10000088) and not exists (select 1 from skill_affixes where skill_id = 10885 and position = 7);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000088 order by id limit 1), 10885, 4, true, false, '', false
      where exists (select 1 from skills where id = 10885 and character_id = 10000088)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (8821, 10000088, 'Moment of Impact', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/37923cc19e7e12713b0ea5ca4423f2c5.png', 2, 'When opponents marked by "Focused Impression" are defeated, <color=#FFD780FF>Framing: Freezing Point Composition</color>''s CD will be decreased by 2s. This CD decrease can be triggered 4 times every 12s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000088 order by id limit 1), 8821, 1, true, false, '', false
      where exists (select 1 from skills where id = 8821 and character_id = 10000088)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (8822, 10000088, 'Diversified Investigation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/a341904db97bd59cdc15b775d44c486d.png', 2, 'When the party contains 1/2/3 Fontainians other than herself, Charlotte gains a 5%/10%/15% Healing Bonus. When the party contains 1/2/3 non-Fontainians, Charlotte gains a 5%/10%/15% Cryo DMG Bonus.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000088 order by id limit 1), 8822, 1, false, false, '', false
      where exists (select 1 from skills where id = 8822 and character_id = 10000088)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (8823, 10000088, 'First-Person Shutter', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/1282556eaa2fd8d932272fcb72ec679d.png', 2, 'After activating the Special Analysis Zoom Lens, Charlotte''s "Framing: Freezing Point Composition" Hold Mode cannot trigger its original effects, but instead enables her to take photos in a rather unique manner...')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000088 order by id limit 1), 8823, 1, true, false, '', false
      where exists (select 1 from skills where id = 8823 and character_id = 10000088)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 2000, 'selected', '7093', '910', '8002')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 20, 'selected', '22.9%', null, '22.9%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 2001, 'selected', '467', '194', '660')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 22, 'selected', '56.2%', null, '56.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 2002, 'selected', '360', '78', '438')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 26, 'selected', '11.5%', null, '11.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 28, 'selected', '72', null, '72')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 46, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 23, 'selected', '194.8%', null, '194.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 2000, 'base', '7093', '910', '8002')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 2001, 'base', '467', '194', '660')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 2002, 'base', '360', '78', '438')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 28, 'base', '72', null, '72')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 20, 'extra', '22.9%', null, '22.9%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 22, 'extra', '56.2%', null, '56.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 26, 'extra', '11.5%', null, '11.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 23, 'extra', '194.8%', null, '194.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000088 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59443, 'Exile''s Flower', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/e8e8c17bd07ea125961b9d2d6f03b1ba.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000088 order by id limit 1), 59443, 2100091, 1, 4, 0, 2, '645', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 1), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 1) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 1), 22, '6.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 1) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 1), 23, '4.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 1) and property_type_id = 23);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59423, 'Exile''s Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/1738ca88f6afa4f1d645e8afb214a7ed.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000088 order by id limit 1), 59423, 2100091, 2, 4, 0, 5, '42', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 2), 20, '2.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 2) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 2), 23, '3.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 2) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 2), 28, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 2) and property_type_id = 28);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55452, 'Berserker''s Timepiece', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/72514ea9341bf0db03079d0c02ef78b2.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000088 order by id limit 1), 55452, 2100051, 3, 4, 8, 23, '22.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 3), 9, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 3) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 3), 3, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 3) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 3), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 3) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 3), 20, '3.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 3) and property_type_id = 20);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55412, 'Berserker''s Bone Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/a1c51bbf393862969fb15640d6a433bd.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000088 order by id limit 1), 55412, 2100051, 4, 4, 4, 6, '13.4%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 4), 28, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 4) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 4), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 4) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 4), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 4) and property_type_id = 8);
insert into relic_sets (id, name) values (2150011, 'Gladiator''s Finale') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150011, 4, 'If the wielder of this artifact set uses a Sword, Claymore or Polearm, increases their Normal Attack DMG by 35%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150011 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (75534, 'Gladiator''s Triumphus', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/69750e95511b6aed7919f73b1d568ccd.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000088 order by id limit 1), 75534, 2150011, 5, 5, 4, 26, '11.5%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 5), 5, '18', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 5) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 5), 9, '7.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 5) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 5), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 5) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 5), 28, '42', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000088 order by id limit 1) and position = 5) and property_type_id = 28);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000088, 'sand', 23
          where not exists (select 1 from character_relic_recommendations where character_id = 10000088 and slot = 'sand' and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000088, 'goblet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000088 and slot = 'goblet' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000088, 'circlet', 26
          where not exists (select 1 from character_relic_recommendations where character_id = 10000088 and slot = 'circlet' and property_type_id = 26);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000088, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000088 and property_type_id = 6);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000088, 23
        where not exists (select 1 from character_recommended_substats where character_id = 10000088 and property_type_id = 23);

-- Mika (10000080)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000080, 'Mika', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f239b3032e85ebb64554e69a58eec91b.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/6ea984ba64a30d66f357f2c1855c1549.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/1e0d82ae5e6314615b3ead8709fff691.png', 'Cryo', 4, 13)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000080, 1, 1, 5, false
    where not exists (select 1 from character_builds where character_id = 10000080);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (13303, 'Black Tassel', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/badaa063427a6e3f39d9c031b3dddc24.png', 13, 'Polearm', 3, 'An exceptionally powerful polearm that also offers a simple but elegant solution to the issue of the easily stained white tassel.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000080 order by id limit 1), 13303, 20, 1, 5)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1)), 4, 'main', null, null, 105
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1)), 3, 'sub', null, null, 18
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (801, 10000080, 'Factor Confluence', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/20ecee502fa21d13a7435976a81dbc1c.png', 'The Soulwind state of <color=#FFD780FF>Starfrost Swirl</color> can decrease the healing interval between instances caused by <color=#FFD780FF>Skyfeather Song</color>''s Eagleplume state. This decrease percentage is equal to the ATK SPD increase provided by Soulwind.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000080 order by id limit 1), 801, true, false, '', false
      where exists (select 1 from constellations where id = 801 and character_id = 10000080)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (802, 10000080, 'Companion''s Ingress', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/6203dbf5d51d1b037969277b94b925b6.png', 'When <color=#FFD780FF>Starfrost Swirl</color>''s Flowfrost Arrow first hits an opponent, or its Rimestar Flare hits an opponent, 1 Detector stack from the Ascension Talent "Suppressive Barrage" will be generated.\nYou must first unlock the Ascension Talent "Suppressive Barrage."', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000080 order by id limit 1), 802, true, false, '', false
      where exists (select 1 from constellations where id = 802 and character_id = 10000080)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (803, 10000080, 'Reconnaissance Experience', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/cdf29bec888b01e6cbb2c5eeac3defdb.png', 'Increases the Level of <color=#FFD780FF>Skyfeather Song</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000080 order by id limit 1), 803, true, false, '', false
      where exists (select 1 from constellations where id = 803 and character_id = 10000080)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (804, 10000080, 'Sunfrost Encomium', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/74905c587101370250cd43ccbae1cd3e.png', 'When Mika''s own <color=#FFD780FF>Skyfeather Song</color>''s Eagleplume state heals party members, this will restore 3 Energy to Mika. This form of Energy restoration can occur 5 times during the Eagleplume state created by 1 use of Skyfeather Song.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000080 order by id limit 1), 804, true, false, '', false
      where exists (select 1 from constellations where id = 804 and character_id = 10000080)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (805, 10000080, 'Signal Arrow', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/8def18e907064fe73113ef43a008edea.png', 'Increases the Level of <color=#FFD780FF>Starfrost Swirl</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000080 order by id limit 1), 805, true, false, '', false
      where exists (select 1 from constellations where id = 805 and character_id = 10000080)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (806, 10000080, 'Companion''s Counsel', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4d2f4cbf65a720db41d503d45c43fca4.png', 'The maximum number of Detector stacks that <color=#FFD780FF>Starfrost Swirl</color>''s Soulwind can gain is increased by 1. You must first unlock the Ascension Talent "Suppressive Barrage.".\nAdditionally, active characters affected by Soulwind will deal 60% more Physical CRIT DMG.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000080 order by id limit 1), 806, false, false, '', false
      where exists (select 1 from constellations where id = 806 and character_id = 10000080)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10801, 10000080, 'Spear of Favonius - Arrow''s Passage', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/0a4af4ecb63b4741aa3e42d18a2a0c21.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 consecutive strikes using his crossbow and spear.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to lunge forward, dealing damage to opponents along the way.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10801, '1-Hit DMG', '43.3%', 1
        where exists (select 1 from skills where id = 10801 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10801 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10801, '2-Hit DMG', '41.5%', 2
        where exists (select 1 from skills where id = 10801 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10801 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10801, '3-Hit DMG', '54.5%', 3
        where exists (select 1 from skills where id = 10801 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10801 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10801, '4-Hit DMG', '27.6%+27.6%', 4
        where exists (select 1 from skills where id = 10801 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10801 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10801, '5-Hit DMG', '70.9%', 5
        where exists (select 1 from skills where id = 10801 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10801 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10801, 'Charged Attack DMG', '112.7%', 6
        where exists (select 1 from skills where id = 10801 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10801 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10801, 'Charged Attack Stamina Cost', '25.0', 7
        where exists (select 1 from skills where id = 10801 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10801 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10801, 'Plunge DMG', '63.9%', 8
        where exists (select 1 from skills where id = 10801 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10801 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10801, 'Low/High Plunge DMG', '128%/160%', 9
        where exists (select 1 from skills where id = 10801 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10801 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000080 order by id limit 1), 10801, 1, true, false, '', false
      where exists (select 1 from skills where id = 10801 and character_id = 10000080)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10802, 10000080, 'Starfrost Swirl', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/d49bf0cd574692f211a286cd06826ab0.png', 1, 'Mika uses his crossbow to attack, granting all nearby characters in your party Soulwind. When characters in the Soulwind state are on the field, their ATK SPD will be increased.\nWill take effect in different ways if Tapped or Held.\n\n<color=#FFD780FF>Tap</color>\nFires a Flowfrost Arrow that can pierce through opponents, dealing <color=#99FFFFFF>Cryo DMG</color> to enemies it comes into contact with.\n\n<color=#FFD780FF>Hold</color>\nGoes into Aiming Mode, locking on to an opponent and firing a Rimestar Flare at them, dealing <color=#99FFFFFF>Cryo DMG</color>. When the Rimestar Flare hits, it will rise before exploding, launching Rimestar Shards into a maximum of 3 other opponents, dealing <color=#99FFFFFF>Cryo DMG</color>.\n\n<i>Stars burst ''neath the frosted skies.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10802, 'Flowfrost Arrow DMG', '84.00%', 1
        where exists (select 1 from skills where id = 10802 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10802 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10802, 'Rimestar Flare DMG', '105.00%', 2
        where exists (select 1 from skills where id = 10802 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10802 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10802, 'Rimestar Shard DMG', '31.50%', 3
        where exists (select 1 from skills where id = 10802 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10802 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10802, 'ATK SPD Bonus', '16%', 4
        where exists (select 1 from skills where id = 10802 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10802 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10802, 'Soulwind Duration', '12.0s', 5
        where exists (select 1 from skills where id = 10802 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10802 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10802, 'CD', '15.0s', 6
        where exists (select 1 from skills where id = 10802 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10802 and position = 6);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000080 order by id limit 1), 10802, 4, true, false, '', false
      where exists (select 1 from skills where id = 10802 and character_id = 10000080)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10805, 10000080, 'Skyfeather Song', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/2fa196b73e8dc008998011e3b5774dc0.png', 1, 'Derives the ability to spur his teammates on from the recited prayers of the knightly order, regenerating HP for all nearby party members. This healing is based on Mika''s Max HP and will grant them the Eagleplume state.\n\n<color=#FFD780FF>Eagleplume</color>\nWhen the Normal Attacks of active characters affected by Eagleplume hit an opponent, Mika will help them regenerate HP based on his Max HP.\nCharacters affected by this state can only regenerate HP in this way once per short interval of time.\n\n<i>"Carry hope when in dire straits, and keep vigil when all is well... For that pure white plume shall at last guide the lost wayfarers."</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10805, 'Cast Healing', '15.2% Max HP+1553', 1
        where exists (select 1 from skills where id = 10805 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10805 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10805, 'Eagleplume Healing', '3.0% Max HP+310', 2
        where exists (select 1 from skills where id = 10805 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10805 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10805, 'Eagleplume Healing Interval', '2.5s', 3
        where exists (select 1 from skills where id = 10805 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10805 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10805, 'Eagleplume Duration', '15.0s', 4
        where exists (select 1 from skills where id = 10805 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10805 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10805, 'CD', '18.0s', 5
        where exists (select 1 from skills where id = 10805 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10805 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10805, 'Energy Cost', '70', 6
        where exists (select 1 from skills where id = 10805 and character_id = 10000080) and not exists (select 1 from skill_affixes where skill_id = 10805 and position = 6);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000080 order by id limit 1), 10805, 4, true, false, '', false
      where exists (select 1 from skills where id = 10805 and character_id = 10000080)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (8021, 10000080, 'Suppressive Barrage', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/11b8a83e9aaac1d2455d6b34bbb47b60.png', 2, 'Per the following circumstances, the Soulwind state caused by <color=#FFD780FF>Starfrost Swirl</color> will grant characters the Detector effect, increasing their Physical DMG by 10% when they are on the field.\n·If the Flowfrost Arrow hits more than one opponent, each additional opponent hit will generate 1 Detector stack.\n·When a Rimestar Shard hits an opponent, it will generate 1 Detector stack. Each Rimestar Shard can trigger the effect 1 time.\n\nThe Soulwind state can have a maximum of 3 Detector stacks, and if Starfrost Swirl is cast again during this duration, the pre-existing Soulwind state and all its Detector stacks will be cleared.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000080 order by id limit 1), 8021, 1, false, false, '', false
      where exists (select 1 from skills where id = 8021 and character_id = 10000080)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (8022, 10000080, 'Topographical Mapping', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/e3af6e068e474e8de46e32f19e7582f9.png', 2, 'When an active character affected by both <color=#FFD780FF>Skyfeather Song</color>''s Eagleplume and <color=#FFD780FF>Starfrost Swirl</color>''s Soulwind at once scores a CRIT Hit with their attacks, Soulwind will grant them 1 stack of Detector from the Ascension Talent Suppressive Barrage. During a single instance of Soulwind, 1 Detector stack can be gained in this manner.\nAdditionally, the maximum number of stacks that can be gained through Soulwind alone is increased by 1.\nYou must first unlock the Ascension Talent "Suppressive Barrage."')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000080 order by id limit 1), 8022, 1, false, false, '', false
      where exists (select 1 from skills where id = 8022 and character_id = 10000080)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (8023, 10000080, 'Demarcation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/542b7846b06ea605e5c63ee50573e37a.png', 2, 'Displays the location of nearby <color=#FFD780FF>resources unique to Mondstadt</color> on the mini-map.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000080 order by id limit 1), 8023, 1, true, false, '', false
      where exists (select 1 from skills where id = 8023 and character_id = 10000080)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 2000, 'selected', '1049', '1765', '2814')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 20, 'selected', '20.5%', null, '20.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 2001, 'selected', '124', '37', '161')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 22, 'selected', '56.5%', null, '56.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 2002, 'selected', '60', '2', '62')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 28, 'selected', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 46, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 23, 'selected', '107.0%', null, '107.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 2000, 'base', '1049', '1765', '2814')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 2001, 'base', '124', '37', '161')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 2002, 'base', '60', '2', '62')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 28, 'base', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 999999, 'base', '220', null, '220')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 20, 'extra', '20.5%', null, '20.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 22, 'extra', '56.5%', null, '56.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 23, 'extra', '107.0%', null, '107.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000080 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
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
      values ((select id from character_builds where character_id = 10000080 order by id limit 1), 55342, 2100051, 1, 3, 0, 2, '430', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1) and position = 1), 23, '3.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1) and position = 1) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1) and position = 1), 22, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1) and position = 1) and property_type_id = 22);
insert into relic_sets (id, name) values (2100101, 'Adventurer') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100101, 2, 'Max HP increased by 1,000.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100101 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100101, 4, 'Opening a chest regenerates 30% Max HP over 5s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100101 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (60321, 'Adventurer''s Tail Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/260c4f71afac2b8d0b57e447687f20ab.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000080 order by id limit 1), 60321, 2100101, 2, 3, 0, 5, '28', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1) and position = 2), 3, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1) and position = 2) and property_type_id = 3);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55352, 'Berserker''s Timepiece', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/72514ea9341bf0db03079d0c02ef78b2.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000080 order by id limit 1), 55352, 2100051, 3, 3, 0, 3, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1) and position = 3), 22, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1) and position = 3) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1) and position = 3), 9, '3.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1) and position = 3) and property_type_id = 9);
insert into relic_sets (id, name) values (2100111, 'Lucky Dog') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100111, 2, 'DEF increased by 100.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100111 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100111, 4, 'Picking up Mora restores 300 HP.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100111 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (61311, 'Lucky Dog''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/b42512d4d511944707d69e587465cd6c.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000080 order by id limit 1), 61311, 2100111, 4, 3, 0, 3, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1) and position = 4), 5, '9', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1) and position = 4) and property_type_id = 5);
insert into relic_sets (id, name) values (2100101, 'Adventurer') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100101, 2, 'Max HP increased by 1,000.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100101 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100101, 4, 'Opening a chest regenerates 30% Max HP over 5s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100101 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (60331, 'Adventurer''s Bandana', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/2e4915a7fccba739312194886d2c0c9a.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000080 order by id limit 1), 60331, 2100101, 5, 3, 0, 20, '3.5%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1) and position = 5), 23, '3.9%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000080 order by id limit 1) and position = 5) and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000080, 'sand', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000080 and slot = 'sand' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000080, 'goblet', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000080 and slot = 'goblet' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000080, 'circlet', 26
          where not exists (select 1 from character_relic_recommendations where character_id = 10000080 and slot = 'circlet' and property_type_id = 26);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000080, 3
        where not exists (select 1 from character_recommended_substats where character_id = 10000080 and property_type_id = 3);

-- Faruzan (10000076)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000076, 'Faruzan', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/58a03d4cded3b6e93af3cc3efb708031.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/20b3c2297a405f88513cee20de705986.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/efda18cb3e43ffbbb8355b54417f05b6.png', 'Anemo', 4, 12)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000076, 1, 1, 1, false
    where not exists (select 1 from character_builds where character_id = 10000076);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (15401, 'Favonius Warbow', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f0b8edcc330cd9de1dcf97eccb20cbaf.png', 12, 'Bow', 4, 'A standard-issue recurve bow of the Knights of Favonius. Only the best archers can unleash its full potential.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000076 order by id limit 1), 15401, 1, 0, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000076 order by id limit 1)), 4, 'main', null, null, 41
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000076 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000076 order by id limit 1)), 23, 'sub', null, null, 13.3
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000076 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (761, 10000076, 'Truth by Any Means', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/ecf1fe7986c972f32b58eddcf688ab27.png', 'Faruzan can fire off a maximum of 2 Hurricane Arrows using fully charged Aimed Shots while under the effect of a single Manifest Gale created by <color=#FFD780FF>Wind Realm of Nasamjnin</color>.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000076 order by id limit 1), 761, true, false, '', false
      where exists (select 1 from constellations where id = 761 and character_id = 10000076)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (762, 10000076, 'Overzealous Intellect', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/492469223d1a5e717d5f84395330fe20.png', 'The duration of the Dazzling Polyhedron created by <color=#FFD780FF>The Wind''s Secret Ways</color> is increased by 6s.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000076 order by id limit 1), 762, false, false, '', false
      where exists (select 1 from constellations where id = 762 and character_id = 10000076)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (763, 10000076, 'Spirit-Orchard Stroll', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/981351bed5bb9502d5e55e40cd54b391.png', 'Increases the Level of <color=#FFD780FF>Wind Realm of Nasamjnin</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000076 order by id limit 1), 763, false, false, '', false
      where exists (select 1 from constellations where id = 763 and character_id = 10000076)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (764, 10000076, 'Divine Comprehension', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/f5941afb9ac8d8350275bab7fcec8f4a.png', 'The vortex created by <color=#FFD780FF>Pressurized Collapses</color> will restore Energy to Faruzan based on the number of opponents hit: If it hits 1 opponent, it will restore 2 Energy for Faruzan. Each additional opponent hit will restore 0.5 more Energy for Faruzan.\nA maximum of 4 Energy can be restored to her per vortex.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000076 order by id limit 1), 764, false, false, '', false
      where exists (select 1 from constellations where id = 764 and character_id = 10000076)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (765, 10000076, 'Wonderland of Rumination', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/0e613e1486ebf8d8f6293e57bd02a8d9.png', 'Increases the Level of <color=#FFD780FF>The Wind''s Secret Ways</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000076 order by id limit 1), 765, false, false, '', false
      where exists (select 1 from constellations where id = 765 and character_id = 10000076)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (766, 10000076, 'The Wondrous Path of Truth', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/92566e9c6a987f584742cb0326ff6667.png', 'Characters affected by <color=#FFD780FF>The Wind''s Secret Ways</color>'' Prayerful Wind''s Benefit have 40% increased CRIT DMG when they deal <color=#80FFD7FF>Anemo DMG</color>. When the active character deals DMG while affected by Prayerful Wind''s Benefit, they will apply Pressurized Collapse to the opponent damaged. This effect can be triggered once every 3s. This CD is shared between all party members.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000076 order by id limit 1), 766, false, false, '', false
      where exists (select 1 from constellations where id = 766 and character_id = 10000076)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10761, 10000076, 'Parthian Shot', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/cc29fde34aa6d42f8e110628a4bf2de2.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 4 consecutive shots with a bow.\n\n<color=#FFD780FF>Charged Attack</color>\nPerforms a more precise <color=#FFD780FF>Aimed Shot</color> with increased DMG.\nWhile aiming, mighty winds will accumulate on the arrowhead. A fully charged wind arrow will deal <color=#80FFD7FF>Anemo DMG</color>.\n\n<color=#FFD780FF>Plunging Attack</color>\nFires off a shower of arrows in mid-air before falling and striking the ground, hitting opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10761, '1-Hit DMG', '44.7%', 1
        where exists (select 1 from skills where id = 10761 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10761 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10761, '2-Hit DMG', '42.2%', 2
        where exists (select 1 from skills where id = 10761 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10761 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10761, '3-Hit DMG', '53.2%', 3
        where exists (select 1 from skills where id = 10761 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10761 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10761, '4-Hit DMG', '70.6%', 4
        where exists (select 1 from skills where id = 10761 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10761 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10761, 'Aimed Shot', '43.9%', 5
        where exists (select 1 from skills where id = 10761 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10761 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10761, 'Fully-Charged Aimed Shot', '124%', 6
        where exists (select 1 from skills where id = 10761 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10761 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10761, 'Plunge DMG', '56.8%', 7
        where exists (select 1 from skills where id = 10761 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10761 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10761, 'Low/High Plunge DMG', '114%/142%', 8
        where exists (select 1 from skills where id = 10761 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10761 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000076 order by id limit 1), 10761, 1, true, false, '', false
      where exists (select 1 from skills where id = 10761 and character_id = 10000076)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10762, 10000076, 'Wind Realm of Nasamjnin', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/11cf7cca4e7cfcc9c41ba15dbb22976b.png', 1, 'Faruzan deploys a polyhedron that deals <color=#80FFD7FF>AoE Anemo DMG</color> to nearby opponents. She will also enter the Manifest Gale state.\nWhile in the Manifest Gale state, Faruzan''s next fully charged shot will consume this state and will become a Hurricane Arrow that contains high-pressure currents. This arrow deals <color=#80FFD7FF>Anemo DMG</color> based on the DMG of a fully charged Aimed Shot from "Normal Attack: Parthian Shot."\n\n<color=#FFD780FF>Pressurized Collapse</color>\nThe Hurricane Arrow will apply a Pressurized Collapse effect to the opponent or character hit. This effect will be removed after a short delay, creating a vortex that deals <color=#80FFD7FF>AoE Anemo DMG</color> and pulls nearby objects and opponents in. If the Hurricane Arrow does not hit any opponent or character, it will create a Pressurized Collapse effect at its point of impact.\nThe vortex DMG is considered Elemental Skill DMG.\n\n<i>The winds of truth buffet the spirits of those who seek truth, dispersing the miasma of preconception.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10762, 'Skill DMG', '148.8%', 1
        where exists (select 1 from skills where id = 10762 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10762 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10762, 'Pressurized Collapse Vortex DMG', '108.0%', 2
        where exists (select 1 from skills where id = 10762 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10762 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10762, 'Manifest Gale Duration', '18.0s', 3
        where exists (select 1 from skills where id = 10762 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10762 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10762, 'CD', '6.0s', 4
        where exists (select 1 from skills where id = 10762 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10762 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000076 order by id limit 1), 10762, 1, true, false, '', false
      where exists (select 1 from skills where id = 10762 and character_id = 10000076)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10765, 10000076, 'The Wind''s Secret Ways', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/e6124d2c60235ce347ba76d2b3935900.png', 1, 'Faruzan deploys a Dazzling Polyhedron that unleashes a Whirlwind Pulse and deals <color=#80FFD7FF>AoE Anemo DMG</color>.\nWhile the Dazzling Polyhedron persists, it will continuously move along a triangular path. Once it reaches each corner of that triangular path, it will unleash 1 more Whirlwind Pulse.\n\n<color=#FFD780FF>Whirlwind Pulse</color>\n·When the Whirlwind Pulse is unleashed, it will apply Perfidious Wind''s Bale to nearby opponents, decreasing their <color=#80FFD7FF>Anemo RES</color>.\n·The Whirlwind Pulse will also apply Prayerful Wind''s Benefit to all nearby party members when it is unleashed, granting them an <color=#80FFD7FF>Anemo DMG Bonus</color>.\n\n<i>One must have respect for the unknown wisdom that one might find hidden in ancient ruins.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10765, 'Skill DMG', '377.6%', 1
        where exists (select 1 from skills where id = 10765 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10765 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10765, 'Anemo DMG Bonus', '18.0%', 2
        where exists (select 1 from skills where id = 10765 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10765 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10765, 'Prayerful Wind''s Benefit Duration', '4.0s', 3
        where exists (select 1 from skills where id = 10765 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10765 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10765, 'Anemo RES Decrease', '30.0%', 4
        where exists (select 1 from skills where id = 10765 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10765 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10765, 'Perfidious Wind''s Bale Duration', '4.0s', 5
        where exists (select 1 from skills where id = 10765 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10765 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10765, 'Duration', '12.0s', 6
        where exists (select 1 from skills where id = 10765 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10765 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10765, 'CD', '20.0s', 7
        where exists (select 1 from skills where id = 10765 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10765 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10765, 'Energy Cost', '80', 8
        where exists (select 1 from skills where id = 10765 and character_id = 10000076) and not exists (select 1 from skill_affixes where skill_id = 10765 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000076 order by id limit 1), 10765, 1, true, false, '', false
      where exists (select 1 from skills where id = 10765 and character_id = 10000076)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (7621, 10000076, 'Impetuous Flow', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/089d94b46935f3f12a07f859a73982d0.png', 2, 'When Faruzan is in the Manifest Gale state created by <color=#FFD780FF>Wind Realm of Nasamjnin</color>, the amount of time taken to charge a shot is decreased by 60%, and she can apply <color=#FFD780FF>The Wind''s Secret Ways</color>'' Perfidious Wind''s Bale to opponents who are hit by the vortex created by Pressurized Collapse.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000076 order by id limit 1), 7621, 1, false, false, '', false
      where exists (select 1 from skills where id = 7621 and character_id = 10000076)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (7622, 10000076, 'Lost Wisdom of the Seven Caverns', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/a9a760a665891ffb96900bcfdfbadf04.png', 2, 'When characters affected by <color=#FFD780FF>The Wind''s Secret Ways</color>'' Prayerful Wind''s Benefit deal <color=#80FFD7FF>Anemo DMG</color> using Normal, Charged, Plunging Attacks, Elemental Skills, or Elemental Bursts to opponents, they will gain the Hurricane Guard effect: This DMG will be increased based on 32% of Faruzan''s Base ATK. 1 instance of Hurricane Guard can occur once every 0.8s. This DMG Bonus will be cleared after Prayerful Wind''s Benefit expires or after the effect is triggered once.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000076 order by id limit 1), 7622, 1, false, false, '', false
      where exists (select 1 from skills where id = 7622 and character_id = 10000076)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (7623, 10000076, 'Tomes Light the Path', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/0a1d069b1ae33b113bfded6544c30e2f.png', 2, 'Gains 25% more rewards when dispatched on a Sumeru Expedition for 20 hours.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000076 order by id limit 1), 7623, 1, true, false, '', false
      where exists (select 1 from skills where id = 7623 and character_id = 10000076)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 2000, 'selected', '802', '545', '1347')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 20, 'selected', '20.5%', null, '20.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 2001, 'selected', '58', '29', '87')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 22, 'selected', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 2002, 'selected', '53', '3', '56')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 28, 'selected', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 44, 'selected', '5.2%', null, '5.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 23, 'selected', '142.6%', null, '142.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 2000, 'base', '802', '545', '1347')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 2001, 'base', '58', '29', '87')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 2002, 'base', '53', '3', '56')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 28, 'base', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 20, 'extra', '20.5%', null, '20.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 22, 'extra', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 23, 'extra', '142.6%', null, '142.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 44, 'element', '5.2%', null, '5.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000076 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55341, 'Berserker''s Rose', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/105fbe95a8b020b587d75387e5d84854.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000076 order by id limit 1), 55341, 2100051, 1, 3, 0, 2, '430', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000076 order by id limit 1) and position = 1), 6, '2.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000076 order by id limit 1) and position = 1) and property_type_id = 6);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55321, 'Berserker''s Indigo Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/92d2a9153a2f03e1249c17f8530a2aa3.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000076 order by id limit 1), 55321, 2100051, 2, 3, 0, 5, '28', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000076 order by id limit 1) and position = 2), 23, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000076 order by id limit 1) and position = 2) and property_type_id = 23);
insert into relic_sets (id, name) values (2100101, 'Adventurer') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100101, 2, 'Max HP increased by 1,000.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100101 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100101, 4, 'Opening a chest regenerates 30% Max HP over 5s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100101 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (60351, 'Adventurer''s Pocket Watch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/28990ea9a4bbd88bcc0585fd5132a622.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000076 order by id limit 1), 60351, 2100101, 3, 3, 0, 23, '5.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000076 order by id limit 1) and position = 3), 9, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000076 order by id limit 1) and position = 3) and property_type_id = 9);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59311, 'Exile''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7847bfdeab60c072ec09b17462505cdc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000076 order by id limit 1), 59311, 2100091, 4, 3, 0, 44, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000076 order by id limit 1) and position = 4), 2, '115', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000076 order by id limit 1) and position = 4) and property_type_id = 2);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59331, 'Exile''s Circlet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/22faf0f5c42ac3652ea2c4a1ca38ac05.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000076 order by id limit 1), 59331, 2100091, 5, 3, 0, 20, '3.5%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000076 order by id limit 1) and position = 5), 9, '3.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000076 order by id limit 1) and position = 5) and property_type_id = 9);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000076, 'sand', 23
          where not exists (select 1 from character_relic_recommendations where character_id = 10000076 and slot = 'sand' and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000076, 'goblet', 44
          where not exists (select 1 from character_relic_recommendations where character_id = 10000076 and slot = 'goblet' and property_type_id = 44);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000076, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 10000076 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000076, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000076 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000076, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000076 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000076, 23
        where not exists (select 1 from character_recommended_substats where character_id = 10000076 and property_type_id = 23);

-- Dori (10000068)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000068, 'Dori', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/d4892796ad70d139c13a6e42d170b877.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/ce6448d7d2bf3dc034ad698fa60917ef.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/6ad4b9ea1bc906f7ba8fb547ba3215c6.png', 'Electro', 4, 11)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000068, 1, 1, 0, false
    where not exists (select 1 from character_builds where character_id = 10000068);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (12403, 'Sacrificial Greatsword', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/b79312ddc86e05133b8a8d984f9931e1.png', 11, 'Claymore', 4, 'A ceremonial greatsword that has become petrified over time. The trinkets on it are still visible. It grants the wielder the power to withstand the winds of time.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000068 order by id limit 1), 12403, 1, 0, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1)), 4, 'main', null, null, 44
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1)), 23, 'sub', null, null, 6.7
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (681, 10000068, 'Additional Investment', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/318242be2bc5b39ccd039dc02f55dd73.png', 'The number of After-Sales Service Rounds created by <color=#FFD780FF>Troubleshooter Shots</color> is increased by 1.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000068 order by id limit 1), 681, false, false, '', false
      where exists (select 1 from constellations where id = 681 and character_id = 10000068)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (682, 10000068, 'Special Franchise', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/11740fe758c746320294a1e8d2615dc1.png', 'When you are in combat and the <color=#FFD780FF>Jinni</color> heals the character it is connected to, it will fire a Jinni Toop from that character''s position that deals 50% of Dori''s ATK DMG.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000068 order by id limit 1), 682, false, false, '', false
      where exists (select 1 from constellations where id = 682 and character_id = 10000068)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (683, 10000068, 'Wonders Never Cease', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/f972af0797e437a7bf9605fce1906e54.png', 'Increases the Level of <color=#FFD780FF>Alcazarzaray''s Exactitude</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000068 order by id limit 1), 683, false, false, '', false
      where exists (select 1 from constellations where id = 683 and character_id = 10000068)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (684, 10000068, 'Discretionary Supplement', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/f56d4a6192536c8526faada89dad2927.png', 'The character connected to the <color=#FFD780FF>Jinni</color> will obtain the following buffs based on their current HP and Energy:\n·When their HP is lower than 50%, they gain 50% Incoming Healing Bonus.\n·When their Energy is less than 50%, they gain 30% Energy Recharge.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000068 order by id limit 1), 684, false, false, '', false
      where exists (select 1 from constellations where id = 684 and character_id = 10000068)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (685, 10000068, 'Value for Mora', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/0b513809a784f00c6485d0138d6c1f3b.png', 'Increases the Level of <color=#FFD780FF>Spirit-Warding Lamp: Troubleshooter Cannon</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000068 order by id limit 1), 685, false, false, '', false
      where exists (select 1 from constellations where id = 685 and character_id = 10000068)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (686, 10000068, 'Sprinkling Weight', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/7144a5b30330068cbe3ca87f5a6639d0.png', 'Dori gains the following effects for 3s after using <color=#FFD780FF>Spirit-Warding Lamp: Troubleshooter Cannon</color>:\n·<color=#FFACFFFF>Electro Infusion</color>.\n·When Normal Attacks hit opponents, all nearby party members will heal HP equivalent to 4% of Dori''s Max HP. This type of healing can occur once every 0.1s.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000068 order by id limit 1), 686, false, false, '', false
      where exists (select 1 from constellations where id = 686 and character_id = 10000068)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10681, 10000068, 'Marvelous Sword-Dance (Modified)', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/bf0237fba9d4ab5b47ea86b90711a765.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 3 consecutive strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nDrains Stamina over time to perform continuous spinning attacks against all nearby opponents.\nAt the end of the sequence, performs a more powerful slash. \n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10681, '1-Hit DMG', '90.2%', 1
        where exists (select 1 from skills where id = 10681 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10681 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10681, '2-Hit DMG', '41.1%+43.1%', 2
        where exists (select 1 from skills where id = 10681 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10681 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10681, '3-Hit DMG', '128.4%', 3
        where exists (select 1 from skills where id = 10681 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10681 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10681, 'Charged Attack Spinning DMG', '62.5%', 4
        where exists (select 1 from skills where id = 10681 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10681 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10681, 'Charged Attack Final DMG', '113%', 5
        where exists (select 1 from skills where id = 10681 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10681 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10681, 'Charged Attack Stamina Cost', '40.0/s', 6
        where exists (select 1 from skills where id = 10681 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10681 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10681, 'Max Duration', '5.0s', 7
        where exists (select 1 from skills where id = 10681 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10681 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10681, 'Plunge DMG', '74.6%', 8
        where exists (select 1 from skills where id = 10681 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10681 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10681, 'Low/High Plunge DMG', '149%/186%', 9
        where exists (select 1 from skills where id = 10681 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10681 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000068 order by id limit 1), 10681, 1, true, false, '', false
      where exists (select 1 from skills where id = 10681 and character_id = 10000068)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10682, 10000068, 'Spirit-Warding Lamp: Troubleshooter Cannon', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/8041159f499c17cc89062e003b434bf7.png', 1, 'Directs a Spirit-Warding Lamp to fire off a Troubleshooter Shot at opponents, dealing <color=#FFACFFFF>Electro DMG</color>.\nAfter the Troubleshooter Shot hits, it will create 2 After-Sales Service Rounds that will automatically track nearby opponents and deal <color=#FFACFFFF>Electro DMG</color>.\n\n<i>It is said that Dori can fix any problem for you... for the right price.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10682, 'Troubleshooter Shot DMG', '147.3%', 1
        where exists (select 1 from skills where id = 10682 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10682 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10682, 'After-Sales Service Round DMG', '31.6%', 2
        where exists (select 1 from skills where id = 10682 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10682 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10682, 'CD', '9.0s', 3
        where exists (select 1 from skills where id = 10682 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10682 and position = 3);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000068 order by id limit 1), 10682, 1, true, false, '', false
      where exists (select 1 from skills where id = 10682 and character_id = 10000068)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10685, 10000068, 'Alcazarzaray''s Exactitude', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/82c741e469336c47f6577ad626ee8bf0.png', 1, 'Summons forth the Jinni within the lamp to give the client various kinds of aid.\n\n<color=#FFD780FF>Jinni</color>\nConnects to a nearby character. The connected character will:\n· Continuously restore HP based on Dori''s Max HP.\n· Continuously regenerate Energy.\n· Be affected by <color=#FFACFFFF>Electro</color>.\nWhen the connector between the Jinni and the character touches opponents, it will deal one instance of <color=#FFACFFFF>Electro DMG</color> to them every 0.4s.\n\nOnly one Jinni can exist at one time.\n\n<i>"Hmm? You''ll pick this lamp, will you? Oh my, you''ve got good taste! Unfortunately, there''s no price on this treasure — comparable, I''d say, to how you will not sell that mascot by your side for any price in the world."</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10685, 'Connector DMG', '16%', 1
        where exists (select 1 from skills where id = 10685 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10685 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10685, 'Continuous Healing', '6.7% Max HP+642', 2
        where exists (select 1 from skills where id = 10685 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10685 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10685, 'Energy Regeneration', '1.6', 3
        where exists (select 1 from skills where id = 10685 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10685 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10685, 'Duration', '12.0s', 4
        where exists (select 1 from skills where id = 10685 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10685 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10685, 'CD', '20.0s', 5
        where exists (select 1 from skills where id = 10685 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10685 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10685, 'Energy Cost', '80', 6
        where exists (select 1 from skills where id = 10685 and character_id = 10000068) and not exists (select 1 from skill_affixes where skill_id = 10685 and position = 6);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000068 order by id limit 1), 10685, 1, true, false, '', false
      where exists (select 1 from skills where id = 10685 and character_id = 10000068)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (6821, 10000068, 'An Eye for Gold', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4469dfa53dd7fd2d1b38ea2a761b76dc.png', 2, 'After a character connected to the <color=#FFD780FF>Jinni</color> triggers an Electro-Charged, Lunar-Charged, Superconduct, Stellar-Conduct, Overloaded, Quicken, Aggravate, Hyperbloom, Electro Swirl, or Electro Crystallize reaction, the CD of <color=#FFD780FF>Spirit-Warding Lamp: Troubleshooter Cannon</color> is decreased by 1s.\nThis effect can be triggered once every 3s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000068 order by id limit 1), 6821, 1, false, false, '', false
      where exists (select 1 from skills where id = 6821 and character_id = 10000068)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (6822, 10000068, 'Compound Interest', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/4e01c480893f19151a1533437730af90.png', 2, 'When the Troubleshooter Shots or After-Sales Service Rounds from <color=#FFD780FF>Spirit-Warding Lamp: Troubleshooter Cannon</color> hit opponents, Dori will restore 5 Elemental Energy for every 100% Energy Recharge possessed.\nPer Spirit-Warding Lamp: Troubleshooter Cannon, only one instance of Energy restoration can be triggered and a maximum of 15 Energy can be restored this way.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000068 order by id limit 1), 6822, 1, false, false, '', false
      where exists (select 1 from skills where id = 6822 and character_id = 10000068)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (6823, 10000068, 'Unexpected Order', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/1f236bf2ba5810cfbf2bfa22006b0098.png', 2, 'Has a 25% chance to recover some of the materials used when crafting Character and Weapon Materials.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000068 order by id limit 1), 6823, 1, true, false, '', false
      where exists (select 1 from skills where id = 6823 and character_id = 10000068)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 2000, 'selected', '1039', '1004', '2043')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 20, 'selected', '10.0%', null, '10.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 2001, 'selected', '62', '48', '110')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 22, 'selected', '54.2%', null, '54.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 2002, 'selected', '61', '49', '110')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 28, 'selected', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 41, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 23, 'selected', '110.3%', null, '110.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 2000, 'base', '1039', '1004', '2043')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 2001, 'base', '62', '48', '110')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 2002, 'base', '61', '49', '110')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 28, 'base', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 20, 'extra', '10.0%', null, '10.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 22, 'extra', '54.2%', null, '54.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 23, 'extra', '110.3%', null, '110.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000068 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150051, 'Thundering Fury') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150051, 2, 'Electro DMG Bonus +15%'
        where not exists (select 1 from relic_set_affixes where set_id = 2150051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150051, 4, 'Increases the DMG caused by Overloaded, Electro-Charged, Superconduct, and Hyperbloom by 40%, the DMG Bonus conferred by Aggravate by 20%, and the DMG caused by Lunar-Charged and Stellar-Conduct by 20%. When Quicken or the aforementioned Elemental Reactions are triggered, Elemental Skill CD is decreased by 1s. Can only occur once every 0.8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (79442, 'Thunderbird''s Mercy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/40445cb5a9bdd5c8df397d819b8bc958.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000068 order by id limit 1), 79442, 2150051, 1, 4, 0, 2, '645', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 1), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 1) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 1), 9, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 1) and property_type_id = 9);
insert into relic_sets (id, name) values (2150021, 'Viridescent Venerer') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150021, 2, 'Anemo DMG Bonus +15%'
        where not exists (select 1 from relic_set_affixes where set_id = 2150021 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150021, 4, 'Increases Swirl reaction DMG dealt by 60%, and Stellar Swirl reaction DMG dealt by 20%. Decreases opponent''s Elemental RES to the element infused in the Swirl by 40% for 10s. Upon triggering a Stellar Swirl in the opponent, will also decrease their Cryo RES by 40%. RES debuffs of the same elemental type do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150021 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (76422, 'Viridescent Arrow Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/37134a2511467762e3a085ab1d043965.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000068 order by id limit 1), 76422, 2150021, 2, 4, 0, 5, '42', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 2), 2, '239', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 2), 6, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 2) and property_type_id = 6);
insert into relic_sets (id, name) values (2150031, 'Wanderer''s Troupe') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150031, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150031 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150031, 4, 'Increases Charged Attack DMG by 35% if the character uses a Catalyst or a Bow.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150031 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (77453, 'Concert''s Final Hour', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/00cfc809485c04ff1092838901c8c413.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000068 order by id limit 1), 77453, 2150031, 3, 4, 0, 6, '6.3%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 3), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 3) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 3), 23, '3.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 3) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 3), 20, '2.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 3) and property_type_id = 20);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55311, 'Berserker''s Bone Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/a1c51bbf393862969fb15640d6a433bd.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000068 order by id limit 1), 55311, 2100051, 4, 3, 0, 3, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 4), 22, '4.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 4) and property_type_id = 22);
insert into relic_sets (id, name) values (2150130, 'Prayers to Springtime') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150130, 1, 'Affected by Cryo for 40% less time.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150130 and activation_number = 1);
insert into relics (id, name, icon, pos_name) values (87432, 'Tiara of Frost', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/d48c6338496d67d5c29e7a900a454294.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000068 order by id limit 1), 87432, 2150130, 5, 4, 0, 3, '6.3%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 5), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 5), 20, '2.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000068 order by id limit 1) and position = 5) and property_type_id = 20);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000068, 'sand', 23
          where not exists (select 1 from character_relic_recommendations where character_id = 10000068 and slot = 'sand' and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000068, 'goblet', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000068 and slot = 'goblet' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000068, 'circlet', 26
          where not exists (select 1 from character_relic_recommendations where character_id = 10000068 and slot = 'circlet' and property_type_id = 26);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000068, 3
        where not exists (select 1 from character_recommended_substats where character_id = 10000068 and property_type_id = 3);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000068, 23
        where not exists (select 1 from character_recommended_substats where character_id = 10000068 and property_type_id = 23);

commit;
