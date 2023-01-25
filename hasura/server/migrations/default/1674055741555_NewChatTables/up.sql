
CREATE TABLE "public"."service_provider_customer_chat" ("chat_id" integer NOT NULL, "customer_id" integer NOT NULL, "service_provider_id" integer NOT NULL, "service_provider_type" text NOT NULL DEFAULT 'restaurant', PRIMARY KEY ("chat_id") , UNIQUE ("customer_id", "service_provider_id", "service_provider_type"));

CREATE TABLE "public"."direct_chat" ("chat_id" integer NOT NULL, "user_id_1" integer NOT NULL, "user_id_2" integer NOT NULL, PRIMARY KEY ("chat_id") , UNIQUE ("user_id_1", "user_id_2"));

CREATE TABLE "public"."mez_admin_chat" ("user_id" integer NOT NULL, "app_type" text NOT NULL, "chat_id" integer NOT NULL, PRIMARY KEY ("chat_id") );

alter table "public"."chat_participant" drop constraint "chat_participant_app_type_id_fkey",
  add constraint "chat_participant_app_type_id_fkey"
  foreign key ("app_type_id")
  references "public"."app_type"
  ("id") on update cascade on delete restrict;

alter table "public"."direct_chat" rename column "user_id_1" to "user_id1";

alter table "public"."direct_chat" rename column "user_id_2" to "user_id2";

alter table "public"."chat" add column "chat_type" text
 not null default 'group';
