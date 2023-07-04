alter table "service_provider"."delivery_partner"
  add constraint "delivery_partner_service_provider_id_fkey"
  foreign key ("service_provider_id")
  references "service_provider"."details"
  ("id") on update restrict on delete restrict;
