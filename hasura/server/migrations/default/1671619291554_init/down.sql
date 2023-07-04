

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_user_id_key";
alter table "public"."restaurant_operator" add constraint "restaurant_operator_restaurant_id_user_id_key" unique ("restaurant_id", "user_id");

alter table "public"."delivery_operator" drop constraint "delivery_operator_user_id_key";

alter table "public"."delivery_driver" drop constraint "delivery_driver_user_id_key";
alter table "public"."delivery_driver" add constraint "delivery_driver_delivery_company_type_delivery_company_id_user_id_key" unique ("delivery_company_type", "delivery_company_id", "user_id");


ALTER TABLE "public"."restaurant" ALTER COLUMN "schedule" drop default;

alter table "public"."restaurant_option_choice_map" drop constraint "restaurant_option_choice_map_choice_id_fkey";

alter table "public"."restaurant_option_choice_map" drop constraint "restaurant_option_choice_map_option_id_fkey",
  add constraint "restaurant_option_choice_map_option_id_fkey"
  foreign key ("option_id")
  references "public"."restaurant_option"
  ("id") on update restrict on delete cascade;

alter table "public"."restaurant_item" drop constraint "restaurant_item_category_id_fkey",
  add constraint "restaurant_item_category_id_fkey"
  foreign key ("category_id")
  references "public"."restaurant_category"
  ("id") on update restrict on delete cascade;

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_restaurant_id_fkey",
  add constraint "restaurant_item_option_map_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "public"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_item_id_fkey",
  add constraint "restaurant_item_option_map_item_id_fkey"
  foreign key ("item_id")
  references "public"."restaurant_item"
  ("id") on update restrict on delete cascade;

alter table "public"."restaurant_cart_item" drop constraint "restaurant_cart_item_restaurant_item_id_fkey",
  add constraint "restaurant_cart_restaurant_item_id_fkey"
  foreign key ("restaurant_item_id")
  references "public"."restaurant_item"
  ("id") on update restrict on delete restrict;


alter table "public"."delivery_operator" alter column "current_gps" set not null;

alter table "public"."delivery_operator" alter column "app_version" set not null;

alter table "public"."delivery_order" alter column "chat_with_customer_id" drop not null;

alter table "public"."restaurant_order" alter column "chat_id" set not null;

alter table "public"."user" add constraint "user_firebase_id_key" unique ("firebase_id");

alter table "public"."user" drop constraint "user_firebase_id_key";

alter table "public"."delivery_order" alter column "chat_with_customer_id" set not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "scheduled_time" timestamptz
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_item" add column "image" text
--  null;

alter table "public"."restaurant_cart_item" drop constraint "restaurant_cart_item_customer_id_restaurant_item_id_key";

alter table "public"."customer" alter column "app_version" set not null;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."service_link" add column "customer_deep_link" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."service_link" add column "customer_qr_image_link" text
--  null;


alter table "public"."delivery_order"
  add constraint "delivery_deliverer_app_type_id_fkey"
  foreign key ("delivery_driver_type")
  references "public"."app_type"
  ("id") on update restrict on delete restrict;

comment on column "public"."delivery_driver"."delivery_driver_type" is NULL;

CREATE  INDEX "delivery_company_index" on
  "public"."delivery_driver" using btree ("delivery_company_id", "delivery_company_type");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION deliOp_notification_token(delivery_operator_row delivery_operator)
--     RETURNS varchar
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT token
--     FROM notification_info n
--     WHERE n.user_id = delivery_operator_row.user_id
--     AND n.app_type_id = 'delivery_admin';
-- $$;

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_user_id_restaurant_id_key";
alter table "public"."restaurant_operator" add constraint "restaurant_operator_user_id_key" unique ("user_id");

alter table "public"."restaurant_operator" add constraint "restaurant_operator_restaurant_id_key" unique ("restaurant_id");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."user" add column "big_image" text
--  null;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."review" add column "created_at" timestamptz
--  not null default now();

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."customer" add column "service_provider_type" text
--  null default 'customer';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.in_process(order_row restaurant_order)
--  RETURNS boolean
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT order_row.status = 'orderReceived' OR order_row.status = 'preparing' OR order_row.status = 'ready' OR order_row.status = 'onTheWay'
-- $function$;


