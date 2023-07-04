
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE restaurant.favourited_item SET SCHEMA customer;

alter table "restaurant"."favourited_item" drop constraint "favourited_item_restaurant_id_fkey";

alter table "restaurant"."favourited_item" drop constraint "favourited_item_restaurant_item_id_fkey";

alter table "restaurant"."favourited_item" drop constraint "favourited_item_customer_id_fkey";

DROP TABLE "restaurant"."favourited_item";

comment on column "service_provider"."post"."comments" is NULL;

comment on column "service_provider"."post"."likes" is NULL;

alter table "service_provider"."location" alter column "address" drop not null;

alter table "service_provider"."subscriber" drop constraint "subscriber_customer_id_fkey";
