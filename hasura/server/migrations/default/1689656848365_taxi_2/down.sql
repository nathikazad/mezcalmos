
alter table "taxi"."taxi" rename column "id" to "taxi_id";

alter table "taxi"."driver" drop constraint "driver_taxi_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "taxi"."driver" add column "taxi_id" integer
--  not null;

alter table "taxi"."taxi" drop constraint "taxi_car_number_key";

alter table "taxi"."taxi" drop constraint "taxi_pkey";
alter table "taxi"."taxi"
    add constraint "taxi_pkey"
    primary key ("car_number");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "taxi"."taxi" add column "taxi_id" serial
--  not null;

DROP TABLE "taxi"."taxi";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "taxi"."company" add column "maximum_delivery_distance" integer
--  not null;

alter table "taxi"."company" drop constraint "company_business_id_fkey";

alter table "taxi"."company" rename column "business_id" to "details_id";

alter table "taxi"."company"
  add constraint "company_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."details"
  ("id") on update restrict on delete restrict;
