alter table characters
  add constraint characters_rarity_check check (rarity in (4, 5));

alter table weapons
  add constraint weapons_rarity_check check (rarity between 1 and 5);