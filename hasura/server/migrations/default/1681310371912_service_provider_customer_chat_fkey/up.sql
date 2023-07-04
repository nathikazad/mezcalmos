
alter table "public"."service_provider_customer_chat"
  add constraint "service_provider_customer_chat_chat_id_fkey"
  foreign key ("chat_id")
  references "public"."chat"
  ("id") on update restrict on delete restrict;

alter table "public"."service_provider_customer_chat"
  add constraint "service_provider_customer_chat_customer_id_fkey"
  foreign key ("customer_id")
  references "customer"."customer"
  ("user_id") on update restrict on delete restrict;
