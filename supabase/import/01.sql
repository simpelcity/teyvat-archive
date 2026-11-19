-- Part 1 of 13. Generated from app/data/character_detail.ts.
-- Insert-only and safe to re-run. Run the parts in order in the Supabase SQL editor.
begin;

-- Vesna (10000143)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000143, 'Vesna', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6ab31686/88e4654b892a5ada8d0fd21301c07518.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/e1817f5bbeed3c7b882da7bdf736d15b.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6ab31696/29b50cdb9288163fc60662473ecf44d5.png', 'Anemo', 5, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000143, 80, 7, 0, true
    where not exists (select 1 from character_builds where character_id = 10000143);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11438, 'Silver Light', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6ab31686/0c2f38fc6c8afb31613c16f6f950c517.png', 1, 'Sword', 4, 'A longsword left behind by Wind Reader, one of the Three Hermits of Guizang in Liyue. Legend has it that it was forged out of sacred silver descended from the heavens, and that it once cleaved flowing sea water into two.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000143 order by id limit 1), 11438, 80, 6, 5)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1)), 4, 'main', null, null, 475
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1)), 6, 'sub', null, null, 37.7
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (1431, 10000143, 'Winter''s Farewell Feast', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6ab31695/71711cd1598a001ffcbc3e565fccdd95.png', 'When in the <color=#FFD780FF>{LINK#N11430001}Armed for Action{/LINK}</color> mode, Vesna can unleash <color=#FFD780FF>{LINK#N11430003}Windborne Sword{/LINK}</color> at the highest level 4 times instead of 3. Also, each time she enters the <color=#FFD780FF>Armed for Action</color> mode, she will not consume <color=#FFD780FF>{LINK#N11430002}Sword Essence{/LINK}</color> the first time she uses <color=#FFD780FF>Windborne Sword</color> at the highest level.\nAdditionally, Vesna deals 20% increased Stellar Swirl reaction DMG when in the <color=#FFD780FF>Armed for Action</color> mode.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000143 order by id limit 1), 1431, false, false, '', false
      where exists (select 1 from constellations where id = 1431 and character_id = 10000143)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1432, 10000143, 'Kolo of Spring''s Arrival', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6ab31695/9bfe7227048168a6191a341b58af7beb.png', 'The Ascension Talent <color=#FFD780FF>{LINK#P1432101}Rite of Spring''s Procession{/LINK}</color> is enhanced: Vesna gains the maximum number of <color=#FFD780FF>Disciplinary Action</color> stacks when she enters <color=#FFD780FF>{LINK#N11430001}Armed for Action{/LINK}</color> mode. Vesna''s ATK is increased by 40% when she has maximum <color=#FFD780FF>Disciplinary Action</color> stacks.\nYou must unlock the Ascension Talent "Rite of Spring''s Procession" to gain access to the above effects.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000143 order by id limit 1), 1432, false, false, '', false
      where exists (select 1 from constellations where id = 1432 and character_id = 10000143)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1433, 10000143, 'Winter''s Last Offering', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6ab31695/80d0d1c5eaa8d483f85e2a6ced11495e.png', 'Increases the Level of the Elemental Skill <color=#FFD780FF>{LINK#S11432}The Art of Victory{/LINK}</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000143 order by id limit 1), 1433, false, false, '', false
      where exists (select 1 from constellations where id = 1433 and character_id = 10000143)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1434, 10000143, 'Glory to Our Forebears', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6ab31695/f856b92769c4b7a96332ed28d5c0fb55.png', 'The Ascension Talent <color=#FFD780FF>{LINK#P1432201}Truth Prevails{/LINK}</color> is enhanced: Its ATK and Elemental Mastery bonuses increase to 3 times their original values.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000143 order by id limit 1), 1434, false, false, '', false
      where exists (select 1 from constellations where id = 1434 and character_id = 10000143)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1435, 10000143, 'The Nobleborn''s Charge', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6ab31695/7fdd7b7f72512d8e92a8965e5e89b813.png', 'Increases the Level of the Elemental Burst <color=#FFD780FF>{LINK#S11435}For the Tsaritsa!{/LINK}</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000143 order by id limit 1), 1435, false, false, '', false
      where exists (select 1 from constellations where id = 1435 and character_id = 10000143)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1436, 10000143, 'Unwavering Ardor', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6ab31695/931536cfba9ddecde0b17e8648cdfb30.png', 'Tapping on Normal Attack or Elemental Skill in the 5s after Vesna uses <color=#FFD780FF>{LINK#N11430003}Windborne Sword{/LINK}</color> at its highest level will unleash the secret Vila ability <color=#FFD780FF>Windborne Sword: Transpose</color>, dealing <color=#80FFD7FF>Anemo DMG</color> at 150% of Vesna''s ATK as well as summoning <color=#FFD780FF>{LINK#N11430004}Spirit Blades{/LINK}</color> which deal an additional instance of <color=#80FFD7FF>Anemo DMG</color> at 200% of Vesna''s ATK. If Vesna is in the <color=#FFD780FF>{LINK#N11430001}Armed for Action{/LINK}</color> mode, she will also summon a wind pinion to perform Coordinated Attacks against opponents.\nAdditionally, Vesna''s Stellar Swirl reaction DMG dealt is {LINK#N11190007}<color=#FFD780FF>elevated</color>{/LINK} by 20%.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000143 order by id limit 1), 1436, false, false, '', false
      where exists (select 1 from constellations where id = 1436 and character_id = 10000143)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11431, 10000143, 'Vila Blade Dance', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 6 consecutive strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to trample opponents in front of her.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along her path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11431, '1-Hit DMG', '51.7%', 1
        where exists (select 1 from skills where id = 11431 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11431 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11431, '2-Hit DMG', '62.3%', 2
        where exists (select 1 from skills where id = 11431 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11431 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11431, '3-Hit DMG', '35.9%×2', 3
        where exists (select 1 from skills where id = 11431 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11431 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11431, '4-Hit DMG', '75.7%', 4
        where exists (select 1 from skills where id = 11431 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11431 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11431, '5-Hit DMG', '79.9%', 5
        where exists (select 1 from skills where id = 11431 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11431 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11431, '6-Hit DMG', '92.4%', 6
        where exists (select 1 from skills where id = 11431 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11431 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11431, 'Charged Attack DMG', '170.2%', 7
        where exists (select 1 from skills where id = 11431 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11431 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 11431, 'Charged Attack Stamina Cost', '20.0', 8
        where exists (select 1 from skills where id = 11431 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11431 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 11431, 'Plunge DMG', '81.8%', 9
        where exists (select 1 from skills where id = 11431 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11431 and position = 9);
insert into skill_affixes (skill_id, name, value, position)
        select 11431, 'Low/High Plunge DMG', '164%/204%', 10
        where exists (select 1 from skills where id = 11431 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11431 and position = 10);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000143 order by id limit 1), 11431, 4, true, false, '', false
      where exists (select 1 from skills where id = 11431 and character_id = 10000143)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11432, 10000143, 'The Art of Victory', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6ab31695/9786d20583f617c1fdd9c196bb8eb6d6.png', 1, 'Calls forth Spirit Blades passed down through generations of the Vila to deal <color=#80FFD7FF>AoE Anemo DMG</color>, then switches to the <color=#FFD780FF>{LINK#N11430001}Armed for Action{/LINK}</color> mode and gains 2 stacks of <color=#FFD780FF>{LINK#N11430002}Sword Essence{/LINK}</color>.\n\n<color=#FFD780FF>Armed for Action</color>\nDMG dealt by Vesna with her Normal Attacks, Charged Attacks, and Plunging Attacks become <color=#80FFD7FF>Anemo DMG</color> that cannot be overridden by another elemental infusion instead. She will also summon a wind pinion that attacks the opponent at the same time, dealing additional <color=#80FFD7FF>Anemo DMG</color>. Each time the wind pinion is summoned, Vesna will regenerate a certain amount of <color=#FFD780FF>Sword Essence</color>.\nVesna can consume <color=#FFD780FF>Sword Essence</color> to unleash the special Elemental Skill <color=#FFD780FF>{LINK#N11430003}Windborne Sword{/LINK}</color>, which deals to the opponent <color=#80FFD7FF>Anemo DMG</color>.\nEach use of the special Elemental Skill <color=#FFD780FF>Windborne Sword</color> in the same instance of <color=#FFD780FF>Armed for Action</color> will increase the level of <color=#FFD780FF>Windborne Sword</color>, beginning from Lv. 1 to Lv. 3 max, for more <color=#80FFD7FF>Anemo DMG</color>. Using <color=#FFD780FF>Windborne Sword</color> at Lv. 2 and Lv. 3 will also summon <color=#FFD780FF>{LINK#N11430004}Spirit Blades{/LINK}</color> which deal <color=#80FFD7FF>Anemo DMG</color>.\nVesna will exit the mode when its duration ends or when she has used <color=#FFD780FF>Windborne Sword</color> at the highest level 3 times. Exiting will clear all remaining <color=#FFD780FF>Sword Essence</color> she has accrued.\nAdditionally, when in this mode, Vesna''s resistance to interruption is increased.\n<color=#FFD780FF>Radiance: Stellar Swirl</color>: DMG dealt with the <color=#FFD780FF>Spirit Blades</color> becomes <color=#80FFD7FF>Anemo DMG</color> that is also considered Stellar Swirl reaction DMG.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11432, 'Skill DMG', '53.0%', 1
        where exists (select 1 from skills where id = 11432 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11432 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11432, 'Windborne Sword Lv. 1 DMG', '53.0%', 2
        where exists (select 1 from skills where id = 11432 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11432 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11432, 'Windborne Sword Lv. 2 DMG', '79.5%', 3
        where exists (select 1 from skills where id = 11432 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11432 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11432, 'Windborne Sword Lv. 2 Spirit Blade DMG', '148.4%', 4
        where exists (select 1 from skills where id = 11432 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11432 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11432, 'Windborne Sword Lv. 3 Spirit Blade DMG', '59.4% ×4', 5
        where exists (select 1 from skills where id = 11432 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11432 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11432, 'Windborne Sword Lv. 3 Spirit Blade Final Hit DMG', '207.8%', 6
        where exists (select 1 from skills where id = 11432 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11432 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11432, 'Windborne Sword Lv. 2 Spirit Blade Stellar Swirl DMG', '148.4%', 7
        where exists (select 1 from skills where id = 11432 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11432 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 11432, 'Windborne Sword Lv. 3 Spirit Blade Stellar Swirl DMG', '59.4% ×4', 8
        where exists (select 1 from skills where id = 11432 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11432 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 11432, 'Windborne Sword Lv. 3 Spirit Blade Final Hit Stellar Swirl DMG', '207.8%', 9
        where exists (select 1 from skills where id = 11432 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11432 and position = 9);
insert into skill_affixes (skill_id, name, value, position)
        select 11432, 'Wind Pinion DMG', '13.8%', 10
        where exists (select 1 from skills where id = 11432 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11432 and position = 10);
insert into skill_affixes (skill_id, name, value, position)
        select 11432, 'Armed for Action Duration', '15.0s', 11
        where exists (select 1 from skills where id = 11432 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11432 and position = 11);
insert into skill_affixes (skill_id, name, value, position)
        select 11432, 'CD', '18.0s', 12
        where exists (select 1 from skills where id = 11432 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11432 and position = 12);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000143 order by id limit 1), 11432, 5, true, false, '', false
      where exists (select 1 from skills where id = 11432 and character_id = 10000143)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11435, 10000143, 'For the Tsaritsa!', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6ab31695/c69f680aafe793aab73cba3a27a06371.png', 1, 'Summons multiple <color=#FFD780FF>{LINK#N11430004}Spirit Blades{/LINK}</color>, dealing <color=#80FFD7FF>AoE Anemo DMG</color>. Also gains a stack of <color=#FFD780FF>{LINK#N11430002}Sword Essence{/LINK}</color>.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11435, 'Spirit Blade DMG', '348.7%', 1
        where exists (select 1 from skills where id = 11435 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11435 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11435, 'Spirit Blade Stellar Swirl DMG', '348.7%', 2
        where exists (select 1 from skills where id = 11435 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11435 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11435, 'CD', '15.0s', 3
        where exists (select 1 from skills where id = 11435 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11435 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11435, 'Energy Cost', '60', 4
        where exists (select 1 from skills where id = 11435 and character_id = 10000143) and not exists (select 1 from skill_affixes where skill_id = 11435 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000143 order by id limit 1), 11435, 5, true, false, '', false
      where exists (select 1 from skills where id = 11435 and character_id = 10000143)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (14321, 10000143, 'Rite of Spring''s Procession', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6ab31695/a5687108b94cfaacaadb3c20eef945f2.png', 2, 'After Vesna uses the special Elemental Skill <color=#FFD780FF>{LINK#N11430003}Windborne Sword{/LINK}</color> or the Elemental Burst <color=#FFD780FF>{LINK#S11435}For the Tsaritsa!{/LINK}</color>, she also gains 1 stack of <color=#FFD780FF>Disciplinary Action</color> which lasts 20s. Max 6 stacks, and the duration of each stack is independent of the others''.\nWhen she has <color=#FFD780FF>Disciplinary Action</color> stacks active, the <color=#FFD780FF>{LINK#N11430004}Spirit Blades{/LINK}</color> summoned by Vesna will deal DMG equal to (100% + 10% × Disciplinary Action stack count) of the original DMG instead. All active stacks of <color=#FFD780FF>Disciplinary Action</color> are cleared when Vesna uses the Elemental Skill <color=#FFD780FF>The Art of Victory</color> or when she leaves the field.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000143 order by id limit 1), 14321, 1, true, false, '', false
      where exists (select 1 from skills where id = 14321 and character_id = 10000143)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (14322, 10000143, 'Truth Prevails', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6ab31695/c377cf652e41042f3260ce02942d94ff.png', 2, '<color=#FFD780FF>Radiance: Stellar Swirl</color>: Vesna will gain the corresponding effect based on the Elemental Type of her party members: \n· For every <color=#99FFFFFF>Cryo</color> or <color=#80FFD7FF>Anemo</color> character in her current party, Vesna''s ATK increases by 6%; and\n· For every character of all other Elemental Types in her current party, Vesna''s Elemental Mastery increases by 25 instead.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000143 order by id limit 1), 14322, 1, true, false, '', false
      where exists (select 1 from skills where id = 14322 and character_id = 10000143)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (14323, 10000143, 'Stellar Jubilee: Splendid Prelude', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6ab31695/c95abaf61e9ffd2626d9bd020c27e526.png', 2, 'When party members trigger Cryo Swirl, it will be changed to a Stellar Swirl reaction, and party members'' Base DMG for the Stellar Swirl will be increased based on Vesna''s ATK. Every 100 ATK she has increases the Base Stellar Swirl DMG by 0.7%. The maximum DMG increase that can be gained this way is 14%.\nAfter a party member triggers a Stellar Swirl reaction nearby, Vesna enters the <color=#FFD780FF>Radiance: Stellar Swirl</color> state for 8s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000143 order by id limit 1), 14323, 1, true, false, '', false
      where exists (select 1 from skills where id = 14323 and character_id = 10000143)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (14325, 10000143, 'The Grand Circuit', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6ab31695/0be256b007885064a71e136a8b5f9b86.png', 2, 'Holding on Sprint or Jump when Vesna is not in combat will cause her to enter the <color=#FFD780FF>Coursing</color> state.\n\n<color=#FFD780FF>Coursing</color>\nContinuously consumes Stamina to hover in mid-air. Sprinting or tapping Jump to go higher expends additional Stamina. Including the hold on Jump that triggers <color=#FFD780FF>Coursing</color>, Vesna can go higher up to 3 times in each instance of the <color=#FFD780FF>Coursing</color> state.\n\nAdditionally, in Snezhnaya (excluding Nod-Krai), when Vesna is switched onto the field while the currently active party member is in mid-air and not in combat, she will immediately enter the <color=#FFD780FF>Coursing</color> state and regenerate 50 Stamina. This effect can trigger once every 10s, and does not take effect in Domains, Trounce Domains, or the Spiral Abyss.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000143 order by id limit 1), 14325, 1, true, false, '', false
      where exists (select 1 from skills where id = 14325 and character_id = 10000143)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 2000, 'selected', '11701', '3407', '15108')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 20, 'selected', '24.7%', null, '24.7%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 2001, 'selected', '787', '1081', '1868')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 22, 'selected', '88.3%', null, '88.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 2002, 'selected', '644', '144', '788')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 28, 'selected', '34', null, '34')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 44, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 23, 'selected', '122.8%', null, '122.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 2000, 'base', '11701', '3407', '15108')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 2001, 'base', '787', '1081', '1868')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 2002, 'base', '644', '144', '788')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 28, 'base', '34', null, '34')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 20, 'extra', '24.7%', null, '24.7%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 22, 'extra', '88.3%', null, '88.3%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 23, 'extra', '122.8%', null, '122.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000143 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
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
      values ((select id from character_builds where character_id = 10000143 order by id limit 1), 47543, 2150471, 1, 5, 8, 2, '2342', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 1), 9, '5.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 1) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 1), 28, '21', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 1) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 1), 5, '33', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 1) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 1), 23, '6.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 1) and property_type_id = 23);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47523, 'Glory to Your Legacy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/f60c04735c5a36d349a2802b51e9b6fc.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000143 order by id limit 1), 47523, 2150471, 2, 5, 9, 5, '166', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 2), 23, '6.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 2) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 2), 22, '10.9%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 2) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 2), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 2) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 2), 3, '5.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 2) and property_type_id = 3);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47453, 'Time Gifted Unto You', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/f378887dafcdfd8b72457765732a0828.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000143 order by id limit 1), 47453, 2150471, 3, 4, 12, 6, '27.7%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 3), 20, '2.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 3) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 3), 9, '5.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 3) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 3), 5, '25', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 3) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 3), 8, '35', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 3) and property_type_id = 8);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47412, 'Chalice of Your Blood and Sorrow', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/d653c3aa684c882bbf09757f695ab533.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000143 order by id limit 1), 47412, 2150471, 4, 4, 10, 6, '24.1%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 4), 2, '167', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 4) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 4), 5, '11', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 4), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 4) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 4), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 4) and property_type_id = 23);
insert into relic_sets (id, name) values (2150471, 'Scarlet Proof') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150471, 4, 'Increases the equipping character''s CRIT Rate by 16%, and their Stellar Swirl reaction DMG dealt by 40%, for 10s after they trigger a Stellar Swirl reaction.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150471 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (47432, 'Testament to Your Faith', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/11eeed27d2d7fbb0ab34f03c87325688.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000143 order by id limit 1), 47432, 2150471, 5, 4, 8, 22, '27.4%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 5), 23, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 5) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 5), 28, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 5) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 5), 2, '215', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 5) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 5), 20, '2.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000143 order by id limit 1) and position = 5) and property_type_id = 20);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000143, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000143 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000143, 'goblet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000143 and slot = 'goblet' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000143, 'circlet', 22
          where not exists (select 1 from character_relic_recommendations where character_id = 10000143 and slot = 'circlet' and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000143, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000143 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000143, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000143 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000143, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000143 and property_type_id = 6);

