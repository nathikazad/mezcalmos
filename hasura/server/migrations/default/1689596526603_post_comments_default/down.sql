
comment on column "service_provider"."post"."comments" is E'Array of { message, date, Array of customerIds }';
alter table "service_provider"."post" alter column "comments" drop not null;
ALTER TABLE "service_provider"."post" ALTER COLUMN "comments" drop default;

alter table "service_provider"."post" alter column "likes" drop not null;
ALTER TABLE "service_provider"."post" ALTER COLUMN "likes" drop default;
