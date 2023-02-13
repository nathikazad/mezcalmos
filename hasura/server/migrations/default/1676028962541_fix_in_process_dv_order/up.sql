CREATE OR REPLACE FUNCTION public.delivery_in_process(order_row delivery."order")
 RETURNS boolean
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.status = 'orderReceived' OR order_row.status = 'packageReady' OR order_row.status = 'atPickup' OR order_row.status = 'onTheWayToDropoff'OR order_row.status = 'onTheWayToPickup' OR order_row.status = 'atDropoff'
$function$;
