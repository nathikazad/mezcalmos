
alter table "restaurant"."operator" drop constraint "operator_restaurant_id_fkey",
  add constraint "restaurant_operator_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."order" drop constraint "order_restaurant_id_fkey",
  add constraint "restaurant_order_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete restrict;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION public.restaurant_location_text(restaurant_row restaurant.restaurant)
--     RETURNS varchar
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT location_text
--     FROM delivery.details d
--     WHERE d.service_provider_id = restaurant_row.id AND d.service_provider_type = 'restaurant';
-- $$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION public.restaurant_location_gps(restaurant_row restaurant.restaurant)
--     RETURNS geography
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT location_gps
--     FROM delivery.details d
--     WHERE d.service_provider_id = restaurant_row.id AND d.service_provider_type = 'restaurant';
-- $$;

alter table "restaurant"."restaurant" alter column "location_text" drop not null;
alter table "restaurant"."restaurant" add column "location_text" text;

alter table "restaurant"."restaurant" alter column "location_gps" drop not null;
alter table "restaurant"."restaurant" add column "location_gps" geography;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."details" add column "location_text" text
--  null;

alter table "delivery"."details" rename column "location_gps" to "location";

alter table "delivery"."company" alter column "delivery_radius" drop not null;
alter table "delivery"."company" add column "delivery_radius" int4;

alter table "delivery"."company" alter column "location" drop not null;
alter table "delivery"."company" add column "location" geography;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."details" add column "location" geography
--  not null;

ALTER TABLE "delivery"."details" ALTER COLUMN "radius" drop default;

comment on column "delivery"."details"."radius" is NULL;
ALTER TABLE "delivery"."details" ALTER COLUMN "radius" TYPE integer;
