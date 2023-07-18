
alter table "restaurant"."cart" add column "applied_offers" jsonb
 not null default jsonb_build_array();

ALTER TABLE "service_provider"."offer" ALTER COLUMN "service_provider_type" drop default;

alter table "service_provider"."offer"
  add constraint "offer_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;
