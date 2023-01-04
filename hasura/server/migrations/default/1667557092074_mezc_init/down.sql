
alter table "public"."chat_participant" drop constraint "chat_participant_notification_info_id_fkey";

alter table "public"."chat_participant" drop constraint "chat_participant_participant_id_fkey";

DROP INDEX IF EXISTS "public"."delivery_company_index";

alter table "public"."delivery" alter column "current_location" drop not null;
alter table "public"."delivery" add column "current_location" geography;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "current_location" geography
--  null;

comment on table "public"."restaurant_order_item" is NULL;

DROP TABLE "public"."restaurant_operator";

alter table "public"."deliverer" rename to "driver";

alter table "public"."delivery" drop constraint "delivery_deliverer_id_fkey";

alter table "public"."delivery" alter column "delivery_company_id" drop not null;
alter table "public"."delivery" add column "delivery_company_id" int4;

alter table "public"."delivery" alter column "delivery_company_type" drop not null;
alter table "public"."delivery" add column "delivery_company_type" text;

DROP TABLE "public"."driver";

alter table "public"."chat_participant" alter column "id" set default nextval('chat_participants_id_seq'::regclass);
alter table "public"."chat_participant" alter column "id" drop not null;
alter table "public"."chat_participant" add column "id" int4;

alter table "public"."chat_participant" drop constraint "chat_participant_pkey";
alter table "public"."chat_participant"
    add constraint "chat_participants_pkey"
    primary key ("id");

alter table "public"."notification_info" drop constraint "notification_info_app_type_id_fkey";

alter table "public"."notification_info" rename column "app_type_id" to "app_type";

DROP TABLE "topology"."app_type";

DROP INDEX IF EXISTS "public"."notification_info_user_id";

alter table "public"."notification_info" drop constraint "notification_info_user_id_fkey";

DROP TABLE "public"."user";

alter table "public"."restaurant_order_item" drop constraint "restaurant_order_item_review_id_fkey";

alter table "public"."delivery" drop constraint "delivery_customer_review_by_driver_id_fkey";

alter table "public"."delivery" drop constraint "delivery_service_provider_review_by_driver_id_fkey";

alter table "public"."delivery" drop constraint "delivery_driver_review_by_customer_id_fkey";

alter table "public"."delivery" drop constraint "delivery_driver_review_by_service_provider_id_fkey";

alter table "public"."delivery" rename column "customer_review_by_driver_id" to "customer_review_by_driver";

alter table "public"."delivery" rename column "service_provider_review_by_driver_id" to "service_provider_review_by_driver";

alter table "public"."restaurant_order" drop constraint "restaurant_order_review_id_fkey";

alter table "public"."restaurant_order" rename column "customer_app_type" to "customer_app_medium";

DROP TABLE "public"."review";

DROP TABLE "public"."notification_info";

alter table "public"."chat_participant" rename to "chat_participants";

DROP TABLE "public"."chat_participants";

alter table "public"."delivery" drop constraint "delivery_chat_with_customer_id_fkey";

alter table "public"."delivery" drop constraint "delivery_chat_with_service_provider_id_fkey";

alter table "public"."delivery" rename column "deliverer_app_type" to "deliverer_type";

alter table "public"."chat" rename column "chat_info" to "participants";

alter table "public"."restaurant_order" drop constraint "restaurant_order_chat_id_fkey";

alter table "public"."chat" alter column "parent_link" drop not null;
alter table "public"."chat" add column "parent_link" text;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."chat" add column "parent_link" text
--  null;

DROP TABLE "public"."chat";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "customer_id" integer
--  not null;

alter table "public"."restaurant_order" rename column "customer_id" to "user_id";

alter table "public"."restaurant_order" drop constraint "restaurant_order_delivery_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "chat_id" integer
--  not null;

alter table "public"."delivery" rename column "actual_arrival_at_pickup_time" to "actual_pickup_time";

alter table "public"."delivery" rename column "estimated_arrival_at_pickup_time" to "estimated_pickup_time";

