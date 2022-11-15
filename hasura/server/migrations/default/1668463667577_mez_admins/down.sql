
DROP TABLE "public"."mez_admin";

alter table "public"."restaurant_cart" alter column "restaurant_id" set not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_cart_item" add column "note" text
--  null;

comment on column "public"."delivery"."status" is NULL;

alter table "public"."chat_participant" drop constraint "chat_participant_app_type_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."chat_participant" add column "app_type_id" text
--  not null;

alter table "public"."chat_participant"
  add constraint "chat_participant_notification_info_id_fkey"
  foreign key (app_type_id)
  references "public"."notification_info"
  (id) on update restrict on delete restrict;
alter table "public"."chat_participant" alter column "app_type_id" drop not null;
alter table "public"."chat_participant" add column "app_type_id" int4;

alter table "public"."chat_participant" rename column "app_type_id" to "notification_info_id";
