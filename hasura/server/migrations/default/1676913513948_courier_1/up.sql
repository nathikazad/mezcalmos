
alter table "delivery"."order" add column "distance_from_base" integer
 null;

alter table "delivery"."details" add column "cost_per_km_from_base" money
 null;

CREATE FUNCTION delivery.deliveryCostFromBase(order_row delivery."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT (d.cost_per_km_from_base * order_row.distance_from_base + order_row.delivery_cost)
    FROM delivery.details d
    INNER JOIN delivery.company c
    ON d.id = c.delivery_details_id
    WHERE c.id = order_row.service_provider_id
$function$;

CREATE FUNCTION delivery.baseLocation(details_row delivery.details)
 RETURNS geography
 LANGUAGE sql
 STABLE
AS $$
    SELECT gps
    FROM service_provider.location l
    INNER JOIN service_provider.details d
    ON d.location_id = l.id
    FULL JOIN restaurant.restaurant r ON r.delivery_details_id = details_row.id
    FULL JOIN laundry.store s ON s.delivery_details_id = details_row.id
    FULL JOIN delivery.company c ON c.delivery_details_id = details_row.id
$$;

CREATE OR REPLACE FUNCTION delivery.baselocation(details_row delivery.details)
 RETURNS geography
 LANGUAGE sql
 STABLE
AS $function$
    SELECT gps
    FROM service_provider.location l
    INNER JOIN service_provider.details d
    ON d.location_id = l.id
    WHERE d.id = 
        CASE 
            WHEN d.service_provider_type = 'restaurant'
            THEN (SELECT details_id FROM restaurant.restaurant r WHERE r.delivery_details_id = details_row.id)
            WHEN d.service_provider_type = 'laundry'
            THEN (SELECT details_id FROM laundry.store s WHERE s.delivery_details_id = details_row.id)
            ELSE
                (SELECT details_id FROM delivery.company c WHERE c.delivery_details_id = details_row.id)
        END
$function$;

CREATE OR REPLACE FUNCTION delivery.baselocation(details_row delivery.details)
 RETURNS geography
 LANGUAGE sql
 STABLE
AS $function$
    SELECT gps
    FROM service_provider.location l
    INNER JOIN service_provider.details d
    ON d.location_id = l.id
    WHERE d.id = 
        CASE 
            WHEN d.service_provider_type = 'restaurant'
            THEN (SELECT details_id FROM restaurant.restaurant r WHERE r.delivery_details_id = details_row.id)
            WHEN d.service_provider_type = 'laundry'
            THEN (SELECT details_id FROM laundry.store s WHERE s.delivery_details_id = details_row.id)
            WHEN d.service_provider_type = 'deliveryCompany'
            THEN (SELECT details_id FROM delivery.company c WHERE c.delivery_details_id = details_row.id)
        END
$function$;

CREATE TABLE "delivery"."courier_order" ("id" serial NOT NULL, "from_location_gps" geography, "from_location_adress" text, "to_location_gps" geography NOT NULL, "to_location_adress" text NOT NULL, "delivery_order_id" integer NOT NULL, PRIMARY KEY ("id") );

alter table "delivery"."courier_order" add constraint "courier_order_delivery_order_id_key" unique ("delivery_order_id");

alter table "delivery"."courier_order"
  add constraint "courier_order_delivery_order_id_fkey"
  foreign key ("delivery_order_id")
  references "delivery"."order"
  ("id") on update restrict on delete cascade;

alter table "delivery"."courier_order" add column "notes" text
 null;

CREATE TABLE "delivery"."courier_order_item" ("id" serial NOT NULL, "name" text NOT NULL, "image" text, "estimated_cost_per_one" money, "actual_cost_per_one" money, "order_id" integer NOT NULL, "quantity" integer NOT NULL DEFAULT 1, "unavailable" boolean NOT NULL DEFAULT false, PRIMARY KEY ("id") );
