
alter table "delivery"."order" alter column "service_provider_type" drop not null;

alter table "delivery"."order" alter column "service_provider_id" drop not null;
