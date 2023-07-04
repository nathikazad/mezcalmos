
alter table "laundry"."store" add column "normal_delivery_time" integer
 not null default '1';

comment on column "laundry"."store"."normal_delivery_time" is E'in days';
