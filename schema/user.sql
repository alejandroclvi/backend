-- TABLE user

create table bravado_db.user (
  id                    serial primary key,
  password              text not null check (char_length(password) < 80),
  name                  text not null check (char_length(name) < 80),
  email                 citext not null unique check (email ~* '^.+@.+\..+$')
);

create unique index on bravado_db.user (email);