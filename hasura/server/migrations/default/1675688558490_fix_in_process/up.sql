CREATE OR REPLACE FUNCTION laundry.order_in_process(order_row laundry."order")
 RETURNS boolean
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.status != 'delivered' AND order_row.status != 'cancelledByCustomer' AND order_row.status != 'cancelledByAdmin' 
$function$;
