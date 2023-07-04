
alter table "service_provider"."details" drop column "delivery_details_id" cascade;

alter table "restaurant"."restaurant" add column "delivery_details_id" integer
 not null unique;

alter table "restaurant"."restaurant"
  add constraint "restaurant_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update restrict on delete restrict;

alter table "laundry"."store" add column "delivery_details_id" integer
 not null unique;

alter table "laundry"."store"
  add constraint "store_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update restrict on delete restrict;

alter table "delivery"."company" add column "delivery_details_id" integer
 not null unique;

alter table "delivery"."company"
  add constraint "company_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."delivery_partner" add column "service_provider_type" text
 not null;
