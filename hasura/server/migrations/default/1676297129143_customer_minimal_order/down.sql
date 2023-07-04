
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."minimal_order" add column "payment_type" text
--  not null;

alter table "customer"."minimal_order" rename column "image" to "service_provider_image";

alter table "customer"."minimal_order" rename column "name" to "service_provider_name";

DROP TABLE "customer"."minimal_order";
