
CREATE OR REPLACE FUNCTION public.restaurant_delivery_details(restaurant_row restaurant.restaurant)
 RETURNS delivery.details
 LANGUAGE sql
 STABLE
AS $function$
    SELECT *
    FROM delivery.details d
    WHERE d.id = (
	    CASE
		WHEN (SELECT self_delivery FROM delivery.details i WHERE restaurant_row.delivery_details_id = i.id) = true 
		    THEN restaurant_row.delivery_details_id
		ELSE (
			SELECT delivery_details_id 
			FROM delivery.company c
			WHERE c.id = (
			    SELECT delivery_company_id
			    FROM service_provider.delivery_partner p 
			    WHERE p.service_provider_id = restaurant_row.id AND p.service_provider_type = 'restaurant'
			)
		)
	    END
    )
$function$;

CREATE OR REPLACE FUNCTION public.laundry_delivery_details(laundry_row laundry.store)
 RETURNS delivery.details
 LANGUAGE sql
 STABLE
AS $function$
    SELECT *
    FROM delivery.details d
    WHERE d.id = (
	    CASE
		WHEN (SELECT self_delivery FROM delivery.details i WHERE laundry_row.delivery_details_id = i.id) = true 
		    THEN laundry_row.delivery_details_id
		ELSE (
			SELECT delivery_details_id 
			FROM delivery.company c
			WHERE c.id = (
			    SELECT delivery_company_id
			    FROM service_provider.delivery_partner p 
			    WHERE p.service_provider_id = laundry_row.id AND p.service_provider_type = 'laundry'
			)
		)
	    END
    )
$function$;
