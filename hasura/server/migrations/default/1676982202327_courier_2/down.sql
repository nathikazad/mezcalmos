
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "cancellation_time" timestamptz
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "refund_amount" money
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "customer_app_type" text
--  not null default 'native';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "discount_value" money
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "stripe_fees" money
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "tax" money
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "payment_type" text
--  not null default 'Cash';

comment on column "delivery"."courier_order"."stripe_info" is NULL;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "stripe_info" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "order_time" timestamptz
--  not null default now();

alter table "delivery"."courier_order" drop constraint "courier_order_customer_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "customer_id" integer
--  not null;

alter table "delivery"."courier_order_item" drop constraint "courier_order_item_order_id_fkey";

alter table "delivery"."order" alter column "pickup_address" set not null;

alter table "delivery"."order" alter column "pickup_gps" set not null;

alter table "delivery"."courier_order" rename column "from_location_text" to "from_location_adress";

alter table "delivery"."courier_order_item" rename column "actual_cost" to "actual_cost_per_one";

alter table "delivery"."courier_order_item" rename column "estimated_cost" to "estimated_cost_per_one";

alter table "delivery"."courier_order_item" alter column "quantity" set default 1;
alter table "delivery"."courier_order_item" alter column "quantity" drop not null;
alter table "delivery"."courier_order_item" add column "quantity" int4;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order_item" add column "notes" text
--  null;

alter table "delivery"."courier_order" alter column "notes" drop not null;
alter table "delivery"."courier_order" add column "notes" text;
