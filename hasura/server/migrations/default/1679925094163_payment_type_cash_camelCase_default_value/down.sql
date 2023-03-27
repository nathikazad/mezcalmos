
alter table "laundry"."order" alter column "payment_type" set default 'Cash'::text;

alter table "restaurant"."order" alter column "payment_type" set default 'Cash'::text;


alter table "delivery"."order" alter column "payment_type" set default 'Cash'::text;


alter table "delivery"."courier_order" alter column "payment_type" set default 'Cash'::text;
