
ALTER TABLE "public"."delivery_messages" ALTER COLUMN "responded_time" TYPE timestamp without time zone;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery_messages" add column "responded_time" Timestamp
--  null;

alter table "public"."delivery_messages" rename column "finished_time" to "resolved_time";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."details" add column "sitin_available" boolean
--  not null default 'true';
