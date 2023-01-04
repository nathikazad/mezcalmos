
CREATE TABLE "public"."saved_location" ("id" serial NOT NULL, "customer_id" integer NOT NULL, "location_gps" geography NOT NULL, "location_text" text NOT NULL, "name" text NOT NULL, "default" boolean NOT NULL DEFAULT false, PRIMARY KEY ("id") , FOREIGN KEY ("customer_id") REFERENCES "public"."customer"("user_id") ON UPDATE restrict ON DELETE restrict);COMMENT ON TABLE "public"."saved_location" IS E'Customer\'s saved locations';

alter table "public"."user" add column "email" text
 null;

alter table "public"."user" add column "phone" text
 null;
