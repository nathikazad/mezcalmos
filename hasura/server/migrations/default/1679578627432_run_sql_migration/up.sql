CREATE OR REPLACE FUNCTION delivery.totalcost(order_row delivery.courier_order)
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT delivery.actualitemsCost(order_row) - order_row.refund_amount + order_row.stripe_fees + order_row.tax - order_row.discount_value + (
        SELECT delivery_cost 
        FROM delivery."order" o
        WHERE o.id = order_row.delivery_order_id
    )
$function$;
