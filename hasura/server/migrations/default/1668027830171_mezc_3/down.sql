
alter table "public"."restaurant_option" drop constraint "restaurant_option_name_id_fkey";

comment on column "public"."restaurant_item"."item_type" is NULL;
ALTER TABLE "public"."restaurant_item" ALTER COLUMN "item_type" drop default;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant" add column "language_id" text
--  not null default 'en';

alter table "public"."restaurant" alter column "language_id" drop not null;
alter table "public"."restaurant" add column "language_id" int4;
