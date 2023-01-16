
alter view "restaurant"."order_public" rename to "restaurant_order_public";

alter table "restaurant"."order_item" rename to "restaurant_order_item";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.restaurant_operator_notification_token(restaurant_operator_row restaurant.operator)
--  RETURNS character varying
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT token
--     FROM notification_info n
--     WHERE n.user_id = restaurant_operator_row.user_id
--     AND n.app_type_id = 'restaurant';
-- $function$;

alter table "restaurant"."operator" rename to "restaurant_operator";

alter table "restaurant"."option_choice_map" rename to "restaurant_option_choice_map";

alter table "restaurant"."option" rename to "restaurant_option";

alter table "restaurant"."item_option_map" rename to "restaurant_item_option_map";

alter table "restaurant"."item" rename to "restaurant_item";

alter table "restaurant"."choice" rename to "restaurant_choice";

alter table "restaurant"."category" rename to "restaurant_category";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.cost(cart_row restaurant.cart)
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT SUM(quantity * cost_per_one)
--     FROM restaurant.cart_item
--     WHERE customer_id = cart_row.customer_id;
-- $function$
-- -- SELECT schema_name
-- -- FROM information_schema.schemata;
--
-- -- SELECT * FROM restaurant.cart;

alter table "restaurant"."cart_item" rename to "restaurant_cart_item";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.driver_notification_token(deliverer_row delivery.driver)
--  RETURNS character varying
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT token
--     FROM notification_info n
--     WHERE n.user_id = deliverer_row.user_id
--     AND n.app_type_id = 'delivery';
-- $function$;

alter table "delivery"."driver" rename to "delivery_driver";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.delivery_in_process(order_row delivery.order)
--  RETURNS boolean
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT order_row.status = 'orderReceived' OR order_row.status = 'packageReady' OR order_row.status = 'atPickup' OR order_row.status = 'onTheWayToDropoff' OR order_row.status = 'atDropoff'
-- $function$
--
-- -- CREATE OR REPLACE FUNCTION public.delivery_notification_token(delivery_row delivery.order)
-- --  RETURNS character varying
-- --  LANGUAGE sql
-- --  STABLE
-- -- AS $function$
-- --     SELECT token
-- --     FROM notification_info n
-- --     WHERE n.user_id = (
-- --     CASE
-- --         WHEN delivery_row.deliverer_app_type_id = 'restaurant' THEN (SELECT user_id FROM restaurant_operator r WHERE r.id = delivery_row.deliverer_id)
-- --         ELSE (SELECT user_id FROM deliverer WHERE deliverer.id = delivery_row.deliverer_id)
-- --     END
-- --     )
-- --     AND n.app_type_id = delivery_row.deliverer_app_type_id;
-- -- $function$;

alter table "delivery"."order" rename to "delivery_order";

alter view "delivery"."order_public" rename to "delivery_order_public";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- -- DROP FUNCTION public.deliop_notification_token;
-- CREATE OR REPLACE FUNCTION public.deliop_notification_token(delivery_operator_row delivery.operator)
--  RETURNS character varying
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT token
--     FROM notification_info n
--     WHERE n.user_id = delivery_operator_row.user_id
--     AND n.app_type_id = 'delivery_admin';
-- $function$;

alter table "delivery"."operator" rename to "delivery_operator";

alter table "delivery"."cost" rename to "delivery_cost";

alter table "delivery"."company" rename to "delivery_company";
