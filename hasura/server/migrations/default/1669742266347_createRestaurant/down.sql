
alter table "public"."restaurant_operator" drop constraint "restaurant_operator_user_id_key";

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_restaurant_id_key";
alter table "public"."restaurant_operator" add constraint "restaurant_operator_restaurant_id_user_id_key" unique ("restaurant_id", "user_id");

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_restaurant_id_user_id_key";
alter table "public"."restaurant_operator" add constraint "restaurant_operator_restaurant_id_user_id_key" unique ("restaurant_id", "user_id");

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_restaurant_id_user_id_key";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant" add column "schedule" jsonb
--  null;

alter table "public"."restaurant" alter column "schedule_id" drop not null;
alter table "public"."restaurant" add column "schedule_id" int4;
