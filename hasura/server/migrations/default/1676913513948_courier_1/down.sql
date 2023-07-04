
DROP TABLE "delivery"."courier_order_item";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "notes" text
--  null;

alter table "delivery"."courier_order" drop constraint "courier_order_delivery_order_id_fkey";

alter table "delivery"."courier_order" drop constraint "courier_order_delivery_order_id_key";

DROP TABLE "delivery"."courier_order";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION delivery.baselocation(details_row delivery.details)
--  RETURNS geography
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT gps
--     FROM service_provider.location l
--     INNER JOIN service_provider.details d
--     ON d.location_id = l.id
--     WHERE d.id =
--         CASE
--             WHEN d.service_provider_type = 'restaurant'
--             THEN (SELECT details_id FROM restaurant.restaurant r WHERE r.delivery_details_id = details_row.id)
--             WHEN d.service_provider_type = 'laundry'
--             THEN (SELECT details_id FROM laundry.store s WHERE s.delivery_details_id = details_row.id)
--             WHEN d.service_provider_type = 'deliveryCompany'
--             THEN (SELECT details_id FROM delivery.company c WHERE c.delivery_details_id = details_row.id)
--         END
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION delivery.baselocation(details_row delivery.details)
--  RETURNS geography
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT gps
--     FROM service_provider.location l
--     INNER JOIN service_provider.details d
--     ON d.location_id = l.id
--     WHERE d.id =
--         CASE
--             WHEN d.service_provider_type = 'restaurant'
--             THEN (SELECT details_id FROM restaurant.restaurant r WHERE r.delivery_details_id = details_row.id)
--             WHEN d.service_provider_type = 'laundry'
--             THEN (SELECT details_id FROM laundry.store s WHERE s.delivery_details_id = details_row.id)
--             ELSE
--                 (SELECT details_id FROM delivery.company c WHERE c.delivery_details_id = details_row.id)
--         END
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION delivery.baseLocation(details_row delivery.details)
--  RETURNS geography
--  LANGUAGE sql
--  STABLE
-- AS $$
--     SELECT gps
--     FROM service_provider.location l
--     INNER JOIN service_provider.details d
--     ON d.location_id = l.id
--     FULL JOIN restaurant.restaurant r ON r.delivery_details_id = details_row.id
--     FULL JOIN laundry.store s ON s.delivery_details_id = details_row.id
--     FULL JOIN delivery.company c ON c.delivery_details_id = details_row.id
-- $$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION delivery.deliveryCostFromBase(order_row delivery."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT (d.cost_per_km_from_base * order_row.distance_from_base + order_row.delivery_cost)
--     FROM delivery.details d
--     INNER JOIN delivery.company c
--     ON d.id = c.delivery_details_id
--     WHERE c.id = order_row.service_provider_id
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."details" add column "cost_per_km_from_base" money
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."order" add column "distance_from_base" integer
--  null;
