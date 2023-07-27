
alter table "service_provider"."post_comment" drop constraint "post_comment_user_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."post_comment" add column "user_id" integer
--  not null;

alter table "service_provider"."post" alter column "comments" set default jsonb_build_array();
alter table "service_provider"."post" alter column "comments" drop not null;
alter table "service_provider"."post" add column "comments" jsonb;

DROP TABLE "service_provider"."post_comment";
