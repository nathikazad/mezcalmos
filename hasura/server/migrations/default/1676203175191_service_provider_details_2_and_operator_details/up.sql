
alter table "service_provider"."details" add column "service_link_id" integer
 null;

alter table "service_provider"."details"
  add constraint "details_service_link_id_fkey"
  foreign key ("service_link_id")
  references "service_provider"."service_link"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."details" add constraint "details_service_link_id_key" unique ("service_link_id");

alter table "service_provider"."service_link" drop column "service_provider_id" cascade;

alter table "service_provider"."service_link" drop column "service_provider_type" cascade;

alter table "service_provider"."details" drop column "stripe_info" cascade;

alter table "service_provider"."delivery_partner" drop column "service_provider_type" cascade;

alter table "service_provider"."delivery_partner"
  add constraint "delivery_partner_service_provider_id_fkey"
  foreign key ("service_provider_id")
  references "service_provider"."details"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."operator_details" drop column "delivery_driver_type" cascade;

alter table "service_provider"."details" alter column "delivery_details_id" set not null;

alter table "restaurant"."operator" drop constraint "operator_details_id_fkey",
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."operator" drop constraint "operator_details_id_fkey",
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update cascade on delete cascade;

alter table "delivery"."operator" drop constraint "operator_details_id_fkey",
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete cascade;

alter table "service_provider"."stripe_info" alter column "details_submitted" set default 'false';

alter table "service_provider"."stripe_info" alter column "payouts_enabled" set default 'false';

alter table "service_provider"."stripe_info" alter column "charges_enabled" set default 'false';
