alter table "laundry"."operator" drop constraint "operator_details_id_fkey",
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete restrict;
