
alter table "public"."delivery_operator" alter column "current_gps" set not null;

alter table "public"."delivery_operator" alter column "app_version" set not null;

alter table "public"."delivery_order" alter column "chat_with_customer_id" drop not null;

alter table "public"."restaurant_order" alter column "chat_id" set not null;

alter table "public"."user" add constraint "user_firebase_id_key" unique ("firebase_id");

alter table "public"."user" drop constraint "user_firebase_id_key";

alter table "public"."delivery_order" alter column "chat_with_customer_id" set not null;
