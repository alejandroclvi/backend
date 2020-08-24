-- TABLE user

create table bravado_db.user (
  id                    serial primary key,
  password_hash         text,
  name                  text not null check (char_length(name) < 80),
  email                 citext not null unique check (email ~* '^.+@.+\..+$'),
);

create unique index on l2.user (email);