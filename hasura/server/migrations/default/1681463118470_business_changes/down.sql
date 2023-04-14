
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."rental" add column "category3" text
--  not null default 'uncategorized';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP table "business"."class";

alter table "business"."service" alter column "category2" drop not null;
ALTER TABLE "business"."service" ALTER COLUMN "category2" drop default;

comment on column "business"."business"."profile" is NULL;
alter table "business"."business" alter column "profile" set default 'surfShop, vehicleRental, homeRental, wellnessClass, party, volunteer, tourAgency, therapy'::text;

ALTER TABLE "business"."business" ALTER COLUMN "profile" drop default;

alter table "business"."business" rename column "referral_points" to "points";
