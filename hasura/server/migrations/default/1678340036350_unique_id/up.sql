
alter table "service_provider"."details" add column "unique_id" text
 null;

alter table "service_provider"."details" alter column "unique_id" set not null;
