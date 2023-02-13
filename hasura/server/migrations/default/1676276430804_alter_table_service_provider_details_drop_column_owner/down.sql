alter table "service_provider"."details" alter column "owner" set default false;
alter table "service_provider"."details" alter column "owner" drop not null;
alter table "service_provider"."details" add column "owner" bool;