alter table "public"."restaurant_order_item" alter column "review_text" drop not null;
alter table "public"."restaurant_order_item" add column "review_text" text;

alter table "public"."restaurant_order_item" rename column "review_id" to "review_rating";

alter table "public"."restaurant_order" alter column "review_text" drop not null;
alter table "public"."restaurant_order" add column "review_text" text;

alter table "public"."restaurant_order" rename column "review_id" to "review_rating";

DROP TABLE "public"."delivery";

alter table "public"."restaurant_order" alter column "delivery_cost" drop not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "tax" float8
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "delivery_cost" float8
--  null default '0';

alter table "public"."restaurant_order" alter column "to_location_address" set not null;

alter table "public"."restaurant_order" alter column "to_location_gps" set not null;

DROP TABLE "public"."restaurant_cart";

alter table "public"."restaurant_order_item" drop constraint "restaurant_order_item_restaurant_order_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order_item" add column "restaurant_order_id" integer
--  not null;

DROP TABLE "public"."restaurant_order_item";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_item" add column "archived" boolean
--  not null default 'false';

alter table "public"."restaurant_order" rename column "customer_app_medium" to "customer_medium";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "notes" text
--  null;

alter table "public"."service_provider_payment_info" drop constraint "service_provider_payment_info_stripe_info_id_key";

alter table "public"."service_provider_payment_info" drop constraint "service_provider_payment_info_stripe_info_id_fkey";

DROP TABLE "public"."stripe_info";

alter table "public"."service_provider_payment_info" add constraint "service_provider_payment_info_service_provider_id_key" unique (service_provider_id);
alter table "public"."service_provider_payment_info"
  add constraint "service_provider_payment_info_service_provider_id_fkey"
  foreign key (service_provider_id)
  references "public"."restaurant"
  (id) on update restrict on delete restrict;
alter table "public"."service_provider_payment_info" alter column "service_provider_id" drop not null;
alter table "public"."service_provider_payment_info" add column "service_provider_id" int4;

alter table "public"."restaurant" drop constraint "restaurant_payment_info_id_key";

alter table "public"."restaurant" drop constraint "restaurant_payment_info_id_fkey";

alter table "public"."service_provider_payment_info"
  add constraint "service_provider_payment_info_service_provider_id_fkey2"
  foreign key ("service_provider_id")
  references "public"."restaurant_item"
  ("id") on update restrict on delete restrict;

alter table "public"."service_provider_payment_info" drop constraint "service_provider_payment_info_service_provider_id_fkey2";

DROP TABLE "public"."service_provider_payment_info";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "customer_medium" text
--  not null default 'native';

DROP TABLE "public"."restaurant_option_choice_map";

DROP TABLE "public"."restaurant_choice";

ALTER TABLE "public"."restaurant_item" ALTER COLUMN "cost" TYPE integer;

DROP TABLE "public"."restaurant_item_option_map";

DROP TABLE "public"."restaurant_option";

DROP TABLE "public"."restaurant_item";

alter table "public"."restaurant" drop constraint "restaurant_firebase_id_key";

alter table "public"."restaurant_order" drop constraint "restaurant_order_firebase_id_key";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "firebase_id" text
--  null;

alter table "public"."restaurant_order" drop constraint "restaurant_order_restaurant_id_fkey";

DROP TABLE "public"."restaurant_category";

alter table "public"."restaurant" drop constraint "restaurant_description_id_fkey";

DROP TABLE "public"."translation_value";

alter table "public"."translation" alter column "group_id" drop not null;
alter table "public"."translation" add column "group_id" int4;

alter table "public"."translation" alter column "value" drop not null;
alter table "public"."translation" add column "value" text;

alter table "public"."translation" add constraint "translation_group_id_language_id_key" unique (group_id, language_id);
alter table "public"."translation" alter column "language_id" drop not null;
alter table "public"."translation" add column "language_id" int4;

DROP TABLE "public"."translation";

DROP TABLE "topology"."language";

DROP TABLE "public"."restaurant";

DROP TABLE "public"."restaurant_order";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP table "public"."order";

DROP TABLE "public"."order";
