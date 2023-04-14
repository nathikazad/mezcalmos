

alter table "business"."business" rename column "points" to "referral_points";

alter table "business"."business" alter column "profile" set default 'surfShop, vehicleRental, homeRental, wellnessClass, party, volunteer, tourAgency, therapy';

ALTER TABLE "business"."business" ALTER COLUMN "profile" drop default;
comment on column "business"."business"."profile" is E'surfShop, vehicleRental, homeRental, wellnessClass, party, volunteer, tourAgency, therapy';

alter table "business"."service" alter column "category2" set default 'uncategorized';
alter table "business"."service" alter column "category2" set not null;

DROP table "business"."class";

alter table "business"."rental" add column "category3" text
 not null default 'uncategorized';

alter table "business"."service" add column "tags" jsonb
 null;

alter table "business"."service" rename to "item_details";

alter table "business"."home_rental" rename column "homeType" to "home_type";

CREATE TABLE "business"."service" ("id" serial NOT NULL, "details_id" integer NOT NULL, "business_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("details_id") REFERENCES "business"."item_details"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("business_id") REFERENCES "business"."business"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("details_id"));

alter table "business"."event" rename column "service_id" to "details_id";

alter table "business"."rental" rename column "service_id" to "details_id";

CREATE TABLE "business"."product" ("id" serial NOT NULL, "business_id" integer NOT NULL, "details_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("details_id") REFERENCES "business"."item_details"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("business_id") REFERENCES "business"."business"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("details_id"));
