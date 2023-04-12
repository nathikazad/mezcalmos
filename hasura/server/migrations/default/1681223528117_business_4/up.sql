

CREATE TABLE "business"."home_rental" ("id" serial NOT NULL, "rental_id" integer NOT NULL, "bedrooms" integer NOT NULL DEFAULT 1, "bathrooms" integer NOT NULL DEFAULT 1, "gps_location" geography NOT NULL, "homeType" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("rental_id") REFERENCES "business"."rental"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("rental_id"));

alter table "business"."event" add column "gps_location" geography
 null;

alter table "business"."class" add column "gps_location" geography
 null;

CREATE TABLE "business"."referral" ("customer_id" integer NOT NULL, "business_id" integer NOT NULL, PRIMARY KEY ("customer_id") );

alter table "business"."referral"
  add constraint "referral_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "business"."referral"
  add constraint "referral_customer_id_fkey"
  foreign key ("customer_id")
  references "customer"."customer"
  ("user_id") on update restrict on delete restrict;

alter table "business"."business" add column "points" integer
 not null default '0';

alter table "business"."event" add column "time" timestamptz
 null;

alter table "business"."class" add column "time" timestamptz
 null;

alter table "business"."service" add column "category2" text
 null;

BEGIN TRANSACTION;
ALTER TABLE "business"."home_rental" DROP CONSTRAINT "home_rental_pkey";

ALTER TABLE "business"."home_rental"
    ADD CONSTRAINT "home_rental_pkey" PRIMARY KEY ("rental_id");
COMMIT TRANSACTION;

alter table "business"."home_rental" drop column "id" cascade;
