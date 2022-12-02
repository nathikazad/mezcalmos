
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE VIEW "public"."delivery_order_public" AS
--  SELECT delivery_order.id AS delivery_driver_id,
--     delivery_order.delivery_driver_type,
--     delivery_order.order_time,
--     delivery_order.estimated_package_ready_time,
--     delivery_order.actual_package_ready_time,
--     delivery_order.estimated_arrival_at_pickup_time,
--     delivery_order.actual_arrival_at_pickup_time,
--     delivery_order.estimated_arrival_at_dropoff_time,
--     delivery_order.actual_arrival_at_dropoff_time,
--     delivery_order.actual_delivered_time,
--     delivery_order.status,
--     delivery_order.driver_review_by_service_provider_id,
--     delivery_order.driver_review_by_customer_id,
--     delivery_order.service_provider_review_by_driver_id,
--     delivery_order.customer_review_by_driver_id,
--     delivery_order.customer_id,
--     delivery_order.service_provider_id,
--     delivery_order.service_provider_type,
--     delivery_order.trip_distance,
--     delivery_order.trip_duration
--    FROM delivery_order;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP VIEW "public"."delivery_order_public";


comment on column "public"."delivery_order"."delivery_driver_type" is E'restaurant, delivery_driver, delivery_operator';

alter table "public"."delivery_order" rename column "delivery_driver_type" to "delivery_driver_app_type_id";

alter table "public"."delivery_order"
  add constraint "delivery_deliverer_id_fkey"
  foreign key ("delivery_driver_id")
  references "public"."delivery_driver"
  ("id") on update restrict on delete restrict;

alter table "public"."delivery_order" alter column "delivery_company_id" drop not null;
alter table "public"."delivery_order" add column "delivery_company_id" int4;

alter table "public"."delivery_order" alter column "delivery_company_type" drop not null;
alter table "public"."delivery_order" add column "delivery_company_type" text;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_operator" add column "delivery_driver_type" text
--  not null default 'restaurant_operator';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery_driver" add column "delivery_driver_type" text
--  not null default 'delivery_driver';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery_operator" add column "delivery_driver_type" text
--  not null default 'delivery_operator';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery_order" add column "delivery_company_id" integer
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery_order" add column "delivery_company_type" text
--  not null;

comment on column "public"."delivery_order"."delivery_driver_app_type_id" is E'restaurant, delivery';

alter table "public"."delivery_company" alter column "service_provider_type" set default 'delivery'::text;

comment on column "public"."delivery_order"."service_provider_type" is NULL;

alter table "public"."delivery_order" rename column "delivery_driver_app_type_id" to "deliverer_app_type_id";

alter table "public"."delivery_order" rename column "delivery_driver_id" to "deliverer_id";

alter table "public"."delivery_driver" rename to "deliverer";

DROP TABLE "public"."delivery_operator";

DROP TABLE "public"."delivery_company";
