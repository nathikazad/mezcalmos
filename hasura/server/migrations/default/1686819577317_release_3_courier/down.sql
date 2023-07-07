
comment on column "delivery"."order"."chosen_companies" is NULL;

alter table "delivery"."order" alter column "chosen_companies" set not null;

alter table "delivery"."order" alter column "chosen_companies" drop not null;

comment on column "delivery"."order"."counter_offers" is NULL;

alter table "delivery"."order" rename column "notified_drivers" to "change_price_request";
comment on column "delivery"."order"."change_price_request" is E'{ status: {requested, accepted, rejected}, newPrice: number, oldPrice: number, reason: string}';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."order" add column "counter_offers" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."order" add column "customer_offer" money
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."order" add column "chosen_companies" jsonb
--  null;

alter table "delivery"."courier_order" alter column "chosen_companies" drop not null;
alter table "delivery"."courier_order" add column "chosen_companies" jsonb;

alter table "delivery"."courier_order" alter column "chosen_companies" drop not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "chosen_companies" jsonb
--  null;

alter table "delivery"."order" alter column "chosen_companies" drop not null;
alter table "delivery"."order" add column "chosen_companies" jsonb;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."order" add column "chosen_companies" jsonb
--  null;

alter table "delivery"."order" alter column "service_provider_id" set not null;
