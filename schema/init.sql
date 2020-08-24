\set ON_ERROR_STOP true

begin;


-- Misc extensions
create extension if not exists citext;
create extension if not exists pgcrypto;

-- Schemas (public and private)
create schema if not exists bravado_db;

-- Roles (postgraphql, anonymous, user)
create role bravado_postgraphql login password :'password';

create role bravado_anonymous;
grant bravado_anonymous to bravado_postgraphql;

create role bravado_user;
grant bravado_user to bravado_postgraphql;

create role bravado_admin bypassrls;
grant bravado_admin to bravado_postgraphql;


-- Access control on bravado_db schema
grant usage on schema bravado_db to bravado_anonymous, bravado_user, bravado_admin;

grant select, insert, update, delete on all tables in schema bravado_db to bravado_admin;
grant usage on all sequences in schema bravado_db to bravado_admin;
grant execute on all functions in schema bravado_db to bravado_admin;

create type l2.jwt_token as (
  role text,
  user_id integer,
  exp integer
);

commit;