alter table "public"."delivery_cost" add constraint "delivery_cost_service_provider_type_key" unique ("service_provider_type");

alter table "public"."delivery_cost" drop constraint "delivery_cost_service_provider_id_service_provider_type_key";
alter table "public"."delivery_cost" add constraint "delivery_cost_service_provider_id_key" unique ("service_provider_id");

ALTER TABLE "public"."delivery_cost" ALTER COLUMN "free_delivery_km_range" TYPE double precision;

DROP TABLE "public"."delivery_cost";

comment on column "public"."delivery_driver"."delivery_company_type" is NULL;

ALTER TABLE "public"."chat" ALTER COLUMN "chat_info" drop default;



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

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION driver_notification_token(deliverer_row deliverer)
--     RETURNS varchar
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT token
--     FROM notification_info n
--     WHERE n.user_id = deliverer_row.user_id
--     AND n.app_type_id = 'delivery';
-- $$;


alter table "public"."restaurant_operator" drop constraint "restaurant_operator_user_id_key";

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_restaurant_id_key";
alter table "public"."restaurant_operator" add constraint "restaurant_operator_restaurant_id_user_id_key" unique ("restaurant_id", "user_id");

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_restaurant_id_user_id_key";
alter table "public"."restaurant_operator" add constraint "restaurant_operator_restaurant_id_user_id_key" unique ("restaurant_id", "user_id");

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_restaurant_id_user_id_key";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant" add column "schedule" jsonb
--  null;

alter table "public"."restaurant" alter column "schedule_id" drop not null;
alter table "public"."restaurant" add column "schedule_id" int4;



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

comment on column "public"."app_type"."id" is NULL;

comment on column "public"."delivery"."deliverer_app_type_id" is NULL;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant" add column "service_provider_type" text
--  not null default 'restaurant';




alter table "public"."restaurant_operator"
  add constraint "restaurant_operator_notification_info_id_fkey"
  foreign key (notification_info_id)
  references "public"."notification_info"
  (id) on update restrict on delete restrict;
alter table "public"."restaurant_operator" alter column "notification_info_id" drop not null;
alter table "public"."restaurant_operator" add column "notification_info_id" int4;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION delivery_notification_token(delivery_row delivery)
--     RETURNS varchar
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT token
--     FROM notification_info n
--     WHERE n.user_id = (
--     CASE
--         WHEN delivery_row.deliverer_app_type_id = 'restaurant' THEN (SELECT user_id FROM restaurant_operator r WHERE r.id = delivery_row.deliverer_id)
--         ELSE (SELECT user_id FROM deliverer WHERE deliverer.id = delivery_row.deliverer_id)
--     END
--     )
--     AND n.app_type_id = delivery_row.deliverer_app_type_id;
-- $$;
-- -- DROP FUNCTION cost;

alter table "public"."mez_admin"
  add constraint "mez_admin_notification_info_id_fkey"
  foreign key (notification_info_id)
  references "public"."notification_info"
  (id) on update restrict on delete restrict;
alter table "public"."mez_admin" alter column "notification_info_id" drop not null;
alter table "public"."mez_admin" add column "notification_info_id" int4;

alter table "public"."customer" alter column "notification_info_id" drop not null;
alter table "public"."customer" add column "notification_info_id" int4;

alter table "public"."notification_info" drop constraint "notification_info_user_id_app_type_id_key";

alter table "public"."notification_info" drop constraint "notification_info_app_type_id_fkey",
  add constraint "notification_info_app_type_id_fkey"
  foreign key ("app_type_id")
  references "public"."app_type"
  ("id") on update restrict on delete restrict;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION special_items(restaurant_row restaurant)
--     RETURNS SETOF restaurant_item
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT *
--     FROM restaurant_item r
--     WHERE r.restaurant_id = restaurant_row.id AND r.item_type = 'special';
-- $$;


alter table "public"."restaurant_option_choice_map" drop constraint "restaurant_option_choice_map_option_id_fkey",
  add constraint "restaurant_option_choice_map_option_id_fkey"
  foreign key ("option_id")
  references "public"."restaurant_option"
  ("id") on update restrict on delete cascade;

