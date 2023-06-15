
alter table "delivery"."order" alter column "service_provider_id" drop not null;

alter table "delivery"."order" add column "chosen_companies" jsonb
 null;

alter table "delivery"."order" drop column "chosen_companies" cascade;

alter table "delivery"."courier_order" add column "chosen_companies" jsonb
 null;

alter table "delivery"."courier_order" alter column "chosen_companies" set not null;

alter table "delivery"."courier_order" drop column "chosen_companies" cascade;

alter table "delivery"."order" add column "chosen_companies" jsonb
 null;

alter table "delivery"."order" add column "customer_offer" money
 null;

alter table "delivery"."order" add column "counter_offers" jsonb
 null;

comment on column "delivery"."order"."change_price_request" is E'Map<driverId, boolean>, false if driver has not read the notification, true otherwise';
alter table "delivery"."order" rename column "change_price_request" to "notified_drivers";

comment on column "delivery"."order"."counter_offers" is E'Map<driverId, {price: number;   time: string;   status: CounterOfferStatus;   expiryTime: string;}>';

alter table "delivery"."order" alter column "chosen_companies" set not null;

alter table "delivery"."order" alter column "chosen_companies" drop not null;

comment on column "delivery"."order"."chosen_companies" is E'Array of delivery company ids';
