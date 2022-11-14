
comment on column "public"."restaurant_order"."status" is NULL;

alter table "public"."restaurant_cart" drop constraint "restaurant_cart_restaurant_id_fkey";

alter table "public"."restaurant" alter column "open_status" set default 'awaiting_verification'::text;

alter table "public"."restaurant" alter column "approved" drop not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant" add column "approved" boolean
--  null default 'false';

alter table "public"."restaurant" rename column "open_status" to "status";
comment on column "public"."restaurant"."status" is E'awaiting_verification, open, closed_temporarily, closed_indefinitely';
