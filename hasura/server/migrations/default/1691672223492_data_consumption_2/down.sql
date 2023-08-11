
alter table "public"."data_consumption" alter column "app_type_id" drop not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."data_consumption" add column "app_type_id" Text
--  null;
