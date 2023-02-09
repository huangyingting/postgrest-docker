create schema api;

create role web_anon nologin;
grant usage on schema api to web_anon;
alter default privileges in schema api grant select on tables to web_anon;
grant web_anon to postgrest;

create role api_user nologin;
grant usage on schema api to api_user;
alter default privileges in schema api grant all on tables to api_user;
alter default privileges in schema api grant all on sequences to api_user;
grant api_user to postgrest;

create table api.todos (
  id serial primary key,
  done boolean not null default false,
  task text not null,
  due timestamptz
);
insert into api.todos (task) values
  ('learn azure'), ('learn aws');
