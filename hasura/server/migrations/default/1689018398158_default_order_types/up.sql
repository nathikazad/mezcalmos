
alter table "service_provider"."offer_applied"
  add constraint "offer_applied_offer_id_fkey"
  foreign key ("offer_id")
  references "service_provider"."offer"
  ("id") on update restrict on delete restrict;

ALTER TABLE "service_provider"."offer_applied" ALTER COLUMN "service_provider_type" drop default;
alter table "service_provider"."offer_applied" rename column "service_provider_type" to "order_type";

alter table "restaurant"."order" add column "order_type" text
 not null default 'restaurant';

alter table "laundry"."order" add column "order_type" text
 not null default 'laundry';

alter table "business"."order_request" add column "order_type" text
 not null default 'business';
