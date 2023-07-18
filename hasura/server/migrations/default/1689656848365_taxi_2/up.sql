
alter table "taxi"."company" drop constraint "company_details_id_fkey";

alter table "taxi"."company" rename column "details_id" to "business_id";

alter table "taxi"."company"
  add constraint "company_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "taxi"."company" add column "maximum_delivery_distance" integer
 not null;

CREATE TABLE "taxi"."taxi" ("car_number" text NOT NULL, "car_name" text NOT NULL, PRIMARY KEY ("car_number") );

alter table "taxi"."taxi" add column "taxi_id" serial
 not null;

BEGIN TRANSACTION;
ALTER TABLE "taxi"."taxi" DROP CONSTRAINT "taxi_pkey";

ALTER TABLE "taxi"."taxi"
    ADD CONSTRAINT "taxi_pkey" PRIMARY KEY ("taxi_id");
COMMIT TRANSACTION;

alter table "taxi"."taxi" add constraint "taxi_car_number_key" unique ("car_number");

alter table "taxi"."driver" add column "taxi_id" integer
 not null;

alter table "taxi"."driver"
  add constraint "driver_taxi_id_fkey"
  foreign key ("taxi_id")
  references "taxi"."taxi"
  ("taxi_id") on update restrict on delete restrict;

alter table "taxi"."taxi" rename column "taxi_id" to "id";