alter table "public"."restaurant_option_choice_map" drop constraint "restaurant_option_choice_map_option_id_fkey",
  add constraint "restaurant_option_choice_map_option_id_fkey"
  foreign key ("option_id")
  references "public"."restaurant_option"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_item_id_fkey",
  add constraint "restaurant_item_option_map_item_id_fkey"
  foreign key ("item_id")
  references "public"."restaurant_item"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_item" drop constraint "restaurant_item_category_id_fkey",
  add constraint "restaurant_item_category_id_fkey"
  foreign key ("category_id")
  references "public"."restaurant_category"
  ("id") on update restrict on delete restrict;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."chat" add column "creation_time" timestamptz
--  not null default now();

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "cancellation_time" timestamptz
--  null;

comment on column "public"."delivery"."status" is E'orderReceived';

comment on column "public"."restaurant_cart_item"."selected_options" is NULL;


alter table "public"."delivery" drop constraint "delivery_chat_with_service_provider_id_fkey",
  add constraint "delivery_chat_with_service_provider_id_fkey"
  foreign key ("chat_with_service_provider_id")
  references "public"."chat"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_order_item" drop constraint "restaurant_order_item_restaurant_order_id_fkey",
  add constraint "restaurant_order_item_restaurant_order_id_fkey"
  foreign key ("restaurant_order_id")
  references "public"."restaurant_order"
  ("id") on update restrict on delete restrict;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "order_time" timestamptz
--  not null default now();

alter table "public"."restaurant_order" alter column "review_id" set default '0';

alter table "public"."chat_participant" drop constraint "chat_participant_pkey";
alter table "public"."chat_participant"
    add constraint "chat_participants_pkey"
    primary key ("participant_id", "chat_id");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."chat_participant" add column "id" serial
--  not null;

alter table "public"."chat" alter column "chat_info" set not null;

alter table "public"."delivery" alter column "deliverer_id" set not null;

alter table "public"."delivery" alter column "deliverer_app_type_id" set not null;

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "order_time" drop default;
ALTER TABLE "public"."restaurant_order" ALTER COLUMN "order_time" TYPE timestamp without time zone;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION totalCost(order_row restaurant_order)
--     RETURNS money
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT order_row.delivery_cost + order_row.itemsCost
-- $$;
-- -- DROP FUNCTION cost;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION itemsCost(order_row restaurant_order)
--     RETURNS money
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT SUM(quantity * cost_per_one)
--     FROM restaurant_order_item
--     WHERE restaurant_order_id = order_row.id;
-- $$;
--
-- -- CREATE FUNCTION totalCost(order_row restaurant_order)
-- --     RETURNS money
-- --     LANGUAGE sql
-- --     STABLE
-- -- AS $$
-- --     SELECT order_row.delivery_cost + order_row.itemsCost
-- -- $$;
-- -- DROP FUNCTION cost;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION cost(cart_row restaurant_cart)
--     RETURNS money
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT SUM(quantity * cost_per_one)
--     FROM restaurant_cart_item
--     WHERE customer_id = cart_row.customer_id;
-- $$;
--
-- -- CREATE FUNCTION totalCost(order_row restaurant_order)
-- --     RETURNS money
-- --     LANGUAGE sql
-- --     STABLE
-- -- AS $$
-- --     SELECT order_row.delivery_cost + order_row.itemsCost
-- -- $$;
-- -- DROP FUNCTION cost;

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "order_time" TYPE timestamp with time zone;


comment on column "public"."delivery"."trip_distance" is NULL;

comment on column "public"."delivery"."trip_duration" is NULL;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "trip_duration" integer
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "trip_distance" integer
--  null;

alter table "public"."delivery" alter column "trip_duration" drop not null;
alter table "public"."delivery" add column "trip_duration" text;

alter table "public"."delivery" alter column "trip_distance" drop not null;
alter table "public"."delivery" add column "trip_distance" text;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."user" add column "phone" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."user" add column "email" text
--  null;

DROP TABLE "public"."saved_location";


DROP TABLE "public"."mez_admin";

alter table "public"."restaurant_cart" alter column "restaurant_id" set not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_cart_item" add column "note" text
--  null;

comment on column "public"."delivery"."status" is NULL;

