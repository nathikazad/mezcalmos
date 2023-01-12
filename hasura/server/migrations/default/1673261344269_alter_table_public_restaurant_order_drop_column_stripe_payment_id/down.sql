alter table "public"."restaurant_order" alter column "stripe_payment_id" drop not null;
alter table "public"."restaurant_order" add column "stripe_payment_id" int4;
