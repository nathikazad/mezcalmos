
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "unique_id" text
--  null;

alter table "service_provider"."details" alter column "unique_id" drop not null;
alter table "service_provider"."details" add column "unique_id" text;
