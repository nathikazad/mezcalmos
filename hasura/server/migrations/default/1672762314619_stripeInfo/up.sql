
alter table "public"."restaurant" add column "stripe_info" jsonb
 null;

alter table "public"."restaurant" add column "accepted_payments" jsonb
 null;

alter table "public"."customer" add column "stripe_info" jsonb
 null;

alter table "public"."restaurant_order" add column "stripe_info" jsonb
 null;
