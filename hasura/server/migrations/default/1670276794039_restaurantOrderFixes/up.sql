
alter table "public"."restaurant_order" drop column "tax" cascade;

alter table "public"."restaurant_order" add column "tax" money
 not null default '0';

alter table "public"."restaurant_order" drop column "refund_amount" cascade;

alter table "public"."restaurant_order" add column "refund_amount" money
 not null default '0';

alter table "public"."restaurant_order" drop constraint "restaurant_order_customer_id_fkey",
  add constraint "restaurant_order_customer_id_fkey"
  foreign key ("customer_id")
  references "public"."customer"
  ("user_id") on update restrict on delete restrict;
