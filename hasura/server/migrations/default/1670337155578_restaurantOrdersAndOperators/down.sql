

alter table "public"."restaurant" alter column "operator_deep_link" drop not null;
alter table "public"."restaurant" add column "operator_deep_link" text;

alter table "public"."restaurant" alter column "operator_qr_image_link" drop not null;
alter table "public"."restaurant" add column "operator_qr_image_link" text;


alter table "public"."restaurant_order" drop constraint "restaurant_order_customer_id_fkey",
  add constraint "restaurant_order_customer_id_fkey"
  foreign key ("customer_id")
  references "public"."customer"
  ("user_id") on update restrict on delete restrict;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "refund_amount" money
--  not null default '0';

alter table "public"."restaurant_order" alter column "refund_amount" set default 0;
alter table "public"."restaurant_order" alter column "refund_amount" drop not null;
alter table "public"."restaurant_order" add column "refund_amount" int4;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "tax" money
--  not null default '0';

alter table "public"."restaurant_order" alter column "tax" set default '0'::double precision;
alter table "public"."restaurant_order" alter column "tax" drop not null;
alter table "public"."restaurant_order" add column "tax" float8;


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
