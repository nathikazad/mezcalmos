
alter table "public"."chat" alter column "last_message_sent" drop not null;
ALTER TABLE "public"."chat" ALTER COLUMN "last_message_sent" drop default;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "address" text
--  null;
