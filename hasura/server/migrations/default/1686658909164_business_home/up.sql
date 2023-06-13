

alter table "business"."home_rental" drop constraint "home_rental_rental_id_fkey";

alter table "business"."home_rental" rename column "rental_id" to "id";

DROP FUNCTION "business"."get_home_rentals"("public"."geography");

alter table "business"."home_rental" rename to "home";

alter table "business"."home" add column "business_id" integer
 not null;

BEGIN TRANSACTION;
ALTER TABLE "business"."home" DROP CONSTRAINT "home_rental_pkey";

ALTER TABLE "business"."home"
    ADD CONSTRAINT "home_rental_pkey" PRIMARY KEY ("business_id");
COMMIT TRANSACTION;

alter table "business"."home" drop column "id" cascade;

alter table "business"."home" add column "id" serial
 not null;

BEGIN TRANSACTION;
ALTER TABLE "business"."home" DROP CONSTRAINT "home_rental_pkey";

ALTER TABLE "business"."home"
    ADD CONSTRAINT "home_rental_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;

DROP table "business"."home";

CREATE TABLE "business"."home" ("id" serial NOT NULL, "details_id" integer NOT NULL, "business_id" integer NOT NULL, "available_for" text NOT NULL, "location_id" integer NOT NULL, PRIMARY KEY ("id") );

CREATE TABLE "business"."home_location" ("id" serial NOT NULL, "name" text NOT NULL, "gps" geography NOT NULL, "address" text NOT NULL, PRIMARY KEY ("id") );

alter table "business"."home"
  add constraint "home_details_id_fkey"
  foreign key ("details_id")
  references "business"."item_details"
  ("id") on update restrict on delete restrict;

alter table "business"."home" drop constraint "home_details_id_fkey",
  add constraint "home_details_id_fkey"
  foreign key ("details_id")
  references "business"."item_details"
  ("id") on update cascade on delete cascade;

alter table "business"."home" drop constraint "home_details_id_fkey",
  add constraint "home_details_id_fkey"
  foreign key ("details_id")
  references "business"."item_details"
  ("id") on update restrict on delete cascade;

alter table "business"."home"
  add constraint "home_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete cascade;

alter table "business"."home"
  add constraint "home_location_id_fkey"
  foreign key ("location_id")
  references "business"."home_location"
  ("id") on update restrict on delete cascade;

alter table "business"."home" add column "bedrooms" integer
 not null default '1';

alter table "business"."home" add column "bathrooms" integer
 not null default '1';

alter table "business"."home" add column "offering_type" text
 not null default 'home';
