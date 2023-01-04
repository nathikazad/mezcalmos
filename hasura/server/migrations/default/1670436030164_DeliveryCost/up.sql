
comment on column "public"."delivery_driver"."delivery_company_type" is E'restaurant,laundry,delivery_company';

CREATE TABLE "public"."delivery_cost" ("id" serial NOT NULL, "minimum_cost" money NOT NULL DEFAULT 0, "cost_per_km" money NOT NULL DEFAULT 0, "free_delivery_minimum_cost" money, "free_delivery_km_range" float8, "service_provider_id" integer NOT NULL, "service_provider_type" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("service_provider_id"), UNIQUE ("service_provider_type"));

ALTER TABLE "public"."delivery_cost" ALTER COLUMN "free_delivery_km_range" TYPE float4;

alter table "public"."delivery_cost" drop constraint "delivery_cost_service_provider_id_key";
alter table "public"."delivery_cost" add constraint "delivery_cost_service_provider_id_service_provider_type_key" unique ("service_provider_id", "service_provider_type");

alter table "public"."delivery_cost" drop constraint "delivery_cost_service_provider_type_key";
