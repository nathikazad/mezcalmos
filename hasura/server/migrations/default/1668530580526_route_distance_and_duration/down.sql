
comment on column "public"."delivery"."trip_distance" is NULL;

comment on column "public"."delivery"."trip_duration" is NULL;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "trip_duration" integer
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "trip_distance" integer
--  null;

alter table "public"."delivery" alter column "trip_duration" drop not null;
alter table "public"."delivery" add column "trip_duration" text;

alter table "public"."delivery" alter column "trip_distance" drop not null;
alter table "public"."delivery" add column "trip_distance" text;
