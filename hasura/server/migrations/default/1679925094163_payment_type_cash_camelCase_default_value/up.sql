

alter table "delivery"."courier_order" alter column "payment_type" set default 'cash'::text;


alter table "delivery"."order" alter column "payment_type" set default 'cash'::text;

alter table "restaurant"."order" alter column "payment_type" set default 'cash'::text;

alter table "laundry"."order" alter column "payment_type" set default 'cash'::text;