alter table "public"."chat_participant" drop constraint "chat_participant_app_type_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."chat_participant" add column "app_type_id" text
--  not null;

alter table "public"."chat_participant"
  add constraint "chat_participant_notification_info_id_fkey"
  foreign key (app_type_id)
  references "public"."notification_info"
  (id) on update restrict on delete restrict;
alter table "public"."chat_participant" alter column "app_type_id" drop not null;
alter table "public"."chat_participant" add column "app_type_id" int4;

alter table "public"."chat_participant" rename column "app_type_id" to "notification_info_id";

comment on column "public"."restaurant_order"."status" is NULL;

alter table "public"."restaurant_cart" drop constraint "restaurant_cart_restaurant_id_fkey";

alter table "public"."restaurant" alter column "open_status" set default 'awaiting_verification'::text;

alter table "public"."restaurant" alter column "approved" drop not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant" add column "approved" boolean
--  null default 'false';

alter table "public"."restaurant" rename column "open_status" to "status";
comment on column "public"."restaurant"."status" is E'awaiting_verification, open, closed_temporarily, closed_indefinitely';

alter table "public"."restaurant_choice" alter column "id" set default nextval('restaurant_choice_id_seq'::regclass);

alter table "public"."restaurant_option" alter column "id" set default nextval('restaurant_option_id_seq'::regclass);

alter table "public"."restaurant_item_option_map" alter column "option_id" set default nextval('restaurant_option_id_seq'::regclass);

alter table "public"."restaurant_item_option_map" alter column "option_id" set default nextval('restaurant_item_option_map_option_id_seq'::regclass);

ALTER TABLE "public"."restaurant_item_option_map" ALTER COLUMN "option_id" drop default;

alter table "public"."restaurant_item_option_map" alter column "option_id" set default nextval('restaurant_item_option_map_option_id_seq'::regclass);

alter table "public"."restaurant_option_choice_map" drop constraint "restaurant_option_choice_map_option_id_choice_id_key";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_option_choice_map" add column "choice_id" serial
--  not null;

alter table "public"."restaurant_option_choice_map" add constraint "restaurant_option_choice_map_option_id_choice_id_key" unique (option_id, choice_id);
alter table "public"."restaurant_option_choice_map"
  add constraint "restaurant_option_choice_map_choice_id_fkey"
  foreign key (choice_id)
  references "public"."restaurant_choice"
  (id) on update restrict on delete restrict;
alter table "public"."restaurant_option_choice_map" alter column "choice_id" drop not null;
alter table "public"."restaurant_option_choice_map" add column "choice_id" int4;

alter table "public"."restaurant_option_choice_map" drop constraint "restaurant_option_choice_map_pkey";
alter table "public"."restaurant_option_choice_map"
    add constraint "restaurant_option_choice_map_pkey"
    primary key ("choice_id", "option_id");

alter table "public"."restaurant_option_choice_map" drop constraint "restaurant_option_choice_map_option_id_choice_id_key";


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_option_choice_map" add column "id" serial
--  not null;

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_item_id_option_id_key";

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_pkey";
alter table "public"."restaurant_item_option_map"
    add constraint "restaurant_item_option_map_pkey"
    primary key ("option_id", "item_id");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_item_option_map" add column "id" serial
--  not null;

alter table "public"."restaurant_item_option_map"
  add constraint "restaurant_item_option_map_option_id_fkey"
  foreign key ("option_id")
  references "public"."restaurant_option"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_option_id_fkey";

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_pkey";
alter table "public"."restaurant_item_option_map"
    add constraint "restaurant_item_option_map_pkey"
    primary key ("item_id");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_item_option_map" add column "option_id" serial
--  not null;

alter table "public"."restaurant_item_option_map" alter column "option_id" drop not null;
alter table "public"."restaurant_item_option_map" add column "option_id" int4;

alter table "public"."restaurant_item_option_map"
  add constraint "restaurant_item_option_map_option_id_fkey"
  foreign key ("option_id")
  references "public"."restaurant_option"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_pkey";
alter table "public"."restaurant_item_option_map"
    add constraint "restaurant_item_option_map_pkey"
    primary key ("option_id", "item_id");


