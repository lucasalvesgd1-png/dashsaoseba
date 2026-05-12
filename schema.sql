-- Execute no Supabase: SQL Editor → New query → cole isso e clique em Run

create table if not exists comuns (
  id text primary key,
  title text not null,
  category text not null,
  report_date text not null,
  created_at timestamptz default now()
);

create table if not exists legendas (
  news_id text primary key,
  report_date text not null,
  caption text not null,
  created_at timestamptz default now()
);

-- Libera acesso público às tabelas (necessário para a anon key funcionar)
alter table comuns enable row level security;
alter table legendas enable row level security;

create policy "acesso_publico_comuns" on comuns for all using (true) with check (true);
create policy "acesso_publico_legendas" on legendas for all using (true) with check (true);
