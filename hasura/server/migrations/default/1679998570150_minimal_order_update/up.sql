
alter table "customer"."minimal_order" add column "estimated_ready_time" timestamptz
 null;

alter table "customer"."minimal_order" add column "estimated_delivery_time" timestamptz
 null;

alter table "customer"."minimal_order" add column "number_of_items" integer
 null;

alter table "customer"."minimal_order" add column "items_weight" float8
 null;

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
        WHERE c.customer_id = cus_id)
    SELECT * from ro UNION select * from lo UNION select * from co
$function$;
