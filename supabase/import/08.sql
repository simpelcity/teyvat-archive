-- Part 8 of 13. Generated from app/data/character_detail.ts.
-- Insert-only and safe to re-run. Run the parts in order in the Supabase SQL editor.
begin;

-- Baizhu (10000082)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000082, 'Baizhu', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/afc87fc731e998f8f0f956f03de1cf21.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/92615eab5cf26186546dfc6a83f0b797.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/7bdb4a3d05b01b20850a8b570e72cb16.png', 'Dendro', 5, 10)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000082, 24, 1, 0, false
    where not exists (select 1 from character_builds where character_id = 10000082);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (14406, 'Prototype Amber', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/00d58c6a9f08c487851206576c962551.png', 10, 'Catalyst', 4, 'A dully gilded catalyst secretly guarded in the Blackcliff Forge. It seems to glow with the very light from the sky.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000082 order by id limit 1), 14406, 50, 3, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1)), 4, 'main', null, null, 292
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1)), 3, 'sub', null, null, 26.8
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (821, 10000082, 'Attentive Observation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/44b839c71d7e0a9b96c0463532b4a80d.png', '<color=#FFD780FF>Universal Diagnosis</color> gains 1 additional charge.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000082 order by id limit 1), 821, false, false, '', false
      where exists (select 1 from constellations where id = 821 and character_id = 10000082)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (822, 10000082, 'Incisive Discernment', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/49593015b1c11540b3aad95b2840ded1.png', 'When your own active character hits a nearby opponent with their attacks, Baizhu will unleash a Gossamer Sprite: Splice.\nGossamer Sprite: Splice will initiate 1 attack before returning, dealing 250% of Baizhu''s ATK as <color=#99FF88FF>Dendro DMG</color> and healing for 20% of <color=#FFD780FF>Universal Diagnosis</color>''s Gossamer Sprite''s normal healing.\nDMG dealt this way is considered Elemental Skill DMG.\nThis effect can be triggered once every 5s.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000082 order by id limit 1), 822, false, false, '', false
      where exists (select 1 from constellations where id = 822 and character_id = 10000082)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (823, 10000082, 'All Aspects Stabilized', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/6659f02d4b97d874243986a35ae55a21.png', 'Increases the Level of <color=#FFD780FF>Holistic Revivification</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000082 order by id limit 1), 823, false, false, '', false
      where exists (select 1 from constellations where id = 823 and character_id = 10000082)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (824, 10000082, 'Ancient Art of Perception', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/ad500c0b9e459dec2d0fb96214abc199.png', 'For 15s after <color=#FFD780FF>Holistic Revivification</color> is used, Baizhu will increase all nearby party members'' Elemental Mastery by 80.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000082 order by id limit 1), 824, false, false, '', false
      where exists (select 1 from constellations where id = 824 and character_id = 10000082)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (825, 10000082, 'The Hidden Ebb and Flow', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/233bb1b87a319f7ff1b0d440a3239d87.png', 'Increases the Level of <color=#FFD780FF>Universal Diagnosis</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000082 order by id limit 1), 825, false, false, '', false
      where exists (select 1 from constellations where id = 825 and character_id = 10000082)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (826, 10000082, 'Elimination of Malicious Qi', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/03bb2eacf0767464f15a9ba9eb4a0ea3.png', 'Increases the DMG dealt by <color=#FFD780FF>Holistic Revivification</color>''s Spiritveins by 8% of Baizhu''s Max HP.\nAdditionally, when a <color=#FFD780FF>Gossamer Sprite</color> or Gossamer Sprite: Splice hits opponents, there is a 100% chance of generating one of <color=#FFD780FF>Holistic Revivification</color>''s Seamless Shields. This effect can only be triggered once by each Gossamer Sprite or Gossamer Sprite: Splice.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000082 order by id limit 1), 826, false, false, '', false
      where exists (select 1 from constellations where id = 826 and character_id = 10000082)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10821, 10000082, 'The Classics of Acupuncture', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/2c014e6053c4f0d032e1d1ff0c6de0e1.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 4 attacks that deal <color=#99FF88FF>Dendro DMG</color> to opponents in front of him.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to deal <color=#99FF88FF>AoE Dendro DMG</color> to opponents in front of him after a short casting time.\n\n<color=#FFD780FF>Plunging Attack</color>\nCalling upon the might of Dendro, Baizhu plunges towards the ground from mid-air, damaging all opponents in his path. Deals <color=#99FF88FF>AoE Dendro DMG</color> upon impact with the ground.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10821, '1-Hit DMG', '37.4%', 1
        where exists (select 1 from skills where id = 10821 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10821 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10821, '2-Hit DMG', '36.4%', 2
        where exists (select 1 from skills where id = 10821 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10821 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10821, '3-Hit DMG', '22.5%×2', 3
        where exists (select 1 from skills where id = 10821 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10821 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10821, '4-Hit DMG', '54.1%', 4
        where exists (select 1 from skills where id = 10821 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10821 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10821, 'Charged Attack DMG', '121.0%', 5
        where exists (select 1 from skills where id = 10821 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10821 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10821, 'Charged Attack Stamina Cost', '50.0', 6
        where exists (select 1 from skills where id = 10821 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10821 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10821, 'Plunge DMG', '56.8%', 7
        where exists (select 1 from skills where id = 10821 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10821 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10821, 'Low/High Plunge DMG', '114%/142%', 8
        where exists (select 1 from skills where id = 10821 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10821 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000082 order by id limit 1), 10821, 1, true, false, '', false
      where exists (select 1 from skills where id = 10821 and character_id = 10000082)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10822, 10000082, 'Universal Diagnosis', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/f26d5959d28c2acdc87c2fa1fa2f8e5d.png', 1, 'Controls a Gossamer Sprite that cruises and attacks nearby opponents, dealing <color=#99FF88FF>Dendro DMG</color>.\nAfter it performs 3 attacks or if there are no opponents nearby, the Sprite will return, healing all nearby party members based on Baizhu''s Max HP.\n\n<i>Those in the medical field who can read true signs of illness from false ones may even cure people before any symptoms can show.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10822, 'Skill DMG', '79.2%', 1
        where exists (select 1 from skills where id = 10822 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10822 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10822, 'Healing', '8.00% Max HP+770', 2
        where exists (select 1 from skills where id = 10822 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10822 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10822, 'CD', '10.0s', 3
        where exists (select 1 from skills where id = 10822 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10822 and position = 3);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000082 order by id limit 1), 10822, 1, true, false, '', false
      where exists (select 1 from skills where id = 10822 and character_id = 10000082)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10825, 10000082, 'Holistic Revivification', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/fabe10ff4511cb9e81a3ca9155ee9283.png', 1, 'Enters the Pulsing Clarity state, creating a Seamless Shield that absorbs <color=#99FF88FF>Dendro DMG</color> with 250% effectiveness.\nWhile in this state, Baizhu will generate a new Seamless Shield every 2.5s.\n\nThe Seamless Shield will heal your own active character based on Baizhu''s Max HP and attack opponents by unleashing Spiritveins, dealing <color=#99FF88FF>Dendro DMG</color> under the following circumstances:\n·When a character is under the protection of a Seamless Shield and a new Seamless Shield is generated.\n·When the Seamless Shield''s effects expire, or when it is shattered.\n\n<i>If you can perceive the heavens and the earth, defend against malignant auras with the flow of qi, and keep your mind clear, surely nothing can hinder you.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10825, 'Seamless Shield DMG Absorption', '0.80% Max HP+77', 1
        where exists (select 1 from skills where id = 10825 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10825 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10825, 'Seamless Shield Duration', '2.5s', 2
        where exists (select 1 from skills where id = 10825 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10825 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10825, 'Seamless Shield Healing', '5.20% Max HP+501', 3
        where exists (select 1 from skills where id = 10825 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10825 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10825, 'Spiritvein DMG', '97.1%', 4
        where exists (select 1 from skills where id = 10825 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10825 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10825, 'Pulsing Clarity Duration', '14.0s', 5
        where exists (select 1 from skills where id = 10825 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10825 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10825, 'CD', '20.0s', 6
        where exists (select 1 from skills where id = 10825 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10825 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10825, 'Energy Cost', '80', 7
        where exists (select 1 from skills where id = 10825 and character_id = 10000082) and not exists (select 1 from skill_affixes where skill_id = 10825 and position = 7);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000082 order by id limit 1), 10825, 1, true, false, '', false
      where exists (select 1 from skills where id = 10825 and character_id = 10000082)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (8221, 10000082, 'Five Fortunes Forever', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/1aca91d5eb96533401724bea99362856.png', 2, 'Baizhu gains different effects according to the current HP of your current active character:\n·When their HP is less than 50%, Baizhu gains 20% Healing Bonus.\n·When their HP is equal to or more than 50%, Baizhu gains 25% <color=#99FF88FF>Dendro DMG Bonus</color>.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000082 order by id limit 1), 8221, 1, true, false, '', false
      where exists (select 1 from skills where id = 8221 and character_id = 10000082)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (8222, 10000082, 'All Things Are of the Earth', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/9dd47152d1faf8a07dc33134d9f06a83.png', 2, 'Characters who are healed by <color=#FFD780FF>Seamless Shields</color> will gain the Year of Verdant Favor effect: Each 1,000 Max HP that Baizhu possesses that does not exceed 50,000 will increase the Burning, Bloom, Hyperbloom, and Burgeon reaction DMG dealt by these characters by 2%, their Lunar-Bloom DMG by 0.7%, and the DMG Bonus provided by Aggravate and Spread by 0.8%. This effect lasts 6s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000082 order by id limit 1), 8222, 1, false, false, '', false
      where exists (select 1 from skills where id = 8222 and character_id = 10000082)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (8223, 10000082, 'Herbal Nourishment', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/37f865d2338a07c476a26a6ae93274ae.png', 2, 'When Baizhu is in the party, interacting with certain harvestable items will heal your current active character for 2.5% of Baizhu''s Max HP.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000082 order by id limit 1), 8223, 1, true, false, '', false
      where exists (select 1 from skills where id = 8223 and character_id = 10000082)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 2000, 'selected', '3940', '3162', '7101')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 20, 'selected', '9.1%', null, '9.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 2001, 'selected', '349', '162', '511')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 22, 'selected', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 2002, 'selected', '147', '36', '184')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 28, 'selected', '13', null, '13')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 43, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 23, 'selected', '128.0%', null, '128.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 2000, 'base', '3940', '3162', '7101')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 2001, 'base', '349', '162', '511')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 2002, 'base', '147', '36', '184')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 28, 'base', '13', null, '13')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 999999, 'base', '220', null, '220')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 20, 'extra', '9.1%', null, '9.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 22, 'extra', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 23, 'extra', '128.0%', null, '128.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000082 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150061, 'Crimson Witch of Flames') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150061, 2, 'Pyro DMG Bonus +15%'
        where not exists (select 1 from relic_set_affixes where set_id = 2150061 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150061, 4, 'Increases Overloaded, Burning, and Burgeon DMG by 40%. Increases Vaporize and Melt DMG by 15%. Using Elemental Skill increases the 2-Piece Set Bonus by 50% of its starting value for 10s. Max 3 stacks.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150061 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (80442, 'Witch''s Flower of Blaze', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/a82e8324d448243daaa56674785ee82f.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000082 order by id limit 1), 80442, 2150061, 1, 4, 0, 2, '645', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 1), 23, '4.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 1) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 1), 9, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 1) and property_type_id = 9);
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57422, 'Instructor''s Feather Accessory', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/239b10d2e54e17572a34ac34156f91fa.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000082 order by id limit 1), 57422, 2100071, 2, 4, 8, 5, '137', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 2), 28, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 2) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 2), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 2) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 2), 9, '5.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 2) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 2), 20, '2.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 2) and property_type_id = 20);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59351, 'Exile''s Pocket Watch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f9dd8d807eaa9ec5997b9c0e6f7cd48c.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000082 order by id limit 1), 59351, 2100091, 3, 3, 0, 3, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 3), 20, '1.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 3) and property_type_id = 20);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59311, 'Exile''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7847bfdeab60c072ec09b17462505cdc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000082 order by id limit 1), 59311, 2100091, 4, 3, 0, 3, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 4), 23, '3.9%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 4) and property_type_id = 23);
insert into relic_sets (id, name) values (2100121, 'Scholar') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100121, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100121 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100121, 4, 'Gaining Elemental Particles or Orbs gives 3 Energy to all party members who have a bow or a catalyst equipped. Can only occur once every 3s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100121 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (62432, 'Scholar''s Lens', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/64b60bb7b2b1e35e7ece981c3fcf9134.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000082 order by id limit 1), 62432, 2100121, 5, 4, 8, 3, '20.6%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 5), 5, '12', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 5) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 5), 2, '239', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 5) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 5), 9, '5.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 5) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 5), 6, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000082 order by id limit 1) and position = 5) and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000082, 'sand', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000082 and slot = 'sand' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000082, 'goblet', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000082 and slot = 'goblet' and property_type_id = 3);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000082, 'circlet', 3
          where not exists (select 1 from character_relic_recommendations where character_id = 10000082 and slot = 'circlet' and property_type_id = 3);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000082, 3
        where not exists (select 1 from character_recommended_substats where character_id = 10000082 and property_type_id = 3);

