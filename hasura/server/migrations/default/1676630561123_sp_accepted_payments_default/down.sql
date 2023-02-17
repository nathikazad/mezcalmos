
alter table "service_provider"."details" alter column "accepted_payments" set default '"{\"cash\":true,\"card\":false,\"bankTransfer\":false}"'::jsonb;

alter table "service_provider"."details" alter column "accepted_payments" drop not null;
