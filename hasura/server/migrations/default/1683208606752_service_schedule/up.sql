
alter table "business"."service" add column "schedule" jsonb
 null;

alter table "business"."item_details" add column "business_id" integer
 not null;

alter table "business"."item_details"
  add constraint "item_details_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;