-- Manekina (10000118)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000118, 'Manekina', 'https://fastcdn.hoyoverse.com/static-resource-v2/2025/10/16/7328f006a498626b32a1e187c0dba1ea_7198130205836288559.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/cf31bb5bd03ef7b2b7e48d13bc14600f.png', 'https://fastcdn.hoyoverse.com/static-resource-v2/2025/10/16/96df141f7d4d44b153a5af52420fd1ce_5040035997387079748.png', 'Cryo', 5, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000118, 20, 0, 0, false
    where not exists (select 1 from character_builds where character_id = 10000118);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11306, 'Skyrider Sword', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/bc3f197fd37c0f92f0f253f578a1d266.png', 1, 'Sword', 3, 'A reliable steel sword. The legendary Skyrider once tried to ride it as a flying sword...')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000118 order by id limit 1), 11306, 20, 1, 4)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1)), 4, 'main', null, null, 105
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1)), 23, 'sub', null, null, 20
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1)) and property_slot = 'sub');
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11171, 10000118, 'Outlander Arts: Vigilant Watch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 4 rapid strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to unleash 2 rapid sword strikes.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11171, '1-Hit DMG', '51.8%', 1
        where exists (select 1 from skills where id = 11171 and character_id = 10000118) and not exists (select 1 from skill_affixes where skill_id = 11171 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11171, '2-Hit DMG', '49.7%', 2
        where exists (select 1 from skills where id = 11171 and character_id = 10000118) and not exists (select 1 from skill_affixes where skill_id = 11171 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11171, '3-Hit DMG', '33.7%×2', 3
        where exists (select 1 from skills where id = 11171 and character_id = 10000118) and not exists (select 1 from skill_affixes where skill_id = 11171 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11171, '4-Hit DMG', '80.9%', 4
        where exists (select 1 from skills where id = 11171 and character_id = 10000118) and not exists (select 1 from skill_affixes where skill_id = 11171 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11171, 'Charged Attack DMG', '52.6%+59.1%', 5
        where exists (select 1 from skills where id = 11171 and character_id = 10000118) and not exists (select 1 from skill_affixes where skill_id = 11171 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11171, 'Charged Attack Stamina Cost', '20.0', 6
        where exists (select 1 from skills where id = 11171 and character_id = 10000118) and not exists (select 1 from skill_affixes where skill_id = 11171 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11171, 'Plunge DMG', '63.9%', 7
        where exists (select 1 from skills where id = 11171 and character_id = 10000118) and not exists (select 1 from skill_affixes where skill_id = 11171 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 11171, 'Low/High Plunge DMG', '128%/160%', 8
        where exists (select 1 from skills where id = 11171 and character_id = 10000118) and not exists (select 1 from skill_affixes where skill_id = 11171 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000118 order by id limit 1), 11171, 1, true, false, '', false
      where exists (select 1 from skills where id = 11171 and character_id = 10000118)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11172, 10000118, 'Punishing Barrage', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68f81ec7/63aba6ac9d035929737759dcc26063be.png', 1, 'The Manekin attacks nearby opponents once, dealing AoE DMG corresponding to their own Elemental Type before pulling back rapidly. After unleashing an Elemental Skill, the Manekin''s Normal Attacks, Charged Attacks, and Plunging Attacks are converted to deal the corresponding elemental DMG, which cannot be overridden by other Elemental infusions, for a period of time. This effect will disappear when the Manekin leaves the field.\n\nHas 2 charges.\n\n<i>"A well-measured blow is a necessary warning."</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11172, 'Skill DMG', '134.4%', 1
        where exists (select 1 from skills where id = 11172 and character_id = 10000118) and not exists (select 1 from skill_affixes where skill_id = 11172 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11172, 'Elemental Type Conversion Duration', '4.0s', 2
        where exists (select 1 from skills where id = 11172 and character_id = 10000118) and not exists (select 1 from skill_affixes where skill_id = 11172 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11172, 'CD', '10.0s', 3
        where exists (select 1 from skills where id = 11172 and character_id = 10000118) and not exists (select 1 from skill_affixes where skill_id = 11172 and position = 3);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000118 order by id limit 1), 11172, 1, true, false, '', false
      where exists (select 1 from skills where id = 11172 and character_id = 10000118)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (111754, 10000118, 'No Entry', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68f81ec7/86fd98fe5bbeac37e4fcb1c829dd29c8.png', 1, 'The Manekin summons a "Restricted Area" that follows them around, dealing 1 instance of DMG corresponding to the Manekin''s Elemental Type to nearby opponents.\nAdditionally, when opponents enter the Restricted Area, they will receive 1 instance of DMG corresponding to the Manekin''s Elemental Type. This effect can trigger once every 0.5s.\nThe Restricted Area will disappear when the Manekin leaves the field.\n\n<i>"Those who insist on trespassing within the restricted area will be regarded as hostile and expelled with maximum force."</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 111754, 'Restricted Area Summon DMG', '324.0%', 1
        where exists (select 1 from skills where id = 111754 and character_id = 10000118) and not exists (select 1 from skill_affixes where skill_id = 111754 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 111754, 'Restricted Area Trespass DMG', '28.0%', 2
        where exists (select 1 from skills where id = 111754 and character_id = 10000118) and not exists (select 1 from skill_affixes where skill_id = 111754 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 111754, 'Restricted Area Duration', '8.0s', 3
        where exists (select 1 from skills where id = 111754 and character_id = 10000118) and not exists (select 1 from skill_affixes where skill_id = 111754 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 111754, 'CD', '15.0s', 4
        where exists (select 1 from skills where id = 111754 and character_id = 10000118) and not exists (select 1 from skill_affixes where skill_id = 111754 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 111754, 'Energy Cost', '60', 5
        where exists (select 1 from skills where id = 111754 and character_id = 10000118) and not exists (select 1 from skill_affixes where skill_id = 111754 and position = 5);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000118 order by id limit 1), 111754, 1, true, false, '', false
      where exists (select 1 from skills where id = 111754 and character_id = 10000118)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11721, 10000118, 'Battlelines Redrawn', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68f81ec9/567237c5298d9bca3480af4f9e65ef82.png', 2, 'When the Manekin leaves the field, if a Restricted Area that they summoned is still active, it will explode, dealing AoE DMG of the Manekin''s Elemental Type equal to 200% of the Manekin''s ATK.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000118 order by id limit 1), 11721, 1, false, false, '', false
      where exists (select 1 from skills where id = 11721 and character_id = 10000118)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11722, 10000118, 'Combat Readiness', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68f81ec9/3de485915e21c5ff2ab7dd9eb2d3919e.png', 2, 'When the Manekin is not on the field and their Elemental Energy is below 30%, they will recover 2 Elemental Energy per second.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000118 order by id limit 1), 11722, 1, false, false, '', false
      where exists (select 1 from skills where id = 11722 and character_id = 10000118)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11725, 10000118, 'Agile Stance', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68f81ec9/b95453ccd15d50ad23d195d3e2e4b601.png', 2, 'When the Manekin unleashes an Elemental Skill or Burst, it will change to one of its existing Cosmetic Plans at random.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000118 order by id limit 1), 11725, 1, true, false, '', false
      where exists (select 1 from skills where id = 11725 and character_id = 10000118)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 2000, 'selected', '2342', '610', '2953')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 20, 'selected', '7.1%', null, '7.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 2001, 'selected', '151', '59', '210')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 22, 'selected', '61.2%', null, '61.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 2002, 'selected', '147', '15', '162')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 26, 'selected', '4.0%', null, '4.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 28, 'selected', '80', null, '80')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 46, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 23, 'selected', '120.0%', null, '120.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 2000, 'base', '2342', '610', '2953')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 2001, 'base', '151', '59', '210')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 2002, 'base', '147', '15', '162')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 28, 'base', '80', null, '80')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 20, 'extra', '7.1%', null, '7.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 22, 'extra', '61.2%', null, '61.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 26, 'extra', '4.0%', null, '4.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 23, 'extra', '120.0%', null, '120.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000118 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57341, 'Instructor''s Brooch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/ab213bb1abd2a5467d680d5ea9890417.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000118 order by id limit 1), 57341, 2100071, 1, 3, 0, 2, '430', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1) and position = 1), 9, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1) and position = 1) and property_type_id = 9);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55321, 'Berserker''s Indigo Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/92d2a9153a2f03e1249c17f8530a2aa3.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000118 order by id limit 1), 55321, 2100051, 2, 3, 0, 5, '28', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1) and position = 2), 22, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1) and position = 2) and property_type_id = 22);
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57351, 'Instructor''s Pocket Watch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/76419f505a01e33f9aa12349802e1d1d.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000118 order by id limit 1), 57351, 2100071, 3, 3, 0, 9, '6.6%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1) and position = 3), 6, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1) and position = 3) and property_type_id = 6);
insert into relic_sets (id, name) values (2100111, 'Lucky Dog') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100111, 2, 'DEF increased by 100.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100111 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100111, 4, 'Picking up Mora restores 300 HP.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100111 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (61311, 'Lucky Dog''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/b42512d4d511944707d69e587465cd6c.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000118 order by id limit 1), 61311, 2100111, 4, 3, 8, 6, '17.1%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1) and position = 4), 22, '3.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1) and position = 4) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1) and position = 4), 3, '2.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1) and position = 4) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1) and position = 4), 2, '115', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1) and position = 4) and property_type_id = 2);
insert into relic_sets (id, name) values (2100061, 'Martial Artist') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100061, 2, 'Normal and Charged Attack DMG +15%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100061 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100061, 4, 'After using Elemental Skill, increases Normal Attack and Charged Attack DMG by 25% for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100061 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (56332, 'Martial Artist''s Bandana', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/a47393ddf72a5af6eb1eedba49f56940.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000118 order by id limit 1), 56332, 2100061, 5, 3, 0, 26, '4.0%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1) and position = 5), 22, '4.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1) and position = 5) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1) and position = 5), 20, '2.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000118 order by id limit 1) and position = 5) and property_type_id = 20);

