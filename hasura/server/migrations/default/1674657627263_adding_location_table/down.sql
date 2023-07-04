
alter table "delivery"."details" alter column "location_gps" drop not null;
alter table "delivery"."details" add column "location_gps" geography;

alter table "delivery"."details" alter column "location_text" drop not null;
alter table "delivery"."details" add column "location_text" text;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER table "location" set schema service_provider;

DROP TABLE "public"."location";

alter table "restaurant"."restaurant" drop constraint "restaurant_delivery_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."restaurant" add column "delivery_details_id" integer
--  not null;

alter table "delivery"."company" drop constraint "company_delivery_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."company" add column "delivery_details_id" integer
--  not null;
