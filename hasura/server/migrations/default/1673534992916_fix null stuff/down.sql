
alter table "public"."restaurant_order" alter column "chat_id" drop not null;

alter table "public"."user" alter column "language_id" drop not null;

alter table "public"."user" alter column "language_id" set not null;

ALTER TABLE "public"."user" ALTER COLUMN "language_id" drop default;
