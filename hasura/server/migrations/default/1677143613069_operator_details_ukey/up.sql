
alter table "service_provider"."operator_details" drop constraint "operator_details_user_id_key";
alter table "service_provider"."operator_details" add constraint "operator_details_user_id_app_type_id_key" unique ("user_id", "app_type_id");

CREATE OR REPLACE FUNCTION customer.minimal_orders(cus_id integer)
 RETURNS SETOF customer.minimal_order
 LANGUAGE sql
 STABLE
AS $function$
    WITH 
    ro AS (
        SELECT 
            id, 
            'restaurant' AS order_type, 
            status, 
            public.in_process(r) as in_process,
            order_time, 
            COALESCE(public.totalcost(r), '0'::money) as total_cost,
            (SELECT name 
                FROM service_provider.details d 
                WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
            ),
            (SELECT image 
                FROM service_provider.details d 
                WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
            ),
            payment_type,
            to_location_address as to_address,
            delivery_cost,
            customer_id
        FROM restaurant.order r
        WHERE r.customer_id = cus_id),
    lo AS (
        SELECT 
            id, 
            'laundry' AS order_type, 
            status, 
            laundry.order_in_process(l) as in_process,
            order_time,
            COALESCE(laundry.totalcost(l), '0'::money) as total_cost,
            (SELECT name 
                FROM service_provider.details d 
                WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
            ),
            (SELECT image 
                FROM service_provider.details d 
                WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
            ),
            payment_type,
            customer_address as to_address,
            delivery_cost,
            customer_id
        FROM  laundry.order l
        WHERE l.customer_id = cus_id)
    SELECT * from ro UNION select * from lo
$function$;
