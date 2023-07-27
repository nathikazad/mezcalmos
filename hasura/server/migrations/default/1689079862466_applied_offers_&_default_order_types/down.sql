
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."cart" add column "applied_offers" jsonb
--  not null default jsonb_build_array();


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request" add column "order_type" text
--  not null default 'business';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "order_type" text
--  not null default 'laundry';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."order" add column "order_type" text
--  not null default 'restaurant';

alter table "service_provider"."offer_applied" rename column "order_type" to "service_provider_type";
alter table "service_provider"."offer_applied" alter column "service_provider_type" set default 'restaurant'::text;

alter table "service_provider"."offer_applied" drop constraint "offer_applied_offer_id_fkey";
