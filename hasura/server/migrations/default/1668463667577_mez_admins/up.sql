
alter table "public"."chat_participant" rename column "notification_info_id" to "app_type_id";

alter table "public"."chat_participant" drop column "app_type_id" cascade;

alter table "public"."chat_participant" add column "app_type_id" text
 not null;

alter table "public"."chat_participant"
  add constraint "chat_participant_app_type_id_fkey"
  foreign key ("app_type_id")
  references "topology"."app_type"
  ("id") on update restrict on delete restrict;

comment on column "public"."delivery"."status" is E'orderReceived';

alter table "public"."restaurant_cart_item" add column "note" text
 null;

alter table "public"."restaurant_cart" alter column "restaurant_id" drop not null;

CREATE TABLE "public"."mez_admin" ("user_id" Integer NOT NULL, "notification_info_id" integer, "version" text, PRIMARY KEY ("user_id") , FOREIGN KEY ("notification_info_id") REFERENCES "public"."notification_info"("id") ON UPDATE restrict ON DELETE restrict);