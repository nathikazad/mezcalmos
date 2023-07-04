
alter table "service_provider"."stripe_info" drop column "requirements" cascade;

alter table "service_provider"."stripe_info" add column "requirements" jsonb
 null;
