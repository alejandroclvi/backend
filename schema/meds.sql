-- TABLE meds

create table bravado_db.meds (
  id                   serial primary key,
  dosis                text,
  frequency            text,
  cost                 float,
  user_id              integer references bravado_db.user (id) on delete cascade,
  name                 text not null check (char_length(name) < 80)
);

create unique index on bravado_db.meds (name);
create unique index on bravado_db.meds (id);