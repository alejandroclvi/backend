-- TABLE meds

create table bravado_db.meds (
  dosis                text,
  frequency            text,
  cost                 float,
  name                 text not null check (char_length(name) < 80),
);

create unique index on bravado_db.meds (name);