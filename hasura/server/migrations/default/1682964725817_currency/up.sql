
alter table "service_provider"."details" add column "currency" text
 not null default 'Peso';

alter table "service_provider"."details" alter column "currency" set default 'peso';
