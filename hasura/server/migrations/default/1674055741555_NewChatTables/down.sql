
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."chat" add column "chat_type" text
--  not null default 'group';

alter table "public"."direct_chat" rename column "user_id2" to "user_id_2";

alter table "public"."direct_chat" rename column "user_id1" to "user_id_1";

alter table "public"."chat_participant" drop constraint "chat_participant_app_type_id_fkey",
  add constraint "chat_participant_app_type_id_fkey"
  foreign key ("app_type_id")
  references "topology"."app_type"
  ("id") on update restrict on delete restrict;

DROP TABLE "public"."mez_admin_chat";

DROP TABLE "public"."direct_chat";

DROP TABLE "public"."service_provider_customer_chat";
