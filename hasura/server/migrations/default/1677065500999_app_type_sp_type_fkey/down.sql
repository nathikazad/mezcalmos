
alter table "service_provider"."subscriber" drop constraint "subscriber_service_provider_type_fkey";

alter table "service_provider"."post" drop constraint "post_service_provider_type_fkey";

alter table "service_provider"."details" drop constraint "details_service_provider_type_fkey";

alter table "service_provider"."delivery_partner" drop constraint "delivery_partner_service_provider_type_fkey";

alter table "restaurant"."restaurant" drop constraint "restaurant_service_provider_type_fkey";

alter table "public"."translation" drop constraint "translation_service_provider_type_fkey";

alter table "public"."service_provider_customer_chat" drop constraint "service_provider_customer_chat_service_provider_type_fkey";

alter table "public"."mez_admin_chat" drop constraint "mez_admin_chat_app_type_fkey";

alter table "public"."mez_admin" drop constraint "mez_admin_app_type_id_fkey";

alter table "public"."mez_admin" alter column "app_type_id" set default 'mez_admin'::text;

alter table "laundry"."store" drop constraint "store_service_provider_type_fkey";

alter table "delivery"."order" drop constraint "order_service_provider_type_fkey";

alter table "delivery"."driver" drop constraint "driver_delivery_company_type_fkey";

alter table "delivery"."driver" drop constraint "driver_app_type_id_fkey";

alter table "delivery"."company" drop constraint "company_service_provider_type_fkey";

alter table "customer"."customer" drop constraint "customer_app_type_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE service_provider_type SET SCHEMA valid_types;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE app_type SET SCHEMA valid_types;

drop schema "valid_types" cascade;

DROP TABLE "public"."service_provider_type";
