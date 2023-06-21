
CREATE OR REPLACE FUNCTION business.order_in_process(order_row business."order_request")
 RETURNS boolean
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.status != 'completed' AND order_row.status != 'cancelledByCustomer' AND order_row.status != 'cancelledByBusiness' 
$function$;

alter table "customer"."minimal_order" alter column "payment_type" drop not null;

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
            customer_id,
            estimated_food_ready_time as estimated_ready_time,
            (SELECT estimated_arrival_at_dropoff_time 
                FROM delivery.order o 
                WHERE o.id = r.delivery_id
            ) as estimated_delivery_time,
            (SELECT SUM(quantity) 
                FROM restaurant.order_item i
                WHERE i.restaurant_order_id = r.id
            ) as number_of_items,
            0 as items_weight
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
            customer_id,
            estimated_ready_time,
            (SELECT estimated_arrival_at_dropoff_time 
                FROM delivery.order o 
                WHERE o.id = l.to_customer_delivery_id
            ) as estimated_delivery_time,
            0 as number_of_items,
            (SELECT SUM(weight_in_kilo) 
                FROM laundry.order_category c
                WHERE c.order_id = l.id
            ) as items_weight
        FROM  laundry.order l
        WHERE l.customer_id = cus_id),
    co AS (
        SELECT 
            c.id, 
            'courier' AS order_type, 
            d.status, 
            public.delivery_in_process(d) as in_process,
            c.order_time,
            COALESCE(delivery.totalcost(c), '0'::money) as total_cost,
            (SELECT name 
                FROM service_provider.details s 
                WHERE s.id = (SELECT details_id FROM delivery.company WHERE id = d.service_provider_id)
            ),
            (SELECT image 
                FROM service_provider.details s 
                WHERE s.id = (SELECT details_id FROM delivery.company WHERE id = d.service_provider_id)
            ),
            c.payment_type,
            c.to_location_address as to_address,
            d.delivery_cost,
            c.customer_id,
            d.estimated_arrival_at_dropoff_time as estimated_ready_time,
            d.estimated_arrival_at_dropoff_time as estimated_delivery_time,
            (SELECT COUNT(id) 
                FROM delivery.courier_order_item i
                WHERE i.order_id = c.id
            ) as number_of_items,
            0 as items_weight
        FROM  delivery.courier_order c
        INNER JOIN delivery.order d
        ON c.delivery_order_id = d.id
        WHERE c.customer_id = cus_id),
    bo AS (
        SELECT 
            id, 
            'business' AS order_type, 
            status, 
            business.order_in_process(b) as in_process,
            order_time, 
            COALESCE(business.ordercost(b), '0'::money) as total_cost,
            (SELECT name 
                FROM service_provider.details d 
                WHERE d.id = (SELECT details_id FROM business.business WHERE id = b.business_id)
            ),
            (SELECT image 
                FROM service_provider.details d 
                WHERE d.id = (SELECT details_id FROM business.business WHERE id = b.business_id)
            ),
            null as payment_type,
            null as to_address,
            '0'::money as delivery_cost,
            customer_id,
            null::timestamp with time zone as estimated_ready_time,
            null::timestamp with time zone as estimated_delivery_time,
            (SELECT COUNT(*) 
                FROM business.order_request_item i
                WHERE i.order_request_id = b.id
            ) as number_of_items,
            0 as items_weight
        FROM business.order_request b
        WHERE b.customer_id = cus_id)
    SELECT * from ro UNION select * from lo UNION select * from co UNION select * from bo
$function$;
