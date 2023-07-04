
alter table "restaurant"."restaurant" alter column "delivery_details_id" drop not null;

alter table "restaurant"."restaurant" add column "location_id" integer
 not null;

alter table "restaurant"."restaurant"
  add constraint "restaurant_location_id_fkey"
  foreign key ("location_id")
  references "service_provider"."location"
  ("id") on update restrict on delete restrict;

alter table "delivery"."company" add column "location_id" integer
 not null;

alter table "delivery"."company"
  add constraint "company_location_id_fkey"
  foreign key ("location_id")
  references "service_provider"."location"
  ("id") on update cascade on delete cascade;

alter table "restaurant"."restaurant" drop constraint "restaurant_location_id_fkey",
  add constraint "restaurant_location_id_fkey"
  foreign key ("location_id")
  references "service_provider"."location"
  ("id") on update cascade on delete cascade;

DROP FUNCTION restaurant.fetch_restaurants;
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
        WHERE l.id = r.location_id 
    ), location) <= 
    (
        SELECT radius 
        FROM delivery.details d
        WHERE d.id = r.delivery_details_id 
    )
$function$;

DROP FUNCTION delivery.fetch_delivery_company;
CREATE OR REPLACE FUNCTION delivery.get_delivery_companies(location geography)
 RETURNS SETOF delivery.company
 LANGUAGE sql
 STABLE
AS $function$
    SELECT *
    FROM delivery.company c
    WHERE ST_Distance(
    (
        SELECT gps 
        FROM service_provider.location l 
        WHERE l.id = c.location_id 
    ), location) <= 
    (
        SELECT radius 
        FROM delivery.details d
        WHERE d.id = c.delivery_details_id
    )
$function$;

alter table "service_provider"."location" drop column "service_provider_id" cascade;

alter table "service_provider"."location" drop column "service_provider_type" cascade;

alter table "delivery"."details" drop column "service_provider_id" cascade;

alter table "delivery"."details" drop column "service_provider_type" cascade;

CREATE OR REPLACE FUNCTION public.restaurant_delivery_details(restaurant_row restaurant.restaurant)
 RETURNS delivery.details
 LANGUAGE sql
 STABLE
AS $function$
    SELECT *
    FROM delivery.details d
    WHERE d.id = (
	    CASE
		WHEN restaurant_row.self_delivery = true THEN restaurant_row.delivery_details_id
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
    		WHEN r.self_delivery = true THEN r.location_id 
    		ELSE (
    			SELECT location_id 
    			FROM delivery.company c
    			WHERE c.id = (
    			    SELECT delivery_company_id
    			    FROM service_provider.delivery_partner p 
    			    WHERE p.service_provider_id = r.id AND p.service_provider_type = 'restaurant'
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
    		WHEN r.self_delivery = true THEN r.delivery_details_id 
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
