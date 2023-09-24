
CREATE TABLE "service_provider"."influencer" ("id" serial NOT NULL, "tag" text NOT NULL, "user_id" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("tag"), UNIQUE ("user_id"));

CREATE TABLE "service_provider"."influencer_offer" ("id" serial NOT NULL, "user_id" integer NOT NULL, "offer_id" integer NOT NULL, PRIMARY KEY ("id") , UNIQUE ("id"));

alter table "service_provider"."influencer_offer" rename column "user_id" to "influencer_id";

alter table "service_provider"."offer" add column "influencer_detail" jsonb
 null;

comment on column "service_provider"."offer"."influencer_detail" is E'{  rewardType :  same as discountType  rewardValue : double  }';
alter table "service_provider"."offer" rename column "influencer_detail" to "influencer_details";
