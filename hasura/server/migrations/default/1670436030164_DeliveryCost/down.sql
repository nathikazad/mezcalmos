
alter table "public"."delivery_cost" add constraint "delivery_cost_service_provider_type_key" unique ("service_provider_type");

alter table "public"."delivery_cost" drop constraint "delivery_cost_service_provider_id_service_provider_type_key";
alter table "public"."delivery_cost" add constraint "delivery_cost_service_provider_id_key" unique ("service_provider_id");

ALTER TABLE "public"."delivery_cost" ALTER COLUMN "free_delivery_km_range" TYPE double precision;

DROP TABLE "public"."delivery_cost";

comment on column "public"."delivery_driver"."delivery_company_type" is NULL;
