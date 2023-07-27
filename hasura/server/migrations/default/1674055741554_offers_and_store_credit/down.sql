
alter table "service_provider"."offer_applied" drop constraint "offer_applied_pkey";
alter table "service_provider"."offer_applied"
    add constraint "offer_applied_pkey"
    primary key ("service_provider_type", "order_id", "offer_id");

alter table "service_provider"."offer_applied" drop constraint "offer_applied_pkey";
alter table "service_provider"."offer_applied"
    add constraint "offer_applied_pkey"
    primary key ("offer_id", "order_id");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."offer_applied" add column "service_provider_type" text
--  not null default 'restaurant';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."offer_applied" add column "loss" money
--  not null default '0';

DROP TABLE "service_provider"."offer_applied";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."offer" add column "status" text
--  not null default 'active';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.totalcost(order_row restaurant."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT order_row.delivery_cost + order_row.itemsCost - order_row.refund_amount + order_row.stripe_fees - order_row.discount_value
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."order" add column "discount_value" money
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."cart" add column "discount_value" money
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."offer" add column "service_provider_id" integer
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."offer" add column "service_provider_type" text
--  not null default 'restaurant';

comment on column "service_provider"."offer"."details" is NULL;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."offer" add column "details" jsonb
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."offer" add column "name_id" Integer
--  not null;

alter table "service_provider"."offer" alter column "details" drop not null;
alter table "service_provider"."offer" add column "details" jsonb;

comment on column "service_provider"."offer"."details" is NULL;

DROP TABLE "service_provider"."offer";

DROP TABLE "service_provider"."store_credit";
