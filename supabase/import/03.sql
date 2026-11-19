-- Part 3 of 13. Generated from app/data/character_detail.ts.
-- Insert-only and safe to re-run. Run the parts in order in the Supabase SQL editor.
begin;

-- Traveler (100000011)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (100000011, 'Traveler', 'https://fastcdn.hoyoverse.com/static-resource-v2/2023/09/26/10dede5c05005ebb96bbe01f8408e775_7397178366194463086.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/10fcbb4bb21456b3d7b9590543bf3891.png', 'https://webstatic.hoyoverse.com/upload/static-resource/2023/06/15/35263f63879cc4270098b4a03d4fd658_4063129471300368143.png', 'Hydro', 5, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 100000011, 90, 0, 3, false
    where not exists (select 1 from character_builds where character_id = 100000011);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11521, 'Exaiphanes Blade', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/8ec89cd8827583d02662704f5738efc8.png', 1, 'Sword', 5, 'A longsword that once shone with the Pale Star''s light. In the voyager''s hand, it becomes a brand-new light that has nothing to do with any past era.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 100000011 order by id limit 1), 11521, 80, 5, 3)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1)), 4, 'main', null, null, 532
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1)), 20, 'sub', null, null, 30.2
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (61, 100000011, 'Swelling Lake', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/eefd0112adccd2bd60d9458993b2ecae.png', 'Picking up a Sourcewater Droplet will restore 2 Energy to the Traveler.\nYou must first unlock the Ascension Talent "Spotless Waters."', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000011 order by id limit 1), 61, true, false, '', false
      where exists (select 1 from constellations where id = 61 and character_id = 100000011)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (62, 100000011, 'Trickling Purity', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/decde2026cdbf78b52dc8102be73b8ec.png', 'The Movement SPD of <color=#FFD780FF>Rising Waters</color>'' bubble will be decreased by 30%, and its duration increased by 3s.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000011 order by id limit 1), 62, true, false, '', false
      where exists (select 1 from constellations where id = 62 and character_id = 100000011)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (63, 100000011, 'Turbulent Ripples', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/e2cc55d2a8b2a27b02664d89406ce3eb.png', 'Increases the Level of <color=#FFD780FF>Aquacrest Saber</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000011 order by id limit 1), 63, true, false, '', false
      where exists (select 1 from constellations where id = 63 and character_id = 100000011)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (64, 100000011, 'Pouring Descent', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/360c3fb66a225d44948971292370565b.png', 'When using <color=#FFD780FF>Aquacrest Saber</color>, an Aquacrest Aegis that can absorb 10% of the Traveler''s Max HP in DMG will be created and will absorb <color=#80C0FFFF>Hydro DMG</color> with 250% effectiveness. It will persist until the Traveler finishes using the skill.\nOnce every 2s, after a Dewdrop hits an opponent, if the Traveler is being protected by Aquacrest Aegis, the DMG Absorption of the Aegis will be restored to 10% of the Traveler''s Max HP. If the Traveler is not presently being protected by an Aegis, one will be redeployed.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000011 order by id limit 1), 64, false, false, '', false
      where exists (select 1 from constellations where id = 64 and character_id = 100000011)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (65, 100000011, 'Churning Whirlpool', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/f0dc8659ebe7aa2554715a7f5b091b48.png', 'Increases the Level of <color=#FFD780FF>Rising Waters</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000011 order by id limit 1), 65, false, false, '', false
      where exists (select 1 from constellations where id = 65 and character_id = 100000011)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (66, 100000011, 'Tides of Justice', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/796dbc6cefdaf4a3500138e0ec2203f5.png', 'When the Traveler picks up a Sourcewater Droplet, they will restore HP to a nearby party member with the lowest remaining HP percentage based on 6% of said member''s Max HP.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000011 order by id limit 1), 66, false, false, '', false
      where exists (select 1 from constellations where id = 66 and character_id = 100000011)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (100552, 100000011, 'Foreign Stream', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 rapid strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to unleash 2 rapid sword strikes.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 100552, '1-Hit DMG', '44.5%', 1
        where exists (select 1 from skills where id = 100552 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 100552 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 100552, '2-Hit DMG', '43.4%', 2
        where exists (select 1 from skills where id = 100552 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 100552 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 100552, '3-Hit DMG', '53.0%', 3
        where exists (select 1 from skills where id = 100552 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 100552 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 100552, '4-Hit DMG', '58.3%', 4
        where exists (select 1 from skills where id = 100552 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 100552 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 100552, '5-Hit DMG', '70.8%', 5
        where exists (select 1 from skills where id = 100552 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 100552 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 100552, 'Charged Attack DMG', '55.9%+72.2%', 6
        where exists (select 1 from skills where id = 100552 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 100552 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 100552, 'Charged Attack Stamina Cost', '20.0', 7
        where exists (select 1 from skills where id = 100552 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 100552 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 100552, 'Plunge DMG', '63.9%', 8
        where exists (select 1 from skills where id = 100552 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 100552 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 100552, 'Low/High Plunge DMG', '128%/160%', 9
        where exists (select 1 from skills where id = 100552 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 100552 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000011 order by id limit 1), 100552, 1, true, true, '', false
      where exists (select 1 from skills where id = 100552 and character_id = 100000011)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10087, 100000011, 'Aquacrest Saber', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/dcc561d097dd02d66a3c7d9614ae5c6f.png', 1, 'Unleashes a torrent that can cleanse the world.\n\n<color=#FFD780FF>Press</color>\nSends a Torrent Surge forward that will deal <color=#80C0FFFF>Hydro DMG</color> to opponents it comes into contact with.\n\n<color=#FFD780FF>Hold</color>\nEnter Aiming Mode and constantly fire off Dewdrops in the direction in which you are aiming, dealing <color=#80C0FFFF>Hydro DMG</color> to opponents they hit.\nWhen the skill ends, it will send a Torrent Surge forward that will deal <color=#80C0FFFF>Hydro DMG</color> to opponents it comes into contact with.\nSuffusion: When using the Hold configuration of this skill, if the Traveler''s HP is higher than 50%, the DMG dealt by Dewdrops will increase based on the Traveler''s Max HP, and the Traveler will lose a fixed amount of HP every second.\n\n<color=#FFD780FF>Arkhe: Pneuma</color>\nAt certain intervals, after using Torrent Surge, this skill will unleash a Spiritbreath Thorn that pierces opponents, dealing Pneuma-aligned <color=#80C0FFFF>Hydro DMG</color>.\n\n<i>You studied the ripples in the water with Paimon.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10087, 'Torrent Surge DMG', '236.6%', 1
        where exists (select 1 from skills where id = 10087 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 10087 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10087, 'Dewdrop DMG', '41.0%', 2
        where exists (select 1 from skills where id = 10087 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 10087 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10087, 'Spiritbreath Thorn DMG', '41.0%', 3
        where exists (select 1 from skills where id = 10087 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 10087 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10087, 'Spiritbreath Thorn Interval', '9.0s', 4
        where exists (select 1 from skills where id = 10087 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 10087 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10087, 'Suffusion HP Cost', '4.00% Max HP', 5
        where exists (select 1 from skills where id = 10087 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 10087 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10087, 'Suffusion DMG Bonus', '0.80% Max HP', 6
        where exists (select 1 from skills where id = 10087 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 10087 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10087, 'Hold Duration', 'Max 6.0s', 7
        where exists (select 1 from skills where id = 10087 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 10087 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10087, 'CD', '10.0s', 8
        where exists (select 1 from skills where id = 10087 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 10087 and position = 8);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000011 order by id limit 1), 10087, 4, true, true, '', false
      where exists (select 1 from skills where id = 10087 and character_id = 100000011)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10088, 100000011, 'Rising Waters', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/05c8da91b2fa3a8a075b598c5702a3e5.png', 1, 'Unleashes a slow-moving floating bubble that deals continuous <color=#80C0FFFF>Hydro DMG</color> to nearby opponents.\n\n<i>You studied the ebb and flow of the tides with Paimon.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10088, 'Skill DMG', '101.9%', 1
        where exists (select 1 from skills where id = 10088 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 10088 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10088, 'Duration', '4.0s', 2
        where exists (select 1 from skills where id = 10088 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 10088 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10088, 'CD', '20.0s', 3
        where exists (select 1 from skills where id = 10088 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 10088 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10088, 'Energy Cost', '80', 4
        where exists (select 1 from skills where id = 10088 and character_id = 100000011) and not exists (select 1 from skill_affixes where skill_id = 10088 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000011 order by id limit 1), 10088, 1, true, true, '', false
      where exists (select 1 from skills where id = 10088 and character_id = 100000011)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (621, 100000011, 'Spotless Waters', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/60c10abdfebb76bf820eaf88bdb84d25.png', 2, 'After the Dewdrop fired by the Hold Mode of the <color=#FFD780FF>Aquacrest Saber</color> hits an opponent, a Sourcewater Droplet will be generated near to the Traveler. If the Traveler picks it up, they will restore 7% HP.\n1 Droplet can be created this way every second, and each use of Aquacrest Saber can create 4 Droplets at most.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000011 order by id limit 1), 621, 1, true, true, '', false
      where exists (select 1 from skills where id = 621 and character_id = 100000011)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (622, 100000011, 'Clear Waters', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/75710e9414a1977c4e240478b2ae261d.png', 2, 'If HP has been consumed via Suffusion while using the Hold Mode <color=#FFD780FF>Aquacrest Saber</color>, the Torrent Surge at the skill''s end will deal Bonus DMG equal to 45% of the total HP the Traveler has consumed in this skill use via Suffusion.\nThe maximum DMG Bonus that can be gained this way is 5,000.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000011 order by id limit 1), 622, 1, true, true, '', false
      where exists (select 1 from skills where id = 622 and character_id = 100000011)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (651, 100000011, 'Foreign Aqualis', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6966dce8/10be31244c6bfef067ef41fdb0504871.png', 3, 'Draw new strength from journeys past. For every element you have resonated with, you gain additional {LINK#N10050001}<color=#FFD780FF>buffs</color>{/LINK}.\n\nAdditionally, when nearby party members'' current HP increases or decreases by 5%, Traveler will receive 1 stack of Blade of Many Waters. You can gain 1 stack of Blade of Many Waters this way once every 4s, max 3 stacks. After obtaining 3 stacks of Blade of Many Waters, performing a Charged Attack will consume all stacks of Blade of Many Waters and transform into the special <color=#FFD780FF>Charged Attack: Tidebound</color>.\n\n<color=#FFD780FF>Charged Attack: Tidebound</color>\n· Each Charged Attack hit deals increased <color=#80C0FFFF>Hydro DMG</color>. Increase in DMG is equal to 150% of Traveler''s ATK,\n· When Traveler''s HP is no less than 50%, 10% of Traveler''s Max HP will be consumed to increase DMG inflicted by each Charged Attack hit by 100% of Traveler''s ATK.\n· When Traveler''s HP is lower than 50%, one instance of healing equal to 25% of Traveler''s Max HP will be restored upon hitting an enemy.\n· <color=#FFD780FF>Charged Attack: Tidebound</color> can be triggered up to once every 15s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000011 order by id limit 1), 651, 1, true, true, 'Draw new strength from journeys past. For every element you have resonated with, you gain additional {LINK#N10050001}<color=#FFD780FF>buffs</color>{/LINK}.\n\nAdditionally, when nearby party members'' current HP increases or decreases by 5%, Traveler will receive 1 stack of Blade of Many Waters. You can gain 1 stack of Blade of Many Waters this way once every 4s, max 3 stacks. After obtaining 3 stacks of Blade of Many Waters, performing a Charged Attack will consume all stacks of Blade of Many Waters and transform into the special <color=#FFD780FF>Charged Attack: Tidebound</color>.\n\n<color=#FFD780FF>Charged Attack: Tidebound</color>\n· Each Charged Attack hit deals increased <color=#80C0FFFF>Hydro DMG</color>. Increase in DMG is equal to 150% of Traveler''s ATK,\n· When Traveler''s HP is no less than 50%, 10% of Traveler''s Max HP will be consumed to increase DMG inflicted by each Charged Attack hit by 100% of Traveler''s ATK.\n· When Traveler''s HP is lower than 50%, one instance of healing equal to 25% of Traveler''s Max HP will be restored upon hitting an enemy.\n· <color=#FFD780FF>Charged Attack: Tidebound</color> can be triggered up to once every 15s.', true
      where exists (select 1 from skills where id = 651 and character_id = 100000011)
      on conflict do nothing;
insert into costumes (id, character_id, name, icon) values (200701, 100000011, 'As Heaven and Earth Are Made Anew', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_2/2f91d7c102df0056de11dce08b296624.png') on conflict do nothing;
insert into build_costumes (build_id, costume_id) values ((select id from character_builds where character_id = 100000011 order by id limit 1), 200701) on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 2000, 'selected', '9638', '3903', '13541')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 20, 'selected', '40.8%', null, '40.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 2001, 'selected', '723', '892', '1615')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 22, 'selected', '83.6%', null, '83.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 2002, 'selected', '605', '46', '651')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 28, 'selected', '50', null, '50')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 42, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 23, 'selected', '124.1%', null, '124.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 2000, 'base', '9638', '3903', '13541')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 2001, 'base', '723', '892', '1615')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 2002, 'base', '605', '46', '651')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 28, 'base', '50', null, '50')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 999999, 'base', '227', null, '227')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 20, 'extra', '40.8%', null, '40.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 22, 'extra', '83.6%', null, '83.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 23, 'extra', '124.1%', null, '124.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000011 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
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
      values ((select id from character_builds where character_id = 100000011 order by id limit 1), 48543, 2150481, 1, 5, 8, 2, '2342', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 1), 22, '6.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 1) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 1), 6, '10.5%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 1) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 1), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 1) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 1), 23, '6.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 1) and property_type_id = 23);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48422, 'Foundryman''s Observation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/6d43279928ae731e4199ff123ecd210e.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000011 order by id limit 1), 48422, 2150481, 2, 4, 8, 5, '137', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 2), 28, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 2) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 2), 20, '2.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 2) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 2), 2, '215', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 2), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 2) and property_type_id = 8);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48553, 'Foundryman''s Calculus', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/0119db4ca0f7c650686e2da11b9c6a1d.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000011 order by id limit 1), 48553, 2150481, 3, 5, 8, 6, '22.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 3), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 3) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 3), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 3) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 3), 2, '448', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 3) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 3), 20, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 3) and property_type_id = 20);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59413, 'Exile''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7847bfdeab60c072ec09b17462505cdc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000011 order by id limit 1), 59413, 2100091, 4, 4, 12, 6, '27.7%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 4), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 4), 23, '8.8%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 4) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 4), 28, '34', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 4) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 4), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 4) and property_type_id = 8);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48432, 'Foundryman''s Legacy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/2aece34359e0f99802feced2f25ee01b.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000011 order by id limit 1), 48432, 2150481, 5, 4, 8, 22, '27.4%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 5), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 5), 6, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 5) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 5), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 5) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 5), 23, '3.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000011 order by id limit 1) and position = 5) and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 100000011, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 100000011 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 100000011, 'goblet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 100000011 and slot = 'goblet' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 100000011, 'circlet', 22
          where not exists (select 1 from character_relic_recommendations where character_id = 100000011 and slot = 'circlet' and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 100000011, 20
        where not exists (select 1 from character_recommended_substats where character_id = 100000011 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 100000011, 22
        where not exists (select 1 from character_recommended_substats where character_id = 100000011 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 100000011, 6
        where not exists (select 1 from character_recommended_substats where character_id = 100000011 and property_type_id = 6);

-- Traveler (100000012)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (100000012, 'Traveler', 'https://fastcdn.hoyoverse.com/static-resource-v2/2023/09/26/10dede5c05005ebb96bbe01f8408e775_7397178366194463086.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/10fcbb4bb21456b3d7b9590543bf3891.png', 'https://webstatic.hoyoverse.com/upload/static-resource/2023/06/15/35263f63879cc4270098b4a03d4fd658_4063129471300368143.png', 'Pyro', 5, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 100000012, 90, 0, 6, false
    where not exists (select 1 from character_builds where character_id = 100000012);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11521, 'Exaiphanes Blade', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/8ec89cd8827583d02662704f5738efc8.png', 1, 'Sword', 5, 'A longsword that once shone with the Pale Star''s light. In the voyager''s hand, it becomes a brand-new light that has nothing to do with any past era.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 100000012 order by id limit 1), 11521, 80, 5, 3)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1)), 4, 'main', null, null, 532
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1)), 20, 'sub', null, null, 30.2
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (51, 100000012, 'Starfire''s Flowing Light', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/239b1fb1f27f4b1b57efa2cad396620b.png', 'When opposing the Lord of Eroded Primal Fire incarnated by Gosoythoth, while the <color=#FFD780FF>Blazing Threshold</color> or <color=#FFD780FF>Scorching Threshold</color> is active, the Traveler''s ATK increases by 40%, they take 40% less DMG, and their interruption resistance is increased.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000012 order by id limit 1), 51, true, false, '', false
      where exists (select 1 from constellations where id = 51 and character_id = 100000012)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (52, 100000012, 'Ever-Lit Candle', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/f4cb7bc2c77d895f6920748a0ce87a07.png', 'When opposing the Lord of Eroded Primal Fire incarnated by Gosoythoth, while in the Nightsoul''s Blessing state, after the Traveler hits an opponent with <color=#FF9999FF>Pyro</color> attacks, that opponent''s <color=#FF9999FF>Pyro RES</color> is decreased by 20% for 6s. Max 2 stacks. Each stack''s duration is counted independently.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000012 order by id limit 1), 52, true, false, '', false
      where exists (select 1 from constellations where id = 52 and character_id = 100000012)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (53, 100000012, 'Relayed Beacon', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/6d636b106d3abeab33b6fea38aa89225.png', 'When opposing the Lord of Eroded Primal Fire incarnated by Gosoythoth, the Traveler gains 40% <color=#FF9999FF>Pyro DMG Bonus</color>.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000012 order by id limit 1), 53, true, false, '', false
      where exists (select 1 from constellations where id = 53 and character_id = 100000012)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (54, 100000012, 'Ravaging Flame', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/eeb3fa8f4402f989771201f6fe307fb4.png', 'When opposing the Lord of Eroded Primal Fire incarnated by Gosoythoth, after using the Elemental Burst <color=#FFD780FF>Plains Scorcher</color>, all nearby party members will restore 40% of their Max HP. The Traveler will regain 4 Energy per second for the next 10s.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000012 order by id limit 1), 54, true, false, '', false
      where exists (select 1 from constellations where id = 54 and character_id = 100000012)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (55, 100000012, 'The Fire Inextinguishable', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/620c536c24e82d7638b4da0537dae6c8.png', 'When opposing the Lord of Eroded Primal Fire incarnated by Gosoythoth, the Traveler''s CRIT Rate increases by 20%, and their CRIT DMG increases by 40%.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000012 order by id limit 1), 55, true, false, '', false
      where exists (select 1 from constellations where id = 55 and character_id = 100000012)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (56, 100000012, 'The Sacred Flame Imperishable', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/0b632038f14a2c3b0b332ee4debdb404.png', 'When opposing the Lord of Eroded Primal Fire incarnated by Gosoythoth, while in the Nightsoul''s Blessing state, the Traveler''s Movement SPD increases by 20%, their Stamina consumption decreases by 30%, and when they use Normal or Charged Attacks, they will send flaming waves flowing forward, dealing 96% of their ATK to opponents in the wave''s path as Nightsoul-aligned <color=#FF9999FF>Pyro DMG</color>.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000012 order by id limit 1), 56, true, false, '', false
      where exists (select 1 from constellations where id = 56 and character_id = 100000012)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (100551, 100000012, 'Foreign Blaze', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 rapid strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to unleash 2 rapid sword strikes.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 100551, '1-Hit DMG', '44.5%', 1
        where exists (select 1 from skills where id = 100551 and character_id = 100000012) and not exists (select 1 from skill_affixes where skill_id = 100551 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 100551, '2-Hit DMG', '43.4%', 2
        where exists (select 1 from skills where id = 100551 and character_id = 100000012) and not exists (select 1 from skill_affixes where skill_id = 100551 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 100551, '3-Hit DMG', '53.0%', 3
        where exists (select 1 from skills where id = 100551 and character_id = 100000012) and not exists (select 1 from skill_affixes where skill_id = 100551 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 100551, '4-Hit DMG', '58.3%', 4
        where exists (select 1 from skills where id = 100551 and character_id = 100000012) and not exists (select 1 from skill_affixes where skill_id = 100551 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 100551, '5-Hit DMG', '70.8%', 5
        where exists (select 1 from skills where id = 100551 and character_id = 100000012) and not exists (select 1 from skill_affixes where skill_id = 100551 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 100551, 'Charged Attack DMG', '55.9%+72.2%', 6
        where exists (select 1 from skills where id = 100551 and character_id = 100000012) and not exists (select 1 from skill_affixes where skill_id = 100551 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 100551, 'Charged Attack Stamina Cost', '20.0', 7
        where exists (select 1 from skills where id = 100551 and character_id = 100000012) and not exists (select 1 from skill_affixes where skill_id = 100551 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 100551, 'Plunge DMG', '63.9%', 8
        where exists (select 1 from skills where id = 100551 and character_id = 100000012) and not exists (select 1 from skill_affixes where skill_id = 100551 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 100551, 'Low/High Plunge DMG', '128%/160%', 9
        where exists (select 1 from skills where id = 100551 and character_id = 100000012) and not exists (select 1 from skill_affixes where skill_id = 100551 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000012 order by id limit 1), 100551, 1, true, true, '', false
      where exists (select 1 from skills where id = 100551 and character_id = 100000012)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10097, 100000012, 'Flowfire Blade', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/131562716a03fa2128681b0ef5340b25.png', 1, 'Wields a searing flame that can incinerate the very earth. Has different effects when Tapped or Held.\n\n<color=#FFD780FF>Tap</color>\nCall forth flames in a raging blaze. When used, the Traveler gains 42 Nightsoul points and enters the Nightsoul''s Blessing state, summoning a Blazing Threshold that follows the current active character.\nWhen the Blazing Threshold gets close to opponents, it will deal Nightsoul-aligned <color=#FF9999FF>Pyro DMG</color> to nearby opponents at intervals.\n\n<color=#FFD780FF>Hold</color>\nUnleash fire in a composed manner, dealing Nightsoul-aligned <color=#FF9999FF>AoE Pyro DMG</color> to nearby opponents. When used, the Traveler gains 42 Nightsoul points and enters the Nightsoul''s Blessing state, summoning a Scorching Threshold that follows the current active character.\nWhen the current active character within a Scorching Threshold deals DMG to opponents, the Threshold will launch a Coordinated Attack that deals Nightsoul-aligned <color=#FF9999FF>Pyro DMG</color> based on the Traveler''s ATK. This effect can occur once every 3s.\n\n<color=#FFD780FF>Nightsoul''s Blessing: Traveler</color>\nContinuously consumes Nightsoul points. The Traveler''s Nightsoul''s Blessing state lasts 12s at maximum, and when their Nightsoul points are exhausted, this state will end. If this Elemental Skill is used again while active, the Traveler''s Nightsoul points will be reset to 42 points.\nBlazing and Scorching Thresholds will disappear once the Traveler''s Nightsoul''s Blessing state ends, and only 1 Blazing or Scorching Threshold summoned by the Traveler themselves can exist at any one time.\n\n<i>Together, you and Paimon watched the shifting colors of the flowing flames.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10097, 'Blazing Threshold', '28.1%', 1
        where exists (select 1 from skills where id = 10097 and character_id = 100000012) and not exists (select 1 from skill_affixes where skill_id = 10097 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10097, 'Hold DMG', '98.8%', 2
        where exists (select 1 from skills where id = 10097 and character_id = 100000012) and not exists (select 1 from skill_affixes where skill_id = 10097 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10097, 'Scorching Threshold', '81.4%', 3
        where exists (select 1 from skills where id = 10097 and character_id = 100000012) and not exists (select 1 from skill_affixes where skill_id = 10097 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10097, 'Nightsoul Point Limit', '80.0', 4
        where exists (select 1 from skills where id = 10097 and character_id = 100000012) and not exists (select 1 from skill_affixes where skill_id = 10097 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10097, 'CD', '18.0s', 5
        where exists (select 1 from skills where id = 10097 and character_id = 100000012) and not exists (select 1 from skill_affixes where skill_id = 10097 and position = 5);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000012 order by id limit 1), 10097, 1, true, true, '', false
      where exists (select 1 from skills where id = 10097 and character_id = 100000012)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10098, 100000012, 'Plains Scorcher', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/846009236ed056f59b77ff299e9a1172.png', 1, 'Condense the flames into a mark, dealing Nightsoul-aligned <color=#FF9999FF>AoE Pyro DMG</color> to opponents up ahead. The Traveler restores 7 Nightsoul points per second for the next 4s.\n\n<i>Together, you and Paimon studied the principles behind an undying flame.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10098, 'Skill DMG', '427.2%', 1
        where exists (select 1 from skills where id = 10098 and character_id = 100000012) and not exists (select 1 from skill_affixes where skill_id = 10098 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10098, 'CD', '18.0s', 2
        where exists (select 1 from skills where id = 10098 and character_id = 100000012) and not exists (select 1 from skill_affixes where skill_id = 10098 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10098, 'Energy Cost', '70', 3
        where exists (select 1 from skills where id = 10098 and character_id = 100000012) and not exists (select 1 from skill_affixes where skill_id = 10098 and position = 3);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000012 order by id limit 1), 10098, 1, true, true, '', false
      where exists (select 1 from skills where id = 10098 and character_id = 100000012)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (521, 100000012, 'True Flame of Incineration', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/31747e0666769375df7e965da8c49460.png', 2, 'When the Traveler has over 20 Nightsoul points, the attack AoE of the Blazing and Scorching Thresholds from the Elemental Skill <color=#FFD780FF>Flowfire Blade</color> after they hit opponents is increased.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000012 order by id limit 1), 521, 1, true, true, '', false
      where exists (select 1 from skills where id = 521 and character_id = 100000012)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (522, 100000012, 'Embers Unspent', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/113b7ca00d4bddf1b7d586c05c9c1b05.png', 2, 'After the current active character inside a <color=#FFD780FF>Blazing Threshold</color> or <color=#FFD780FF>Scorching Threshold</color> triggers a <color=#FF9999FF>Pyro-related reaction</color>, the Traveler will regain 5 Energy. This can occur once every 12s. Additionally, when a nearby party member triggers a Nightsoul Burst, the Traveler will regain 4 Energy.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000012 order by id limit 1), 522, 1, true, true, '', false
      where exists (select 1 from skills where id = 522 and character_id = 100000012)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (551, 100000012, 'Foreign Starfire', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6966dce8/53a26cd146893b4cb89f2f32a5b0adb7.png', 3, 'Draw new strength from journeys past. For every element you have resonated with, you gain additional {LINK#N10050001}<color=#FFD780FF>buffs</color>{/LINK}.\n\nAdditionally, when nearby party members trigger Nightsoul Burst, Traveler will receive 1 stack of Blade of the Sacred Flame, max 2 stacks. After obtaining 2 stacks of Blade of the Sacred Flame, performing a Charged Attack will consume all stacks of Blade of the Sacred Flame and transform into a special <color=#FFD780FF>Charged Attack: Inferno</color>.\n\n<color=#FFD780FF>Charged Attack: Inferno</color>\n· Each Charged Attack hit deals increased, Nightsoul-aligned <color=#FF9999FF>Pyro DMG</color>. Increase in DMG is equal to 200% of Traveler''s ATK.\n· <color=#FFD780FF>Charged Attack: Inferno</color> can be triggered up to once every 15s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000012 order by id limit 1), 551, 1, true, true, 'Draw new strength from journeys past. For every element you have resonated with, you gain additional {LINK#N10050001}<color=#FFD780FF>buffs</color>{/LINK}.\n\nAdditionally, when nearby party members trigger Nightsoul Burst, Traveler will receive 1 stack of Blade of the Sacred Flame, max 2 stacks. After obtaining 2 stacks of Blade of the Sacred Flame, performing a Charged Attack will consume all stacks of Blade of the Sacred Flame and transform into a special <color=#FFD780FF>Charged Attack: Inferno</color>.\n\n<color=#FFD780FF>Charged Attack: Inferno</color>\n· Each Charged Attack hit deals increased, Nightsoul-aligned <color=#FF9999FF>Pyro DMG</color>. Increase in DMG is equal to 200% of Traveler''s ATK.\n· <color=#FFD780FF>Charged Attack: Inferno</color> can be triggered up to once every 15s.', true
      where exists (select 1 from skills where id = 551 and character_id = 100000012)
      on conflict do nothing;
insert into costumes (id, character_id, name, icon) values (200701, 100000012, 'As Heaven and Earth Are Made Anew', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_2/2f91d7c102df0056de11dce08b296624.png') on conflict do nothing;
insert into build_costumes (build_id, costume_id) values ((select id from character_builds where character_id = 100000012 order by id limit 1), 200701) on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 2000, 'selected', '9638', '3903', '13541')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 20, 'selected', '40.8%', null, '40.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 2001, 'selected', '723', '892', '1615')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 22, 'selected', '83.6%', null, '83.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 2002, 'selected', '605', '46', '651')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 28, 'selected', '50', null, '50')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 40, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 23, 'selected', '124.1%', null, '124.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 2000, 'base', '9638', '3903', '13541')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 2001, 'base', '723', '892', '1615')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 2002, 'base', '605', '46', '651')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 28, 'base', '50', null, '50')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 999999, 'base', '227', null, '227')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 20, 'extra', '40.8%', null, '40.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 22, 'extra', '83.6%', null, '83.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 23, 'extra', '124.1%', null, '124.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000012 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
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
      values ((select id from character_builds where character_id = 100000012 order by id limit 1), 48543, 2150481, 1, 5, 8, 2, '2342', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 1), 22, '6.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 1) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 1), 6, '10.5%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 1) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 1), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 1) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 1), 23, '6.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 1) and property_type_id = 23);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48422, 'Foundryman''s Observation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/6d43279928ae731e4199ff123ecd210e.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000012 order by id limit 1), 48422, 2150481, 2, 4, 8, 5, '137', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 2), 28, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 2) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 2), 20, '2.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 2) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 2), 2, '215', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 2), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 2) and property_type_id = 8);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48553, 'Foundryman''s Calculus', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/0119db4ca0f7c650686e2da11b9c6a1d.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000012 order by id limit 1), 48553, 2150481, 3, 5, 8, 6, '22.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 3), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 3) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 3), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 3) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 3), 2, '448', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 3) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 3), 20, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 3) and property_type_id = 20);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59413, 'Exile''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7847bfdeab60c072ec09b17462505cdc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000012 order by id limit 1), 59413, 2100091, 4, 4, 12, 6, '27.7%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 4), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 4), 23, '8.8%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 4) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 4), 28, '34', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 4) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 4), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 4) and property_type_id = 8);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48432, 'Foundryman''s Legacy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/2aece34359e0f99802feced2f25ee01b.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000012 order by id limit 1), 48432, 2150481, 5, 4, 8, 22, '27.4%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 5), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 5), 6, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 5) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 5), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 5) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 5), 23, '3.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000012 order by id limit 1) and position = 5) and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 100000012, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 100000012 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 100000012, 'goblet', 40
          where not exists (select 1 from character_relic_recommendations where character_id = 100000012 and slot = 'goblet' and property_type_id = 40);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 100000012, 'circlet', 22
          where not exists (select 1 from character_relic_recommendations where character_id = 100000012 and slot = 'circlet' and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 100000012, 20
        where not exists (select 1 from character_recommended_substats where character_id = 100000012 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 100000012, 22
        where not exists (select 1 from character_recommended_substats where character_id = 100000012 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 100000012, 6
        where not exists (select 1 from character_recommended_substats where character_id = 100000012 and property_type_id = 6);

-- Traveler (100000013)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (100000013, 'Traveler', 'https://fastcdn.hoyoverse.com/static-resource-v2/2023/09/26/10dede5c05005ebb96bbe01f8408e775_7397178366194463086.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/10fcbb4bb21456b3d7b9590543bf3891.png', 'https://webstatic.hoyoverse.com/upload/static-resource/2023/06/15/35263f63879cc4270098b4a03d4fd658_4063129471300368143.png', 'Cryo', 5, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 100000013, 90, 0, 6, true
    where not exists (select 1 from character_builds where character_id = 100000013);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11521, 'Exaiphanes Blade', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/8ec89cd8827583d02662704f5738efc8.png', 1, 'Sword', 5, 'A longsword that once shone with the Pale Star''s light. In the voyager''s hand, it becomes a brand-new light that has nothing to do with any past era.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 100000013 order by id limit 1), 11521, 90, 6, 5)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1)), 4, 'main', null, null, 608
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1)), 20, 'sub', null, null, 33.1
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (81, 100000013, 'Somber Freeze', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/93a2e34b7c1158d2fdfa90cf213c24db.png', 'The Traveler regenerates 5 Elemental Energy when they deal Stellar Glimmer DMG. This effect can trigger once every 0.5s.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000013 order by id limit 1), 81, true, false, '', false
      where exists (select 1 from constellations where id = 81 and character_id = 100000013)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (82, 100000013, 'Frostfall Reverberation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/205c1741d3ad0f006abc488396539515.png', 'The active character''s Elemental Mastery is increased by 60 for 5s when an opponent is hit by an <color=#FFD780FF>ice crystal</color> fired by the Elemental Skill <color=#FFD780FF>{LINK#S10127}Ice Fog Piercer{/LINK}</color>.\nAdditionally, when a character affected by the aforementioned effect triggers a Stellar Glimmer reaction or deals Stellar Glimmer reaction DMG, the Elemental Mastery boost described above will be increased to 120 for its duration.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000013 order by id limit 1), 82, true, false, '', false
      where exists (select 1 from constellations where id = 82 and character_id = 100000013)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (83, 100000013, 'Glacial Shard', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/4266bcbd36ee43010bfe62b106087916.png', 'Increases the Level of the Elemental Burst <color=#FFD780FF>{LINK#S10128}Frostbound Javelin{/LINK}</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000013 order by id limit 1), 83, true, false, '', false
      where exists (select 1 from constellations where id = 83 and character_id = 100000013)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (84, 100000013, 'Enduring Ice', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/4dbf0d87f39b5de6b214353683062311.png', 'The duration of the <color=#FFD780FF>Frostpierce Star</color> created by the Elemental Skill <color=#FFD780FF>{LINK#S10127}Ice Fog Piercer{/LINK}</color> is increased by 25%.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000013 order by id limit 1), 84, true, false, '', false
      where exists (select 1 from constellations where id = 84 and character_id = 100000013)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (85, 100000013, 'Bittercold Fog', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/3cd86a0303aaf2c90040712a98b2ecc0.png', 'Increases the Level of the Elemental Skill <color=#FFD780FF>{LINK#S10127}Ice Fog Piercer{/LINK}</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000013 order by id limit 1), 85, true, false, '', false
      where exists (select 1 from constellations where id = 85 and character_id = 100000013)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (86, 100000013, 'Brumal Grimfrost', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/3086ff53c07143ce7deecf5bd973c4ab.png', 'Every stack of {LINK#N10050002}<color=#FFD780FF>Frostglow</color>{/LINK} consumed when using the Elemental Burst <color=#FFD780FF>{LINK#S10128}Frostbound Javelin{/LINK}</color> increases Stellar Glimmer reaction DMG dealt by other party members by 5% for 15s. A maximum 40% increase can be obtained in this way.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 100000013 order by id limit 1), 86, true, false, '', false
      where exists (select 1 from constellations where id = 86 and character_id = 100000013)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (100554, 100000013, 'Foreign Frostglint', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 rapid strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to unleash 2 rapid sword strikes.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 100554, '1-Hit DMG', '56.9%', 1
        where exists (select 1 from skills where id = 100554 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 100554 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 100554, '2-Hit DMG', '55.6%', 2
        where exists (select 1 from skills where id = 100554 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 100554 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 100554, '3-Hit DMG', '67.8%', 3
        where exists (select 1 from skills where id = 100554 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 100554 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 100554, '4-Hit DMG', '74.6%', 4
        where exists (select 1 from skills where id = 100554 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 100554 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 100554, '5-Hit DMG', '90.5%', 5
        where exists (select 1 from skills where id = 100554 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 100554 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 100554, 'Charged Attack DMG', '71.5%+92.4%', 6
        where exists (select 1 from skills where id = 100554 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 100554 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 100554, 'Charged Attack Stamina Cost', '20.0', 7
        where exists (select 1 from skills where id = 100554 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 100554 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 100554, 'Plunge DMG', '81.8%', 8
        where exists (select 1 from skills where id = 100554 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 100554 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 100554, 'Low/High Plunge DMG', '164%/204%', 9
        where exists (select 1 from skills where id = 100554 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 100554 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000013 order by id limit 1), 100554, 4, true, true, '', false
      where exists (select 1 from skills where id = 100554 and character_id = 100000013)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10127, 100000013, 'Ice Fog Piercer', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/c2b1d5216b763b0c3e50358154b3af60.png', 1, 'Stabs at the opponent with the Traveler''s weapon, which releases an ice-cold fog. This deals <color=#99FFFFFF>Cryo DMG</color> to opponents up ahead and forms a Frostpierce Star next to the Traveler.\n\n<color=#FFD780FF>Frostpierce Star</color>\n· Follows your own party members around the field and periodically fires ice crystals at nearby opponents, dealing <color=#99FFFFFF>Cryo DMG</color>.\n<color=#FFD780FF>Radiance: Stellar-Conduct</color>: The Frostpierce Star will no longer fire ice crystals at opponents at intervals but will instead fire an ice crystal at opponents in a coordinated attack when the Traveler hits an opponent with a Normal Attack, Charged Attack, or Plunging Attack. This effect can trigger once every 0.2s.\n· When an opponent is hit with an ice crystal, the Traveler gains 1 stack of {LINK#N10050002}<color=#FFD780FF>Frostglow</color>{/LINK} (max 8 stacks).\n· When not in combat, <color=#FFD780FF>Frostglow</color> expires after 30s.\n\n<i>You observed the formation of frost together with Paimon.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10127, 'Skill DMG', '137.5%', 1
        where exists (select 1 from skills where id = 10127 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 10127 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10127, 'Ice Crystal DMG', '32.1%', 2
        where exists (select 1 from skills where id = 10127 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 10127 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10127, 'Frostpierce Star Duration', '12.0s', 3
        where exists (select 1 from skills where id = 10127 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 10127 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10127, 'CD', '15.0s', 4
        where exists (select 1 from skills where id = 10127 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 10127 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000013 order by id limit 1), 10127, 7, true, true, '', false
      where exists (select 1 from skills where id = 10127 and character_id = 100000013)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10128, 100000013, 'Frostbound Javelin', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/f1a61a7c1a46bdbe8b80753ffcd4384a.png', 1, 'Generates an ice javelin with the power of Cryo, then directs it at enemies to deal multiple instances of <color=#99FFFFFF>Cryo DMG</color>.\nWhen cast, the Traveler consumes all existing stacks of <color=#FFD780FF>Frostglow</color>, which in turn increases the DMG dealt by this Elemental Burst. When 8 stacks of {LINK#N10050002}<color=#FFD780FF>Frostglow</color>{/LINK} are consumed, the number of DMG instances caused by the javelins is also increased.\n\n{LINK#N11500004}<color=#FFD780FF>Radiance: Stellar Glimmer</color>{/LINK}: DMG from the current Elemental Burst is changed to <color=#99FFFFFF>Cryo DMG</color> of the corresponding Stellar Glimmer reaction type.\n\n<i>You felt the keen edge of the icicles alongside Paimon.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10128, 'Ice Javelin DMG', '88.2%/Strike', 1
        where exists (select 1 from skills where id = 10128 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 10128 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10128, 'Frostglow DMG Bonus', '4.4%', 2
        where exists (select 1 from skills where id = 10128 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 10128 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10128, 'Stellar-Conduct Ice Javelin Single Strike DMG', '58.8%', 3
        where exists (select 1 from skills where id = 10128 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 10128 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10128, 'Stellar-Conduct Frostglow DMG Bonus', '2.9%', 4
        where exists (select 1 from skills where id = 10128 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 10128 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10128, 'Stellar Swirl Ice Javelin Single Strike DMG', '88.2%', 5
        where exists (select 1 from skills where id = 10128 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 10128 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10128, 'Stellar Swirl Frostglow DMG Bonus', '4.4%', 6
        where exists (select 1 from skills where id = 10128 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 10128 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 10128, 'No. of Strikes in Attack', '3', 7
        where exists (select 1 from skills where id = 10128 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 10128 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 10128, 'Additional Frostglow Attack Strikes at Stack Max', '2', 8
        where exists (select 1 from skills where id = 10128 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 10128 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 10128, 'CD', '15.0s', 9
        where exists (select 1 from skills where id = 10128 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 10128 and position = 9);
insert into skill_affixes (skill_id, name, value, position)
        select 10128, 'Energy Cost', '60', 10
        where exists (select 1 from skills where id = 10128 and character_id = 100000013) and not exists (select 1 from skill_affixes where skill_id = 10128 and position = 10);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000013 order by id limit 1), 10128, 8, true, true, '', false
      where exists (select 1 from skills where id = 10128 and character_id = 100000013)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (821, 100000013, 'Ever-Keen Frost', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/635e34c10e4cb7a22b099f44d8a2c0de.png', 2, '<color=#FFD780FF>Radiance: Stellar-Conduct</color>: When a <color=#FFD780FF>Frostpierce Star</color> is on the field, DMG from the Traveler''s Normal Attacks, Charged Attacks, and Plunging Attacks are converted to <color=#99FFFFFF>Cryo DMG</color> that cannot be overridden by another elemental infusion, and DMG dealt is also increased by 80% of the Traveler''s ATK.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000013 order by id limit 1), 821, 1, true, true, '', false
      where exists (select 1 from skills where id = 821 and character_id = 100000013)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (822, 100000013, 'Lucent Ice', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/e8ab07fc0a4e4d8f56f5d12bdd390bc7.png', 2, 'The Traveler''s Elemental Mastery is increased by 8% of their ATK. Up to 160 Elemental Mastery can be gained in this way.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000013 order by id limit 1), 822, 1, true, true, '', false
      where exists (select 1 from skills where id = 822 and character_id = 100000013)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (851, 100000013, 'Foreign Permafrost', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/d5547b6384d7e5be226f1676a9d0ed0b.png', 3, 'Draws new strength and power from their past travels: Every Elemental Type the Traveler has resonated with now grants an additional {LINK#N10050001}<color=#FFD780FF>enhancement effect</color>{/LINK}.\n\nAdditionally, when a nearby party member deals Stellar-Conduct or Stellar Swirl DMG, the Traveler gains 1 stack of "Icepoint." 1 stack of Icepoint can be obtained in this way once every 2s, max 3 stacks. When the Traveler unleashes a Charged Attack at 3 stacks of Icepoint, all stacks are consumed to change the attack into a special <color=#FFD780FF>Charged Attack: Freezing Ice</color>.\n\n<color=#FFD780FF>Charged Attack: Freezing Ice</color>\n· <color=#99FFFFFF>Cryo DMG</color> dealt is increased by 140% of the Traveler''s ATK, and the Traveler also gains 2 stacks of {LINK#N10050002}<color=#FFD780FF>Frostglow</color>{/LINK}.\n· <color=#FFD780FF>Charged Attack: Freezing Ice</color> can be unleashed once every 15s. Additionally, the DMG Bonus from the Ascension Talent "Ever-Keen Frost" does not apply to <color=#FFD780FF>Charged Attack: Freezing Ice</color>.\n{LINK#N11500004}<color=#FFD780FF>Radiance: Stellar Glimmer{/LINK}</color>: DMG from <color=#FFD780FF>Charged Attack: Freezing Ice</color> is instead considered <color=#99FFFFFF>Cryo DMG</color> of the corresponding Stellar Glimmer reaction type.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000013 order by id limit 1), 851, 1, true, true, 'Draws new strength and power from their past travels: Every Elemental Type the Traveler has resonated with now grants an additional {LINK#N10050001}<color=#FFD780FF>enhancement effect</color>{/LINK}.\n\nAdditionally, when a nearby party member deals Stellar-Conduct or Stellar Swirl DMG, the Traveler gains 1 stack of "Icepoint." 1 stack of Icepoint can be obtained in this way once every 2s, max 3 stacks. When the Traveler unleashes a Charged Attack at 3 stacks of Icepoint, all stacks are consumed to change the attack into a special <color=#FFD780FF>Charged Attack: Freezing Ice</color>.\n\n<color=#FFD780FF>Charged Attack: Freezing Ice</color>\n· <color=#99FFFFFF>Cryo DMG</color> dealt is increased by 140% of the Traveler''s ATK, and the Traveler also gains 2 stacks of {LINK#N10050002}<color=#FFD780FF>Frostglow</color>{/LINK}.\n· <color=#FFD780FF>Charged Attack: Freezing Ice</color> can be unleashed once every 15s. Additionally, the DMG Bonus from the Ascension Talent "Ever-Keen Frost" does not apply to <color=#FFD780FF>Charged Attack: Freezing Ice</color>.\n{LINK#N11500004}<color=#FFD780FF>Radiance: Stellar Glimmer{/LINK}</color>: DMG from <color=#FFD780FF>Charged Attack: Freezing Ice</color> is instead considered <color=#99FFFFFF>Cryo DMG</color> of the corresponding Stellar Glimmer reaction type.', true
      where exists (select 1 from skills where id = 851 and character_id = 100000013)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (823, 100000013, 'Stellar Jubilee: Illusory Frostmirror', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba982/a97ac747cbc5a355a6e8b32569c28deb.png', 2, 'The Traveler will enter the {LINK#N11330003}<color=#FFD780FF>Radiance: Stellar-Conduct</color>{/LINK} state when inside a <color=#FFD780FF>Polestar Field</color>, or the <color=#FFD780FF>Radiance: Stellar Swirl</color> state for 8s after a nearby party member triggers a Stellar Swirl reaction.\nWhen a party member triggers a Superconduct or Cryo Swirl reaction, it becomes a Stellar-Conduct or Stellar Swirl reaction instead, and the Base DMG of said reaction is also increased by 0.35% for every 100 points of the Traveler''s ATK. A maximum 7% increase can be obtained in this way.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 100000013 order by id limit 1), 823, 1, true, true, '', false
      where exists (select 1 from skills where id = 823 and character_id = 100000013)
      on conflict do nothing;
insert into costumes (id, character_id, name, icon) values (200701, 100000013, 'As Heaven and Earth Are Made Anew', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_2/2f91d7c102df0056de11dce08b296624.png') on conflict do nothing;
insert into build_costumes (build_id, costume_id) values ((select id from character_builds where character_id = 100000013 order by id limit 1), 200701) on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 2000, 'selected', '10875', '7273', '18148')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 20, 'selected', '47.4%', null, '47.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 2001, 'selected', '823', '994', '1818')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 22, 'selected', '92.3%', null, '92.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 2002, 'selected', '683', '88', '770')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 28, 'selected', '47', null, '47')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 46, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 23, 'selected', '123.1%', null, '123.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 2000, 'base', '10875', '7273', '18148')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 2001, 'base', '823', '994', '1818')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 2002, 'base', '683', '88', '770')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 28, 'base', '47', null, '47')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 20, 'extra', '47.4%', null, '47.4%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 22, 'extra', '92.3%', null, '92.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 23, 'extra', '123.1%', null, '123.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 100000013 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into relic_sets (id, name) values (2150461, 'Disenchantment in Deep Shadow') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150461, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150461 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150461, 4, 'Increases Superconduct Reaction DMG by 80% and Stellar-Conduct Reaction DMG by 40%. When the wielder attacks opponents affected by Superconduct or Stellar-Conduct, this attack''s CRIT Rate is increased by 16%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150461 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (46544, 'Iridescence That Ceased Amidst Glory', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a0cf98d/06fa300aff19d3a5de4c4ce6048a5404.png', 'Flower of Life') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000013 order by id limit 1), 46544, 2150461, 1, 5, 12, 2, '3155', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 1), 3, '11.1%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 1) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 1), 5, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 1) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 1), 8, '21', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 1) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 1), 20, '9.3%', 2
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 1) and property_type_id = 20);
insert into relic_sets (id, name) values (2150461, 'Disenchantment in Deep Shadow') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150461, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150461 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150461, 4, 'Increases Superconduct Reaction DMG by 80% and Stellar-Conduct Reaction DMG by 40%. When the wielder attacks opponents affected by Superconduct or Stellar-Conduct, this attack''s CRIT Rate is increased by 16%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150461 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (46523, 'Sharpness That Ceased Upon Wondrous Creation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a0cf98d/78cfacac47588a8472a40d5c411b4b6d.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000013 order by id limit 1), 46523, 2150461, 2, 5, 12, 5, '205', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 2), 2, '209', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 2), 23, '9.1%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 2) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 2), 22, '5.4%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 2) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 2), 3, '10.5%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 2) and property_type_id = 3);
insert into relic_sets (id, name) values (2150461, 'Disenchantment in Deep Shadow') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150461, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150461 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150461, 4, 'Increases Superconduct Reaction DMG by 80% and Stellar-Conduct Reaction DMG by 40%. When the wielder attacks opponents affected by Superconduct or Stellar-Conduct, this attack''s CRIT Rate is increased by 16%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150461 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (46452, 'Moment That Ceased Upon Waking From Grand Dreams', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a0cf98d/fb048f9cd39a2dcec3caf61eeba5da3a.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000013 order by id limit 1), 46452, 2150461, 3, 4, 8, 6, '20.6%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 3), 28, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 3) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 3), 5, '11', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 3) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 3), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 3) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 3), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 3) and property_type_id = 3);
insert into relic_sets (id, name) values (2150031, 'Wanderer''s Troupe') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150031, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150031 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150031, 4, 'Increases Charged Attack DMG by 35% if the character uses a Catalyst or a Bow.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150031 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (77513, 'Wanderer''s String-Kettle', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/00068fbfdac5602f0ebd3d6a2b85d0bc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000013 order by id limit 1), 77513, 2150031, 4, 5, 9, 6, '24.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 4), 2, '478', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 4) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 4), 28, '21', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 4) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 4), 9, '5.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 4) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 4), 22, '7.0%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 4) and property_type_id = 22);
insert into relic_sets (id, name) values (2150461, 'Disenchantment in Deep Shadow') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150461, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150461 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150461, 4, 'Increases Superconduct Reaction DMG by 80% and Stellar-Conduct Reaction DMG by 40%. When the wielder attacks opponents affected by Superconduct or Stellar-Conduct, this attack''s CRIT Rate is increased by 16%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150461 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (46433, 'Pendulum That Ceased Amidst a Great Fall', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a0cf98d/96ccb9bdc03619c89825dd424fb8312e.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 100000013 order by id limit 1), 46433, 2150461, 5, 4, 12, 22, '36.9%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 5), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 5) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 5), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 5) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 5), 9, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 5) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 5), 2, '550', 2
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 100000013 order by id limit 1) and position = 5) and property_type_id = 2);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 100000013, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 100000013 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 100000013, 'goblet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 100000013 and slot = 'goblet' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 100000013, 'circlet', 22
          where not exists (select 1 from character_relic_recommendations where character_id = 100000013 and slot = 'circlet' and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 100000013, 20
        where not exists (select 1 from character_recommended_substats where character_id = 100000013 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 100000013, 22
        where not exists (select 1 from character_recommended_substats where character_id = 100000013 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 100000013, 6
        where not exists (select 1 from character_recommended_substats where character_id = 100000013 and property_type_id = 6);

commit;
