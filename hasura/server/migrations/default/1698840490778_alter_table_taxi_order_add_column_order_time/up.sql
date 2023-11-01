alter table "taxi"."order" add column "order_time" time
 not null default now();
