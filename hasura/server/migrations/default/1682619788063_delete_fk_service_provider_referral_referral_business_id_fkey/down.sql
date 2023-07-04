alter table "service_provider"."referral"
  add constraint "referral_business_id_fkey"
  foreign key ("service_provider_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;
