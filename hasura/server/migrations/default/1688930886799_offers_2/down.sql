
alter table "service_provider"."offer" drop constraint "offer_name_id_fkey";

alter table "service_provider"."offer" alter column "service_provider_type" set default 'restaurant'::text;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."cart" add column "applied_offers" jsonb
--  not null default jsonb_build_array();
