
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION customer.minimal_orders(customer_id integer)
--  RETURNS SETOF customer.minimal_order
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     WITH
--     ro AS (
--         SELECT
--             id,
--             'restaurant' AS order_type,
--             status,
--             public.in_process(r) as in_process,
--             order_time,
--             public.totalcost(r) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             payment_type,
--             to_location_address as to_address,
--             delivery_cost
--         FROM restaurant.order r),
--     lo AS (
--         SELECT
--             id,
--             'laundry' AS order_type,
--             status,
--             laundry.order_in_process(l) as in_process,
--             order_time,
--             COALESCE(laundry.totalcost(l), '0'::money) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             payment_type,
--             customer_address as to_address,
--             delivery_cost
--         FROM  laundry.order l)
--     SELECT * from ro UNION select * from lo
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."minimal_order" add column "delivery_cost" money
--  not null default '0';

alter table "customer"."minimal_order" alter column "delivery_cost" drop not null;
alter table "customer"."minimal_order" add column "delivery_cost" money;

alter table "customer"."minimal_order" rename column "to_address" to "address";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."minimal_order" add column "address" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."minimal_order" add column "delivery_cost" money
--  null;
