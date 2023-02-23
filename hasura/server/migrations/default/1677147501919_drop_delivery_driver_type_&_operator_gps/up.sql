
alter table "delivery"."driver" drop column "delivery_driver_type" cascade;

alter table "delivery"."operator" drop column "delivery_driver_type" cascade;

alter table "restaurant"."operator" drop column "delivery_driver_type" cascade;

alter table "laundry"."operator" drop column "delivery_driver_type" cascade;

alter table "service_provider"."operator_details" drop column "current_gps" cascade;
