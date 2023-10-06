
alter table "service_provider"."offer_applied" drop constraint "offer_applied_pkey";

alter table "service_provider"."offer_applied" alter column "order_id" drop not null;

alter table "service_provider"."offer_applied" add column "id" serial
 not null unique;

alter table "service_provider"."offer_applied"
    add constraint "offer_applied_pkey"
    primary key ("id");

alter table "service_provider"."offer_applied" add column "influencer_id" integer
 null;

alter table "service_provider"."offer_applied" add column "comission" money
 null;

alter table "service_provider"."offer_applied" add column "order_total" money
 null;
