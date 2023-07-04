
alter table "service_provider"."details" alter column "unique_id" set not null;
alter table "service_provider"."details" add constraint "details_unique_id_key" unique ("unique_id");

alter table "service_provider"."details" add column "advertise_only" boolean
 not null default 'false';
