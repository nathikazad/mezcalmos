alter table "taxi"."order" alter column "order_time" set default now();
alter table "taxi"."order" alter column "order_time" drop not null;
alter table "taxi"."order" add column "order_time" time;
