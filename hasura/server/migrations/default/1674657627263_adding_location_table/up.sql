
alter table "delivery"."company" add column "delivery_details_id" integer
 not null;

alter table "delivery"."company"
  add constraint "company_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update cascade on delete cascade;

alter table "restaurant"."restaurant" add column "delivery_details_id" integer
 not null;

alter table "restaurant"."restaurant"
  add constraint "restaurant_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update cascade on delete cascade;

CREATE TABLE "public"."location" ("id" serial NOT NULL, "gps" geography NOT NULL, "address" text, "service_provider_id" integer NOT NULL, "service_provider_type" text NOT NULL, PRIMARY KEY ("id") );

ALTER table "location" set schema service_provider;

alter table "delivery"."details" drop column "location_text" cascade;

alter table "delivery"."details" drop column "location_gps" cascade;
