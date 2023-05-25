
alter table "public"."mez_admin_chat" drop constraint "mez_admin_chat_recipient_id_recipient_type_key";

alter table "public"."mez_admin_chat"
  add constraint "mez_admin_chat_app_type_fkey"
  foreign key ("recipient_type")
  references "valid_types"."app_type"
  ("id") on update restrict on delete restrict;

comment on column "public"."mez_admin_chat"."recipient_type" is NULL;

alter table "public"."mez_admin_chat" rename column "recipient_type" to "app_type";

alter table "public"."mez_admin_chat" rename column "recipient_id" to "user_id";
