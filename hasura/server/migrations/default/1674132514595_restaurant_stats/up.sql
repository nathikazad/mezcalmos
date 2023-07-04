

CREATE TABLE "public"."mez_json" ("json_object" jsonb NOT NULL, PRIMARY KEY ("json_object") );

-- DROP FUNCTION restaurant_orders_by_date;
CREATE OR REPLACE FUNCTION public.restaurant_orders_by_date(res_id integer default null)
 RETURNS mez_json
 LANGUAGE sql
 STABLE
AS $function$
SELECT json_agg(r)
FROM (
SELECT
json_build_object('date', date(order_time),
'total_orders', count(*),
'total_cost', sum(totalcost(o)),
'delivered', count(*) FILTER (WHERE status = 'delivered'),
'cus_cancelled', count(*) FILTER (WHERE status = 'cancelledByCustomer'),
'adm_cancelled', count(*) FILTER (WHERE status = 'cancelledByAdmin')) as json
FROM restaurant.order o
WHERE res_id IS NULL OR restaurant_id = res_id
GROUP BY date(order_time)
ORDER BY date(order_time) DESC) r
$function$;

-- DROP FUNCTION restaurant_orders_by_date;
CREATE OR REPLACE FUNCTION public.restaurant_orders_by_month(res_id integer default null)
 RETURNS mez_json
 LANGUAGE sql
 STABLE
AS $function$
SELECT json_agg(r)
FROM (
SELECT
json_build_object('month', TO_CHAR(TO_DATE (extract(month from order_time)::text, 'MM'), 'Month'),
'total_orders', count(*),
'total_cost', sum(totalcost(o)),
'delivered', count(*) FILTER (WHERE status = 'delivered'),
'cus_cancelled', count(*) FILTER (WHERE status = 'cancelledByCustomer'),
'adm_cancelled', count(*) FILTER (WHERE status = 'cancelledByAdmin')) as json
FROM restaurant.order o
WHERE res_id IS NULL OR restaurant_id = res_id
GROUP BY extract(month from order_time)
ORDER BY extract(month from order_time) DESC) r
$function$;

DROP FUNCTION public.restaurant_orders_by_date;

CREATE OR REPLACE FUNCTION restaurant.orders_by_date(res_id integer DEFAULT NULL::integer)
 RETURNS mez_json
 LANGUAGE sql
 STABLE
AS $function$
SELECT json_agg(r)
FROM (
SELECT
json_build_object('date', date(order_time),
'total_orders', count(*),
'total_cost', sum(totalcost(o)),
'delivered', count(*) FILTER (WHERE status = 'delivered'),
'cus_cancelled', count(*) FILTER (WHERE status = 'cancelledByCustomer'),
'adm_cancelled', count(*) FILTER (WHERE status = 'cancelledByAdmin')) as json
FROM restaurant.order o
WHERE res_id IS NULL OR restaurant_id = res_id
GROUP BY date(order_time)
ORDER BY date(order_time) DESC) r
$function$;

DROP FUNCTION public.restaurant_orders_by_month;

CREATE OR REPLACE FUNCTION restaurant.orders_by_month(res_id integer DEFAULT NULL::integer)
 RETURNS mez_json
 LANGUAGE sql
 STABLE
AS $function$
SELECT json_agg(r)
FROM (
SELECT
json_build_object('month', TO_CHAR(TO_DATE (extract(month from order_time)::text, 'MM'), 'Month'),
'total_orders', count(*),
'total_cost', sum(totalcost(o)),
'delivered', count(*) FILTER (WHERE status = 'delivered'),
'cus_cancelled', count(*) FILTER (WHERE status = 'cancelledByCustomer'),
'adm_cancelled', count(*) FILTER (WHERE status = 'cancelledByAdmin')) as json
FROM restaurant.order o
WHERE res_id IS NULL OR restaurant_id = res_id
GROUP BY extract(month from order_time)
ORDER BY extract(month from order_time) DESC) r
$function$;
