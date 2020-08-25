-- TABLE appointments

create table bravado_db.appointments (
  id                   serial primary key,
  user_id              integer references bravado_db.user (id) on delete cascade,
  location             json not null,
  doctor               text not null check (char_length(doctor) < 80),
  notes                text not null check (char_length(notes) < 80),
  date                 timestamptz not null default now(),
  time                 text not null check (char_length(time) < 80)
);

create unique index on bravado_db.appointments (id);