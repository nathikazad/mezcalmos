
alter table "business"."home_location" add column "business_id" integer
 not null;

alter table "business"."home_location"
  add constraint "home_location_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete cascade;
