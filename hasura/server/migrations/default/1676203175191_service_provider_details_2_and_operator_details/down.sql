
ALTER TABLE "service_provider"."stripe_info" ALTER COLUMN "charges_enabled" drop default;

ALTER TABLE "service_provider"."stripe_info" ALTER COLUMN "payouts_enabled" drop default;

ALTER TABLE "service_provider"."stripe_info" ALTER COLUMN "details_submitted" drop default;

alter table "delivery"."operator" drop constraint "operator_details_id_fkey",
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."operator" drop constraint "operator_details_id_fkey",
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."operator" drop constraint "operator_details_id_fkey",
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."details" alter column "delivery_details_id" drop not null;

alter table "service_provider"."operator_details" alter column "delivery_driver_type" drop not null;
alter table "service_provider"."operator_details" add column "delivery_driver_type" text;

alter table "service_provider"."delivery_partner" drop constraint "delivery_partner_service_provider_id_fkey";

alter table "service_provider"."delivery_partner" add constraint "delivery_partner_service_provider_id_service_provider_type_key" unique (service_provider_id, service_provider_type);
alter table "service_provider"."delivery_partner" alter column "service_provider_type" drop not null;
alter table "service_provider"."delivery_partner" add column "service_provider_type" text;

alter table "service_provider"."details" alter column "stripe_info" drop not null;
alter table "service_provider"."details" add column "stripe_info" jsonb;

alter table "service_provider"."service_link" alter column "service_provider_type" drop not null;
alter table "service_provider"."service_link" add column "service_provider_type" text;

alter table "service_provider"."service_link" add constraint "service_links_provider_id_key" unique (service_provider_id);
alter table "service_provider"."service_link" alter column "service_provider_id" drop not null;
alter table "service_provider"."service_link" add column "service_provider_id" int4;

alter table "service_provider"."details" drop constraint "details_service_link_id_key";

alter table "service_provider"."details" drop constraint "details_service_link_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "service_link_id" integer
--  null;