-- Escoffier (10000112)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000112, 'Escoffier', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/681a947b/6c4f7f722b0226a1171ec265485de61c.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/4df737e56e4e119855259d06ca68b802.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/681a94b6/5f9648398c922adad4b39f7721fe17c4.png', 'Cryo', 5, 13)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000112, 80, 7, 0, true
    where not exists (select 1 from character_builds where character_id = 10000112);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (13514, 'Symphonist of Scents', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/681a947b/6d211f1902adc8a5946a5530489ab77a.png', 13, 'Polearm', 5, 'An elegantly built polearm, said to have been a conductor''s baton wielded by a great musician to bridge tune and taste.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000112 order by id limit 1), 13514, 80, 6, 1)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1)), 4, 'main', null, null, 563
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1)), 22, 'sub', null, null, 60.3
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (1121, 10000112, 'Pre-Dinner Dance for Your Taste Buds', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/681a94b4/ddd51fba93712bca406744c153e76cfc.png', 'When 4 party members are <color=#80C0FFFF>Hydro</color> or <color=#99FFFFFF>Cryo</color>, all nearby party members will have their <color=#99FFFFFF>Cryo DMG</color> CRIT DMG increased by 60% for 15s after Escoffier uses her Elemental Skill <color=#FFD780FF>{LINK#S11122}Low-Temperature Cooking{/LINK}</color> or Elemental Burst <color=#FFD780FF>{LINK#S11125}Scoring Cuts{/LINK}</color>.\nYou must first unlock the Ascension Talent "Inspiration-Immersed Seasoning."', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000112 order by id limit 1), 1121, false, false, '', false
      where exists (select 1 from constellations where id = 1121 and character_id = 10000112)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1122, 10000112, 'Fresh, Fragrant Stew Is an Art', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/681a94b4/c47a58b1c1e93ae53084f72e88ecfe76.png', 'When Escoffier activates her Cooking Mek in its {LINK#N11120001}<color=#FFD780FF>Cold Storage Mode</color>{/LINK}, she will gain the "Freshly-Prepped Delicacy" effect for 15s. During this time, Escoffier will gain 5 Cold Dish stacks. When nearby active characters apart from Escoffier deal <color=#99FFFFFF>Cryo DMG</color> with a Normal, Charged, or Plunging Attack, or an Elemental Skill or Elemental Burst, they will expend 1 Cold Dish stack to increase their DMG dealt by 240% of Escoffier''s ATK.\nIf you hit multiple opponents with a single instance of <color=#99FFFFFF>Cryo DMG</color>, Cold Dish stacks will be consumed based on the number of opponents hit.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000112 order by id limit 1), 1122, false, false, '', false
      where exists (select 1 from constellations where id = 1122 and character_id = 10000112)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1123, 10000112, 'The Bakery Magic of Caramel Browning', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/681a94b4/5bed9f296a49a1446fbf1ca9c43737cd.png', 'Increases the Level of <color=#FFD780FF>{LINK#S11122}Low-Temperature Cooking{/LINK}</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000112 order by id limit 1), 1123, false, false, '', false
      where exists (select 1 from constellations where id = 1123 and character_id = 10000112)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1124, 10000112, 'Secret Rosemary Recipe', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/681a94b4/80a4830698a107c9cc269442949517e2.png', '{LINK#P1122101}<color=#FFD780FF>Rehab Diet</color>{/LINK} lasts 6 more seconds. While it is active, you have a chance of healing 100% extra HP and restoring 2 Energy to Escoffier when you trigger healing through <color=#FFD780FF>Rehab Diet</color>. This chance corresponds to Escoffier''s CRIT Rate. You can trigger this effect 7 times during any one <color=#FFD780FF>Rehab Diet</color>''s duration.\nYou must first unlock the Ascension Talent "Better to Salivate Than Medicate."', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000112 order by id limit 1), 1124, false, false, '', false
      where exists (select 1 from constellations where id = 1124 and character_id = 10000112)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1125, 10000112, 'Symphony of a Thousand Sauces', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/681a94b4/ce9f4f800fe113b1389e21126a22960a.png', 'Increases the Level of <color=#FFD780FF>{LINK#S11125}Scoring Cuts{/LINK}</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000112 order by id limit 1), 1125, false, false, '', false
      where exists (select 1 from constellations where id = 1125 and character_id = 10000112)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (1126, 10000112, 'Tea Parties Bursting With Color', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/681a94b4/52f51d10e3e864553ed78e235d763e58.png', '{LINK#N11120001}<color=#FFD780FF>Cooking Mek: Cold Storage Mode</color>{/LINK} is enhanced:\n· When your party''s active character''s Normal, Charged, or Plunging Attacks hit opponents, Cooking Mek: Cold Storage Mode will fire off another Special-Grade Frosty Parfait, dealing 500% of Escoffier''s ATK as <color=#99FFFFFF>AoE Cryo DMG</color>. This DMG is considered Elemental Skill DMG.\nThis effect can be triggered once every 0.5s, and this effect can be triggered 6 times within the duration of one Cooking Mek: Cold Storage Mode.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000112 order by id limit 1), 1126, false, false, '', false
      where exists (select 1 from constellations where id = 1126 and character_id = 10000112)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11121, 10000112, 'Kitchen Skills', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/0a4af4ecb63b4741aa3e42d18a2a0c21.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 3 consecutive spear strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to perform an upward thrust.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11121, '1-Hit DMG', '55.7%', 1
        where exists (select 1 from skills where id = 11121 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11121 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11121, '2-Hit DMG', '51.5%', 2
        where exists (select 1 from skills where id = 11121 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11121 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11121, '3-Hit DMG', '35.7%+43.6%', 3
        where exists (select 1 from skills where id = 11121 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11121 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11121, 'Charged Attack DMG', '124.8%', 4
        where exists (select 1 from skills where id = 11121 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11121 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11121, 'Charged Attack Stamina Cost', '25.0', 5
        where exists (select 1 from skills where id = 11121 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11121 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11121, 'Plunge DMG', '69.1%', 6
        where exists (select 1 from skills where id = 11121 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11121 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11121, 'Low/High Plunge DMG', '138%/173%', 7
        where exists (select 1 from skills where id = 11121 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11121 and position = 7);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000112 order by id limit 1), 11121, 2, true, false, '', false
      where exists (select 1 from skills where id = 11121 and character_id = 10000112)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11122, 10000112, 'Low-Temperature Cooking', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/681a94b2/45a8f965a7fdd80af3409b64844bcc9c.png', 1, 'Behold the true meaning of "cooking"! Escoffier will demonstrate different cooking techniques when you Tap or Hold this skill, but rest assured, each of them is Fontaine''s pride and joy.\n\n<color=#FFD780FF>Tap</color>\nActivates her All-Spectrum Multi-Use Cooking Mek in its Cold Storage mode and deals <color=#99FFFFFF>AoE Cryo DMG</color> to nearby opponents.\n\n<color=#FFD780FF>Cooking Mek: Cold Storage Mode</color>\nFollows the current active character and fires Frosty Parfaits at nearby opponents at intervals, dealing <color=#99FFFFFF>Cryo DMG</color>.\n\n<color=#FFD780FF>Arkhe: Ousia</color>\nAt intervals, Escoffier will summon a Surging Blade when activating her Cooking Mek in Cold Storage mode, dealing Ousia-aligned <color=#99FFFFFF>AoE Cryo DMG</color>.\n\n<color=#FFD780FF>Hold</color>\nActivates her All-Spectrum Multi-Use Cooking Mek''s {LINK#N11120002}<color=#FFD780FF>Off-the-Cuff Cookery Mode</color>{/LINK}.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11122, 'Skill DMG', '66.8%', 1
        where exists (select 1 from skills where id = 11122 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11122 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11122, 'Frosty Parfait DMG', '159.0%', 2
        where exists (select 1 from skills where id = 11122 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11122 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11122, 'Cold Storage Mode Duration', '20.0s', 3
        where exists (select 1 from skills where id = 11122 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11122 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11122, 'Surging Blade DMG', '44.5%', 4
        where exists (select 1 from skills where id = 11122 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11122 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 11122, 'Surging Blade CD Interval', '10.0s', 5
        where exists (select 1 from skills where id = 11122 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11122 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 11122, '#{LAYOUT_MOBILE#Tap}{LAYOUT_PC#Press}{LAYOUT_PS#Press} CD', '15.0s', 6
        where exists (select 1 from skills where id = 11122 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11122 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 11122, 'Hold CD', '6.0s', 7
        where exists (select 1 from skills where id = 11122 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11122 and position = 7);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000112 order by id limit 1), 11122, 5, true, false, '', false
      where exists (select 1 from skills where id = 11122 and character_id = 10000112)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11125, 10000112, 'Scoring Cuts', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/681a94b2/50d323516d06f9e3281068403e1d0b69.png', 1, 'Displaying her exceptional knife skills, Escoffier deals <color=#99FFFFFF>AoE Cryo DMG</color> and restores HP to all nearby party members based on her ATK.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 11125, 'Skill DMG', '785.5%', 1
        where exists (select 1 from skills where id = 11125 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11125 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 11125, 'Healing', '227.9% ATK+1564', 2
        where exists (select 1 from skills where id = 11125 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11125 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 11125, 'CD', '15.0s', 3
        where exists (select 1 from skills where id = 11125 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11125 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 11125, 'Energy Cost', '60', 4
        where exists (select 1 from skills where id = 11125 and character_id = 10000112) and not exists (select 1 from skill_affixes where skill_id = 11125 and position = 4);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000112 order by id limit 1), 11125, 5, true, false, '', false
      where exists (select 1 from skills where id = 11125 and character_id = 10000112)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11221, 10000112, 'Better to Salivate Than Medicate', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/681a94b4/d0c2556258992a58cc6b7d05712d58e7.png', 2, 'After using the Elemental Burst <color=#FFD780FF>{LINK#S11125}Scoring Cuts{/LINK}</color>, Escoffier will obtain the Rehab Diet effect for 9s: Restores HP for nearby active characters every 1s based on 138.24% of Escoffier''s ATK.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000112 order by id limit 1), 11221, 1, true, false, '', false
      where exists (select 1 from skills where id = 11221 and character_id = 10000112)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11222, 10000112, 'Inspiration-Immersed Seasoning', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/681a94b4/8c28cbadb0908ae2206fc90de1c81a03.png', 2, 'When there are 1/2/3/4 <color=#80C0FFFF>Hydro</color> or <color=#99FFFFFF>Cryo</color> characters in the party, Escoffier will decrease the <color=#80C0FFFF>Hydro RES</color> and <color=#99FFFFFF>Cryo RES</color> of any opponents hit by her Elemental Skill, <color=#FFD780FF>{LINK#S11122}Low-Temperature Cooking{/LINK}</color>, or her Elemental Burst, <color=#FFD780FF>{LINK#S11125}Scoring Cuts{/LINK}</color>, by 5%/10%/15%/55% for 12s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000112 order by id limit 1), 11222, 1, true, false, '', false
      where exists (select 1 from skills where id = 11222 and character_id = 10000112)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (11223, 10000112, 'Constant Off-the-Cuff Cookery', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/681a94b4/90858cb102b8d1d50a2e136d770aeefd.png', 2, '#When using the Hold form of her Elemental Skill <color=#FFD780FF>{LINK#S11122}Low-Temperature Cooking{/LINK}</color>, Escoffier will activate her All-Spectrum Multi-Use Cooking Mek in its Off-the-Cuff Cookery mode.\n\n<color=#FFD780FF>Cooking Mek: Off-the-Cuff Cookery Mode</color>\n· Places the Cooking Mek on the field. The Cooking Mek can absorb elemental attacks. When the absorbed elemental energy hits a certain limit, Escoffier can convert the ingredients placed within it into wonderful food.\n· Escoffier needs time to purchase new ingredients, so she can only make a certain number of dishes like this each week. The number of dishes Escoffier can make resets every Monday at 4:00 AM {TIMEZONE}.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000112 order by id limit 1), 11223, 1, true, false, '', false
      where exists (select 1 from skills where id = 11223 and character_id = 10000112)
      on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 2000, 'selected', '11777', '3644', '15421')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 20, 'selected', '40.5%', null, '40.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 2001, 'selected', '869', '473', '1342')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 22, 'selected', '136.9%', null, '136.9%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 2002, 'selected', '646', '113', '759')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 28, 'selected', '89', null, '89')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 46, 'selected', '20.6%', null, '20.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 23, 'selected', '136.8%', null, '136.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 2000, 'base', '11777', '3644', '15421')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 2001, 'base', '869', '473', '1342')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 2002, 'base', '646', '113', '759')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 28, 'base', '89', null, '89')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 999999, 'base', '240', null, '240')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 20, 'extra', '40.5%', null, '40.5%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 22, 'extra', '136.9%', null, '136.9%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 23, 'extra', '136.8%', null, '136.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 46, 'element', '20.6%', null, '20.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000112 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
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
      values ((select id from character_builds where character_id = 10000112 order by id limit 1), 32543, 2150321, 1, 5, 8, 2, '2342', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 1), 8, '21', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 1) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 1), 28, '47', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 1) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 1), 23, '4.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 1) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 1), 22, '5.4%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 1) and property_type_id = 22);
insert into relic_sets (id, name) values (2150031, 'Wanderer''s Troupe') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150031, 2, 'Increases Elemental Mastery by 80.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150031 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150031, 4, 'Increases Charged Attack DMG by 35% if the character uses a Catalyst or a Bow.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150031 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (77523, 'Bard''s Arrow Feather', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/70e4bef4acbb4d4789923c3e546aeaf1.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000112 order by id limit 1), 77523, 2150031, 2, 5, 8, 5, '152', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 2), 22, '7.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 2) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 2), 6, '4.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 2) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 2), 3, '8.7%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 2) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 2), 2, '209', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 2) and property_type_id = 2);
insert into relic_sets (id, name) values (2150321, 'Golden Troupe') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150321, 2, 'Increases Elemental Skill DMG by 20%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150321 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150321, 4, 'Increases Elemental Skill DMG by 25%. Additionally, when not on the field, Elemental Skill DMG will be further increased by 25%. This effect will be cleared 2s after taking the field.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150321 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (32553, 'Golden Era''s Prelude', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/623e4ec8f219b8ba5c198444a61ca224.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000112 order by id limit 1), 32553, 2150321, 3, 5, 8, 6, '22.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 3), 3, '5.8%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 3) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 3), 8, '19', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 3) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 3), 9, '5.1%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 3) and property_type_id = 9);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 3), 5, '33', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 3) and property_type_id = 5);
insert into relic_sets (id, name) values (2150461, 'Disenchantment in Deep Shadow') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150461, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150461 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150461, 4, 'Increases Superconduct Reaction DMG by 80% and Stellar-Conduct Reaction DMG by 40%. When the wielder attacks opponents affected by Superconduct or Stellar-Conduct, this attack''s CRIT Rate is increased by 16%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150461 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (46513, 'Ovations That Ceased Upon Festivity', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a0cf98d/c28506a99c203909248bf259774760c4.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000112 order by id limit 1), 46513, 2150461, 4, 5, 10, 46, '26.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 4), 6, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 4) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 4), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 4), 3, '9.9%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 4) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 4), 23, '6.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 4) and property_type_id = 23);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48432, 'Foundryman''s Legacy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/2aece34359e0f99802feced2f25ee01b.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000112 order by id limit 1), 48432, 2150481, 5, 4, 12, 22, '36.9%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 5), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 5), 6, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 5) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 5), 3, '9.3%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 5) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 5), 23, '3.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000112 order by id limit 1) and position = 5) and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000112, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000112 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000112, 'goblet', 46
          where not exists (select 1 from character_relic_recommendations where character_id = 10000112 and slot = 'goblet' and property_type_id = 46);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000112, 'circlet', 22
          where not exists (select 1 from character_relic_recommendations where character_id = 10000112 and slot = 'circlet' and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000112, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000112 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000112, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000112 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000112, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000112 and property_type_id = 6);

