
alter table "business"."service"
  add constraint "service_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "business"."service"
  add constraint "service_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;
