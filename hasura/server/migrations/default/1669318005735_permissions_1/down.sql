

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE
-- OR REPLACE VIEW "public"."restaurant_order_public" AS
-- SELECT
--   restaurant_order.id AS restaurant_id,
--   restaurant_order.review_id,
--   restaurant_order.order_time,
--   restaurant_order.estimated_food_ready_time,
--   restaurant_order.actual_food_ready_time,
--   restaurant_order.customer_id,
--   restaurant_order.status
-- FROM
--   restaurant_order;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE
-- OR REPLACE VIEW "public"."restaurant_order_public" AS
-- SELECT
--   restaurant_order.id AS restaurant_id,
--   restaurant_order.review_id,
--   restaurant_order.order_time,
--   restaurant_order.estimated_food_ready_time,
--   restaurant_order.actual_food_ready_time,
--   restaurant_order.customer_id,
--   restaurant_order.status
-- FROM
--   restaurant_order;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE
-- OR REPLACE VIEW "public"."delivery_order_public" AS
-- SELECT
--   delivery_order.id AS
--   deliverer_id,
--   delivery_order.deliverer_app_type_id,
--   delivery_order.order_time,
--   delivery_order.estimated_package_ready_time,
--   delivery_order.actual_package_ready_time,
--   delivery_order.estimated_arrival_at_pickup_time,
--   delivery_order.actual_arrival_at_pickup_time,
--   delivery_order.estimated_arrival_at_dropoff_time,
--   delivery_order.actual_arrival_at_dropoff_time,
--   delivery_order.actual_delivered_time,
--   delivery_order.status,
--   delivery_order.driver_review_by_service_provider_id,
--   delivery_order.driver_review_by_customer_id,
--   delivery_order.service_provider_review_by_driver_id,
--   delivery_order.customer_review_by_driver_id,
--   delivery_order.customer_id,
--   delivery_order.service_provider_id,
--   delivery_order.service_provider_type,
--   delivery_order.trip_distance,
--   delivery_order.trip_duration
-- FROM
--   delivery_order;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "cancellation_time" timestamptz
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery_order" add column "order_time" timestamptz
--  not null default now();

alter table "public"."delivery_order" rename to "delivery";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE
-- OR REPLACE VIEW "public"."restaurant_order_public" AS
-- SELECT
--   restaurant_order.id AS restaurant_id,
--   restaurant_order.review_id,
--   restaurant_order.order_time,
--   restaurant_order.estimated_food_ready_time,
--   restaurant_order.actual_food_ready_time
-- FROM
--   restaurant_order;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE
-- OR REPLACE VIEW "public"."restaurant_order_public" AS
-- SELECT
--   restaurant_order.id AS restaurant_id,
--   restaurant_order.review_id,
--   restaurant_order.order_time,
--   restaurant_order.estimated_food_ready_time,
--   restaurant_order.actual_food_ready_time
-- FROM
--   restaurant_order;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."translation" add column "service_provider_type" text
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."translation" add column "service_provider_id" integer
--  not null;

alter table "public"."translation" alter column "shared" set default false;
alter table "public"."translation" alter column "shared" drop not null;
alter table "public"."translation" add column "shared" bool;

alter table "public"."translation_value" drop constraint "translation_value_translation_id_fkey",
  add constraint "translation_value_translation_id_fkey"
  foreign key ("translation_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE VIEW restaurant_order_public AS
--   SELECT id AS restaurant_id, review_id
--     FROM restaurant_order;

alter table "public"."restaurant_option_choice_map" drop constraint "restaurant_option_choice_map_restaurant_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_option_choice_map" add column "restaurant_id" integer
--  not null;

ALTER TABLE "public"."restaurant_operator" ALTER COLUMN "status" drop default;

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_restaurant_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_item_option_map" add column "restaurant_id" integer
--  not null;

alter table "public"."restaurant_item" drop constraint "restaurant_item_restaurant_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant" add column "self_delivery" boolean
--  not null default 'false';

alter table "public"."restaurant_option" drop constraint "restaurant_option_restaurant_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_option" add column "restaurant_id" integer
--  not null;

alter table "public"."restaurant_choice" drop constraint "restaurant_choice_restaurant_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_choice" add column "restaurant_id" integer
--  not null;

alter table "public"."deliverer" drop constraint "deliverer_user_id_delivery_company_type_delivery_company_id_key";

alter table "public"."notification_info" drop constraint "notification_info_app_type_id_user_id_key";

alter table "public"."deliverer" rename column "notification_info_id" to "notification_id";

alter table "public"."deliverer" drop constraint "deliverer_notification_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."deliverer" add column "notification_id" integer
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."deliverer" add column "online" boolean
--  not null default 'false';

comment on column "public"."delivery"."deliverer_app_type_id" is E'restaurant_operator, deliverer';

comment on column "topology"."app_type"."id" is NULL;

comment on column "public"."delivery"."deliverer_app_type_id" is NULL;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant" add column "service_provider_type" text
--  not null default 'restaurant';
