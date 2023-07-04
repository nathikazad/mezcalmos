
ALTER TABLE "service_provider"."details" ALTER COLUMN "last_active_time" drop default;

alter table "service_provider"."details" alter column "last_active_time" set default now();

alter table "service_provider"."details" alter column "last_active_time" drop not null;
ALTER TABLE "service_provider"."details" ALTER COLUMN "last_active_time" TYPE timestamp without time zone;
