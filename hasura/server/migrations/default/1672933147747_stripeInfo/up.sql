

alter table "public"."restaurant" add column "stripe_info" jsonb
 null;

alter table "public"."restaurant" add column "accepted_payments" jsonb
 null;

alter table "public"."customer" add column "stripe_info" jsonb
 null;

alter table "public"."restaurant_order" add column "stripe_info" jsonb
 null;

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "stripe_info" TYPE json;

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "stripe_info" TYPE jsonb;

alter table "public"."delivery_order" add column "direction" text
 not null default 'to_customer';

comment on column "public"."delivery_order"."direction" is E'to_customer, from_customer';

alter table "public"."delivery_order" add column "schedule_time" text
 null;

alter table "public"."restaurant_order" add column "stripe_fees" integer
 not null default '0';

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "stripe_fees" TYPE money;

alter table "public"."restaurant_order" drop column "stripe_fees" cascade;

alter table "public"."restaurant_order" add column "stripe_fees" money
 not null default '0';

CREATE OR REPLACE FUNCTION public.totalcost(order_row restaurant_order)
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.delivery_cost + order_row.itemsCost - order_row.refund_amount + order_row.stripe_fees
$function$

-- SELECT to_number((stripe_info #>> '{}')::json->'stripeFees') AS stripeFees FROM restaurant_order
-- WHERE id = 14;

-- SELECT (chat_info #>> '{}')::json->'CustomerApp'->>'chatTitle' AS CustomerApp FROM chat
-- WHERE id = 84;
