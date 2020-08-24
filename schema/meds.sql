-- TABLE meds

create table bravado_db.meds (
  dosis                text,
  frequency            text,
  cost                 float,
  name                 text primary key,
);

create unique index on bravado_db.meds (name);