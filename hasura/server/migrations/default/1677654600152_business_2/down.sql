
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION business.finalOrderCost(order_request_row business.order_request)
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $$
--     SELECT SUM(quantity * final_cost_per_one)
--     FROM business.order_request_item i
--     WHERE i.order_request_id = order_request_row.id;
-- $$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION business.estOrderCost(order_request_row business.order_request)
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $$
--     SELECT SUM(quantity * business.estcostperone(i))
--     FROM business.order_request_item i
--     WHERE i.order_request_id = order_request_row.id;
-- $$;

alter table "business"."order_request" alter column "review_id" set not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION business.cartCost(cart_row business.cart)
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $$
--     SELECT SUM(quantity * cost_per_one)
--     FROM business.cart_item
--     WHERE customer_id = cart_row.customer_id;
-- $$;

DROP TABLE "business"."cart_item";

DROP TABLE "business"."cart";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION business.estCostPerOne(order_request_item_row business."order_request_item")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT
--         CASE
--             WHEN order_request_item_row.service_type = 'rental'
--             THEN (SELECT cost FROM business.rental WHERE id = order_request_item_row.service_id)
--             WHEN order_request_item_row.service_type = 'class'
--             THEN (SELECT cost FROM business.class WHERE id = order_request_item_row.service_id)
--             WHEN order_request_item_row.service_type = 'event'
--             THEN (SELECT cost FROM business.event WHERE id = order_request_item_row.service_id)
--         END
-- $function$;

alter table "business"."order_request_item" drop constraint "order_request_item_order_request_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request_item" add column "order_request_id" integer
--  not null;
