alter table "public"."chat" alter column "messages" drop not null;
ALTER TABLE "public"."chat" ALTER COLUMN "messages" drop default;
