
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "ends_at" timestamp with time zone
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "starts_at" timestamp with time zone
--  null;

alter table "business"."event" alter column "starts_at" drop not null;
alter table "business"."event" add column "starts_at" time;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "starts_at" time
--  null;

alter table "business"."event" alter column "time" drop not null;
alter table "business"."event" add column "time" timestamptz;
