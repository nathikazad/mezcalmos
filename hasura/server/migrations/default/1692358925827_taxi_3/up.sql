
DROP table "taxi"."operator";

alter table "taxi"."order" alter column "notified_drivers" set default jsonb_build_object();
alter table "taxi"."order" alter column "notified_drivers" set not null;

alter table "taxi"."order" alter column "chosen_companies" set default jsonb_build_array();
alter table "taxi"."order" alter column "chosen_companies" set not null;

alter table "taxi"."order" alter column "counter_offers" set default jsonb_build_object();
alter table "taxi"."order" alter column "counter_offers" set not null;

alter table "taxi"."company" drop column "minimum_cost" cascade;

alter table "taxi"."company" drop column "cost_per_km" cascade;

alter table "taxi"."taxi" add column "minimum_cost" money
 null;

alter table "taxi"."taxi" add column "cost_per_km" money
 null;

alter table "taxi"."company" add column "minimum_cost" money
 not null default '0';

alter table "taxi"."company" add column "cost_per_km" money
 not null;

alter table "taxi"."taxi" add column "taxi_company_id" integer
 not null;

alter table "taxi"."order" rename column "to_location_address" to "to_location_text";

CREATE OR REPLACE FUNCTION taxi.finalcost(order_row taxi."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.cost - order_row.refund_amount + order_row.stripe_fees - order_row.discount_value
$function$;
