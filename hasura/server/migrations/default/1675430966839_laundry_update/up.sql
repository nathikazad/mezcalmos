
alter table "laundry"."order_category" alter column "weight_in_kilo" drop not null;

alter table "laundry"."store" add column "service_provider_type" text
 not null default 'laundry';
