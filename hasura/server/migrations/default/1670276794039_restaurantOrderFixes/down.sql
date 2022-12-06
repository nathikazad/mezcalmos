
alter table "public"."restaurant_order" drop constraint "restaurant_order_customer_id_fkey",
  add constraint "restaurant_order_customer_id_fkey"
  foreign key ("customer_id")
  references "public"."customer"
  ("user_id") on update restrict on delete restrict;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "refund_amount" money
--  not null default '0';

alter table "public"."restaurant_order" alter column "refund_amount" set default 0;
alter table "public"."restaurant_order" alter column "refund_amount" drop not null;
alter table "public"."restaurant_order" add column "refund_amount" int4;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "tax" money
--  not null default '0';

alter table "public"."restaurant_order" alter column "tax" set default '0'::double precision;
alter table "public"."restaurant_order" alter column "tax" drop not null;
alter table "public"."restaurant_order" add column "tax" float8;