alter table "public"."restaurant_option" drop constraint "restaurant_option_name_id_fkey";

comment on column "public"."restaurant_item"."item_type" is NULL;
ALTER TABLE "public"."restaurant_item" ALTER COLUMN "item_type" drop default;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant" add column "language_id" text
--  not null default 'en';

alter table "public"."restaurant" alter column "language_id" drop not null;
alter table "public"."restaurant" add column "language_id" int4;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_operator" add column "current_gps" geography
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."deliverer" add column "current_location" geography
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "current_gps" geography
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order_item" add column "cost_per_one" money
--  not null default '0';

comment on column "public"."restaurant_order_item"."cost_per_one" is E'in_json:[name(en,es), selected_options]';
alter table "public"."restaurant_order_item" alter column "cost_per_one" set default 0;
alter table "public"."restaurant_order_item" alter column "cost_per_one" drop not null;
alter table "public"."restaurant_order_item" add column "cost_per_one" float8;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "delivery_cost" money
--  not null default '0';

alter table "public"."restaurant_order" alter column "delivery_cost" set default '0'::double precision;
alter table "public"."restaurant_order" alter column "delivery_cost" drop not null;
alter table "public"."restaurant_order" add column "delivery_cost" float8;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_option" add column "cost_per_extra" money
--  not null default '0';

alter table "public"."restaurant_option" alter column "cost_per_extra" set default 0;
alter table "public"."restaurant_option" alter column "cost_per_extra" drop not null;
alter table "public"."restaurant_option" add column "cost_per_extra" float8;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_item" add column "cost" money
--  not null;

alter table "public"."restaurant_item" alter column "cost" set default 0;
alter table "public"."restaurant_item" alter column "cost" drop not null;
alter table "public"."restaurant_item" add column "cost" float8;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_choice" add column "cost" money
--  not null default '0';

alter table "public"."restaurant_choice" alter column "cost" drop not null;
alter table "public"."restaurant_choice" add column "cost" float8;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_cart_item" add column "cost_per_one" money
--  not null;

alter table "public"."restaurant_cart_item" alter column "cost_per_one" drop not null;
alter table "public"."restaurant_cart_item" add column "cost_per_one" float8;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "package_cost" money
--  not null default '0';

alter table "public"."delivery" alter column "package_cost" drop not null;
alter table "public"."delivery" add column "package_cost" float8;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "delivery_cost" money
--  not null default '0';

alter table "public"."delivery" alter column "delivery_cost" set default 0;
alter table "public"."delivery" alter column "delivery_cost" drop not null;
alter table "public"."delivery" add column "delivery_cost" float8;

DROP INDEX IF EXISTS "public"."user_firebase_id";

DROP INDEX IF EXISTS "public"."restaurant_order_item_order_id";

DROP INDEX IF EXISTS "public"."restaurant_order_restaurant_id_index";

DROP INDEX IF EXISTS "public"."restaurant_order_customer_id";

alter table "public"."restaurant_order" drop constraint "restaurant_order_customer_id_fkey";

comment on column "public"."restaurant_operator"."status" is NULL;

DROP INDEX IF EXISTS "public"."restaurant_operator_restaurant_id";

DROP INDEX IF EXISTS "public"."restaurant_operator_user_id";

DROP INDEX IF EXISTS "public"."restaurant_item_category_id";

DROP INDEX IF EXISTS "public"."restaurant_category_restaurant_id";

alter table "public"."restaurant_cart" drop constraint "restaurant_cart_customer_id_fkey";

DROP INDEX IF EXISTS "public"."restaurant_cart_customer_id";

alter table "public"."restaurant_cart_item" drop constraint "restaurant_cart_item_customer_id_fkey";

alter table "public"."restaurant_cart_item" rename column "customer_id" to "cart_id";

CREATE  INDEX "restaurant_cart_customer_id_key" on
  "public"."restaurant_cart" using btree ("customer_id");

alter table "public"."restaurant_cart" add constraint "restaurant_cart_customer_id_key" unique ("customer_id");

alter table "public"."restaurant_cart_item"
  add constraint "restaurant_cart_customer_id_fkey"
  foreign key ("cart_id")
  references "public"."customer"
  ("user_id") on update restrict on delete restrict;

