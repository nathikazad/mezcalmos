
alter table "business"."order_request" alter column "final_cost" drop not null;
alter table "business"."order_request" add column "final_cost" money;

alter table "business"."order_request" alter column "estimated_cost" drop not null;
alter table "business"."order_request" add column "estimated_cost" money;

alter table "business"."order_request" alter column "commence_time" drop not null;
alter table "business"."order_request" add column "commence_time" timestamptz;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION business.ordercommencetime(order_row business.order_request)
--  RETURNS timestamp
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT MIN(time)
--     FROM business.order_request_item
--     WHERE order_request_id = order_row.id;
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION business.ordercommencetime(order_row business.order_request)
--  RETURNS timestamp
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT MIN(time)
--     FROM business.order_request_item
--     WHERE order_request_id = order_row.id;
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION business.ordercost(order_row business.order_request)
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT SUM(cost)
--     FROM business.order_request_item
--     WHERE order_request_id = order_row.id;
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION business.cartcost(cart_row business.cart)
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT SUM(cost)
--     FROM business.cart_item
--     WHERE customer_id = cart_row.customer_id;
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request_item" add column "cost" money
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request_item" add column "time" timestamptz
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."cart_item" add column "cost" money
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."cart_item" add column "time" Timestamp
--  null;

alter table "business"."order_request_item" rename column "item_id" to "item_details_id";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request_item" add column "offering_type" text
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."cart_item" add column "offering_type" text
--  not null;

alter table "business"."cart_item" rename column "item_id" to "item_details_id";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."service" add column "offering_type" text
--  not null default 'service';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."product" add column "offering_type" text
--  not null default 'product';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "offering_type" text
--  not null default 'event';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."rental" add column "offering_type" text
--  not null default 'rental';
