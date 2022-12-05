
alter table "public"."service_link" alter column "driver_deep_link" set not null;

alter table "public"."service_link" alter column "driver_qr_image_link" set not null;

alter table "public"."service_link" alter column "driver_qr_image_link" drop not null;

alter table "public"."service_link" alter column "driver_deep_link" drop not null;

alter table "public"."service_link" rename column "service_provider_id" to "provider_id";

alter table "public"."service_link" rename to "service_links";

alter table "public"."service_links" rename column "service_provider_type" to "provider_type";

DROP TABLE "public"."service_links";

alter table "public"."restaurant" alter column "operator_qr_image_link" set default 'qr_image'::text;

alter table "public"."restaurant" alter column "operator_deep_link" set default 'deepLink'::text;

ALTER TABLE "public"."restaurant" ALTER COLUMN "operator_qr_image_link" drop default;

ALTER TABLE "public"."restaurant" ALTER COLUMN "operator_deep_link" drop default;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant" add column "operator_qr_image_link" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant" add column "operator_deep_link" text
--  null;
