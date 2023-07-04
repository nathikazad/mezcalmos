
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."delivery_partner" add column "service_provider_type" text
--  not null;

alter table "delivery"."company" drop constraint "company_delivery_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."company" add column "delivery_details_id" integer
--  not null unique;

alter table "laundry"."store" drop constraint "store_delivery_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "delivery_details_id" integer
--  not null unique;

alter table "restaurant"."restaurant" drop constraint "restaurant_delivery_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."restaurant" add column "delivery_details_id" integer
--  not null unique;

alter table "service_provider"."details" add constraint "details_delivery_details_id_key" unique (delivery_details_id);
alter table "service_provider"."details"
  add constraint "details_delivery_details_id_fkey"
  foreign key (delivery_details_id)
  references "delivery"."details"
  (id) on update restrict on delete restrict;
alter table "service_provider"."details" alter column "delivery_details_id" drop not null;
alter table "service_provider"."details" add column "delivery_details_id" int4;
