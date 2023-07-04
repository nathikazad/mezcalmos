CREATE OR REPLACE FUNCTION delivery.deliverytotalcost(delivery_row delivery."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT COALESCE(delivery.packagecost(delivery_row), 0::money) + (SELECT COALESCE(delivery.tax(delivery_row), 0::money)) + (SELECT delivery_cost FROM delivery."order" o WHERE o.id = delivery_row.id)
$function$;
