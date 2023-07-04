
comment on column "delivery"."order"."direction" is E'to_customer, from_customer';
alter table "delivery"."order" alter column "direction" set default 'to_customer'::text;

comment on column "delivery"."order"."service_provider_type" is E'restaurant, delivery_company';