CREATE  INDEX "restaurant_customer_index" on
  "public"."restaurant_cart" using btree ("customer_id");

alter table "public"."restaurant_cart" drop constraint "restaurant_cart_pkey";
alter table "public"."restaurant_cart"
    add constraint "restaurant_cart_pkey1"
    primary key ("restaurant_id", "customer_id");

alter table "public"."restaurant_cart" drop constraint "restaurant_cart_customer_id_key";

alter table "public"."restaurant_cart_item" rename column "cart_id" to "customer_id";

DROP INDEX IF EXISTS "public"."restaurant_customer_index";

DROP TABLE "public"."restaurant_cart";

alter table "public"."restaurant_cart_item" add constraint "restaurant_cart_item_customer_id_key" unique ("customer_id");

alter table "public"."restaurant_cart_item" rename to "restaurant_cart";

alter table "public"."restaurant_cart" drop constraint "restaurant_cart_customer_id_key";

alter table "public"."restaurant_cart" drop constraint "restaurant_cart_customer_id_fkey";

alter table "public"."restaurant_cart" rename column "customer_id" to "user_id";

DROP INDEX IF EXISTS "public"."restaurant_gps_index";

CREATE  INDEX "notification_info_app_type" on
  "public"."notification_info" using btree ("app_type_id", "user_id");

DROP INDEX IF EXISTS "public"."notification_info_app_type";

alter table "public"."delivery" drop constraint "delivery_deliverer_app_type_id_fkey";

alter table "public"."delivery" rename column "deliverer_app_type_id" to "deliverer_app_type";

DROP INDEX IF EXISTS "public"."service_provider_index";

DROP INDEX IF EXISTS "public"."status_index";

DROP INDEX IF EXISTS "public"."deliverer_id_index";

DROP INDEX IF EXISTS "public"."customer_id_index";

alter table "public"."customer" drop constraint "customer_user_id_fkey";

alter table "public"."customer" alter column "id" set default nextval('customer_id_seq'::regclass);
alter table "public"."customer" alter column "id" drop not null;
alter table "public"."customer" add column "id" int4;

alter table "public"."customer" drop constraint "customer_pkey";
alter table "public"."customer"
    add constraint "customer_pkey"
    primary key ("id");

alter table "public"."delivery" drop constraint "delivery_customer_id_fkey",
  add constraint "delivery_customer_id_fkey"
  foreign key ("customer_id")
  references "public"."customer"
  ("id") on update restrict on delete restrict;

alter table "public"."customer"
  add constraint "customer_user_id_fkey"
  foreign key ("user_id")
  references "public"."user"
  ("id") on update restrict on delete restrict;

alter table "public"."customer"
  add constraint "customer_notification_info_id_fkey"
  foreign key ("notification_info_id")
  references "public"."notification_info"
  ("id") on update restrict on delete restrict;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "trip_polyline" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "trip_duration" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "trip_distance" text
--  null;

alter table "public"."restaurant_order" drop constraint "restaurant_order_delivery_id_key";

alter table "public"."delivery" drop constraint "delivery_customer_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "service_provider_type" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "service_provider_id" integer
--  null;

alter table "public"."delivery" alter column "chat_with_service_provider_id" set not null;

comment on column "public"."deliverer"."status" is NULL;

alter table "public"."customer" drop constraint "customer_user_id_key";

DROP TABLE "public"."customer";

alter table "public"."restaurant" rename column "status" to "open_status";

alter table "public"."restaurant" rename column "open_status" to "closed_temporarily";
comment on column "public"."restaurant"."closed_temporarily" is NULL;
alter table "public"."restaurant" alter column "closed_temporarily" set default 'false';
ALTER TABLE "public"."restaurant" ALTER COLUMN "closed_temporarily" TYPE boolean;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant" add column "closed_temporarily" boolean
--  not null default 'false';

alter table "public"."deliverer" rename column "app_version" to "version_number";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."deliverer" add column "version_number" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_operator" add column "app_version" text
--  null;


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

DROP TABLE "public"."app_type";

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

DROP TABLE "public"."language";

DROP TABLE "public"."restaurant";

DROP TABLE "public"."restaurant_order";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP table "public"."order";

DROP TABLE "public"."order";