-- Traveler (10000007)
insert into characters (id, name, icon, image, side_icon, element, rarity, weapon_type)
    values (10000007, 'Traveler', 'https://fastcdn.hoyoverse.com/static-resource-v2/2023/09/26/10dede5c05005ebb96bbe01f8408e775_7397178366194463086.png', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_7/10fcbb4bb21456b3d7b9590543bf3891.png', 'https://webstatic.hoyoverse.com/upload/static-resource/2023/06/15/35263f63879cc4270098b4a03d4fd658_4063129471300368143.png', 'Anemo', 5, 1)
    on conflict do nothing;
insert into character_builds (character_id, level, fetter, active_constellation_num, is_chosen)
    select 10000007, 90, 0, 5, false
    where not exists (select 1 from character_builds where character_id = 10000007);
insert into weapons (id, name, icon, type, type_name, rarity, description)
    values (11521, 'Exaiphanes Blade', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/8ec89cd8827583d02662704f5738efc8.png', 1, 'Sword', 5, 'A longsword that once shone with the Pale Star''s light. In the voyager''s hand, it becomes a brand-new light that has nothing to do with any past era.')
    on conflict do nothing;
insert into build_weapons (build_id, weapon_id, level, promote_level, affix_level)
    values ((select id from character_builds where character_id = 10000007 order by id limit 1), 11521, 90, 5, 3)
    on conflict do nothing;
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1)), 4, 'main', null, null, 608
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1)) and property_slot = 'main');
insert into build_weapon_properties (build_weapon_id, property_type_id, property_slot, base_value, add_value, final_value)
      select (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1)), 20, 'sub', null, null, 33.1
      where not exists (select 1 from build_weapon_properties where build_weapon_id = (select id from build_weapons where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1)) and property_slot = 'sub');
