
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "referral_points" integer
--  not null default '0';

alter table "business"."business" alter column "referral_points" set default 0;
alter table "business"."business" alter column "referral_points" drop not null;
alter table "business"."business" add column "referral_points" int4;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."referral" add column "service_provider_type" text
--  not null;

alter table "service_provider"."referral" rename column "service_provider_id" to "business_id";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE referral SET SCHEMA service_provider;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE business.referral SET SCHEMA public;
