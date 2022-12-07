

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


alter table "public"."restaurant_order" drop column "tax" cascade;

alter table "public"."restaurant_order" add column "tax" money
 not null default '0';

alter table "public"."restaurant_order" drop column "refund_amount" cascade;

alter table "public"."restaurant_order" add column "refund_amount" money
 not null default '0';

alter table "public"."restaurant_order" drop constraint "restaurant_order_customer_id_fkey",
  add constraint "restaurant_order_customer_id_fkey"
  foreign key ("customer_id")
  references "public"."customer"
  ("user_id") on update restrict on delete restrict;


alter table "public"."restaurant" drop column "operator_qr_image_link" cascade;

alter table "public"."restaurant" drop column "operator_deep_link" cascade;
