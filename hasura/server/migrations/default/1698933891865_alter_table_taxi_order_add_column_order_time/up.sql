alter table "taxi"."order" add column "order_time" timestamp with time zone
 not null default now();
