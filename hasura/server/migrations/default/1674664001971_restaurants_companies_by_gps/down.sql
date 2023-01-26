
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION restaurant.get_restaurants(location geography)
--  RETURNS SETOF restaurant.restaurant
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM restaurant.restaurant r
--     WHERE ST_Distance(
--     (
--         SELECT gps
--         FROM service_provider.location l
--         WHERE l.service_provider_id = r.id
--         AND l.service_provider_type = 'restaurant'
--     ), location) <=
--     (
--         SELECT radius
--         FROM delivery.details d
--         WHERE d.service_provider_id = r.id
--         AND d.service_provider_type = 'restaurant'
--     )
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION delivery.get_delivery_companies(location geography)
--  RETURNS SETOF delivery.company
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM delivery.company c
--     WHERE ST_Distance(
--     (
--         SELECT gps
--         FROM service_provider.location l
--         WHERE l.service_provider_id = c.id
--         AND l.service_provider_type = 'delivery_company'
--     ), location) <=
--     (
--         SELECT radius
--         FROM delivery.details d
--         WHERE d.service_provider_id = c.id
--         AND d.service_provider_type = 'delivery_company'
--     )
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION delivery.fetch_delivery_company(location geography, radius double precision)
--  RETURNS SETOF delivery.company
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM delivery.company c
--     WHERE ST_Distance(
--     (
--         SELECT gps
--         FROM service_provider.location l
--         WHERE l.service_provider_id = c.id
--         AND l.service_provider_type = 'delivery_company'
--     ), location) <= radius
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION restaurant.fetch_restaurants(location geography, radius double precision)
--  RETURNS SETOF restaurant.restaurant
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM restaurant.restaurant r
--     WHERE ST_Distance((SELECT gps FROM restaurant.location(r)), location) <= radius
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION restaurant.fetch_restaurants(location geography, radius double precision)
--  RETURNS SETOF restaurant.restaurant
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM restaurant.restaurant r
--     WHERE ST_Distance((SELECT gps FROM restaurant.location(r)), location) <= radius
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION restaurant.location(restaurant_row restaurant.restaurant)
--  RETURNS service_provider.location
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM service_provider.location l
--     WHERE l.service_provider_id = restaurant_row.id
--     AND l.service_provider_type = 'restaurant'
-- $function$;

alter table "restaurant"."restaurant" alter column "delivery_details_id" set not null;


alter table "restaurant"."cart" drop constraint "cart_restaurant_id_fkey",
  add constraint "restaurant_cart_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."order_item" drop constraint "order_item_restaurant_item_id_fkey",
  add constraint "restaurant_order_item_restaurant_item_id_fkey"
  foreign key ("restaurant_item_id")
  references "restaurant"."item"
  ("id") on update restrict on delete restrict;
