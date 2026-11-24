-- Teyvat Archive schema. Run once in the Supabase SQL editor (or `supabase db push`).
-- Then fill it with `pnpm seed` (scripts/seed.ts).

-- Character list shown on the home page (one Characters object per row)
create table if not exists characters (
  id       bigint primary key,
  position int    not null default 0, -- keeps the original display order
  data     jsonb  not null
);

-- Full character detail (one Character object per row).
-- The slug columns let the detail page look a character up by its URL:
-- /characters/<name> or /characters/<name>-<element> (needed for Traveler).
create table if not exists character_details (
  id                bigint primary key,
  data              jsonb  not null,
  name_slug         text generated always as (lower(data->'base'->>'name')) stored,
  name_element_slug text generated always as (lower(data->'base'->>'name') || '-' || lower(data->'base'->>'element')) stored
);
create index if not exists character_details_name_slug_idx         on character_details (name_slug);
create index if not exists character_details_name_element_slug_idx on character_details (name_element_slug);

create table if not exists property_map (
  property_type int  primary key,
  name          text not null,
  icon          text,
  filter_name   text
);

create table if not exists skill_map (
  id   int  primary key,
  name text not null
);

-- Relic set id -> HoYoWiki URL
create table if not exists wiki_map (
  id  bigint primary key,
  url text   not null
);

create table if not exists teams (
  id int primary key,
  name text not null default 'Team Standing By'
);

create table if not exists team_members (
  id int primary key,
  team_id int not null,
  character_id int not null
);

-- Public read-only access with the anon key. Writes need the service role key (seed script).
alter table characters        enable row level security;
alter table character_details enable row level security;
alter table property_map      enable row level security;
alter table skill_map         enable row level security;
alter table wiki_map          enable row level security;
alter table teams enable row level security;
alter table team_members enable row level security;

drop policy if exists "public read" on characters;
drop policy if exists "public read" on character_details;
drop policy if exists "public read" on property_map;
drop policy if exists "public read" on skill_map;
drop policy if exists "public read" on wiki_map;
drop policy if exists "public read" on teams;
drop policy if exists "public read" on team_members;

create policy "public read" on characters        for select using (true);
create policy "public read" on character_details for select using (true);
create policy "public read" on property_map      for select using (true);
create policy "public read" on skill_map         for select using (true);
create policy "public read" on wiki_map          for select using (true);
create policy "public read" on teams for select using (true);
create policy "public read" on team_members for select using (true);

alter table character_builds enable row level security;
alter table build_weapons    enable row level security;
alter table weapons          enable row level security;

drop policy if exists "public read" on character_builds;
drop policy if exists "public read" on build_weapons;
drop policy if exists "public read" on weapons;

create policy "public read" on character_builds for select using (true);
create policy "public read" on build_weapons    for select using (true);
create policy "public read" on weapons          for select using (true);

