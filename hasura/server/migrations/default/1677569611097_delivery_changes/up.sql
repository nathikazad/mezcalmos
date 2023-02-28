
alter table "delivery"."details" alter column "cost_per_km_from_base" set default '0';
alter table "delivery"."details" alter column "cost_per_km_from_base" set not null;

alter table "service_provider"."delivery_partner" add constraint "delivery_partner_service_provider_id_service_provider_type_key" unique ("service_provider_id", "service_provider_type");
