
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION delivery.fetch_delivery_company(location geography(Point), radius double precision)
--     RETURNS SETOF delivery.company
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT *
--     FROM delivery.company c
--     WHERE ST_Distance(c.location, location) <= radius
-- $$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION restaurant.fetch_restaurants(location geography(Point), radius double precision)
--     RETURNS SETOF restaurant.restaurant
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT *
--     FROM restaurant.restaurant r
--     WHERE ST_Distance(r.location_gps, location) <= radius
-- $$;

alter table "restaurant"."order" rename column "delivery_type" to "order_type";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."company" add column "creation_time" timestamptz
--  not null default now();

alter table "delivery"."details" alter column "location" drop not null;
alter table "delivery"."details" add column "location" geography;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."user" add column "creation_time" timestamptz
--  not null default now();

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."restaurant" add column "creation_time" timestamptz
--  not null default now();

comment on column "restaurant"."restaurant"."customer_pickup" is NULL;

comment on column "restaurant"."restaurant"."delivery" is NULL;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."restaurant" add column "customer_pickup" boolean
--  not null default 'true';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."restaurant" add column "delivery" boolean
--  not null default 'true';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION public.restaurant_delivery_details(restaurant_row restaurant."restaurant")
--  RETURNS delivery.details
--  LANGUAGE sql
--  STABLE
-- AS $$
--     SELECT *
--     FROM delivery.details d
--     WHERE d.service_provider_id = (
-- 	    CASE
-- 		WHEN restaurant_row.self_delivery = true THEN restaurant_row.id
-- 		ELSE (
-- 			SELECT delivery_company_id
-- 			FROM service_provider.delivery_partner p
-- 			WHERE p.service_provider_id = restaurant_row.id AND p.service_provider_type = 'restaurant'
-- 		)
-- 	    END
--     )
--     AND d.service_provider_type = (
-- 	    CASE
-- 		WHEN restaurant_row.self_delivery = true THEN 'restaurant'
-- 		ELSE 'delivery_company'
-- 	    END
--     )
-- $$;

alter table "delivery"."details" rename to "cost";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."cost" add column "radius" integer
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."cost" add column "location" geography
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."company" add column "delivery_radius" integer
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."company" add column "location" geography
--  not null;

DROP TABLE "service_provider"."delivery_partner";
