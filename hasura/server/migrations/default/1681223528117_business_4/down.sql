
alter table "business"."home_rental" alter column "id" set default nextval('business.home_rental_id_seq'::regclass);
alter table "business"."home_rental" alter column "id" drop not null;
alter table "business"."home_rental" add column "id" int4;

alter table "business"."home_rental" drop constraint "home_rental_pkey";
alter table "business"."home_rental"
    add constraint "home_rental_pkey"
    primary key ("id");


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."service" add column "category2" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."class" add column "time" timestamptz
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "time" timestamptz
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."business" add column "points" integer
--  not null default '0';

alter table "business"."referral" drop constraint "referral_customer_id_fkey";

alter table "business"."referral" drop constraint "referral_business_id_fkey";

DROP TABLE "business"."referral";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."class" add column "gps_location" geography
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "gps_location" geography
--  null;

DROP TABLE "business"."home_rental";
