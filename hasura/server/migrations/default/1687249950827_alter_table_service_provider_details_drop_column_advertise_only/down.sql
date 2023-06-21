alter table "service_provider"."details" alter column "advertise_only" set default false;
alter table "service_provider"."details" alter column "advertise_only" drop not null;
alter table "service_provider"."details" add column "advertise_only" bool;