insert into constellations (id, character_id, name, icon, effect, position)
      values (71, 10000007, 'Raging Vortex', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/894eff920994fa27d2cfa4560e44b612.png', '<color=#FFD780FF>Palm Vortex</color> pulls in opponents and objects within a 5m radius.', 1)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000007 order by id limit 1), 71, true, false, '', false
      where exists (select 1 from constellations where id = 71 and character_id = 10000007)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (72, 10000007, 'Uprising Whirlwind', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/6719addb4f6e1d2806a30e8c8ebd87cc.png', 'Increases Energy Recharge by 16%.', 2)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000007 order by id limit 1), 72, true, false, '', false
      where exists (select 1 from constellations where id = 72 and character_id = 10000007)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (73, 10000007, 'Sweeping Gust', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/57d3ac91a69f9349d11ad4e00cf0b461.png', 'Increases the Level of <color=#FFD780FF>Gust Surge</color> by 3.\nMaximum upgrade level is 15.', 3)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000007 order by id limit 1), 73, true, false, '', false
      where exists (select 1 from constellations where id = 73 and character_id = 10000007)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (74, 10000007, 'Cherishing Breezes', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/fef8565df53bd0dcae97f2c452ddb105.png', 'Reduces DMG taken while casting <color=#FFD780FF>Palm Vortex</color> by 10%.', 4)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000007 order by id limit 1), 74, true, false, '', false
      where exists (select 1 from constellations where id = 74 and character_id = 10000007)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (75, 10000007, 'Vortex Stellaris', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/a6bd5f29973c85b33fa4faecc60a8366.png', 'Increases the Level of <color=#FFD780FF>Palm Vortex</color> by 3.\nMaximum upgrade level is 15.', 5)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000007 order by id limit 1), 75, true, false, '', false
      where exists (select 1 from constellations where id = 75 and character_id = 10000007)
      on conflict do nothing;
insert into constellations (id, character_id, name, icon, effect, position)
      values (76, 10000007, 'Intertwined Winds', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/108a8bf8e09bd8f74674acd6318afee0.png', 'Targets who take DMG from <color=#FFD780FF>Gust Surge</color> have their <color=#80FFD7FF>Anemo RES</color> decreased by 20%.\nIf an Elemental Absorption occurred, then their RES towards the corresponding Element is also decreased by 20%.', 6)
      on conflict do nothing;
insert into build_constellations (build_id, constellation_id, is_activated, is_enhanced, enhanced_effect, can_enhanced)
      select (select id from character_builds where character_id = 10000007 order by id limit 1), 76, false, false, '', false
      where exists (select 1 from constellations where id = 76 and character_id = 10000007)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (100553, 10000007, 'Foreign Ironwind', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/3f016e2d606ca39ea86e24d5245dfa5b.png', 1, '<color=#FFD780FF>Normal Attack</color>\nPerforms up to 5 rapid strikes.\n\n<color=#FFD780FF>Charged Attack</color>\nConsumes a certain amount of Stamina to unleash 2 rapid sword strikes.\n\n<color=#FFD780FF>Plunging Attack</color>\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 100553, '1-Hit DMG', '51.7%', 1
        where exists (select 1 from skills where id = 100553 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 100553 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 100553, '2-Hit DMG', '50.5%', 2
        where exists (select 1 from skills where id = 100553 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 100553 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 100553, '3-Hit DMG', '61.6%', 3
        where exists (select 1 from skills where id = 100553 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 100553 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 100553, '4-Hit DMG', '67.8%', 4
        where exists (select 1 from skills where id = 100553 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 100553 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 100553, '5-Hit DMG', '82.3%', 5
        where exists (select 1 from skills where id = 100553 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 100553 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 100553, 'Charged Attack DMG', '65.0%+84.0%', 6
        where exists (select 1 from skills where id = 100553 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 100553 and position = 6);
insert into skill_affixes (skill_id, name, value, position)
        select 100553, 'Charged Attack Stamina Cost', '20.0', 7
        where exists (select 1 from skills where id = 100553 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 100553 and position = 7);
insert into skill_affixes (skill_id, name, value, position)
        select 100553, 'Plunge DMG', '74.3%', 8
        where exists (select 1 from skills where id = 100553 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 100553 and position = 8);
insert into skill_affixes (skill_id, name, value, position)
        select 100553, 'Low/High Plunge DMG', '149%/186%', 9
        where exists (select 1 from skills where id = 100553 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 100553 and position = 9);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000007 order by id limit 1), 100553, 3, true, true, '', false
      where exists (select 1 from skills where id = 100553 and character_id = 10000007)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10067, 10000007, 'Palm Vortex', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/6e146f2e8a1d74dc3e6abaa42e12b23d.png', 1, 'Grasping the wind''s might, you form a vortex of vacuum in your palm, causing continuous <color=#80FFD7FF>Anemo DMG</color> to opponents in front of you.\nThe vacuum vortex explodes when the skill duration ends, causing a greater amount of Anemo DMG over a larger area.\n\n<color=#FFD780FF>Hold</color>\nDMG and AoE will gradually increase.\n\n<color=#FFD780FF>Elemental Absorption</color>\nIf the vortex comes into contact with <color=#80C0FFFF>Hydro</color>/<color=#FF9999FF>Pyro</color>/<color=#99FFFFFF>Cryo</color>/<color=#FFACFFFF>Electro</color>, it will deal additional elemental DMG of that type.\nElemental Absorption may only occur once per use.\n\n<i>You discussed the way to grasp the formless wind with Paimon.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10067, 'Initial Cutting DMG', '18.0%', 1
        where exists (select 1 from skills where id = 10067 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 10067 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10067, 'Max Cutting DMG', '25.2%', 2
        where exists (select 1 from skills where id = 10067 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 10067 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10067, 'Initial Storm DMG', '264%', 3
        where exists (select 1 from skills where id = 10067 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 10067 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10067, 'Max Storm DMG', '288%', 4
        where exists (select 1 from skills where id = 10067 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 10067 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10067, 'Base CD', '5.0s', 5
        where exists (select 1 from skills where id = 10067 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 10067 and position = 5);
insert into skill_affixes (skill_id, name, value, position)
        select 10067, 'Max Charging CD', '8.0s', 6
        where exists (select 1 from skills where id = 10067 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 10067 and position = 6);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000007 order by id limit 1), 10067, 7, true, true, '', false
      where exists (select 1 from skills where id = 10067 and character_id = 10000007)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (10068, 10000007, 'Gust Surge', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f71a/0dd9839ad538a475f490e581c67c4c75.png', 1, 'Guiding the path of the wind currents, you summon a forward-moving tornado that pulls objects and opponents towards itself, dealing continuous <color=#80FFD7FF>Anemo DMG</color>.\n\n<color=#FFD780FF>Elemental Absorption</color>\nIf the tornado comes into contact with <color=#80C0FFFF>Hydro</color>/<color=#FF9999FF>Pyro</color>/<color=#99FFFFFF>Cryo</color>/<color=#FFACFFFF>Electro</color>, it will deal additional elemental DMG of that type.\nElemental Absorption may only occur once per use.\n\n<i>You and Paimon studied the flapping of a butterfly''s wings.</i>')
      on conflict do nothing;
insert into skill_affixes (skill_id, name, value, position)
        select 10068, 'Tornado DMG', '107%', 1
        where exists (select 1 from skills where id = 10068 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 10068 and position = 1);
insert into skill_affixes (skill_id, name, value, position)
        select 10068, 'Additional Elemental DMG', '32.9%', 2
        where exists (select 1 from skills where id = 10068 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 10068 and position = 2);
insert into skill_affixes (skill_id, name, value, position)
        select 10068, 'Duration', '6.0s', 3
        where exists (select 1 from skills where id = 10068 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 10068 and position = 3);
insert into skill_affixes (skill_id, name, value, position)
        select 10068, 'CD', '15.0s', 4
        where exists (select 1 from skills where id = 10068 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 10068 and position = 4);
insert into skill_affixes (skill_id, name, value, position)
        select 10068, 'Energy Cost', '60', 5
        where exists (select 1 from skills where id = 10068 and character_id = 10000007) and not exists (select 1 from skill_affixes where skill_id = 10068 and position = 5);
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000007 order by id limit 1), 10068, 5, true, true, '', false
      where exists (select 1 from skills where id = 10068 and character_id = 10000007)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (721, 10000007, 'Slitting Wind', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/9697c0bf602ba6445389fcdb217bdb78.png', 2, 'The last hit of a Normal Attack combo unleashes a wind blade, dealing 60% of ATK as <color=#80FFD7FF>Anemo DMG</color> to all opponents in its path.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000007 order by id limit 1), 721, 1, true, true, '', false
      where exists (select 1 from skills where id = 721 and character_id = 10000007)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (722, 10000007, 'Second Wind', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f721/28312d68bae52f5402822883703fd9e9.png', 2, '<color=#FFD780FF>Palm Vortex</color> kills regenerate 2% HP for 5s.\nThis effect can only occur once every 5s.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000007 order by id limit 1), 722, 1, true, true, '', false
      where exists (select 1 from skills where id = 722 and character_id = 10000007)
      on conflict do nothing;
insert into skills (id, character_id, name, icon, skill_type_id, description)
      values (751, 10000007, 'Foreign Windwrath', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6966dce8/147f53f74b6ac66881d99b6ab7df37d9.png', 3, 'Draw new strength from journeys past. For every element you have resonated with, you gain additional {LINK#N10050001}<color=#FFD780FF>buffs</color>{/LINK}.\n\nAdditionally, when <color=#FF9999FF>Pyro</color>, <color=#80C0FFFF>Hydro</color>, <color=#99FFFFFF>Cryo</color>, or <color=#FFACFFFF>Electro</color> attacks from nearby party members hit opponents, Traveler will receive 1 stack of Blade of the Dawn Breeze. Each Elemental Type can grant 1 Blade of the Dawn Breeze stack. After obtaining at least 2 stacks of Blade of the Dawn Breeze, performing a Charged Attack will consume all stacks of Blade of the Dawn Breeze and transform into the special <color=#FFD780FF>Charged Attack: Whirlwind</color>.\n\n<color=#FFD780FF>Charged Attack: Whirlwind</color>\n· Each Charged Attack hit deals increased <color=#80FFD7FF>Anemo DMG</color>. Increase in DMG is equal to 60% of Traveler''s ATK.\n· Every time a Blade of the Dawn Breeze of a certain elemental type is consumed, a Blade Wind matching this elemental type will also be summoned, dealing elemental DMG equal to 50% of Traveler''s ATK. This DMG is considered Charged Attack DMG.\n· <color=#FFD780FF>Charged Attack: Whirlwind</color> can be triggered up to once every 15s.\n· For the duration of <color=#FFD780FF>Charged Attack: Whirlwind</color>, no Blade of the Dawn Breeze will be obtained.')
      on conflict do nothing;
insert into build_skills (build_id, skill_id, level, is_unlock, is_enhanced, enhanced_desc, can_enhanced)
      select (select id from character_builds where character_id = 10000007 order by id limit 1), 751, 1, true, true, 'Draw new strength from journeys past. For every element you have resonated with, you gain additional {LINK#N10050001}<color=#FFD780FF>buffs</color>{/LINK}.\n\nAdditionally, when <color=#FF9999FF>Pyro</color>, <color=#80C0FFFF>Hydro</color>, <color=#99FFFFFF>Cryo</color>, or <color=#FFACFFFF>Electro</color> attacks from nearby party members hit opponents, Traveler will receive 1 stack of Blade of the Dawn Breeze. Each Elemental Type can grant 1 Blade of the Dawn Breeze stack. After obtaining at least 2 stacks of Blade of the Dawn Breeze, performing a Charged Attack will consume all stacks of Blade of the Dawn Breeze and transform into the special <color=#FFD780FF>Charged Attack: Whirlwind</color>.\n\n<color=#FFD780FF>Charged Attack: Whirlwind</color>\n· Each Charged Attack hit deals increased <color=#80FFD7FF>Anemo DMG</color>. Increase in DMG is equal to 60% of Traveler''s ATK.\n· Every time a Blade of the Dawn Breeze of a certain elemental type is consumed, a Blade Wind matching this elemental type will also be summoned, dealing elemental DMG equal to 50% of Traveler''s ATK. This DMG is considered Charged Attack DMG.\n· <color=#FFD780FF>Charged Attack: Whirlwind</color> can be triggered up to once every 15s.\n· For the duration of <color=#FFD780FF>Charged Attack: Whirlwind</color>, no Blade of the Dawn Breeze will be obtained.', true
      where exists (select 1 from skills where id = 751 and character_id = 10000007)
      on conflict do nothing;
insert into costumes (id, character_id, name, icon) values (200701, 10000007, 'As Heaven and Earth Are Made Anew', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/image_2/2f91d7c102df0056de11dce08b296624.png') on conflict do nothing;
insert into build_costumes (build_id, costume_id) values ((select id from character_builds where character_id = 10000007 order by id limit 1), 200701) on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 2000, 'selected', '9638', '3903', '13541')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 20, 'selected', '40.8%', null, '40.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 2001, 'selected', '723', '892', '1615')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 22, 'selected', '83.6%', null, '83.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 2002, 'selected', '605', '46', '651')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 26, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 28, 'selected', '50', null, '50')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 27, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 44, 'selected', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 23, 'selected', '140.1%', null, '140.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 2000, 'base', '9638', '3903', '13541')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 2001, 'base', '723', '892', '1615')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 2002, 'base', '605', '46', '651')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 28, 'base', '50', null, '50')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 999999, 'base', '227', null, '227')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 20, 'extra', '40.8%', null, '40.8%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 22, 'extra', '83.6%', null, '83.6%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 26, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 27, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 23, 'extra', '140.1%', null, '140.1%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 80, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 81, 'extra', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 40, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 50, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 42, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 52, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 43, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 53, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 41, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 51, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 44, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 54, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 46, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 56, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 45, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 55, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 30, 'element', '0.0%', null, '0.0%')
        on conflict do nothing;
insert into build_properties (build_id, property_type_id, category, base_value, add_value, final_value)
        values ((select id from character_builds where character_id = 10000007 order by id limit 1), 29, 'element', '0.0%', null, '0.0%')
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
      values ((select id from character_builds where character_id = 10000007 order by id limit 1), 48543, 2150481, 1, 5, 8, 2, '2342', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 1), 22, '6.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 1) and property_type_id = 22);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 1), 6, '10.5%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 1) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 1), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 1) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 1), 23, '6.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 1) and property_type_id = 23);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48422, 'Foundryman''s Observation', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/6d43279928ae731e4199ff123ecd210e.png', 'Plume of Death') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000007 order by id limit 1), 48422, 2150481, 2, 4, 8, 5, '137', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 2), 28, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 2) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 2), 20, '2.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 2) and property_type_id = 20);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 2), 2, '215', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 2) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 2), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 2) and property_type_id = 8);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48553, 'Foundryman''s Calculus', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/0119db4ca0f7c650686e2da11b9c6a1d.png', 'Sands of Eon') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000007 order by id limit 1), 48553, 2150481, 3, 5, 8, 6, '22.8%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 3), 23, '5.2%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 3) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 3), 5, '14', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 3) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 3), 2, '448', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 3) and property_type_id = 2);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 3), 20, '3.5%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 3) and property_type_id = 20);
