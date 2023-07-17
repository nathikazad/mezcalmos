
alter table "taxi"."order" drop constraint "order_taxi_company_id_fkey";

alter table "taxi"."order" rename column "chat_id" to "chat_with_customer_id";

DROP TABLE "taxi"."order";

DELETE FROM "valid_types"."app_type" WHERE "id" = 'taxiAdmin';

DELETE FROM "valid_types"."app_type" WHERE "id" = 'taxi';

DROP TABLE "taxi"."driver";

DROP TABLE "taxi"."operator";

alter table "taxi"."company" drop constraint "company_service_provider_type_fkey";

DELETE FROM "valid_types"."service_provider_type" WHERE "id" = 'taxiCompany';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "taxi"."company" add column "cost_per_km" money
--  not null;

alter table "taxi"."company" rename column "minimum_cost" to "cost_id";
alter table "taxi"."company" add constraint "company_cost_id_key" unique ("cost_id");
ALTER TABLE "taxi"."company" ALTER COLUMN "cost_id" TYPE integer;

DROP TABLE "taxi"."company";

drop schema "taxi" cascade;
