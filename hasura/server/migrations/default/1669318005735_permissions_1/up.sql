
alter table "public"."restaurant" add column "service_provider_type" text
 not null default 'restaurant';

comment on column "public"."delivery"."deliverer_app_type_id" is E'restaurant_operator, deliverer';

comment on column "topology"."app_type"."id" is E'customer, delivery, restaurant, admin';

comment on column "public"."delivery"."deliverer_app_type_id" is E'restaurant, delivery';

alter table "public"."deliverer" add column "online" boolean
 not null default 'false';

alter table "public"."deliverer" add column "notification_id" integer
 null;

alter table "public"."deliverer"
  add constraint "deliverer_notification_id_fkey"
  foreign key ("notification_id")
  references "public"."notification_info"
  ("id") on update restrict on delete restrict;

alter table "public"."deliverer" rename column "notification_id" to "notification_info_id";

alter table "public"."notification_info" add constraint "notification_info_app_type_id_user_id_key" unique ("app_type_id", "user_id");

alter table "public"."deliverer" add constraint "deliverer_user_id_delivery_company_type_delivery_company_id_key" unique ("user_id", "delivery_company_type", "delivery_company_id");


alter table "public"."restaurant_choice" add column "restaurant_id" integer
 not null;

alter table "public"."restaurant_choice"
  add constraint "restaurant_choice_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "public"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_option" add column "restaurant_id" integer
 not null;

alter table "public"."restaurant_option"
  add constraint "restaurant_option_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "public"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant" add column "self_delivery" boolean
 not null default 'false';

alter table "public"."restaurant_item"
  add constraint "restaurant_item_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "public"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_item_option_map" add column "restaurant_id" integer
 not null;

alter table "public"."restaurant_item_option_map"
  add constraint "restaurant_item_option_map_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "public"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_operator" alter column "status" set default 'awaiting_approval';

alter table "public"."restaurant_option_choice_map" add column "restaurant_id" integer
 not null;

alter table "public"."restaurant_option_choice_map"
  add constraint "restaurant_option_choice_map_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "public"."restaurant"
  ("id") on update restrict on delete restrict;

CREATE VIEW restaurant_order_public AS
  SELECT id AS restaurant_id, review_id
    FROM restaurant_order;

alter table "public"."translation_value" drop constraint "translation_value_translation_id_fkey",
  add constraint "translation_value_translation_id_fkey"
  foreign key ("translation_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "public"."translation" drop column "shared" cascade;

alter table "public"."translation" add column "service_provider_id" integer
 not null;

alter table "public"."translation" add column "service_provider_type" text
 not null;

CREATE
OR REPLACE VIEW "public"."restaurant_order_public" AS
SELECT
  restaurant_order.id AS restaurant_id,
  restaurant_order.review_id,
  restaurant_order.order_time,
  restaurant_order.estimated_food_ready_time,
  restaurant_order.actual_food_ready_time,
  restaurant_order.customer_id,
  restaurant_order.status
FROM
  restaurant_order;

alter table "public"."delivery" rename to "delivery_order";

alter table "public"."restaurant_order" add column "cancellation_time" timestamptz
 null;

CREATE
OR REPLACE VIEW "public"."delivery_order_public" AS
SELECT
  delivery_order.id AS 
  deliverer_id,
  delivery_order.deliverer_app_type_id,
  delivery_order.order_time,
  delivery_order.estimated_package_ready_time,
  delivery_order.actual_package_ready_time,
  delivery_order.estimated_arrival_at_pickup_time,
  delivery_order.actual_arrival_at_pickup_time,
  delivery_order.estimated_arrival_at_dropoff_time,
  delivery_order.actual_arrival_at_dropoff_time,
  delivery_order.actual_delivered_time,
  delivery_order.status,
  delivery_order.driver_review_by_service_provider_id,
  delivery_order.driver_review_by_customer_id,
  delivery_order.service_provider_review_by_driver_id,
  delivery_order.customer_review_by_driver_id,
  delivery_order.customer_id,
  delivery_order.service_provider_id,
  delivery_order.service_provider_type,
  delivery_order.trip_distance,
  delivery_order.trip_duration
FROM
  delivery_order;
