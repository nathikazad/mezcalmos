
alter table "service_provider"."details" drop column "unique_id" cascade;

alter table "service_provider"."details" add column "unique_id" text
 null;
