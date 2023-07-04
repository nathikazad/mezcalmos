
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "service_provider_type" text
--  not null default 'laundry';

alter table "laundry"."order_category" alter column "weight_in_kilo" set not null;
