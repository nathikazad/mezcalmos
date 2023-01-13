alter table "public"."delivery_order" alter column "stripe_payment_id" drop not null;
alter table "public"."delivery_order" add column "stripe_payment_id" int4;
