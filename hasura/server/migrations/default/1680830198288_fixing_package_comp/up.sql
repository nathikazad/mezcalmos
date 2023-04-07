CREATE OR REPLACE FUNCTION delivery.packagecost(delivery_row delivery."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT 
        CASE 
            WHEN delivery_row.order_type = 'restaurant'
            THEN public.itemscost((SELECT r.*::restaurant."order" FROM restaurant."order" r WHERE r.delivery_id = delivery_row.id)) 
                
            WHEN delivery_row.order_type = 'laundry'
            THEN laundry.itemscost((SELECT l.*::laundry."order" FROM laundry."order" l WHERE (l.from_customer_delivery_id = delivery_row.id OR l.to_customer_delivery_id = delivery_row.id))) 
              
            WHEN delivery_row.order_type = 'courier'
            THEN delivery.actualitemscost((SELECT c.*::delivery."courier_order" FROM delivery."courier_order" c WHERE c.delivery_order_id = delivery_row.id))
              
        END
    
$function$;
