
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.totalcost(order_row restaurant_order)
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT order_row.delivery_cost + order_row.itemsCost - order_row.refund_amount + order_row.stripe_fees
-- $function$
--
-- -- SELECT to_number((stripe_info #>> '{}')::json->'stripeFees') AS stripeFees FROM restaurant_order
-- -- WHERE id = 14;
--
-- -- SELECT (chat_info #>> '{}')::json->'CustomerApp'->>'chatTitle' AS CustomerApp FROM chat
-- -- WHERE id = 84;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "stripe_fees" money
--  not null default '0';

alter table "public"."restaurant_order" alter column "stripe_fees" set default 0;
alter table "public"."restaurant_order" alter column "stripe_fees" drop not null;
alter table "public"."restaurant_order" add column "stripe_fees" money;

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "stripe_fees" TYPE integer;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "stripe_fees" integer
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery_order" add column "schedule_time" text
--  null;

comment on column "public"."delivery_order"."direction" is NULL;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery_order" add column "direction" text
--  not null default 'to_customer';

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "stripe_info" TYPE json;

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "stripe_info" TYPE jsonb;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "stripe_info" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."customer" add column "stripe_info" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant" add column "accepted_payments" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant" add column "stripe_info" jsonb
--  null;
