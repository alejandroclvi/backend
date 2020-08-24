-- TABLE user

create table bravado_db.appointments (
  id                   serial primary key,
  user_id              integer references bravado_db.user (id) on delete cascade,
  location             geometry,
  doctor               text,
  notes                text,
  time                 timestamptz default now(),
);

create unique index on bravado_db.appointments (id);