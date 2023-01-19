alter table "public"."restaurant" add constraint "restaurant_payment_info_id_key" unique (payment_info_id);
alter table "public"."restaurant" alter column "payment_info_id" drop not null;
alter table "public"."restaurant" add column "payment_info_id" int4;
