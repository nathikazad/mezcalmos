
alter table "service_provider"."details" drop column "timezone" cascade;

alter table "service_provider"."details" add column "time_zone" text
 null default 'America/Mexico_City';
