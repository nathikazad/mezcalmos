CREATE OR REPLACE FUNCTION public.laundry_delivery_details(laundry_row laundry.store)
 RETURNS delivery.details
 LANGUAGE sql
 STABLE
AS $function$
    SELECT *
    FROM delivery.details d
   
$function$;
