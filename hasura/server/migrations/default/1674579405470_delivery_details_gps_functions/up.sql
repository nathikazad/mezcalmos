
CREATE TABLE "service_provider"."delivery_partner" ("id" serial NOT NULL, "delivery_company_id" integer NOT NULL, "service_provider_id" integer NOT NULL, "service_provider_type" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("service_provider_id", "service_provider_type"));

alter table "delivery"."company" add column "location" geography
 not null;

alter table "delivery"."company" add column "delivery_radius" integer
 not null;

alter table "delivery"."cost" add column "location" geography
 not null;

alter table "delivery"."cost" add column "radius" integer
 not null;

alter table "delivery"."cost" rename to "details";

CREATE FUNCTION public.restaurant_delivery_details(restaurant_row restaurant."restaurant")
 RETURNS delivery.details
 LANGUAGE sql
 STABLE
AS $$
    SELECT *
    FROM delivery.details d
    WHERE d.service_provider_id = (
	    CASE
		WHEN restaurant_row.self_delivery = true THEN restaurant_row.id
		ELSE (
			SELECT delivery_company_id 
			FROM service_provider.delivery_partner p 
			WHERE p.service_provider_id = restaurant_row.id AND p.service_provider_type = 'restaurant'
		)
	    END
    )
    AND d.service_provider_type = (
	    CASE
		WHEN restaurant_row.self_delivery = true THEN 'restaurant'
		ELSE 'delivery_company'
	    END
    )
$$;

alter table "restaurant"."restaurant" add column "delivery" boolean
 not null default 'true';

alter table "restaurant"."restaurant" add column "customer_pickup" boolean
 not null default 'true';

comment on column "restaurant"."restaurant"."delivery" is E'delivery on or off';

comment on column "restaurant"."restaurant"."customer_pickup" is E'pickup on or off';

alter table "restaurant"."restaurant" add column "creation_time" timestamptz
 not null default now();

alter table "public"."user" add column "creation_time" timestamptz
 not null default now();

alter table "delivery"."details" drop column "location" cascade;

alter table "delivery"."company" add column "creation_time" timestamptz
 not null default now();

alter table "restaurant"."order" rename column "order_type" to "delivery_type";

CREATE FUNCTION restaurant.fetch_restaurants(location geography(Point), radius double precision)
    RETURNS SETOF restaurant.restaurant 
    LANGUAGE sql 
    STABLE 
AS $$
    SELECT *
    FROM restaurant.restaurant r
    WHERE ST_Distance(r.location_gps, location) <= radius
$$;

CREATE FUNCTION delivery.fetch_delivery_company(location geography(Point), radius double precision)
    RETURNS SETOF delivery.company 
    LANGUAGE sql 
    STABLE 
AS $$
    SELECT *
    FROM delivery.company c
    WHERE ST_Distance(c.location, location) <= radius
$$;