-- Aino (10000121)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000121, 'Aino', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68c0b17a/cfec735e9e867016be94f500e9dae122.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/8c2703ada814233cd8bb76f5bfeda98e.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68c0b1bb/99fb1fb7374069299b6a37848b6cca9e.png', 'Hydro', 4, 11)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000121, 20, 1, 2, false
    where not exists (select 1 from character_builds where character_id = 10000121);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (12405, 'Rainslasher', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/de1e307e1104fbf7c8f7a7ef5cb143e1.png', 11, 'Claymore', 4, 'A fluorescent greatsword with no sharp edge that crushes enemies with brute force and raw power.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000121 order by id limit 1), 12405, 10, 0, 5)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1)), 4, 'main', null, null, 74
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1)), 28, 'sub', null, null, 49
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (1211, 10000121, 'The Theory of Ash—Field Equilibrium', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68c0b1b9/f5e4bd05b972f8c557f8d16498fa0ef6.png', 'After Aino uses her Elemental Skill <color=#FFD780FF>{LINK#S11212}Musecatcher{/LINK}</color> or her Elemental Burst <color=#FFD780FF>{LINK#S11215}Precision Hydronic Cooler{/LINK}</color>, her Elemental Mastery will be increased by 80. The Elemental Mastery of other nearby active party members will be increased by 80 for 15s.\n\nThe Elemental Mastery-increasing effects of this Constellation do not stack.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000121 order by id limit 1), 1211, true, false, '', false
      where exists (select 1 from constellations where id = 1211 and character_id = 10000121)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1212, 10000121, 'The Principle of Transference in Gear Differentials', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68c0b1b9/a0ffcaf32589c207a7b50e298ea3ad66.png', 'If Aino is off-field while the <color=#FFD780FF>Focused Hydronic Cooling Zone</color> of her Elemental Burst <color=#FFD780FF>{LINK#S11215}Precision Hydronic Cooler{/LINK}</color> is active, when your active party member hits a nearby opponent with an attack, the <color=#FFD780FF>Cool Your Jets Ducky</color> will fire an additional water ball at that opponent, dealing <color=#80C0FFFF>AoE Hydro DMG</color> equal to 25% of Aino''s ATK and 100% of her Elemental Mastery. This DMG is considered Elemental Burst DMG. This effect can be triggered once every 5s.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000121 order by id limit 1), 1212, true, false, '', false
      where exists (select 1 from constellations where id = 1212 and character_id = 10000121)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1213, 10000121, 'Cake and the Art of Mechanism Repair', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68c0b1b9/a375ef4c084b8192cca51e56c2e80fe3.png', 'Increases the Level of <color=#FFD780FF>{LINK#S11215}Precision Hydronic Cooler{/LINK}</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000121 order by id limit 1), 1213, false, false, '', false
      where exists (select 1 from constellations where id = 1213 and character_id = 10000121)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1214, 10000121, 'Butter and Cats and the Law of Energy Supply', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68c0b1b9/8b2938befeb6251649fa73a506fc4f2f.png', 'When the Elemental Skill <color=#FFD780FF>{LINK#S11212}Musecatcher{/LINK}</color> hits an opponent, it will restore 10 Elemental Energy for Aino. Energy can be restored to her in this manner once every 10s.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000121 order by id limit 1), 1214, false, false, '', false
      where exists (select 1 from constellations where id = 1214 and character_id = 10000121)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1215, 10000121, 'Perpetual Turbine of Metal and Light', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68c0b1b9/25fd91c2510740fde1db50428d749303.png', 'Increases the Level of <color=#FFD780FF>{LINK#S11212}Musecatcher{/LINK}</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000121 order by id limit 1), 1215, false, false, '', false
      where exists (select 1 from constellations where id = 1215 and character_id = 10000121)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1216, 10000121, 'The Burden of Creative Genius', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68c0b1b9/10bd2d5fa2ee77e4f239bdc55c01e895.png', 'For the next 15s after using the Elemental Burst <color=#FFD780FF>{LINK#S11215}Precision Hydronic Cooler{/LINK}</color>, DMG from nearby active characters'' Electro-Charged, Bloom, Lunar-Charged, Lunar-Bloom, and Lunar-Crystallize reactions is increased by 15%.\n<color=#FFD780FF>Moonsign: Ascendant Gleam</color>: DMG from the aforementioned reactions will be further increased by 20%.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000121 order by id limit 1), 1216, false, false, '', false
      where exists (select 1 from constellations where id = 1216 and character_id = 10000121)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11211, 10000121, 'Bish-Bash-Bosh Repair', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/bf0237fba9d4ab5b47ea86b90711a765.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 3 consecutive strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nDrains Stamina over time to perform continuous spinning attacks against all nearby opponents.\nAt the end of the sequence, performs a more powerful slash. \n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11211, '1-Hit DMG', '66.5%', 1
        where exists (select 1 from skills where id = 11211 and character_id = 10000121) and not exists (select 1 from skill_affixes where skill_id = 11211 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11211, '2-Hit DMG', '66.2%', 2
        where exists (select 1 from skills where id = 11211 and character_id = 10000121) and not exists (select 1 from skill_affixes where skill_id = 11211 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11211, '3-Hit DMG', '49.2%×2', 3
        where exists (select 1 from skills where id = 11211 and character_id = 10000121) and not exists (select 1 from skill_affixes where skill_id = 11211 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11211, 'Charged Attack Loop DMG', '62.5%', 4
        where exists (select 1 from skills where id = 11211 and character_id = 10000121) and not exists (select 1 from skill_affixes where skill_id = 11211 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11211, 'Charged Attack Final DMG', '113%', 5
        where exists (select 1 from skills where id = 11211 and character_id = 10000121) and not exists (select 1 from skill_affixes where skill_id = 11211 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11211, 'Charged Attack Stamina Cost', '40.0/s', 6
        where exists (select 1 from skills where id = 11211 and character_id = 10000121) and not exists (select 1 from skill_affixes where skill_id = 11211 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11211, 'Max Duration', '5.0s', 7
        where exists (select 1 from skills where id = 11211 and character_id = 10000121) and not exists (select 1 from skill_affixes where skill_id = 11211 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 11211, 'Plunge DMG', '74.6%', 8
        where exists (select 1 from skills where id = 11211 and character_id = 10000121) and not exists (select 1 from skill_affixes where skill_id = 11211 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 11211, 'Low/High Plunge DMG', '149%/186%', 9
        where exists (select 1 from skills where id = 11211 and character_id = 10000121) and not exists (select 1 from skill_affixes where skill_id = 11211 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000121 order by id limit 1), 11211, 1, true, false, '', false
      where exists (select 1 from skills where id = 11211 and character_id = 10000121)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11212, 10000121, 'Musecatcher', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68c0b1b7/9036689db484d5b98aca56379b66ba1e.png', 1, 'Aino throws a <color=#FFD780FF>Musecatcher</color> forward, dealing <color=#80C0FFFF>Hydro DMG</color> and dragging her along behind it. When the dragging stops, Aino deals <color=#80C0FFFF>AoE Hydro DMG</color> to nearby opponents.\nHolding the Skill will cause it to behave differently.\n\n<color=#FFD780FF>Hold</color>\nEnter Aiming Mode to adjust the Musecatcher''s throwing direction.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11212, 'Stage 1 DMG', '65.6%', 1
        where exists (select 1 from skills where id = 11212 and character_id = 10000121) and not exists (select 1 from skill_affixes where skill_id = 11212 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11212, 'Stage 2 DMG', '188.8%', 2
        where exists (select 1 from skills where id = 11212 and character_id = 10000121) and not exists (select 1 from skill_affixes where skill_id = 11212 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11212, 'CD', '10.0s', 3
        where exists (select 1 from skills where id = 11212 and character_id = 10000121) and not exists (select 1 from skill_affixes where skill_id = 11212 and position = 3);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000121 order by id limit 1), 11212, 1, true, false, '', false
      where exists (select 1 from skills where id = 11212 and character_id = 10000121)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11215, 10000121, 'Precision Hydronic Cooler', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68c0b1b7/de90548e29f3eec0209cd484eea69a8a.png', 1, 'Aino deploys a custom water-spraying device, the <color=#FFD780FF>Cool Your Jets Ducky</color> to establish a <color=#FFD780FF>Focused Hydronic Cooling Zone</color>.\nWhile active, the Cool Your Jets Ducky will periodically fire water balls at nearby opponents, dealing <color=#80C0FFFF>Hydro DMG</color>.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11215, 'Water Ball DMG', '20.1%', 1
        where exists (select 1 from skills where id = 11215 and character_id = 10000121) and not exists (select 1 from skill_affixes where skill_id = 11215 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11215, 'Duration', '14.0s', 2
        where exists (select 1 from skills where id = 11215 and character_id = 10000121) and not exists (select 1 from skill_affixes where skill_id = 11215 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11215, 'CD', '13.5s', 3
        where exists (select 1 from skills where id = 11215 and character_id = 10000121) and not exists (select 1 from skill_affixes where skill_id = 11215 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11215, 'Energy Cost', '50', 4
        where exists (select 1 from skills where id = 11215 and character_id = 10000121) and not exists (select 1 from skill_affixes where skill_id = 11215 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000121 order by id limit 1), 11215, 1, true, false, '', false
      where exists (select 1 from skills where id = 11215 and character_id = 10000121)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (12121, 10000121, 'Modular Efficiency Protocol', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68c0b1b9/e14874378494418cb378aa26e214b38b.png', 2, 'Aino will be granted the corresponding buff effects based on the party''s <color=#FFD780FF>Moonsign</color>.\n\n<color=#FFD780FF>Moonsign: Ascendant Gleam</color>: Her Elemental Burst <color=#FFD780FF>{LINK#S11215}Precision Hydronic Cooler{/LINK}</color> is enhanced: The <color=#FFD780FF>Cool Your Jets Ducky</color> will fire water balls more frequently, and the water balls will deal <color=#80C0FFFF>AoE Hydro DMG</color> over a larger area of effect.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000121 order by id limit 1), 12121, 1, false, false, '', false
      where exists (select 1 from skills where id = 12121 and character_id = 10000121)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (12122, 10000121, 'Structured Power Booster', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68c0b1b9/09b2ee31388ce429daa456b1066529c3.png', 2, 'Aino''s Elemental Burst DMG is increased by 50% of her Elemental Mastery.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000121 order by id limit 1), 12122, 1, false, false, '', false
      where exists (select 1 from skills where id = 12122 and character_id = 10000121)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (12123, 10000121, 'Moonsign Benediction: Force Limit Analysis', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68c0b1b9/041e919d235abf28be823fb2e7ff8a2b.png', 2, 'When Aino is in the party, the party''s <color=#FFD780FF>Moonsign</color> will increase by 1 level.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000121 order by id limit 1), 12123, 1, true, false, '', false
      where exists (select 1 from skills where id = 12123 and character_id = 10000121)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (12125, 10000121, 'Miniaturized Detection Sensor', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/68c0b1b9/e2f6d40907fc04ffe1e42c23187ad1f3.png', 2, 'Displays the location of nearby <color=#FFD780FF>resources unique to Nod-Krai</color> on the mini-map.\nAdditionally, Aino appears to be able to alter the Cool Your Jets Ducky''s appearance in some way...')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000121 order by id limit 1), 12125, 1, true, false, '', false
      where exists (select 1 from skills where id = 12125 and character_id = 10000121)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 2000, 'selected', '2413', '573', '2986')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 20, 'selected', '8.5%', null, '8.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 2001, 'selected', '126', '62', '188')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 22, 'selected', '53.3%', null, '53.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 2002, 'selected', '131', '30', '161')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 28, 'selected', '129', null, '129')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 42, 'selected', '5.2%', null, '5.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 23, 'selected', '103.5%', null, '103.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 2000, 'base', '2413', '573', '2986')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 2001, 'base', '126', '62', '188')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 2002, 'base', '131', '30', '161')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 28, 'base', '129', null, '129')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 20, 'extra', '8.5%', null, '8.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 22, 'extra', '53.3%', null, '53.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 23, 'extra', '103.5%', null, '103.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 42, 'element', '5.2%', null, '5.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000121 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57341, 'Instructor''s Brooch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/ab213bb1abd2a5467d680d5ea9890417.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000121 order by id limit 1), 57341, 2100071, 1, 3, 0, 2, '430', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1) and position = 1), 6, '3.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1) and position = 1) and property_type_id = 6);
insert into relic_sets (id, name) values (2100011, 'Resolution of Sojourner') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100011, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100011 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100011, 4, 'Increases Charged Attack CRIT Rate by 30%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100011 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (51322, 'Feather of Homecoming', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f6e5274b9ceb03a8bdc15498def6c269.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000121 order by id limit 1), 51322, 2100011, 2, 3, 0, 5, '28', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1) and position = 2), 8, '10', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1) and position = 2) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1) and position = 2), 23, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1) and position = 2) and property_type_id = 23);
insert into relic_sets (id, name) values (2100011, 'Resolution of Sojourner') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100011, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100011 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100011, 4, 'Increases Charged Attack CRIT Rate by 30%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100011 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (51352, 'Sundial of the Sojourner', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/2e497232c519183b75fd4d0324e89405.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000121 order by id limit 1), 51352, 2100011, 3, 3, 0, 9, '6.6%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1) and position = 3), 6, '2.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1) and position = 3) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1) and position = 3), 2, '143', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1) and position = 3) and property_type_id = 2);
insert into relic_sets (id, name) values (2100011, 'Resolution of Sojourner') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100011, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100011 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100011, 4, 'Increases Charged Attack CRIT Rate by 30%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100011 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (51312, 'Goblet of the Sojourner', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/215e8828639a6b6851a6744c6c1828d4.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000121 order by id limit 1), 51312, 2100011, 4, 3, 0, 42, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1) and position = 4), 6, '3.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1) and position = 4) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1) and position = 4), 22, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1) and position = 4) and property_type_id = 22);
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57331, 'Instructor''s Cap', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/13dc11a5b26e2890847a8f86e07061a7.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000121 order by id limit 1), 57331, 2100071, 5, 3, 0, 20, '3.5%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1) and position = 5), 8, '11', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000121 order by id limit 1) and position = 5) and property_type_id = 8);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000121, 'sand', 28
          where not exists (select 1 from character_relic_recommendations where character_id = 10000121 and slot = 'sand' and property_type_id = 28);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000121, 'goblet', 42
          where not exists (select 1 from character_relic_recommendations where character_id = 10000121 and slot = 'goblet' and property_type_id = 42);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000121, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 10000121 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000121, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000121 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000121, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000121 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000121, 28
        where not exists (select 1 from character_recommended_substats where character_id = 10000121 and property_type_id = 28);

