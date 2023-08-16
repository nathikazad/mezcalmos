CREATE OR REPLACE FUNCTION business.order_in_process(order_row business.order_request)
 RETURNS boolean
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.status = 'requestReceived' OR order_row.status = 'modificationRequestByBusiness' 
$function$;
