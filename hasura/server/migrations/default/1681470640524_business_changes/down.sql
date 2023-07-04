
DROP TABLE "business"."product";

alter table "business"."rental" rename column "details_id" to "service_id";

alter table "business"."event" rename column "details_id" to "service_id";

DROP TABLE "business"."service";

alter table "business"."home_rental" rename column "home_type" to "homeType";

alter table "business"."item_details" rename to "service";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."service" add column "tags" jsonb
--  null;


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
