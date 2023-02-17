
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."stripe_info" add column "requirements" jsonb
--  null;

alter table "service_provider"."stripe_info" alter column "requirements" drop not null;
alter table "service_provider"."stripe_info" add column "requirements" text;
