
ALTER TABLE business.referral SET SCHEMA public;

ALTER TABLE referral SET SCHEMA service_provider;

alter table "service_provider"."referral" rename column "business_id" to "service_provider_id";

alter table "service_provider"."referral" add column "service_provider_type" text
 not null;

alter table "business"."business" drop column "referral_points" cascade;

alter table "service_provider"."details" add column "referral_points" integer
 not null default '0';
