
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."chat" add column "last_message" jsonb
--  null;

alter table "service_provider"."details" alter column "language" set default '"{\"en\":true,\"es\":true}"'::jsonb;
