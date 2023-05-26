
alter table "public"."mez_admin_chat" rename column "user_id" to "recipient_id";

alter table "public"."mez_admin_chat" rename column "app_type" to "recipient_type";

comment on column "public"."mez_admin_chat"."recipient_type" is E'customer/business/restaurant/laundry/deliveryCompany/deliveryDriver';

alter table "public"."mez_admin_chat" drop constraint "mez_admin_chat_app_type_fkey";

alter table "public"."mez_admin_chat" add constraint "mez_admin_chat_recipient_id_recipient_type_key" unique ("recipient_id", "recipient_type");
