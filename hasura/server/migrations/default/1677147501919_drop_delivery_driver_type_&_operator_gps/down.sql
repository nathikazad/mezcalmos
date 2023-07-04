
alter table "service_provider"."operator_details" alter column "current_gps" drop not null;
alter table "service_provider"."operator_details" add column "current_gps" geography;

alter table "laundry"."operator" alter column "delivery_driver_type" set default ''laundry_operator'::text';
alter table "laundry"."operator" alter column "delivery_driver_type" drop not null;
alter table "laundry"."operator" add column "delivery_driver_type" text;

alter table "restaurant"."operator" alter column "delivery_driver_type" set default ''restaurant_operator'::text';
alter table "restaurant"."operator" alter column "delivery_driver_type" drop not null;
alter table "restaurant"."operator" add column "delivery_driver_type" text;

alter table "delivery"."operator" alter column "delivery_driver_type" set default ''delivery_operator'::text';
alter table "delivery"."operator" alter column "delivery_driver_type" drop not null;
alter table "delivery"."operator" add column "delivery_driver_type" text;

alter table "delivery"."driver" alter column "delivery_driver_type" set default ''delivery_driver'::text';
alter table "delivery"."driver" alter column "delivery_driver_type" drop not null;
alter table "delivery"."driver" add column "delivery_driver_type" text;