-- Lan Yan (10000108)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000108, 'Lan Yan', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/eba829f8ca4b38367c4a2551d0e228ae.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/ec405681b4d5e20223a14638789fca44.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/11ee069d5e9ba93fb4325eabd5f16ef1.png', 'Anemo', 4, 10)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000108, 20, 1, 0, false
    where not exists (select 1 from character_builds where character_id = 10000108);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (14409, 'Eye of Perception', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/811ff594eebe6cc05f12e02662803239.png', 10, 'Catalyst', 4, 'A dim black glaze pearl that is said to have the power to read the purity of one''s heart.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000108 order by id limit 1), 14409, 1, 0, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000108 order by id limit 1)), 4, 'main', null, null, 41
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000108 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000108 order by id limit 1)), 6, 'sub', null, null, 12
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000108 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (1081, 10000108, '"As One Might Stride Betwixt the Clouds"', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/f0a62108cca121c4d84e9c9e37af5f62.png', 'After triggering the Elemental Absorption from the Ascension Talent "Four Sealing Divination Charms," this instance of Lan Yan''s Elemental Skill <color=#FFD780FF>Swallow-Wisp Pinion Dance</color> will produce another Feathermoon Ring when they are thrown at opponents.\nYou must first unlock the Ascension Talent "Four Sealing Divination Charms."', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000108 order by id limit 1), 1081, false, false, '', false
      where exists (select 1 from constellations where id = 1081 and character_id = 10000108)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1082, 10000108, '"Dance Vestments Billow Like Rainbow Jade"', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/246d0d5b77c63aa1318da8c5d56878b9.png', 'While the <color=#FFD780FF>Swallow-Wisp Shield</color> is active, when your active party member''s Normal Attacks deal DMG, 40% of the Shield''s DMG absorption will be restored, up to its original maximum absorption. This effect can occur once every 2s.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000108 order by id limit 1), 1082, false, false, '', false
      where exists (select 1 from constellations where id = 1082 and character_id = 10000108)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1083, 10000108, '"On White Wings Pierce Through Cloud and Fog"', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/ee9dffdd13c3c1e222eb332c1288bf5e.png', 'Increases the Level of <color=#FFD780FF>Swallow-Wisp Pinion Dance</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000108 order by id limit 1), 1083, false, false, '', false
      where exists (select 1 from constellations where id = 1083 and character_id = 10000108)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1084, 10000108, '"With Drakefalcon''s Blood-Pearls Adorned"', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/a75e8fe29d6230e76aa224aba26c4d45.png', 'After Lan Yan uses her Elemental Burst <color=#FFD780FF>Lustrous Moonrise</color>, the Elemental Mastery of all nearby party members increases by 60 for 12s.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000108 order by id limit 1), 1084, false, false, '', false
      where exists (select 1 from constellations where id = 1084 and character_id = 10000108)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1085, 10000108, '"Having Met You, My Heart is Gladdened"', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/abe4c7c9b2fdf3ec189f3b93c646391f.png', 'Increases the Level of <color=#FFD780FF>Lustrous Moonrise</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000108 order by id limit 1), 1085, false, false, '', false
      where exists (select 1 from constellations where id = 1085 and character_id = 10000108)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1086, 10000108, '"Let Us Away on Sylphic Wing, the Silvered Ornaments to Ring"', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/ce7e85747d4eb4ecf2a5d7cd9b21618a.png', '<color=#FFD780FF>Swallow-Wisp Pinion Dance</color> gains 1 additional charge.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000108 order by id limit 1), 1086, false, false, '', false
      where exists (select 1 from constellations where id = 1086 and character_id = 10000108)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11081, 10000108, 'Black Pheasant Strides on Water', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/2c014e6053c4f0d032e1d1ff0c6de0e1.png', 1, '<color=#FFD780FF>Normal Attack</color>\nWields her Feathermoon Rings to perform up to 4 attacks, dealing <color=#80FFD7FF>Anemo DMG</color>.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to throw out a Feathermoon Ring, dealing <color=#80FFD7FF>Anemo DMG</color>.\n\n<color=#FFD780FF>Plunging Attack</color>\nGathers the power of Anemo and plunges towards the ground from mid-air, damaging all opponents in her path. Deals <color=#80FFD7FF>AoE Anemo DMG</color> upon impact with the ground.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11081, '1-Hit DMG', '41.4%', 1
        where exists (select 1 from skills where id = 11081 and character_id = 10000108) and not exists (select 1 from skill_affixes where skill_id = 11081 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11081, '2-Hit DMG', '20.4%+24.9%', 2
        where exists (select 1 from skills where id = 11081 and character_id = 10000108) and not exists (select 1 from skill_affixes where skill_id = 11081 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11081, '3-Hit DMG', '26.9%+26.9%', 3
        where exists (select 1 from skills where id = 11081 and character_id = 10000108) and not exists (select 1 from skill_affixes where skill_id = 11081 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11081, '4-Hit DMG', '64.6%', 4
        where exists (select 1 from skills where id = 11081 and character_id = 10000108) and not exists (select 1 from skill_affixes where skill_id = 11081 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11081, 'Charged Attack DMG', '37.8%×3', 5
        where exists (select 1 from skills where id = 11081 and character_id = 10000108) and not exists (select 1 from skill_affixes where skill_id = 11081 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11081, 'Charged Attack Stamina Cost', '50.0', 6
        where exists (select 1 from skills where id = 11081 and character_id = 10000108) and not exists (select 1 from skill_affixes where skill_id = 11081 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11081, 'Plunge DMG', '56.8%', 7
        where exists (select 1 from skills where id = 11081 and character_id = 10000108) and not exists (select 1 from skill_affixes where skill_id = 11081 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 11081, 'Low/High Plunge DMG', '114%/142%', 8
        where exists (select 1 from skills where id = 11081 and character_id = 10000108) and not exists (select 1 from skill_affixes where skill_id = 11081 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000108 order by id limit 1), 11081, 1, true, false, '', false
      where exists (select 1 from skills where id = 11081 and character_id = 10000108)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11082, 10000108, 'Swallow-Wisp Pinion Dance', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/e4cc0407a1a87f6bfd9340b679c2629b.png', 1, 'Summoning forth the Swallow-Wisp Shield, a secret art passed down across generations, Lan Yan dashes forward and, upon making contact with her target, will leap back into the air.\nThe Swallow-Wisp Shield''s DMG absorption scales based on her ATK, and has a 250% absorption efficiency against <color=#80FFD7FF>Anemo DMG</color>.\nWhile in mid-air due to the effects of her Elemental Skill: Swallow-Wisp Pinion Dance, pressing her Elemental Skill again or pressing Normal Attack will cause Lan Yan to hurl her Feathermoon Rings at an opponent, and they will spin between nearby opponents twice upon hit, dealing <color=#80FFD7FF>Anemo DMG</color>.\nHolding the Skill will cause it to behave differently.\n\n<color=#FFD780FF>Hold</color>\nEnter Aiming Mode to adjust the dash direction.\n\n<i>"The clouds cut the lunar light, like shadows silver gracing one''s sight."</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11082, 'Feathermoon Ring DMG', '96.3%', 1
        where exists (select 1 from skills where id = 11082 and character_id = 10000108) and not exists (select 1 from skill_affixes where skill_id = 11082 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11082, 'Shield DMG Absorption', '276.5% ATK+1156', 2
        where exists (select 1 from skills where id = 11082 and character_id = 10000108) and not exists (select 1 from skill_affixes where skill_id = 11082 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11082, 'Shield Duration', '12.5s', 3
        where exists (select 1 from skills where id = 11082 and character_id = 10000108) and not exists (select 1 from skill_affixes where skill_id = 11082 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11082, 'CD', '16.0s', 4
        where exists (select 1 from skills where id = 11082 and character_id = 10000108) and not exists (select 1 from skill_affixes where skill_id = 11082 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000108 order by id limit 1), 11082, 1, true, false, '', false
      where exists (select 1 from skills where id = 11082 and character_id = 10000108)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11085, 10000108, 'Lustrous Moonrise', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/93103656f4f1f0b7e24d51d048dddad9.png', 1, 'Lan Yan creates a Feathermoon Swallow Array, pulling in nearby opponents and objects and dealing multiple instances of <color=#80FFD7FF>AoE Anemo DMG</color>.\n\n<i>Strictly speaking, with only Lan Yan herself present, it cannot properly be called an "array." However, if her Rattan Figures are brought into the picture, she can sort of fulfill the requirements... Probably.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11085, 'Skill DMG', '241.1%×3', 1
        where exists (select 1 from skills where id = 11085 and character_id = 10000108) and not exists (select 1 from skill_affixes where skill_id = 11085 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11085, 'CD', '15.0s', 2
        where exists (select 1 from skills where id = 11085 and character_id = 10000108) and not exists (select 1 from skill_affixes where skill_id = 11085 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11085, 'Energy Cost', '60', 3
        where exists (select 1 from skills where id = 11085 and character_id = 10000108) and not exists (select 1 from skill_affixes where skill_id = 11085 and position = 3);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000108 order by id limit 1), 11085, 1, true, false, '', false
      where exists (select 1 from skills where id = 11085 and character_id = 10000108)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10821, 10000108, 'Four Sealing Divination Charms', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/c6e6a798cf0868dbcf467d6b2e1cff2d.png', 2, 'When the dash from the Elemental Skill <color=#FFD780FF>Swallow-Wisp Pinion Dance</color> hits a target, if it interacts with <color=#80C0FFFF>Hydro</color>/<color=#FF9999FF>Pyro</color>/<color=#99FFFFFF>Cryo</color>/<color=#FFACFFFF>Electro</color>, the Swallow-Wisp Shield will undergo Elemental Absorption, with the converted shield absorbing DMG from the corresponding element with 250% efficiency.\nAdditionally, if this use of <color=#FFD780FF>Swallow-Wisp Pinion Dance</color> causes the Swallow-Wisp Shield to undergo Elemental Absorption, the Feathermoon Rings that Lan Yan throws at her foes additionally deal Elemental DMG equal to 50% of the original in the corresponding Elemental Type. This DMG is considered Elemental Skill DMG.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000108 order by id limit 1), 10821, 1, true, false, '', false
      where exists (select 1 from skills where id = 10821 and character_id = 10000108)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10822, 10000108, 'Skyfeather Evil-Subduing Charm', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/44d60c82bf64d129d7514eeec12b1142.png', 2, 'The Elemental Skill <color=#FFD780FF>Swallow-Wisp Pinion Dance</color> and the Elemental Burst <color=#FFD780FF>Lustrous Moonrise</color> deal increased DMG equal to 309% and 774% of Lan Yan''s Elemental Mastery respectively.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000108 order by id limit 1), 10822, 1, false, false, '', false
      where exists (select 1 from skills where id = 10822 and character_id = 10000108)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10823, 10000108, 'Thought and Intent, Like Silken Scent', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/bb7a1f56353e916bac95dfef5b4affb2.png', 2, 'When Lan Yan is in the party, your characters will not startle Crystalflies and certain other animals when getting near them.\nCheck the "Other" sub-category of the "Living Beings / Wildlife" section in the Archive for creatures this skill works on.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000108 order by id limit 1), 10823, 1, true, false, '', false
      where exists (select 1 from skills where id = 10823 and character_id = 10000108)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 2000, 'selected', '2570', '1258', '3828')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 20, 'selected', '7.2%', null, '7.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 2001, 'selected', '111', '67', '177')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 22, 'selected', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 2002, 'selected', '161', '27', '188')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 28, 'selected', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 44, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 23, 'selected', '120.0%', null, '120.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 2000, 'base', '2570', '1258', '3828')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 2001, 'base', '111', '67', '177')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 2002, 'base', '161', '27', '188')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 28, 'base', '0', null, '0')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 20, 'extra', '7.2%', null, '7.2%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 22, 'extra', '50.0%', null, '50.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 23, 'extra', '120.0%', null, '120.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000108 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2100131, 'Traveling Doctor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100131, 2, 'Increases incoming healing by 20%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100131 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100131, 4, 'Using Elemental Burst restores 20% HP.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100131 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (63240, 'Traveling Doctor''s Silver Lotus', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/fa54d9a90020567e76638dd48427152e.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000108 order by id limit 1), 63240, 2100131, 1, 2, 0, 2, '258', 0)
      on conflict do nothing;
insert into relic_sets (id, name) values (2100101, 'Adventurer') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100101, 2, 'Max HP increased by 1,000.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100101 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100101, 4, 'Opening a chest regenerates 30% Max HP over 5s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100101 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (60321, 'Adventurer''s Tail Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/260c4f71afac2b8d0b57e447687f20ab.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000108 order by id limit 1), 60321, 2100101, 2, 3, 1, 5, '36', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000108 order by id limit 1) and position = 2), 8, '10', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000108 order by id limit 1) and position = 2) and property_type_id = 8);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59351, 'Exile''s Pocket Watch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f9dd8d807eaa9ec5997b9c0e6f7cd48c.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000108 order by id limit 1), 59351, 2100091, 3, 3, 0, 6, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000108 order by id limit 1) and position = 3), 8, '10', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000108 order by id limit 1) and position = 3) and property_type_id = 8);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59412, 'Exile''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7847bfdeab60c072ec09b17462505cdc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000108 order by id limit 1), 59412, 2100091, 4, 4, 0, 6, '6.3%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000108 order by id limit 1) and position = 4), 20, '2.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000108 order by id limit 1) and position = 4) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000108 order by id limit 1) and position = 4), 9, '4.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000108 order by id limit 1) and position = 4) and property_type_id = 9);
insert into relic_sets (id, name) values (2100101, 'Adventurer') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100101, 2, 'Max HP increased by 1,000.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100101 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100101, 4, 'Opening a chest regenerates 30% Max HP over 5s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100101 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (60230, 'Adventurer''s Bandana', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/2e4915a7fccba739312194886d2c0c9a.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000108 order by id limit 1), 60230, 2100101, 5, 2, 0, 6, '4.2%', 0)
      on conflict do nothing;
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000108, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000108 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000108, 'goblet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000108 and slot = 'goblet' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000108, 'circlet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000108 and slot = 'circlet' and property_type_id = 6);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000108, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000108 and property_type_id = 6);

