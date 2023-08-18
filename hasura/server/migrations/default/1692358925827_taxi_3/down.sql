
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION taxi.finalcost(order_row taxi."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT order_row.cost - order_row.refund_amount + order_row.stripe_fees - order_row.discount_value
-- $function$;

alter table "taxi"."order" rename column "to_location_text" to "to_location_address";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "taxi"."taxi" add column "taxi_company_id" integer
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "taxi"."company" add column "cost_per_km" money
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "taxi"."company" add column "minimum_cost" money
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "taxi"."taxi" add column "cost_per_km" money
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "taxi"."taxi" add column "minimum_cost" money
--  null;

alter table "taxi"."company" alter column "cost_per_km" drop not null;
alter table "taxi"."company" add column "cost_per_km" money;

alter table "taxi"."company" alter column "minimum_cost" drop not null;
alter table "taxi"."company" add column "minimum_cost" money;

alter table "taxi"."order" alter column "counter_offers" drop not null;
ALTER TABLE "taxi"."order" ALTER COLUMN "counter_offers" drop default;

alter table "taxi"."order" alter column "chosen_companies" drop not null;
ALTER TABLE "taxi"."order" ALTER COLUMN "chosen_companies" drop default;

alter table "taxi"."order" alter column "notified_drivers" drop not null;
ALTER TABLE "taxi"."order" ALTER COLUMN "notified_drivers" drop default;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP table "taxi"."operator";
