
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."order" add column "lock_time" Timestamp
--  null;

alter table "delivery"."order" alter column "lock_timestamp" drop not null;
alter table "delivery"."order" add column "lock_timestamp" int4;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."order" add column "lock_timestamp" integer
--  null;

alter table "delivery"."order" alter column "lock_time" drop not null;
alter table "delivery"."order" add column "lock_time" timestamptz;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."order" add column "lock_time" timestamptz
--  null;
