
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "time_zone" text
--  null default 'America/Mexico_City';

alter table "service_provider"."details" alter column "timezone" set default ''America/Mexico_City'::text';
alter table "service_provider"."details" alter column "timezone" drop not null;
alter table "service_provider"."details" add column "timezone" text;
