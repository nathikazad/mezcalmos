
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "advertise_only" boolean
--  not null default 'false';

alter table "service_provider"."details" drop constraint "details_unique_id_key";
alter table "service_provider"."details" alter column "unique_id" drop not null;
