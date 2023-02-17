
alter table "service_provider"."details" alter column "accepted_payments" set not null;

alter table "service_provider"."details" alter column "accepted_payments" set default '"{\"cash\":true,\"card\":false,\"bankTransfer\":false}"';
