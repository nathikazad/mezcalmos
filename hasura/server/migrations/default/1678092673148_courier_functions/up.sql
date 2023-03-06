
CREATE FUNCTION delivery.actualitemscost(order_row delivery."courier_order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $$
    SELECT SUM(COALESCE(actual_cost, 0::money))
    FROM delivery.courier_order_item i
    WHERE i.order_id = order_row.id
$$;

CREATE FUNCTION delivery.totalcost(order_row delivery."courier_order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT delivery.actualitemsCost(order_row) - order_row.refund_amount + order_row.stripe_fees - order_row.discount_value + (
        SELECT delivery_cost 
        FROM delivery."order" o
        WHERE o.id = order_row.delivery_order_id
    )
$function$;

alter table "delivery"."courier_order" alter column "refund_amount" set default '0';
alter table "delivery"."courier_order" alter column "refund_amount" set not null;

alter table "delivery"."courier_order" rename column "to_location_adress" to "to_location_address";

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
            c.customer_id
        FROM  delivery.courier_order c
        INNER JOIN delivery.order d
        ON c.delivery_order_id = d.id
        WHERE c.customer_id = cus_id)
    SELECT * from ro UNION select * from lo UNION select * from co
$function$;
