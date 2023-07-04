
alter table "delivery"."order" add column "lock_time" timestamptz
 null;

alter table "delivery"."order" drop column "lock_time" cascade;

alter table "delivery"."order" add column "lock_timestamp" integer
 null;

alter table "delivery"."order" drop column "lock_timestamp" cascade;

alter table "delivery"."order" add column "lock_time" Timestamp
 null;
