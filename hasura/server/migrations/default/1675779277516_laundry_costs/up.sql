
alter table "service_provider"."delivery_partner"
  add constraint "delivery_partner_delivery_company_id_fkey"
  foreign key ("delivery_company_id")
  references "delivery"."company"
  ("id") on update restrict on delete cascade;

alter table "laundry"."store" alter column "description_id" drop not null;

CREATE FUNCTION laundry.itemscost(order_row laundry."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT SUM(oc.weight_in_kilo * c.cost_by_kilo)
    FROM laundry.order_category oc
    INNER JOIN laundry.category c
    ON oc.category_id = c.id
    WHERE order_id = order_row.id;
$function$;

CREATE FUNCTION laundry.totalCost(order_row laundry."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.delivery_cost  - order_row.refund_amount + order_row.stripe_fees - order_row.discount_value
    
$function$;

CREATE OR REPLACE FUNCTION laundry.totalcost(order_row laundry."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.delivery_cost + laundry.itemsCost(order_row) - order_row.refund_amount + order_row.stripe_fees - order_row.discount_value
    
$function$;
