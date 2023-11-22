alter table "service_provider"."influencer_offer"
  add constraint "influencer_offer_offer_id_fkey"
  foreign key ("offer_id")
  references "service_provider"."offer"
  ("id") on update restrict on delete cascade;