-- Lynette (10000083)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000083, 'Lynette', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/5dad272ce992b32d3aa7a708869d1a4a.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/9e7589a86900298f2f5fca7f7684af0a.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f727/40653a8bca56c6e205d2a01b2f6f9a00.png', 'Anemo', 4, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000083, 20, 1, 1, false
    where not exists (select 1 from character_builds where character_id = 10000083);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11303, 'Traveler''s Handy Sword', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/6b735c4a2cc309a44c5c682f81364261.png', 1, 'Sword', 3, 'A handy steel sword which contains scissors, a magnifying glass, tinder, and other useful items in its sheath.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000083 order by id limit 1), 11303, 40, 2, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1)), 4, 'main', null, null, 207
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1)), 9, 'sub', null, null, 16.4
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (831, 10000083, 'A Cold Blade Like a Shadow', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/6d95b0056c2326e11a29e15003755a9b.png', 'When <color=#FFD780FF>Enigmatic Feint</color>''s Enigma Thrust hits an opponent with Shadowsign, a vortex will be created at that opponent''s position that will pull nearby opponents in.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000083 order by id limit 1), 831, true, false, '', false
      where exists (select 1 from constellations where id = 831 and character_id = 10000083)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (832, 10000083, 'Endless Mysteries', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/8e35cddaa7462fd60bfd7008e03b722b.png', 'Whenever the Bogglecat Box summoned by <color=#FFD780FF>Magic Trick: Astonishing Shift</color> fires a Vivid Shot, it will fire an extra Vivid Shot.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000083 order by id limit 1), 832, false, false, '', false
      where exists (select 1 from constellations where id = 832 and character_id = 10000083)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (833, 10000083, 'Cognition-Inverting Gaze', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/42fb54114364f62a092ffb92a7e115ee.png', 'Increases the Level of <color=#FFD780FF>Magic Trick: Astonishing Shift</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000083 order by id limit 1), 833, false, false, '', false
      where exists (select 1 from constellations where id = 833 and character_id = 10000083)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (834, 10000083, 'Tacit Coordination', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/fc480932f775d37aef8250b5bda1a9c2.png', 'Increases <color=#FFD780FF>Enigmatic Feint</color>''s charges by 1.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000083 order by id limit 1), 834, false, false, '', false
      where exists (select 1 from constellations where id = 834 and character_id = 10000083)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (835, 10000083, 'Obscuring Ambiguity', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/a177870481f06068486bd55fff7ef0fb.png', 'Increases the Level of <color=#FFD780FF>Enigmatic Feint</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000083 order by id limit 1), 835, false, false, '', false
      where exists (select 1 from constellations where id = 835 and character_id = 10000083)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (836, 10000083, 'Watchful Eye', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/b95cc54f38e66ee666bd1d3910e729ca.png', 'When Lynette uses <color=#FFD780FF>Enigmatic Feint</color>''s Enigma Thrust, she will gain an <color=#80FFD7FF>Anemo Infusion</color> and 20% <color=#80FFD7FF>Anemo DMG Bonus</color> for 6s.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000083 order by id limit 1), 836, false, false, '', false
      where exists (select 1 from constellations where id = 836 and character_id = 10000083)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10831, 10000083, 'Rapid Ritesword', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 4 rapid strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to unleash 2 rapid sword strikes.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10831, '1-Hit DMG', '43.1%', 1
        where exists (select 1 from skills where id = 10831 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10831 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10831, '2-Hit DMG', '37.6%', 2
        where exists (select 1 from skills where id = 10831 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10831 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10831, '3-Hit DMG', '27.9%+21.6%', 3
        where exists (select 1 from skills where id = 10831 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10831 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10831, '4-Hit DMG', '63.2%', 4
        where exists (select 1 from skills where id = 10831 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10831 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10831, 'Charged Attack DMG', '44.2%+61.4%', 5
        where exists (select 1 from skills where id = 10831 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10831 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10831, 'Charged Attack Stamina Cost', '20.0', 6
        where exists (select 1 from skills where id = 10831 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10831 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10831, 'Plunge DMG', '63.9%', 7
        where exists (select 1 from skills where id = 10831 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10831 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10831, 'Low/High Plunge DMG', '128%/160%', 8
        where exists (select 1 from skills where id = 10831 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10831 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000083 order by id limit 1), 10831, 1, true, false, '', false
      where exists (select 1 from skills where id = 10831 and character_id = 10000083)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10832, 10000083, 'Enigmatic Feint', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/22c05e8c6b66bf3ea298b6a338b8cb0f.png', 1, '#Flicks her mantle and executes an Enigma Thrust, dealing <color=#80FFD7FF>Anemo DMG</color>.\nWhen the Enigma Thrust hits an opponent, it will restore Lynette''s HP based on her Max HP, and in the 4s afterward, she will lose a certain amount of HP per second.\nBased on whether you {LAYOUT_MOBILE#tap}{LAYOUT_PC#press}{LAYOUT_PS#press} or hold this ability, she will use Enigma Thrust differently.\n\n<color=#FFD780FF>{LAYOUT_MOBILE#Tap}{LAYOUT_PC#Press}{LAYOUT_PS#Press}</color>\nShe swiftly uses an Enigma Thrust.\n\n<color=#FFD780FF>Hold</color>\nLynette will enter a high-speed Pilfering Shadow state and apply Shadowsign to a nearby opponent. You can control her movement direction during this state, and you can end it prematurely by using this skill again.\nWhen this high-speed state ends, Lynette will unleash her Enigma Thrust. If there is an opponent with Shadowsign applied to them nearby, Lynette will approach them in a flash before using Enigma Thrust.\n\nA maximum of 1 opponent can have Shadowsign at any one time. When this opponent gets too far from Lynette, the Shadowsign will be canceled.\n\n<color=#FFD780FF>Arkhe: Ousia</color>\nAt specific intervals, Lynette will unleash a Surging Blade when she uses Enigma Thrust, dealing Ousia-aligned <color=#80FFD7FF>Anemo DMG</color>.\n\n<i>"Now then, turn your eyes to the stage and continue to enjoy the performance. When I next appear, I''ll be where you least expect."</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10832, 'Enigma Thrust DMG', '268.0%', 1
        where exists (select 1 from skills where id = 10832 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10832 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10832, 'Surging Blade DMG', '31.2%', 2
        where exists (select 1 from skills where id = 10832 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10832 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10832, 'Surging Blade Interval', '10.0s', 3
        where exists (select 1 from skills where id = 10832 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10832 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10832, 'HP Regeneration', '25% Max HP', 4
        where exists (select 1 from skills where id = 10832 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10832 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10832, 'HP Cost', '6% Current HP/s', 5
        where exists (select 1 from skills where id = 10832 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10832 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10832, 'Hold Max Duration', '2.5s', 6
        where exists (select 1 from skills where id = 10832 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10832 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10832, 'CD', '12.0s', 7
        where exists (select 1 from skills where id = 10832 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10832 and position = 7);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000083 order by id limit 1), 10832, 1, true, false, '', false
      where exists (select 1 from skills where id = 10832 and character_id = 10000083)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10835, 10000083, 'Magic Trick: Astonishing Shift', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/285a736a4d93eb2aa9478ab5ba0226e1.png', 1, 'Lynette raises her mantle high, dealing <color=#80FFD7FF>AoE Anemo DMG</color>, using skillful sleight of hand to make a giant Bogglecat Box appear!\n\n<color=#FFD780FF>Bogglecat Box</color>\n·Taunts nearby opponents, attracting their attacks.\n·Deals <color=#80FFD7FF>Anemo DMG</color> to nearby opponents at intervals.\n·When the Bogglecat Box comes into contact with <color=#80C0FFFF>Hydro</color>/<color=#FF9999FF>Pyro</color>/<color=#99FFFFFF>Cryo</color>/<color=#FFACFFFF>Electro</color>, it will gain the corresponding element and additionally fire Vivid Shots that will deal DMG from that element at intervals.\nElemental Absorption of this kind will only occur once during this ability''s duration.\n\n<i>"Look this way, and look closely. This is a time for miracles, just for us."</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10835, 'Skill DMG', '83.2%', 1
        where exists (select 1 from skills where id = 10835 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10835 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10835, 'Bogglecat Box DMG', '51.2%', 2
        where exists (select 1 from skills where id = 10835 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10835 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10835, 'Vivid Shot DMG', '45.6%', 3
        where exists (select 1 from skills where id = 10835 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10835 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10835, 'Bogglecat Box Duration', '12.0s', 4
        where exists (select 1 from skills where id = 10835 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10835 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10835, 'CD', '18.0s', 5
        where exists (select 1 from skills where id = 10835 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10835 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10835, 'Energy Cost', '70', 6
        where exists (select 1 from skills where id = 10835 and character_id = 10000083) and not exists (select 1 from skill_affixes where skill_id = 10835 and position = 6);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000083 order by id limit 1), 10835, 1, true, false, '', false
      where exists (select 1 from skills where id = 10835 and character_id = 10000083)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (8321, 10000083, 'Sophisticated Synergy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/f5228d481ec114f0974632ba5af1a430.png', 2, 'Within 10s after using <color=#FFD780FF>Magic Trick: Astonishing Shift</color>, when there are 1/2/3/4 Elemental Types in the party, all party members'' ATK will be increased by 8%/12%/16%/20% respectively.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000083 order by id limit 1), 8321, 1, false, false, '', false
      where exists (select 1 from skills where id = 8321 and character_id = 10000083)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (8322, 10000083, 'Props Positively Prepped', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/7ea4675dbd83011e23dc5acea56b58a0.png', 2, 'After the Bogglecat Box summoned by <color=#FFD780FF>Magic Trick: Astonishing Shift</color> performs Elemental Conversion, Lynette''s Elemental Burst will deal 15% more DMG. This effect will persist until the Bogglecat Box''s duration ends.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000083 order by id limit 1), 8322, 1, false, false, '', false
      where exists (select 1 from skills where id = 8322 and character_id = 10000083)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (8323, 10000083, 'Loci-Based Mnemonics', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/0adeadaa079b2aeae061e77e41c8fc84.png', 2, 'Shows the location of nearby <color=#FFD780FF>Recovery Orbs</color> on the minimap. The Aquatic Stamina and HP gained from touching Orbs will be increased by 25%.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000083 order by id limit 1), 8323, 1, true, false, '', false
      where exists (select 1 from skills where id = 8323 and character_id = 10000083)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 2000, 'selected', '2670', '745', '3416')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 20, 'selected', '17.0%', null, '17.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 2001, 'selected', '256', '73', '329')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 22, 'selected', '54.4%', null, '54.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 2002, 'selected', '153', '40', '193')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 28, 'selected', '150', null, '150')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 44, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 23, 'selected', '135.3%', null, '135.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 2000, 'base', '2670', '745', '3416')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 2001, 'base', '256', '73', '329')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 2002, 'base', '153', '40', '193')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 28, 'base', '150', null, '150')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 999999, 'base', '220', null, '220')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 20, 'extra', '17.0%', null, '17.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 22, 'extra', '54.4%', null, '54.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 23, 'extra', '135.3%', null, '135.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000083 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
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
      values ((select id from character_builds where character_id = 10000083 order by id limit 1), 59341, 2100091, 1, 3, 0, 2, '430', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 1), 23, '3.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 1) and property_type_id = 23);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55321, 'Berserker''s Indigo Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/92d2a9153a2f03e1249c17f8530a2aa3.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000083 order by id limit 1), 55321, 2100051, 2, 3, 0, 5, '28', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 2), 6, '2.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 2) and property_type_id = 6);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59452, 'Exile''s Pocket Watch', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/f9dd8d807eaa9ec5997b9c0e6f7cd48c.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000083 order by id limit 1), 59452, 2100091, 3, 4, 0, 28, '25', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 3), 2, '215', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 3) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 3), 23, '4.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 3) and property_type_id = 23);
insert into relic_sets (id, name) values (2100051, 'Berserker') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 2, 'CRIT Rate +12%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100051, 4, 'When HP is below 70%, CRIT Rate increases by an additional 24%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100051 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (55312, 'Berserker''s Bone Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/a1c51bbf393862969fb15640d6a433bd.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000083 order by id limit 1), 55312, 2100051, 4, 3, 0, 6, '5.2%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 4), 2, '100', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 4) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 4), 23, '3.9%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 4) and property_type_id = 23);
insert into relic_sets (id, name) values (2100071, 'Instructor') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100071, 4, 'Upon triggering an Elemental Reaction, increases all party members'' Elemental Mastery by 120 for 8s.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100071 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (57432, 'Instructor''s Cap', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/13dc11a5b26e2890847a8f86e07061a7.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000083 order by id limit 1), 57432, 2100071, 5, 4, 14, 28, '125', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 5), 5, '25', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 5) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 5), 22, '4.4%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 5) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 5), 23, '4.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 5) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 5), 8, '15', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000083 order by id limit 1) and position = 5) and property_type_id = 8);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000083, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000083 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000083, 'goblet', 44
          where not exists (select 1 from character_relic_recommendations where character_id = 10000083 and slot = 'goblet' and property_type_id = 44);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000083, 'circlet', 20
          where not exists (select 1 from character_relic_recommendations where character_id = 10000083 and slot = 'circlet' and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000083, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000083 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000083, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000083 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000083, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000083 and property_type_id = 6);

commit;
