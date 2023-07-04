
alter table "service_provider"."details" alter column "currency" set default 'Peso'::text;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "currency" text
--  not null default 'Peso';
