
alter table "service_provider"."delivery_partner" drop constraint "delivery_partner_service_provider_id_service_provider_type_key";

alter table "delivery"."details" alter column "cost_per_km_from_base" drop not null;
alter table "delivery"."details" alter column "cost_per_km_from_base" set default '$0.00'::money;
