
alter table "service_provider"."offer" rename column "influencer_details" to "influencer_detail";
comment on column "service_provider"."offer"."influencer_detail" is NULL;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."offer" add column "influencer_detail" jsonb
--  null;

alter table "service_provider"."influencer_offer" rename column "influencer_id" to "user_id";

DROP TABLE "service_provider"."influencer_offer";

DROP TABLE "service_provider"."influencer";
