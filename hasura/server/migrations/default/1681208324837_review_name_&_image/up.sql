
CREATE OR REPLACE FUNCTION public.fromName(review_row public.review)
 RETURNS varchar
 LANGUAGE sql
 STABLE
AS $function$
    SELECT 
        CASE
            WHEN review_row.from_entity_type = 'customer'
            THEN (SELECT name FROM public.user u WHERE u.id = review_row.from_entity_id)
            -- WHEN review_row.from_entity_type = 'driver'
            -- THEN (SELECT name FROM user u WHERE u.id = (
            --     SELECT user_id FROM delivery.driver d WHERE d.id = review_row.from_entity_id
            -- ))
            -- WHEN review_row.from_entity_type = 'restaurant'
            -- THEN (SELECT name FROM service_provider.details s WHERE s.id = (
            --     SELECT details_id FROM restaurant.restaurant r WHERE r.id =  review_row.from_entity_id
            -- ))
            -- WHEN review_row.from_entity_type = 'laundry'
            -- THEN (SELECT name FROM service_provider.details s WHERE s.id = (
            --     SELECT details_id FROM laundry.laundry l WHERE l.id =  review_row.from_entity_id
            -- ))
        END
$function$;

CREATE OR REPLACE FUNCTION public.fromName(review_row public.review)
 RETURNS varchar
 LANGUAGE sql
 STABLE
AS $function$
    SELECT 
        CASE
            WHEN review_row.from_entity_type = 'customer'
            THEN (SELECT name FROM public.user u WHERE u.id = review_row.from_entity_id)
            WHEN review_row.from_entity_type = 'driver'
            THEN (SELECT name FROM public.user u WHERE u.id = (
                SELECT user_id FROM delivery.driver d WHERE d.id = review_row.from_entity_id
            ))
            WHEN review_row.from_entity_type = 'restaurant'
            THEN (SELECT name FROM service_provider.details s WHERE s.id = (
                SELECT details_id FROM restaurant.restaurant r WHERE r.id =  review_row.from_entity_id
            ))
            WHEN review_row.from_entity_type = 'laundry'
            THEN (SELECT name FROM service_provider.details s WHERE s.id = (
                SELECT details_id FROM laundry.store l WHERE l.id =  review_row.from_entity_id
            ))
        END
$function$;

CREATE OR REPLACE FUNCTION public.fromImage(review_row public.review)
 RETURNS varchar
 LANGUAGE sql
 STABLE
AS $function$
    SELECT 
        CASE
            WHEN review_row.from_entity_type = 'customer'
            THEN (SELECT image FROM public.user u WHERE u.id = review_row.from_entity_id)
            WHEN review_row.from_entity_type = 'driver'
            THEN (SELECT image FROM public.user u WHERE u.id = (
                SELECT user_id FROM delivery.driver d WHERE d.id = review_row.from_entity_id
            ))
            WHEN review_row.from_entity_type = 'restaurant'
            THEN (SELECT image FROM service_provider.details s WHERE s.id = (
                SELECT details_id FROM restaurant.restaurant r WHERE r.id =  review_row.from_entity_id
            ))
            WHEN review_row.from_entity_type = 'laundry'
            THEN (SELECT image FROM service_provider.details s WHERE s.id = (
                SELECT details_id FROM laundry.store l WHERE l.id =  review_row.from_entity_id
            ))
        END
$function$;

CREATE OR REPLACE FUNCTION public.toName(review_row public.review)
 RETURNS varchar
 LANGUAGE sql
 STABLE
AS $function$
    SELECT 
        CASE
            WHEN review_row.to_entity_type = 'customer'
            THEN (SELECT name FROM public.user u WHERE u.id = review_row.to_entity_id)
            WHEN review_row.to_entity_type = 'driver'
            THEN (SELECT name FROM public.user u WHERE u.id = (
                SELECT user_id FROM delivery.driver d WHERE d.id = review_row.to_entity_id
            ))
            WHEN review_row.to_entity_type = 'restaurant'
            THEN (SELECT name FROM service_provider.details s WHERE s.id = (
                SELECT details_id FROM restaurant.restaurant r WHERE r.id =  review_row.to_entity_id
            ))
            WHEN review_row.to_entity_type = 'laundry'
            THEN (SELECT name FROM service_provider.details s WHERE s.id = (
                SELECT details_id FROM laundry.store l WHERE l.id =  review_row.to_entity_id
            ))
        END
$function$;

CREATE OR REPLACE FUNCTION public.toImage(review_row public.review)
 RETURNS varchar
 LANGUAGE sql
 STABLE
AS $function$
    SELECT 
        CASE
            WHEN review_row.to_entity_type = 'customer'
            THEN (SELECT image FROM public.user u WHERE u.id = review_row.to_entity_id)
            WHEN review_row.to_entity_type = 'driver'
            THEN (SELECT image FROM public.user u WHERE u.id = (
                SELECT user_id FROM delivery.driver d WHERE d.id = review_row.to_entity_id
            ))
            WHEN review_row.to_entity_type = 'restaurant'
            THEN (SELECT image FROM service_provider.details s WHERE s.id = (
                SELECT details_id FROM restaurant.restaurant r WHERE r.id =  review_row.to_entity_id
            ))
            WHEN review_row.to_entity_type = 'laundry'
            THEN (SELECT image FROM service_provider.details s WHERE s.id = (
                SELECT details_id FROM laundry.store l WHERE l.id =  review_row.to_entity_id
            ))
        END
$function$;
