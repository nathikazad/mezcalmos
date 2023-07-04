
comment on column "delivery"."order"."service_provider_type" is E'restaurant, deliveryCompany';

alter table "delivery"."order" alter column "direction" set default 'toCustomer'::text;
comment on column "delivery"."order"."direction" is E'toCustomer, fromCustomer';