insert into relic_sets (id, name) values (2100091, 'The Exile') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 2, 'Energy Recharge +20%'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2100091, 4, 'Using an Elemental Burst regenerates 2 Energy for all party members (excluding the wearer) every 2s for 6s. This effect cannot stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2100091 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (59413, 'Exile''s Goblet', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/67c7f6c8/7847bfdeab60c072ec09b17462505cdc.png', 'Goblet of Eonothem') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000007 order by id limit 1), 59413, 2100091, 4, 4, 12, 6, '27.7%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 4), 5, '16', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 4) and property_type_id = 5);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 4), 23, '8.8%', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 4) and property_type_id = 23);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 4), 28, '34', 1
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 4) and property_type_id = 28);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 4), 8, '17', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 4) and property_type_id = 8);
insert into relic_sets (id, name) values (2150481, 'Heart of the Furnace') on conflict do nothing;
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 2, 'ATK +18%.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 2);
insert into relic_set_affixes (set_id, activation_number, effect)
        select 2150481, 4, 'Increases the equipping character''s ATK by 12% for 12s when they trigger a Stellar Glimmer reaction or deal Stellar Glimmer reaction DMG. Also increases Stellar Glimmer reaction DMG dealt by all nearby party members by 50%. The above effects can trigger even when the equipping character is not on the field, and the DMG bonus from multiple Artifact Sets with the same name do not stack.'
        where not exists (select 1 from relic_set_affixes where set_id = 2150481 and activation_number = 4);
