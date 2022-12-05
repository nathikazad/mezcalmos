
alter table "public"."restaurant" add column "operator_deep_link" text
 null;

alter table "public"."restaurant" add column "operator_qr_image_link" text
 null;

alter table "public"."restaurant" alter column "operator_deep_link" set default 'deepLink';

alter table "public"."restaurant" alter column "operator_qr_image_link" set default 'qr_image';

ALTER TABLE "public"."restaurant" ALTER COLUMN "operator_deep_link" drop default;

ALTER TABLE "public"."restaurant" ALTER COLUMN "operator_qr_image_link" drop default;

CREATE TABLE "public"."service_links" ("provider_id" integer NOT NULL, "operator_deep_link" text, "operator_qr_image_link" text, "driver_qr_image_link" text, "driver_deep_link" text, "id" serial NOT NULL, "provider_type" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("provider_id"), UNIQUE ("id"));

alter table "public"."service_links" rename column "provider_type" to "service_provider_type";

alter table "public"."service_links" rename to "service_link";

alter table "public"."service_link" rename column "provider_id" to "service_provider_id";

alter table "public"."service_link" alter column "driver_deep_link" set not null;

alter table "public"."service_link" alter column "driver_qr_image_link" set not null;

alter table "public"."service_link" alter column "driver_qr_image_link" drop not null;

alter table "public"."service_link" alter column "driver_deep_link" drop not null;
