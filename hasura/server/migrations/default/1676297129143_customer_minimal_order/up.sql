
CREATE TABLE "customer"."minimal_order" ("id" integer NOT NULL, "order_type" text NOT NULL, "status" text NOT NULL, "in_process" boolean NOT NULL, "order_time" timestamptz NOT NULL, "total_cost" money NOT NULL, "service_provider_name" text NOT NULL, "service_provider_image" text NOT NULL, PRIMARY KEY ("id","order_type") );

alter table "customer"."minimal_order" rename column "service_provider_name" to "name";

alter table "customer"."minimal_order" rename column "service_provider_image" to "image";

alter table "customer"."minimal_order" add column "payment_type" text
 not null;
