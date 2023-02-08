
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION laundry.totalcost(order_row laundry."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT order_row.delivery_cost + laundry.itemsCost(order_row) - order_row.refund_amount + order_row.stripe_fees - order_row.discount_value
--
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION laundry.totalCost(order_row laundry."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT order_row.delivery_cost  - order_row.refund_amount + order_row.stripe_fees - order_row.discount_value
--
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION laundry.itemscost(order_row laundry."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT SUM(oc.weight_in_kilo * c.cost_by_kilo)
--     FROM laundry.order_category oc
--     INNER JOIN laundry.category c
--     ON oc.category_id = c.id
--     WHERE order_id = order_row.id;
-- $function$;

alter table "laundry"."store" alter column "description_id" set not null;

alter table "service_provider"."delivery_partner" drop constraint "delivery_partner_delivery_company_id_fkey";