insert into relics (id, name, icon, pos_name) values (48432, 'Foundryman''s Legacy', 'https://act-webstatic.hoyoverse.com/hk4e/e20200928calculate/item_icon/6a7ba976/2aece34359e0f99802feced2f25ee01b.png', 'Circlet of Logos') on conflict do nothing;
insert into build_relics (build_id, relic_id, set_id, position, rarity, level, main_property_type_id, main_value, main_times)
      values ((select id from character_builds where character_id = 10000007 order by id limit 1), 48432, 2150481, 5, 4, 8, 22, '27.4%', 0)
      on conflict do nothing;
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 5), 8, '13', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 5) and property_type_id = 8);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 5), 6, '3.3%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 5) and property_type_id = 6);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 5), 3, '4.7%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 5) and property_type_id = 3);
insert into build_relic_substats (build_relic_id, property_type_id, value, times)
        select (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 5), 23, '3.6%', 0
        where not exists (select 1 from build_relic_substats where build_relic_id = (select id from build_relics where build_id = (select id from character_builds where character_id = 10000007 order by id limit 1) and position = 5) and property_type_id = 23);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000007, 'sand', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000007 and slot = 'sand' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000007, 'goblet', 6
          where not exists (select 1 from character_relic_recommendations where character_id = 10000007 and slot = 'goblet' and property_type_id = 6);
insert into character_relic_recommendations (character_id, slot, property_type_id)
          select 10000007, 'circlet', 22
          where not exists (select 1 from character_relic_recommendations where character_id = 10000007 and slot = 'circlet' and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000007, 20
        where not exists (select 1 from character_recommended_substats where character_id = 10000007 and property_type_id = 20);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000007, 22
        where not exists (select 1 from character_recommended_substats where character_id = 10000007 and property_type_id = 22);
insert into character_recommended_substats (character_id, property_type_id)
        select 10000007, 6
        where not exists (select 1 from character_recommended_substats where character_id = 10000007 and property_type_id = 6);

commit;
