
alter table "delivery"."delivery_company" rename to "company";

alter table "delivery"."delivery_cost" rename to "cost";

alter table "delivery"."delivery_operator" rename to "operator";

CREATE OR REPLACE FUNCTION public.deliop_notification_token(delivery_operator_row delivery.operator)
 RETURNS character varying
 LANGUAGE sql
 STABLE
AS $function$
    SELECT token
    FROM notification_info n
    WHERE n.user_id = delivery_operator_row.user_id
    AND n.app_type_id = 'delivery_admin';
$function$;

alter view "delivery"."delivery_order_public" rename to "order_public";

alter table "delivery"."delivery_order" rename to "order";

CREATE OR REPLACE FUNCTION public.delivery_in_process(order_row delivery.order)
 RETURNS boolean
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.status = 'orderReceived' OR order_row.status = 'packageReady' OR order_row.status = 'atPickup' OR order_row.status = 'onTheWayToDropoff' OR order_row.status = 'atDropoff'
$function$;


alter table "delivery"."delivery_driver" rename to "driver";

CREATE OR REPLACE FUNCTION public.driver_notification_token(deliverer_row delivery.driver)
 RETURNS character varying
 LANGUAGE sql
 STABLE
AS $function$
    SELECT token
    FROM notification_info n
    WHERE n.user_id = deliverer_row.user_id
    AND n.app_type_id = 'delivery';
$function$;

alter table "restaurant"."restaurant_cart" rename to "cart";

alter table "restaurant"."restaurant_cart_item" rename to "cart_item";

CREATE OR REPLACE FUNCTION public.cost(cart_row restaurant.cart)
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT SUM(quantity * cost_per_one)
    FROM restaurant.cart_item
    WHERE customer_id = cart_row.customer_id;
$function$;

alter table "restaurant"."restaurant_category" rename to "category";

alter table "restaurant"."restaurant_choice" rename to "choice";

alter table "restaurant"."restaurant_item" rename to "item";

alter table "restaurant"."restaurant_item_option_map" rename to "item_option_map";

alter table "restaurant"."restaurant_option" rename to "option";

alter table "restaurant"."restaurant_option_choice_map" rename to "option_choice_map";

alter table "restaurant"."restaurant_operator" rename to "operator";

CREATE OR REPLACE FUNCTION public.restaurant_operator_notification_token(restaurant_operator_row restaurant.operator)
 RETURNS character varying
 LANGUAGE sql
 STABLE
AS $function$
    SELECT token
    FROM notification_info n
    WHERE n.user_id = restaurant_operator_row.user_id
    AND n.app_type_id = 'restaurant';
$function$;

alter table "restaurant"."restaurant_order_item" rename to "order_item";

alter view "restaurant"."restaurant_order_public" rename to "order_public";

alter table "restaurant"."restaurant_order" rename to "order";


CREATE OR REPLACE FUNCTION public.itemscost(order_row restaurant."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT SUM(quantity * cost_per_one)
    FROM restaurant.order_item
    WHERE restaurant_order_id = order_row.id;
$function$