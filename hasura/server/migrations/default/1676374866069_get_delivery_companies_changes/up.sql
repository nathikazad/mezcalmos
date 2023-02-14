
CREATE OR REPLACE FUNCTION restaurant.get_restaurants(location geography)
 RETURNS SETOF restaurant.restaurant
 LANGUAGE sql
 STABLE
AS $function$
    SELECT *
    FROM restaurant.restaurant r
    WHERE ST_Distance(
    (
        SELECT gps 
        FROM service_provider.location l 
        WHERE l.id = (
    	    CASE
    		WHEN (SELECT self_delivery FROM delivery.details i WHERE r.delivery_details_id = i.id) = true 
    		THEN (SELECT location_id FROM service_provider.details d WHERE r.details_id = d.id)
    		ELSE (
    			SELECT location_id 
    			FROM service_provider.details e
    			WHERE e.id = (
    			    SELECT details_id
    			    FROM delivery.company c
    			    WHERE c.id = (
    			        SELECT delivery_company_id
        			    FROM service_provider.delivery_partner p 
        			    WHERE p.service_provider_id = r.id AND p.service_provider_type = 'restaurant'
    			    )
    			)
    		)
    	    END
        )
    ), location) <= 
    (
        SELECT radius 
        FROM delivery.details d
        WHERE d.id = (
    	    CASE
    		WHEN (SELECT self_delivery FROM delivery.details i WHERE r.delivery_details_id = i.id) = true THEN r.delivery_details_id 
    		ELSE (
    			SELECT delivery_details_id 
    			FROM delivery.company c
    			WHERE c.id = (
    			    SELECT delivery_company_id
    			    FROM service_provider.delivery_partner p 
    			    WHERE p.service_provider_id = r.id AND p.service_provider_type = 'restaurant'
    			)
    		)
    	    END
        ) 
    )
$function$;

CREATE OR REPLACE FUNCTION restaurant.get_restaurants(location geography)
 RETURNS SETOF restaurant.restaurant
 LANGUAGE sql
 STABLE
AS $function$
    SELECT *
    FROM restaurant.restaurant r
    WHERE ST_Distance(
    (
        SELECT gps 
        FROM service_provider.location l 
        WHERE l.id = (
    	    CASE
    		WHEN (SELECT self_delivery FROM delivery.details i WHERE r.delivery_details_id = i.id) = true 
    		THEN (SELECT location_id FROM service_provider.details d WHERE r.details_id = d.id)
    		ELSE (
    			SELECT location_id 
    			FROM service_provider.details e
    			WHERE e.id = (
    			    SELECT details_id
    			    FROM delivery.company c
    			    WHERE c.id = (
    			        SELECT delivery_company_id
        			    FROM service_provider.delivery_partner p 
        			    WHERE p.service_provider_id = r.id AND p.service_provider_type = 'restaurant'
    			    )
    			)
    		)
    	    END
        )
    ), location) <= 
    (
        SELECT radius 
        FROM delivery.details d
        WHERE d.id = (
    	    CASE
    		WHEN (SELECT self_delivery FROM delivery.details i WHERE r.delivery_details_id = i.id) = true THEN r.delivery_details_id 
    		ELSE (
    			SELECT delivery_details_id 
    			FROM delivery.company c
    			WHERE c.id = (
    			    SELECT delivery_company_id
    			    FROM service_provider.delivery_partner p 
    			    WHERE p.service_provider_id = r.id AND p.service_provider_type = 'restaurant'
    			)
    		)
    	    END
        ) 
    )
$function$;
