
ALTER TABLE "delivery"."details" ALTER COLUMN "radius" TYPE integer;
comment on column "delivery"."details"."radius" is E'in metres';

alter table "delivery"."details" alter column "radius" set default '0';

alter table "delivery"."details" add column "location" geography
 not null;

alter table "delivery"."company" drop column "location" cascade;

alter table "delivery"."company" drop column "delivery_radius" cascade;

alter table "delivery"."details" rename column "location" to "location_gps";

alter table "delivery"."details" add column "location_text" text
 null;

alter table "restaurant"."restaurant" drop column "location_gps" cascade;

alter table "restaurant"."restaurant" drop column "location_text" cascade;

CREATE FUNCTION public.restaurant_location_gps(restaurant_row restaurant.restaurant)
    RETURNS geography
    LANGUAGE sql 
    STABLE 
AS $$
    SELECT location_gps
    FROM delivery.details d
    WHERE d.service_provider_id = restaurant_row.id AND d.service_provider_type = 'restaurant';
$$;

CREATE FUNCTION public.restaurant_location_text(restaurant_row restaurant.restaurant)
    RETURNS varchar
    LANGUAGE sql 
    STABLE 
AS $$
    SELECT location_text
    FROM delivery.details d
    WHERE d.service_provider_id = restaurant_row.id AND d.service_provider_type = 'restaurant';
$$;

alter table "restaurant"."order" drop constraint "restaurant_order_restaurant_id_fkey",
  add constraint "order_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."operator" drop constraint "restaurant_operator_restaurant_id_fkey",
  add constraint "operator_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete cascade;
