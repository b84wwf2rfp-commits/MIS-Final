-- Fly Fishing Quest: shared catch feed
-- Paste this into Supabase > SQL Editor > New query, then click Run.

create table if not exists public.posts (
  id          uuid primary key default gen_random_uuid(),
  created_at  bigint not null,
  river       text not null check (river in ('solduc','puget','yakima','spokane','granderonde')),
  species     text not null check (species in ('steelhead','coho','chinook','cutthroat','rainbow','brown','brook')),
  length      int  not null check (length between 1 and 60),
  sun         int  check (sun between 0 and 100),
  weather     int  check (weather between 0 and 4),
  temp        int  check (temp between 0 and 120),
  fly         text check (char_length(fly) <= 40),
  photo       text check (char_length(photo) <= 250000),
  uid         text not null check (char_length(uid) <= 64),
  angler      text not null check (char_length(angler) between 1 and 24),
  xp          int
);

create index if not exists posts_river_time on public.posts (river, created_at desc);
create index if not exists posts_uid_time   on public.posts (uid, created_at desc);

alter table public.posts enable row level security;

drop policy if exists "Anyone can read posts" on public.posts;
create policy "Anyone can read posts" on public.posts for select using (true);

drop policy if exists "Anyone can add posts" on public.posts;
create policy "Anyone can add posts" on public.posts for insert with check (true);

grant select, insert on public.posts to anon;
