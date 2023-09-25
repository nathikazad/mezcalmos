


alter table "public"."restaurant" add column "stripe_info" jsonb
 null;

alter table "public"."restaurant" add column "accepted_payments" jsonb
 null;

alter table "public"."customer" add column "stripe_info" jsonb
 null;

alter table "public"."restaurant_order" add column "stripe_info" jsonb
 null;

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "stripe_info" TYPE json;

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "stripe_info" TYPE jsonb;

alter table "public"."delivery_order" add column "direction" text
 not null default 'to_customer';

comment on column "public"."delivery_order"."direction" is E'to_customer, from_customer';

alter table "public"."delivery_order" add column "schedule_time" text
 null;

alter table "public"."restaurant_order" add column "stripe_fees" integer
 not null default '0';

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "stripe_fees" TYPE money;

alter table "public"."restaurant_order" drop column "stripe_fees" cascade;

alter table "public"."restaurant_order" add column "stripe_fees" money
 not null default '0';

CREATE OR REPLACE FUNCTION public.totalcost(order_row restaurant_order)
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.delivery_cost + order_row.itemsCost - order_row.refund_amount + order_row.stripe_fees
$function$

-- SELECT to_number((stripe_info #>> '{}')::json->'stripeFees') AS stripeFees FROM restaurant_order
-- WHERE id = 14;

-- SELECT (chat_info #>> '{}')::json->'CustomerApp'->>'chatTitle' AS CustomerApp FROM chat
-- WHERE id = 84;

alter table "public"."restaurant_order" drop column "stripe_payment_id" cascade;


CREATE TABLE "public"."post" ("id" serial NOT NULL, "service_provider_type" text NOT NULL DEFAULT '"restaurant"', "service_provider_id" integer NOT NULL, "message" text NOT NULL, "image" text, "likes" jsonb, "comments" jsonb, "posted_on" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , UNIQUE ("id"));

CREATE TABLE "public"."subscriber" ("id" serial NOT NULL, "service_provider_type" text NOT NULL DEFAULT '"restaurant"', "service_provider_id" integer NOT NULL, "customer_id" integer NOT NULL, PRIMARY KEY ("id") , UNIQUE ("customer_id", "service_provider_type", "service_provider_id"));

alter table "public"."delivery_order" add column "order_type" text
 not null default 'restaurant';

alter table "public"."chat" add column "agora_info" jsonb
 null;

CREATE OR REPLACE FUNCTION public.delivery_in_process(order_row delivery_order)
 RETURNS boolean
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.status = 'orderReceived' OR order_row.status = 'packageReady' OR order_row.status = 'atPickup' OR order_row.status = 'onTheWayToDropoff' OR order_row.status = 'atDropoff'
$function$;


alter table "public"."user" alter column "language_id" set default 'en';

alter table "public"."user" alter column "language_id" drop not null;

alter table "public"."user" alter column "language_id" set not null;

alter table "public"."restaurant_order" alter column "chat_id" set not null;

alter table "public"."delivery_order" drop column "stripe_payment_id" cascade;


alter table "public"."restaurant" drop constraint "restaurant_payment_info_id_fkey";

DROP table "public"."service_provider_payment_info";

DROP table "public"."stripe_info";

comment on column "public"."restaurant"."stripe_info" is E'{ id: string; status: string; chargeFeesOnCustomer: boolean | null; chargesEnabled: boolean; payoutsEnabled: boolean; detailsSubmitted: boolean; requirements: string[] | null; email: string | null }';

comment on column "public"."customer"."stripe_info" is E'{     id: string,     idsWithServiceProvider: (Record of orderType and ids Object) {         restaurant: {Record of restaurantIds and stripeIdsWithServiceProvider}     },     cards: Record of cardId(string) and card object: {             id: string,             last4?: string,             brand?: string,             expMonth?: number,             expYear?: number,             idsWithServiceProvider: same as above,         }     } }';

comment on column "public"."restaurant"."accepted_payments" is E'Record of PaymentType(cash, card, bank transfer) and boolean';

comment on column "public"."restaurant_order"."stripe_info" is E'{ id: string, stripeFees: number, amountCharged: number, amountRefunded: number, chargeFeesOnCustomer: boolean |null; brand?: string, expMonth?: number, expYear?: number, last4?: string, status: (authorized, captured, cancelled), serviceProviderAccount: string }';

alter table "public"."restaurant" drop column "payment_info_id" cascade;


create schema "restaurant";

ALTER TABLE restaurant SET SCHEMA restaurant;

ALTER TABLE restaurant_cart_item SET SCHEMA restaurant;

ALTER TABLE restaurant_category SET SCHEMA restaurant;

ALTER TABLE restaurant_item SET SCHEMA restaurant;

ALTER TABLE restaurant_item_option_map SET SCHEMA restaurant;

ALTER TABLE restaurant_option SET SCHEMA restaurant;

ALTER TABLE restaurant_option_choice_map SET SCHEMA restaurant;

ALTER TABLE restaurant_choice SET SCHEMA restaurant;

ALTER TABLE restaurant_operator SET SCHEMA restaurant;

ALTER TABLE restaurant_order_item SET SCHEMA restaurant;

ALTER TABLE restaurant_order_public SET SCHEMA restaurant;

create schema "customer";

ALTER TABLE saved_location SET SCHEMA customer;

create schema "delivery";

ALTER TABLE delivery_company SET SCHEMA delivery;

ALTER TABLE delivery_operator SET SCHEMA delivery;

ALTER TABLE delivery_cost SET SCHEMA delivery;

ALTER TABLE delivery_order_public SET SCHEMA delivery;

ALTER TABLE app_type SET SCHEMA public;

ALTER TABLE language SET SCHEMA public;

create schema "service_provider";

ALTER TABLE post SET SCHEMA service_provider;

ALTER TABLE service_link SET SCHEMA service_provider;

ALTER TABLE subscriber SET SCHEMA service_provider;



ALTER TABLE restaurant_cart SET SCHEMA restaurant;

ALTER TABLE restaurant_order SET SCHEMA restaurant;

ALTER TABLE customer SET SCHEMA customer;

ALTER TABLE delivery_order SET SCHEMA delivery;

ALTER TABLE delivery_driver SET SCHEMA delivery;

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

CREATE TABLE "public"."service_provider_customer_chat" ("chat_id" integer NOT NULL, "customer_id" integer NOT NULL, "service_provider_id" integer NOT NULL, "service_provider_type" text NOT NULL DEFAULT 'restaurant', PRIMARY KEY ("chat_id") , UNIQUE ("customer_id", "service_provider_id", "service_provider_type"));

CREATE TABLE "public"."direct_chat" ("chat_id" integer NOT NULL, "user_id_1" integer NOT NULL, "user_id_2" integer NOT NULL, PRIMARY KEY ("chat_id") , UNIQUE ("user_id_1", "user_id_2"));

CREATE TABLE "public"."mez_admin_chat" ("user_id" integer NOT NULL, "app_type" text NOT NULL, "chat_id" integer NOT NULL, PRIMARY KEY ("chat_id") );

alter table "public"."chat_participant" drop constraint "chat_participant_app_type_id_fkey",
  add constraint "chat_participant_app_type_id_fkey"
  foreign key ("app_type_id")
  references "public"."app_type"
  ("id") on update cascade on delete restrict;

alter table "public"."direct_chat" rename column "user_id_1" to "user_id1";

alter table "public"."direct_chat" rename column "user_id_2" to "user_id2";

alter table "public"."chat" add column "chat_type" text
 not null default 'group';



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


alter table "restaurant"."option_choice_map" drop constraint "restaurant_option_choice_map_choice_id_fkey";

alter table "restaurant"."restaurant" drop constraint "restaurant_description_id_fkey",
  add constraint "restaurant_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."category" drop constraint "restaurant_category_restaurant_id_fkey",
  add constraint "category_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."category" drop constraint "restaurant_category_name_id_fkey",
  add constraint "category_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."category" drop constraint "restaurant_category_description_id_fkey",
  add constraint "category_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."item" drop constraint "restaurant_item_category_id_fkey",
  add constraint "item_category_id_fkey"
  foreign key ("category_id")
  references "restaurant"."category"
  ("id") on update set null on delete cascade;

alter table "restaurant"."item" drop constraint "restaurant_item_description_id_fkey",
  add constraint "item_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."item" drop constraint "restaurant_item_name_id_fkey",
  add constraint "item_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."item" drop constraint "restaurant_item_restaurant_id_fkey",
  add constraint "item_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."option" drop constraint "restaurant_option_name_id_fkey",
  add constraint "option_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."option" drop constraint "restaurant_option_restaurant_id_fkey",
  add constraint "option_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."option_choice_map" drop constraint "restaurant_option_choice_map_restaurant_id_fkey",
  add constraint "option_choice_map_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."choice" drop constraint "restaurant_choice_name_id_fkey",
  add constraint "choice_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."choice" drop constraint "restaurant_choice_restaurant_id_fkey",
  add constraint "choice_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."order" alter column "chat_id" drop not null;

alter table "restaurant"."restaurant" alter column "schedule" set default '"{\"monday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"tuesday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"wednesday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"thursday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"friday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"saturday\":{\"from\":\"8:0\",\"to\":\"19:0\",\"isOpen\":false},\"sunday\":{\"from\":\"8:0\",\"to\":\"16:0\",\"isOpen\":false}}"';


CREATE TABLE "service_provider"."delivery_partner" ("id" serial NOT NULL, "delivery_company_id" integer NOT NULL, "service_provider_id" integer NOT NULL, "service_provider_type" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("service_provider_id", "service_provider_type"));

alter table "delivery"."company" add column "location" geography
 not null;

alter table "delivery"."company" add column "delivery_radius" integer
 not null;

alter table "delivery"."cost" add column "location" geography
 not null;

alter table "delivery"."cost" add column "radius" integer
 not null;

alter table "delivery"."cost" rename to "details";

CREATE FUNCTION public.restaurant_delivery_details(restaurant_row restaurant."restaurant")
 RETURNS delivery.details
 LANGUAGE sql
 STABLE
AS $$
    SELECT *
    FROM delivery.details d
    WHERE d.service_provider_id = (
	    CASE
		WHEN restaurant_row.self_delivery = true THEN restaurant_row.id
		ELSE (
			SELECT delivery_company_id 
			FROM service_provider.delivery_partner p 
			WHERE p.service_provider_id = restaurant_row.id AND p.service_provider_type = 'restaurant'
		)
	    END
    )
    AND d.service_provider_type = (
	    CASE
		WHEN restaurant_row.self_delivery = true THEN 'restaurant'
		ELSE 'delivery_company'
	    END
    )
$$;

alter table "restaurant"."restaurant" add column "delivery" boolean
 not null default 'true';

alter table "restaurant"."restaurant" add column "customer_pickup" boolean
 not null default 'true';

comment on column "restaurant"."restaurant"."delivery" is E'delivery on or off';

comment on column "restaurant"."restaurant"."customer_pickup" is E'pickup on or off';

alter table "restaurant"."restaurant" add column "creation_time" timestamptz
 not null default now();

alter table "public"."user" add column "creation_time" timestamptz
 not null default now();

alter table "delivery"."details" drop column "location" cascade;

alter table "delivery"."company" add column "creation_time" timestamptz
 not null default now();

alter table "restaurant"."order" rename column "order_type" to "delivery_type";

CREATE FUNCTION restaurant.fetch_restaurants(location geography(Point), radius double precision)
    RETURNS SETOF restaurant.restaurant 
    LANGUAGE sql 
    STABLE 
AS $$
    SELECT *
    FROM restaurant.restaurant r
    WHERE ST_Distance(r.location_gps, location) <= radius
$$;

CREATE FUNCTION delivery.fetch_delivery_company(location geography(Point), radius double precision)
    RETURNS SETOF delivery.company 
    LANGUAGE sql 
    STABLE 
AS $$
    SELECT *
    FROM delivery.company c
    WHERE ST_Distance(c.location, location) <= radius
$$;


ALTER TABLE "delivery"."details" ALTER COLUMN "radius" TYPE integer;
comment on column "delivery"."details"."radius" is E'in metres';

alter table "delivery"."details" alter column "radius" set default '0';

alter table "delivery"."details" add column "location" geography
 not null;

alter table "delivery"."company" drop column "location" cascade;

alter table "delivery"."company" drop column "delivery_radius" cascade;

alter table "delivery"."details" rename column "location" to "location_gps";

alter table "delivery"."details" add column "location_text" text
 null;

alter table "restaurant"."restaurant" drop column "location_gps" cascade;

alter table "restaurant"."restaurant" drop column "location_text" cascade;

CREATE FUNCTION public.restaurant_location_gps(restaurant_row restaurant.restaurant)
    RETURNS geography
    LANGUAGE sql 
    STABLE 
AS $$
    SELECT location_gps
    FROM delivery.details d
    WHERE d.service_provider_id = restaurant_row.id AND d.service_provider_type = 'restaurant';
$$;

CREATE FUNCTION public.restaurant_location_text(restaurant_row restaurant.restaurant)
    RETURNS varchar
    LANGUAGE sql 
    STABLE 
AS $$
    SELECT location_text
    FROM delivery.details d
    WHERE d.service_provider_id = restaurant_row.id AND d.service_provider_type = 'restaurant';
$$;

alter table "restaurant"."order" drop constraint "restaurant_order_restaurant_id_fkey",
  add constraint "order_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."operator" drop constraint "restaurant_operator_restaurant_id_fkey",
  add constraint "operator_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete cascade;


alter table "delivery"."company" add column "delivery_details_id" integer
 not null;

alter table "delivery"."company"
  add constraint "company_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update cascade on delete cascade;

alter table "restaurant"."restaurant" add column "delivery_details_id" integer
 not null;

alter table "restaurant"."restaurant"
  add constraint "restaurant_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update cascade on delete cascade;

CREATE TABLE "public"."location" ("id" serial NOT NULL, "gps" geography NOT NULL, "address" text, "service_provider_id" integer NOT NULL, "service_provider_type" text NOT NULL, PRIMARY KEY ("id") );

ALTER table "location" set schema service_provider;

alter table "delivery"."details" drop column "location_text" cascade;

alter table "delivery"."details" drop column "location_gps" cascade;



alter table "restaurant"."order_item" drop constraint "restaurant_order_item_restaurant_item_id_fkey",
  add constraint "order_item_restaurant_item_id_fkey"
  foreign key ("restaurant_item_id")
  references "restaurant"."item"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."cart" drop constraint "restaurant_cart_restaurant_id_fkey",
  add constraint "cart_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."restaurant" alter column "delivery_details_id" drop not null;

CREATE FUNCTION restaurant.location(restaurant_row restaurant.restaurant)
 RETURNS service_provider.location
 LANGUAGE sql
 STABLE
AS $function$
    SELECT *
    FROM service_provider.location l
    WHERE l.service_provider_id = restaurant_row.id
    AND l.service_provider_type = 'restaurant'
$function$;

CREATE OR REPLACE FUNCTION restaurant.fetch_restaurants(location geography, radius double precision)
 RETURNS SETOF restaurant.restaurant
 LANGUAGE sql
 STABLE
AS $function$
    SELECT *
    FROM restaurant.restaurant r
    WHERE ST_Distance((SELECT gps FROM restaurant.location(r)), location) <= radius
$function$;

CREATE OR REPLACE FUNCTION restaurant.fetch_restaurants(location geography, radius double precision)
 RETURNS SETOF restaurant.restaurant
 LANGUAGE sql
 STABLE
AS $function$
    SELECT *
    FROM restaurant.restaurant r
    WHERE ST_Distance((SELECT gps FROM restaurant.location(r)), location) <= radius
$function$;

CREATE OR REPLACE FUNCTION delivery.fetch_delivery_company(location geography, radius double precision)
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
        WHERE l.service_provider_id = c.id 
        AND l.service_provider_type = 'delivery_company'
    ), location) <= radius
$function$;

CREATE FUNCTION delivery.get_delivery_companies(location geography)
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
        WHERE l.service_provider_id = c.id 
        AND l.service_provider_type = 'delivery_company'
    ), location) <= 
    (
        SELECT radius 
        FROM delivery.details d
        WHERE d.service_provider_id = c.id 
        AND d.service_provider_type = 'delivery_company'
    )
$function$;

CREATE FUNCTION restaurant.get_restaurants(location geography)
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
        WHERE l.service_provider_id = r.id 
        AND l.service_provider_type = 'restaurant'
    ), location) <= 
    (
        SELECT radius 
        FROM delivery.details d
        WHERE d.service_provider_id = r.id 
        AND d.service_provider_type = 'restaurant'
    )
$function$;


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


alter table "restaurant"."restaurant" add constraint "restaurant_location_id_key" unique ("location_id");

alter table "restaurant"."restaurant" add constraint "restaurant_delivery_details_id_key" unique ("delivery_details_id");

alter table "delivery"."company" add constraint "company_location_id_key" unique ("location_id");

alter table "delivery"."company" add constraint "company_delivery_details_id_key" unique ("delivery_details_id");

ALTER TABLE "restaurant"."restaurant" ALTER COLUMN "schedule" drop default;


alter table "service_provider"."subscriber"
  add constraint "subscriber_customer_id_fkey"
  foreign key ("customer_id")
  references "customer"."customer"
  ("user_id") on update restrict on delete cascade;

alter table "service_provider"."location" alter column "address" set not null;

comment on column "service_provider"."post"."likes" is E'Array of customerIds';

comment on column "service_provider"."post"."comments" is E'Array of { message, date, Array of customerIds }';

CREATE TABLE "restaurant"."favourited_item" ("id" serial NOT NULL, "customer_id" integer NOT NULL, "restaurant_id" integer NOT NULL, "restaurant_item_id" integer NOT NULL, PRIMARY KEY ("id") );

alter table "restaurant"."favourited_item"
  add constraint "favourited_item_customer_id_fkey"
  foreign key ("customer_id")
  references "customer"."customer"
  ("user_id") on update restrict on delete cascade;

alter table "restaurant"."favourited_item"
  add constraint "favourited_item_restaurant_item_id_fkey"
  foreign key ("restaurant_item_id")
  references "restaurant"."item"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."favourited_item"
  add constraint "favourited_item_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete cascade;

ALTER TABLE restaurant.favourited_item SET SCHEMA customer;


alter table "restaurant"."restaurant" add column "phone_number" text
 null;

alter table "restaurant"."operator" add column "online" boolean
 not null default 'true';

alter table "public"."chat" alter column "chat_type" set default 'service';

comment on column "public"."chat"."chat_type" is E'service, direct, group';

alter table "public"."chat" alter column "chat_type" set default 'group';
comment on column "public"."chat"."chat_type" is E'direct, group';

alter table "public"."mez_admin" add column "online" boolean
 not null default 'true';

alter table "public"."mez_admin" drop column "online" cascade;

alter table "public"."notification_info" add column "turn_off_notifications" boolean
 not null default 'false';

DROP FUNCTION public.mez_admin_notification_token;
CREATE OR REPLACE FUNCTION public.mez_admin_notification_info(mez_admin_row mez_admin)
 RETURNS notification_info
 LANGUAGE sql
 STABLE
AS $function$
    SELECT *
    FROM notification_info n
    WHERE n.user_id = mez_admin_row.user_id
    AND n.app_type_id = 'mez_admin';
$function$;

alter table "public"."mez_admin" add column "app_typ_id" text
 not null default 'mez_admin';

DROP FUNCTION public.mez_admin_notification_info;

alter table "public"."mez_admin" rename column "app_typ_id" to "app_type_id";

DROP FUNCTION public.customer_notification_token;

alter table "customer"."customer" add column "app_type_id" text
 not null default 'customer';

DROP FUNCTION public.restaurant_operator_notification_token;

alter table "restaurant"."operator" add column "app_type_id" text
 not null default 'restaurant';

alter table "delivery"."driver" add column "app_type_id" Text
 not null default 'delivery';

DROP FUNCTION public.driver_notification_token;

alter table "delivery"."driver" drop column "notification_info_id" cascade;

alter table "delivery"."operator" add column "app_type_id" text
 not null default 'delivery_admin';

DROP FUNCTION public.deliop_notification_token;

alter table "public"."chat" drop column "agora_info" cascade;


create schema "laundry";

CREATE TABLE "laundry"."store" ("id" serial NOT NULL, "name" text NOT NULL, "image" text NOT NULL, "description_id" integer NOT NULL, "open_status" text NOT NULL DEFAULT 'closed', "language_id" text NOT NULL DEFAULT 'en', "approved" boolean NOT NULL DEFAULT false, "self_delivery" boolean NOT NULL DEFAULT false, "creation_time" timestamptz NOT NULL DEFAULT now(), "location_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("description_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("location_id") REFERENCES "service_provider"."location"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("location_id"));

CREATE TABLE "laundry"."order" ("id" serial NOT NULL, "customer_id" integer NOT NULL, "store_id" integer NOT NULL, "payment_type" text NOT NULL DEFAULT 'Cash', "estimated_ready_time" timestamptz, "actual_ready_time" timestamptz, "from_customer_delivery_id" integer, "to_customer_delivery_id" integer, "status" text NOT NULL, "review_id" integer, "delivery_type" text NOT NULL DEFAULT 'delivery', "order_time" timestamptz NOT NULL DEFAULT now(), "notes" text, "delivery_cost" money NOT NULL DEFAULT 0, "customer_location_gps" geography, "customer_address" text, PRIMARY KEY ("id") , FOREIGN KEY ("store_id") REFERENCES "laundry"."store"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("customer_id") REFERENCES "customer"."customer"("user_id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("from_customer_delivery_id") REFERENCES "delivery"."order"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("to_customer_delivery_id") REFERENCES "delivery"."order"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("review_id") REFERENCES "public"."review"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "laundry"."type" ("id" serial NOT NULL, "name_id" integer NOT NULL, "store_id" integer NOT NULL, "cost_by_kilo" money NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("store_id") REFERENCES "laundry"."store"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("name_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "laundry"."order_type" ("id" serial NOT NULL, "type_id" integer NOT NULL, "weight_in_kilo" float8 NOT NULL, "order_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("type_id") REFERENCES "laundry"."type"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("order_id") REFERENCES "laundry"."order"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "laundry"."operator" ("id" integer NOT NULL, "user_id" integer NOT NULL, "store_id" integer NOT NULL, "status" text NOT NULL DEFAULT 'awaiting_approval', "owner" boolean NOT NULL DEFAULT false, "app_version" text, "current_gps" geography, "delivery_driver_type" text NOT NULL DEFAULT 'laundry_operator', "online" boolean NOT NULL DEFAULT true, "app_type_id" text NOT NULL DEFAULT 'laundry', PRIMARY KEY ("id") , FOREIGN KEY ("store_id") REFERENCES "laundry"."store"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("user_id"));

alter table "laundry"."order" add column "chat_id" integer
 null;

alter table "laundry"."order"
  add constraint "order_chat_id_fkey"
  foreign key ("chat_id")
  references "public"."chat"
  ("id") on update restrict on delete restrict;

alter table "laundry"."store" add column "phone_number" text
 null;

alter table "laundry"."store" add column "payment_type" text
 not null default 'Cash';

alter table "laundry"."store" drop column "payment_type" cascade;

alter table "laundry"."store" add column "schedule" jsonb
 null;

alter table "laundry"."store" add column "stripe_info" jsonb
 null;

alter table "laundry"."store" add column "accepted_payments" jsonb
 null;

alter table "laundry"."store" add column "delivery" boolean
 not null default 'true';

alter table "laundry"."store" add column "customer_pickup" boolean
 not null default 'true';

alter table "laundry"."store" add column "delivery_details_id" integer
 not null unique;

alter table "laundry"."store"
  add constraint "store_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update restrict on delete restrict;

alter table "laundry"."store" drop constraint "store_delivery_details_id_fkey",
  add constraint "store_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update restrict on delete cascade;

alter table "laundry"."type" rename to "category";

alter table "laundry"."order_type" rename to "order_category";

alter table "laundry"."order" add column "firebase_id" text
 null unique;

alter table "laundry"."order" add column "customer_app_type" text
 not null default 'native';

alter table "laundry"."order" add column "cancellation_time" timestamptz
 null;

alter table "laundry"."order" add column "tax" money
 not null default '0';

alter table "laundry"."category" add column "position" integer
 not null default '1';

alter table "laundry"."order" add column "refund_amount" money
 not null default '0';

alter table "laundry"."order" add column "scheduled_time" timestamptz
 null;

alter table "laundry"."order" add column "stripe_info" jsonb
 null;

alter table "laundry"."order" add column "stripe_fees" money
 not null default '0';

alter table "laundry"."order" add column "discount_value" money
 not null default '0';

alter table "laundry"."store" alter column "delivery_details_id" drop not null;

alter table "laundry"."order_category" rename column "type_id" to "category_id";


alter table "laundry"."order_category" alter column "weight_in_kilo" drop not null;

alter table "laundry"."store" add column "service_provider_type" text
 not null default 'laundry';


alter table "laundry"."operator" alter column "id" set default nextval('laundry.type_id_seq'::regclass);

CREATE SEQUENCE laundry.op_seq
  MINVALUE 1
  
  START WITH 1
  INCREMENT BY 1;

alter table "laundry"."operator" alter column "id" set default nextval('laundry.op_seq'::regclass);

CREATE OR REPLACE FUNCTION public.laundry_in_process(order_row laundry."order")
 RETURNS boolean
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.status != 'delivered' AND order_row.status != 'cancelledByCustomer' AND order_row.status != 'cancelledByAdmin' 
$function$;

CREATE OR REPLACE FUNCTION laundry.order_in_process(order_row laundry."order")
 RETURNS boolean
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.status != 'delivered' AND order_row.status != 'cancelledByCustomer' AND order_row.status != 'cancelledByAdmin' 
$function$;


alter table "laundry"."store" add column "normal_delivery_time" integer
 not null default '1';

comment on column "laundry"."store"."normal_delivery_time" is E'in days';


alter table "service_provider"."delivery_partner"
  add constraint "delivery_partner_delivery_company_id_fkey"
  foreign key ("delivery_company_id")
  references "delivery"."company"
  ("id") on update restrict on delete cascade;

alter table "laundry"."store" alter column "description_id" drop not null;

CREATE FUNCTION laundry.itemscost(order_row laundry."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT SUM(oc.weight_in_kilo * c.cost_by_kilo)
    FROM laundry.order_category oc
    INNER JOIN laundry.category c
    ON oc.category_id = c.id
    WHERE order_id = order_row.id;
$function$;

CREATE FUNCTION laundry.totalCost(order_row laundry."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.delivery_cost  - order_row.refund_amount + order_row.stripe_fees - order_row.discount_value
    
$function$;

CREATE OR REPLACE FUNCTION laundry.totalcost(order_row laundry."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.delivery_cost + laundry.itemsCost(order_row) - order_row.refund_amount + order_row.stripe_fees - order_row.discount_value
    
$function$;


alter table "delivery"."order" alter column "service_provider_id" set not null;

alter table "delivery"."order" alter column "service_provider_type" set not null;

CREATE OR REPLACE FUNCTION public.laundry_delivery_details(laundry_row laundry.store)
 RETURNS delivery.details
 LANGUAGE sql
 STABLE
AS $function$
    SELECT *
    FROM delivery.details d
    WHERE d.id = (
	    CASE
		WHEN laundry_row.self_delivery = true THEN laundry_row.delivery_details_id
		ELSE (
			SELECT delivery_details_id 
			FROM delivery.company c
			WHERE c.id = (
			    SELECT delivery_company_id
			    FROM service_provider.delivery_partner p 
			    WHERE p.service_provider_id = laundry_row.id AND p.service_provider_type = 'laundry'
			)
		)
	    END
    )
$function$;

alter table "laundry"."order" alter column "delivery_cost" set default '$0.00'::money;


CREATE TABLE "service_provider"."details" ("id" serial NOT NULL, "service_provider_type" text NOT NULL, "name" text NOT NULL, "image" text NOT NULL, "description_id" integer, "firebase_id" text, "open_status" text NOT NULL DEFAULT 'closed_indefinitely', "language_id" text NOT NULL DEFAULT 'en', "approved" boolean NOT NULL DEFAULT false, "delivery" boolean NOT NULL DEFAULT true, "customer_pickup" boolean NOT NULL DEFAULT true, "self_delivery" boolean NOT NULL DEFAULT false, "creation_time" timestamptz NOT NULL DEFAULT now(), "schedule" jsonb, "stripe_info" jsonb, "accepted_payments" jsonb, "delivery_details_id" integer, "location_id" integer NOT NULL, "phone_number" text, PRIMARY KEY ("id") , UNIQUE ("firebase_id"), UNIQUE ("delivery_details_id"), UNIQUE ("location_id"));

alter table "service_provider"."details" drop column "service_provider_type" cascade;

CREATE TABLE "service_provider"."operator_details" ("id" serial NOT NULL, "user_id" integer NOT NULL, "status" text NOT NULL DEFAULT 'awaiting_approval', "owner" boolean NOT NULL DEFAULT false, "app_version" text, "current_gps" geography, "delivery_driver_type" text NOT NULL, "online" boolean NOT NULL DEFAULT true, "app_type_id" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("user_id"));

alter table "service_provider"."details"
  add constraint "details_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."details"
  add constraint "details_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "service_provider"."details"
  add constraint "details_location_id_fkey"
  foreign key ("location_id")
  references "service_provider"."location"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."operator_details"
  add constraint "operator_details_user_id_fkey"
  foreign key ("user_id")
  references "public"."user"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."details" add column "service_provider_type" text
 not null;

alter table "restaurant"."restaurant" add column "details_id" integer
 not null;

alter table "restaurant"."restaurant"
  add constraint "restaurant_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."details"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."restaurant" add constraint "restaurant_details_id_key" unique ("details_id");

alter table "laundry"."order" drop constraint "order_store_id_fkey",
  add constraint "order_store_id_fkey"
  foreign key ("store_id")
  references "laundry"."store"
  ("id") on update restrict on delete cascade;

alter table "laundry"."category" drop constraint "type_store_id_fkey",
  add constraint "category_store_id_fkey"
  foreign key ("store_id")
  references "laundry"."store"
  ("id") on update restrict on delete cascade;

alter table "laundry"."operator" drop constraint "operator_store_id_fkey",
  add constraint "operator_store_id_fkey"
  foreign key ("store_id")
  references "laundry"."store"
  ("id") on update restrict on delete cascade;

alter table "laundry"."order_category" drop constraint "order_type_order_id_fkey",
  add constraint "order_category_order_id_fkey"
  foreign key ("order_id")
  references "laundry"."order"
  ("id") on update restrict on delete cascade;

alter table "laundry"."order_category" drop constraint "order_type_type_id_fkey",
  add constraint "order_category_category_id_fkey"
  foreign key ("category_id")
  references "laundry"."category"
  ("id") on update restrict on delete cascade;

alter table "laundry"."store" add column "details_id" integer
 not null unique;

alter table "laundry"."store"
  add constraint "store_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."details"
  ("id") on update restrict on delete restrict;

alter table "delivery"."company" add column "details_id" integer
 not null unique;

alter table "delivery"."company"
  add constraint "company_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."details"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."operator" add column "details_id" integer
 not null unique;

alter table "restaurant"."operator"
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete restrict;

alter table "laundry"."operator" add column "details_id" integer
 not null unique;

alter table "laundry"."operator"
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete restrict;

alter table "delivery"."operator" add column "details_id" integer
 not null unique;

alter table "delivery"."operator"
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."restaurant" drop constraint "restaurant_delivery_details_id_fkey";

alter table "restaurant"."restaurant" drop column "delivery_details_id" cascade;

alter table "restaurant"."restaurant" drop column "phone_number" cascade;

alter table "restaurant"."restaurant" drop constraint "restaurant_location_id_fkey";

alter table "restaurant"."restaurant" drop column "location_id" cascade;

alter table "restaurant"."restaurant" drop column "creation_time" cascade;

alter table "restaurant"."restaurant" drop column "customer_pickup" cascade;

alter table "restaurant"."restaurant" drop column "delivery" cascade;

alter table "restaurant"."restaurant" drop column "accepted_payments" cascade;

alter table "restaurant"."restaurant" drop column "stripe_info" cascade;

alter table "restaurant"."restaurant" drop column "schedule" cascade;

alter table "restaurant"."restaurant" drop column "self_delivery" cascade;

alter table "restaurant"."restaurant" drop column "approved" cascade;

alter table "restaurant"."restaurant" drop column "language_id" cascade;

alter table "restaurant"."restaurant" drop column "open_status" cascade;

alter table "restaurant"."restaurant" drop column "firebase_id" cascade;

alter table "restaurant"."restaurant" drop column "description_id" cascade;

alter table "restaurant"."restaurant" drop column "image" cascade;

alter table "restaurant"."restaurant" drop column "name" cascade;

alter table "laundry"."store" drop constraint "store_delivery_details_id_key";

alter table "laundry"."store" drop constraint "store_location_id_key";

alter table "laundry"."store" drop constraint "store_delivery_details_id_fkey";

alter table "laundry"."store" drop constraint "store_description_id_fkey";

alter table "laundry"."store" drop constraint "store_location_id_fkey";

alter table "laundry"."store" drop column "delivery_details_id" cascade;

alter table "laundry"."store" drop column "customer_pickup" cascade;

alter table "laundry"."store" drop column "delivery" cascade;

alter table "laundry"."store" drop column "accepted_payments" cascade;

alter table "laundry"."store" drop column "stripe_info" cascade;

alter table "laundry"."store" drop column "name" cascade;

alter table "laundry"."store" drop column "image" cascade;

alter table "laundry"."store" drop column "description_id" cascade;

alter table "laundry"."store" drop column "open_status" cascade;

alter table "laundry"."store" drop column "language_id" cascade;

alter table "laundry"."store" drop column "approved" cascade;

alter table "laundry"."store" drop column "self_delivery" cascade;

alter table "laundry"."store" drop column "creation_time" cascade;

alter table "laundry"."store" drop column "location_id" cascade;

alter table "laundry"."store" drop column "phone_number" cascade;

alter table "laundry"."store" drop column "schedule" cascade;

alter table "delivery"."company" drop constraint "company_delivery_details_id_fkey";

alter table "delivery"."company" drop constraint "company_location_id_fkey";

alter table "delivery"."company" drop constraint "delivery_company_description_id_fkey";

alter table "delivery"."company" drop column "location_id" cascade;

ALTER TABLE delivery.company DROP COLUMN delivery_details_id, DROP COLUMN creation_time;

ALTER TABLE delivery.company 
    DROP COLUMN name,
    DROP COLUMN image,
    DROP COLUMN open_status,
    DROP COLUMN approved,
    DROP COLUMN description_id;

ALTER TABLE restaurant.operator 
    DROP COLUMN status,
    DROP COLUMN owner,
    DROP COLUMN app_version,
    DROP COLUMN current_gps,
    DROP COLUMN online,
    DROP COLUMN app_type_id;

ALTER TABLE laundry.operator 
    DROP COLUMN status,
    DROP COLUMN owner,
    DROP COLUMN app_version,
    DROP COLUMN current_gps,
    DROP COLUMN online,
    DROP COLUMN app_type_id;

ALTER TABLE delivery.operator 
    DROP COLUMN status,
    DROP COLUMN owner,
    DROP COLUMN app_version,
    DROP COLUMN current_gps,
    DROP COLUMN app_type_id;

alter table "service_provider"."operator_details"
  add constraint "operator_details_app_type_id_fkey"
  foreign key ("app_type_id")
  references "public"."app_type"
  ("id") on update restrict on delete restrict;

alter table "delivery"."details" add column "delivery_available" boolean
 not null default 'true';

alter table "delivery"."details" add column "customer_pickup" boolean
 not null default 'true';

alter table "delivery"."details" add column "self_delivery" boolean
 not null default 'false';

alter table "service_provider"."details" drop column "delivery" cascade;

alter table "service_provider"."details" drop column "customer_pickup" cascade;

alter table "service_provider"."details" drop column "self_delivery" cascade;

CREATE TABLE "customer"."stripe_info" ("id" serial NOT NULL, "customer_id" integer NOT NULL, "sp_id" integer NOT NULL, "stripe_id" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("customer_id") REFERENCES "customer"."customer"("user_id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("sp_id") REFERENCES "service_provider"."details"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("customer_id", "sp_id"));

BEGIN TRANSACTION;
ALTER TABLE "customer"."stripe_info" DROP CONSTRAINT "stripe_info_pkey";

ALTER TABLE "customer"."stripe_info"
    ADD CONSTRAINT "stripe_info_pkey" PRIMARY KEY ("stripe_id");
COMMIT TRANSACTION;

alter table "customer"."stripe_info" drop column "id" cascade;

CREATE TABLE "customer"."stripe_cards" ("card_id" text NOT NULL, "customer_id" integer NOT NULL, "sp_card_ids" jsonb, PRIMARY KEY ("card_id") , FOREIGN KEY ("customer_id") REFERENCES "customer"."customer"("user_id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "service_provider"."stripe_info" ("sp_id" integer NOT NULL, "stripe_id" text NOT NULL, "status" text NOT NULL, "charge_fees_on_customer" boolean, "charges_enabled" boolean NOT NULL, "payouts_enabled" boolean NOT NULL, "details_submitted" boolean NOT NULL, "requirements" text, "email" text, PRIMARY KEY ("sp_id") , FOREIGN KEY ("sp_id") REFERENCES "service_provider"."details"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("stripe_id"));

alter table "service_provider"."details" drop column "language_id" cascade;

alter table "service_provider"."details" add column "language" jsonb
 not null;

alter table "service_provider"."details" alter column "language" set default '{     "en": true,     "es": true }';
comment on column "service_provider"."details"."language" is E'Record <language_id, bool>';

alter table "delivery"."order"
  add constraint "order_delivery_driver_id_fkey"
  foreign key ("delivery_driver_id")
  references "delivery"."driver"
  ("id") on update restrict on delete restrict;

alter table "delivery"."order" drop column "delivery_driver_type" cascade;

CREATE OR REPLACE FUNCTION public.delivery_in_process(order_row delivery."order")
 RETURNS boolean
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.status = 'orderReceived' OR order_row.status = 'packageReady' OR order_row.status = 'atPickup' OR order_row.status = 'onTheWayToDropoff'OR order_row.status = 'onTheWayToPickup' OR order_row.status = 'atDropoff'
$function$;


alter table "service_provider"."details" add column "service_link_id" integer
 null;

alter table "service_provider"."details"
  add constraint "details_service_link_id_fkey"
  foreign key ("service_link_id")
  references "service_provider"."service_link"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."details" add constraint "details_service_link_id_key" unique ("service_link_id");

alter table "service_provider"."service_link" drop column "service_provider_id" cascade;

alter table "service_provider"."service_link" drop column "service_provider_type" cascade;

alter table "service_provider"."details" drop column "stripe_info" cascade;

alter table "service_provider"."delivery_partner" drop column "service_provider_type" cascade;

alter table "service_provider"."delivery_partner"
  add constraint "delivery_partner_service_provider_id_fkey"
  foreign key ("service_provider_id")
  references "service_provider"."details"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."operator_details" drop column "delivery_driver_type" cascade;

alter table "service_provider"."details" alter column "delivery_details_id" set not null;

alter table "restaurant"."operator" drop constraint "operator_details_id_fkey",
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."operator" drop constraint "operator_details_id_fkey",
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update cascade on delete cascade;

alter table "delivery"."operator" drop constraint "operator_details_id_fkey",
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete cascade;

alter table "service_provider"."stripe_info" alter column "details_submitted" set default 'false';

alter table "service_provider"."stripe_info" alter column "payouts_enabled" set default 'false';

alter table "service_provider"."stripe_info" alter column "charges_enabled" set default 'false';

CREATE
OR REPLACE VIEW "delivery"."order_public" AS
SELECT
  "order".id AS restaurant_id,
  "order".review_id,
  "order".order_time,
  "order".estimated_food_ready_time,
  "order".actual_food_ready_time,
  "order".customer_id,
  "order".status
FROM
  restaurant."order";


alter table "service_provider"."details" drop column "delivery_details_id" cascade;

alter table "restaurant"."restaurant" add column "delivery_details_id" integer
 not null unique;

alter table "restaurant"."restaurant"
  add constraint "restaurant_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update restrict on delete restrict;

alter table "laundry"."store" add column "delivery_details_id" integer
 not null unique;

alter table "laundry"."store"
  add constraint "store_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update restrict on delete restrict;

alter table "delivery"."company" add column "delivery_details_id" integer
 not null unique;

alter table "delivery"."company"
  add constraint "company_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."delivery_partner" add column "service_provider_type" text
 not null;

CREATE OR REPLACE FUNCTION public.laundry_delivery_details(laundry_row laundry.store)
 RETURNS delivery.details
 LANGUAGE sql
 STABLE
AS $function$
    SELECT *
    FROM delivery.details d
   
$function$;


CREATE TABLE "customer"."minimal_order" ("id" integer NOT NULL, "order_type" text NOT NULL, "status" text NOT NULL, "in_process" boolean NOT NULL, "order_time" timestamptz NOT NULL, "total_cost" money NOT NULL, "service_provider_name" text NOT NULL, "service_provider_image" text NOT NULL, PRIMARY KEY ("id","order_type") );

alter table "customer"."minimal_order" rename column "service_provider_name" to "name";

alter table "customer"."minimal_order" rename column "service_provider_image" to "image";

alter table "customer"."minimal_order" add column "payment_type" text
 not null;


CREATE FUNCTION customer.minimal_orders(customer_id int) 
RETURNS SETOF customer.minimal_order 
LANGUAGE sql 
STABLE 
AS $$
    WITH 
    ro AS (
        SELECT 
            id, 
            'restaurant' AS order_type, 
            status, 
            public.in_process(r) as in_process,
            order_time, 
            public.totalcost(r) as total_cost,
            (SELECT name 
                FROM service_provider.details d 
                WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
            ),
            (SELECT image 
                FROM service_provider.details d 
                WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
            ),
            payment_type
        FROM restaurant.order r),
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
            payment_type
        FROM  laundry.order l)
    SELECT * from ro UNION select * from lo
$$;

alter table "service_provider"."details" alter column "language" set default '"{en: true, es: true}"';

alter table "service_provider"."details" alter column "language" set default '{"en": true, "es": true}'::jsonb;



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
        WHERE l.id = (SELECT location_id FROM service_provider.details d WHERE d.id = c.details_id)
    ), location) <= 
    (
        SELECT radius 
        FROM delivery.details d
        WHERE d.id = c.delivery_details_id
    )
$function$;

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
        WHERE l.id = (SELECT location_id FROM service_provider.details d WHERE d.id = c.details_id)
    ), location) <= 
    (
        SELECT radius 
        FROM delivery.details d
        WHERE d.id = c.delivery_details_id
    )
$function$;

alter table "service_provider"."details" alter column "language" set default '"{\"en\":true,\"es\":true}"';

alter table "public"."notification_info" drop constraint "notification_info_user_id_app_type_id_key";


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
    		WHEN (SELECT self_delivery FROM delivery.details i WHERE r.delivery_details_id = i.id) = true 
    		THEN (SELECT location_id FROM service_provider.details d WHERE r.details_id = d.id)
    		ELSE (
    			SELECT location_id 
    			FROM service_provider.details e
    			WHERE e.id = (
    			    SELECT details_id
    			    FROM delivery.company c
    			    WHERE c.id = (
    			        SELECT delivery_company_id
        			    FROM service_provider.delivery_partner p 
        			    WHERE p.service_provider_id = r.id AND p.service_provider_type = 'restaurant'
    			    )
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
    		WHEN (SELECT self_delivery FROM delivery.details i WHERE r.delivery_details_id = i.id) = true THEN r.delivery_details_id 
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
    		WHEN (SELECT self_delivery FROM delivery.details i WHERE r.delivery_details_id = i.id) = true 
    		THEN (SELECT location_id FROM service_provider.details d WHERE r.details_id = d.id)
    		ELSE (
    			SELECT location_id 
    			FROM service_provider.details e
    			WHERE e.id = (
    			    SELECT details_id
    			    FROM delivery.company c
    			    WHERE c.id = (
    			        SELECT delivery_company_id
        			    FROM service_provider.delivery_partner p 
        			    WHERE p.service_provider_id = r.id AND p.service_provider_type = 'restaurant'
    			    )
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
    		WHEN (SELECT self_delivery FROM delivery.details i WHERE r.delivery_details_id = i.id) = true THEN r.delivery_details_id 
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


CREATE OR REPLACE FUNCTION public.restaurant_delivery_details(restaurant_row restaurant.restaurant)
 RETURNS delivery.details
 LANGUAGE sql
 STABLE
AS $function$
    SELECT *
    FROM delivery.details d
    WHERE d.id = (
	    CASE
		WHEN (SELECT self_delivery FROM delivery.details i WHERE restaurant_row.delivery_details_id = i.id) = true 
		    THEN restaurant_row.delivery_details_id
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

CREATE OR REPLACE FUNCTION public.laundry_delivery_details(laundry_row laundry.store)
 RETURNS delivery.details
 LANGUAGE sql
 STABLE
AS $function$
    SELECT *
    FROM delivery.details d
    WHERE d.id = (
	    CASE
		WHEN (SELECT self_delivery FROM delivery.details i WHERE laundry_row.delivery_details_id = i.id) = true 
		    THEN laundry_row.delivery_details_id
		ELSE (
			SELECT delivery_details_id 
			FROM delivery.company c
			WHERE c.id = (
			    SELECT delivery_company_id
			    FROM service_provider.delivery_partner p 
			    WHERE p.service_provider_id = laundry_row.id AND p.service_provider_type = 'laundry'
			)
		)
	    END
    )
$function$;


alter table "customer"."minimal_order" add column "delivery_cost" money
 null;

alter table "customer"."minimal_order" add column "address" text
 null;

alter table "customer"."minimal_order" rename column "address" to "to_address";

alter table "customer"."minimal_order" drop column "delivery_cost" cascade;

alter table "customer"."minimal_order" add column "delivery_cost" money
 not null default '0';

CREATE OR REPLACE FUNCTION customer.minimal_orders(customer_id integer)
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
            public.totalcost(r) as total_cost,
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
            delivery_cost
        FROM restaurant.order r),
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
            delivery_cost
        FROM  laundry.order l)
    SELECT * from ro UNION select * from lo
$function$;


alter table "customer"."minimal_order" add column "customer_id" integer
 not null;

CREATE OR REPLACE FUNCTION customer.minimal_orders(customer_id integer)
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
            public.totalcost(r) as total_cost,
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
        FROM restaurant.order r),
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
        FROM  laundry.order l)
    SELECT * from ro UNION select * from lo
$function$;


CREATE OR REPLACE FUNCTION customer.minimal_orders(customer_id integer)
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
            public.totalcost(r) as total_cost,
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
        FROM restaurant.order r),
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
        FROM  laundry.order l)
    SELECT * from ro UNION select * from lo
$function$;

CREATE OR REPLACE FUNCTION customer.minimal_orders(customer_id integer)
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
            public.totalcost(r) as total_cost,
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
        WHERE r.customer_id = customer_id),
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
        WHERE l.customer_id = customer_id)
    SELECT * from ro UNION select * from lo
$function$;

DROP FUNCTION customer.minimal_orders;
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
            public.totalcost(r) as total_cost,
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


alter table "service_provider"."stripe_info" add column "id" serial
 not null;

alter table "service_provider"."stripe_info" drop constraint "stripe_info_pkey";

alter table "service_provider"."stripe_info"
    add constraint "stripe_info_pkey"
    primary key ("id");

alter table "service_provider"."details" add column "stripe_id" integer
 null;

alter table "service_provider"."details"
  add constraint "details_stripe_id_fkey"
  foreign key ("stripe_id")
  references "service_provider"."stripe_info"
  ("id") on update restrict on delete cascade;

alter table "service_provider"."stripe_info" drop constraint "stripe_info_sp_id_fkey";

alter table "service_provider"."stripe_info" drop column "sp_id" cascade;


alter table "delivery"."company" alter column "service_provider_type" set default 'deliveryCompany'::text;

alter table "customer"."customer" add column "stripe_id" text
 null;

alter table "customer"."stripe_info" rename to "stripe_sp_id";

alter table "customer"."stripe_sp_id" add column "id" serial
 not null;

BEGIN TRANSACTION;
ALTER TABLE "customer"."stripe_sp_id" DROP CONSTRAINT "stripe_info_pkey";

ALTER TABLE "customer"."stripe_sp_id"
    ADD CONSTRAINT "stripe_info_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;

alter table "customer"."stripe_cards" add column "id" serial
 not null;

BEGIN TRANSACTION;
ALTER TABLE "customer"."stripe_cards" DROP CONSTRAINT "stripe_cards_pkey";

ALTER TABLE "customer"."stripe_cards"
    ADD CONSTRAINT "stripe_cards_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;

comment on column "customer"."stripe_cards"."sp_card_ids" is E'Record<sp_details_id, card_sp_id>';

alter table "customer"."stripe_cards" add column "last4" text
 null;

alter table "customer"."stripe_cards" rename column "last4" to "last_4";

alter table "customer"."stripe_cards" add column "brand" text
 null;

alter table "customer"."stripe_cards" add column "exp_month" text
 null;

alter table "customer"."stripe_cards" add column "exp_year" integer
 null;

alter table "customer"."stripe_cards" drop column "exp_month" cascade;

alter table "customer"."stripe_cards" add column "exp_month" integer
 null;

alter table "customer"."customer" drop column "stripe_info" cascade;


comment on column "delivery"."order"."service_provider_type" is E'restaurant, deliveryCompany';

alter table "delivery"."order" alter column "direction" set default 'toCustomer'::text;
comment on column "delivery"."order"."direction" is E'toCustomer, fromCustomer';

alter table "customer"."stripe_cards" add constraint "stripe_cards_card_id_key" unique ("card_id");

alter table "service_provider"."delivery_partner" drop constraint "delivery_partner_service_provider_id_fkey";

alter table "delivery"."order" add column "package_ready" boolean
 not null default 'false';


alter table "service_provider"."stripe_info" drop column "requirements" cascade;

alter table "service_provider"."stripe_info" add column "requirements" jsonb
 null;


alter table "service_provider"."details" alter column "accepted_payments" set not null;

alter table "service_provider"."details" alter column "accepted_payments" set default '"{\"cash\":true,\"card\":false,\"bankTransfer\":false}"';

alter table "service_provider"."details" add constraint "details_stripe_id_key" unique ("stripe_id");


alter table "laundry"."store" add column "minimum_cost" money
 not null default '0';

CREATE OR REPLACE FUNCTION laundry.totalcost(order_row laundry."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT
        CASE 
            WHEN (
                SELECT order_row.delivery_cost 
                    + laundry.itemsCost(order_row) 
                    - order_row.refund_amount 
                    + order_row.stripe_fees 
                    - order_row.discount_value
            ) > (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id) 
            THEN (SELECT order_row.delivery_cost 
                + laundry.itemsCost(order_row) 
                - order_row.refund_amount 
                + order_row.stripe_fees 
                - order_row.discount_value)
        ELSE (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id)
        END
    
$function$;

CREATE OR REPLACE FUNCTION laundry.totalcost(order_row laundry."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    -- SELECT
    --     CASE 
    --         WHEN (
                SELECT order_row.delivery_cost 
                    + laundry.itemsCost(order_row) 
                    - order_row.refund_amount 
                    + order_row.stripe_fees 
                    - order_row.discount_value
        --     ) > (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id) 
        --     THEN (SELECT order_row.delivery_cost 
        --         + laundry.itemsCost(order_row) 
        --         - order_row.refund_amount 
        --         + order_row.stripe_fees 
        --         - order_row.discount_value)
        -- ELSE (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id)
        -- END
    
$function$;

CREATE OR REPLACE FUNCTION laundry.itemscost(order_row laundry."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT
        CASE 
            WHEN (
                SELECT SUM(oc.weight_in_kilo * c.cost_by_kilo)
                    FROM laundry.order_category oc
                    INNER JOIN laundry.category c
                    ON oc.category_id = c.id
                    WHERE order_id = order_row.id
            ) > (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id) 
            THEN (SELECT SUM(oc.weight_in_kilo * c.cost_by_kilo)
                FROM laundry.order_category oc
                INNER JOIN laundry.category c
                ON oc.category_id = c.id
                WHERE order_id = order_row.id)
        ELSE (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id)
        END
$function$;

CREATE OR REPLACE FUNCTION laundry.totalcost(order_row laundry."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.delivery_cost + laundry.itemsCost(order_row) - order_row.refund_amount + order_row.stripe_fees - order_row.discount_value
$function$;


alter table "delivery"."order" add column "distance_from_base" integer
 null;

alter table "delivery"."details" add column "cost_per_km_from_base" money
 null;

CREATE FUNCTION delivery.deliveryCostFromBase(order_row delivery."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT (d.cost_per_km_from_base * order_row.distance_from_base + order_row.delivery_cost)
    FROM delivery.details d
    INNER JOIN delivery.company c
    ON d.id = c.delivery_details_id
    WHERE c.id = order_row.service_provider_id
$function$;

CREATE FUNCTION delivery.baseLocation(details_row delivery.details)
 RETURNS geography
 LANGUAGE sql
 STABLE
AS $$
    SELECT gps
    FROM service_provider.location l
    INNER JOIN service_provider.details d
    ON d.location_id = l.id
    FULL JOIN restaurant.restaurant r ON r.delivery_details_id = details_row.id
    FULL JOIN laundry.store s ON s.delivery_details_id = details_row.id
    FULL JOIN delivery.company c ON c.delivery_details_id = details_row.id
$$;

CREATE OR REPLACE FUNCTION delivery.baselocation(details_row delivery.details)
 RETURNS geography
 LANGUAGE sql
 STABLE
AS $function$
    SELECT gps
    FROM service_provider.location l
    INNER JOIN service_provider.details d
    ON d.location_id = l.id
    WHERE d.id = 
        CASE 
            WHEN d.service_provider_type = 'restaurant'
            THEN (SELECT details_id FROM restaurant.restaurant r WHERE r.delivery_details_id = details_row.id)
            WHEN d.service_provider_type = 'laundry'
            THEN (SELECT details_id FROM laundry.store s WHERE s.delivery_details_id = details_row.id)
            ELSE
                (SELECT details_id FROM delivery.company c WHERE c.delivery_details_id = details_row.id)
        END
$function$;

CREATE OR REPLACE FUNCTION delivery.baselocation(details_row delivery.details)
 RETURNS geography
 LANGUAGE sql
 STABLE
AS $function$
    SELECT gps
    FROM service_provider.location l
    INNER JOIN service_provider.details d
    ON d.location_id = l.id
    WHERE d.id = 
        CASE 
            WHEN d.service_provider_type = 'restaurant'
            THEN (SELECT details_id FROM restaurant.restaurant r WHERE r.delivery_details_id = details_row.id)
            WHEN d.service_provider_type = 'laundry'
            THEN (SELECT details_id FROM laundry.store s WHERE s.delivery_details_id = details_row.id)
            WHEN d.service_provider_type = 'deliveryCompany'
            THEN (SELECT details_id FROM delivery.company c WHERE c.delivery_details_id = details_row.id)
        END
$function$;

CREATE TABLE "delivery"."courier_order" ("id" serial NOT NULL, "from_location_gps" geography, "from_location_adress" text, "to_location_gps" geography NOT NULL, "to_location_adress" text NOT NULL, "delivery_order_id" integer NOT NULL, PRIMARY KEY ("id") );

alter table "delivery"."courier_order" add constraint "courier_order_delivery_order_id_key" unique ("delivery_order_id");

alter table "delivery"."courier_order"
  add constraint "courier_order_delivery_order_id_fkey"
  foreign key ("delivery_order_id")
  references "delivery"."order"
  ("id") on update restrict on delete cascade;

alter table "delivery"."courier_order" add column "notes" text
 null;

CREATE TABLE "delivery"."courier_order_item" ("id" serial NOT NULL, "name" text NOT NULL, "image" text, "estimated_cost_per_one" money, "actual_cost_per_one" money, "order_id" integer NOT NULL, "quantity" integer NOT NULL DEFAULT 1, "unavailable" boolean NOT NULL DEFAULT false, PRIMARY KEY ("id") );


alter table "delivery"."courier_order" drop column "notes" cascade;

alter table "delivery"."courier_order_item" add column "notes" text
 null;

alter table "delivery"."courier_order_item" drop column "quantity" cascade;

alter table "delivery"."courier_order_item" rename column "estimated_cost_per_one" to "estimated_cost";

alter table "delivery"."courier_order_item" rename column "actual_cost_per_one" to "actual_cost";

alter table "delivery"."courier_order" rename column "from_location_adress" to "from_location_text";

alter table "delivery"."order" alter column "pickup_gps" drop not null;

alter table "delivery"."order" alter column "pickup_address" drop not null;

alter table "delivery"."courier_order_item"
  add constraint "courier_order_item_order_id_fkey"
  foreign key ("order_id")
  references "delivery"."courier_order"
  ("id") on update restrict on delete cascade;

alter table "delivery"."courier_order" add column "customer_id" integer
 not null;

alter table "delivery"."courier_order"
  add constraint "courier_order_customer_id_fkey"
  foreign key ("customer_id")
  references "customer"."customer"
  ("user_id") on update restrict on delete restrict;

alter table "delivery"."courier_order" add column "order_time" timestamptz
 not null default now();

alter table "delivery"."courier_order" add column "stripe_info" jsonb
 null;

comment on column "delivery"."courier_order"."stripe_info" is E'{ id: string, stripeFees: number, amountCharged: number, amountRefunded: number, chargeFeesOnCustomer: boolean |null; brand?: string, expMonth?: number, expYear?: number, last4?: string, status: (authorized, captured, cancelled), serviceProviderAccount: string }';

alter table "delivery"."courier_order" add column "payment_type" text
 not null default 'Cash';

alter table "delivery"."courier_order" add column "tax" money
 not null default '0';

alter table "delivery"."courier_order" add column "stripe_fees" money
 not null default '0';

alter table "delivery"."courier_order" add column "discount_value" money
 not null default '0';

alter table "delivery"."courier_order" add column "customer_app_type" text
 not null default 'native';

alter table "delivery"."courier_order" add column "refund_amount" money
 null;

alter table "delivery"."courier_order" add column "cancellation_time" timestamptz
 null;


CREATE TABLE "public"."service_provider_type" ("id" text NOT NULL, PRIMARY KEY ("id") );

create schema "valid_types";

ALTER TABLE app_type SET SCHEMA valid_types;

ALTER TABLE service_provider_type SET SCHEMA valid_types;

INSERT INTO valid_types.service_provider_type (id)
VALUES ('restaurant');
INSERT INTO valid_types.service_provider_type (id)
VALUES ('delivery_company');
INSERT INTO valid_types.service_provider_type (id)
VALUES ('laundry');

alter table "customer"."customer"
  add constraint "customer_app_type_id_fkey"
  foreign key ("app_type_id")
  references "valid_types"."app_type"
  ("id") on update restrict on delete restrict;

alter table "delivery"."company"
  add constraint "company_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "delivery"."driver"
  add constraint "driver_app_type_id_fkey"
  foreign key ("app_type_id")
  references "valid_types"."app_type"
  ("id") on update restrict on delete restrict;

alter table "delivery"."driver"
  add constraint "driver_delivery_company_type_fkey"
  foreign key ("delivery_company_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "delivery"."order"
  add constraint "order_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "laundry"."store"
  add constraint "store_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "public"."mez_admin" alter column "app_type_id" set default 'mezAdmin';

alter table "public"."mez_admin"
  add constraint "mez_admin_app_type_id_fkey"
  foreign key ("app_type_id")
  references "valid_types"."app_type"
  ("id") on update restrict on delete restrict;

alter table "public"."mez_admin_chat"
  add constraint "mez_admin_chat_app_type_fkey"
  foreign key ("app_type")
  references "valid_types"."app_type"
  ("id") on update restrict on delete restrict;

alter table "public"."service_provider_customer_chat"
  add constraint "service_provider_customer_chat_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "public"."translation"
  add constraint "translation_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."restaurant"
  add constraint "restaurant_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."delivery_partner"
  add constraint "delivery_partner_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."details"
  add constraint "details_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."post"
  add constraint "post_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."subscriber"
  add constraint "subscriber_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;


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


alter table "delivery"."driver" drop column "delivery_driver_type" cascade;

alter table "delivery"."operator" drop column "delivery_driver_type" cascade;

alter table "restaurant"."operator" drop column "delivery_driver_type" cascade;

alter table "laundry"."operator" drop column "delivery_driver_type" cascade;

alter table "service_provider"."operator_details" drop column "current_gps" cascade;

alter table "public"."chat" alter column "messages" set default jsonb_build_array();
alter table "public"."chat" alter column "messages" set not null;


create schema "business";

CREATE TABLE "business"."business" ("id" serial NOT NULL, "service_type" text NOT NULL, "profile" text NOT NULL, "details_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("details_id") REFERENCES "service_provider"."details"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("details_id"));

alter table "business"."business" add column "service_provider_type" text
 not null default 'business';

CREATE TABLE "business"."order_request" ("id" serial NOT NULL, "customer_id" integer NOT NULL, "business_id" integer NOT NULL, "status" text NOT NULL, "review_id" integer NOT NULL, "order_time" timestamptz NOT NULL DEFAULT now(), "customer_app_type" text NOT NULL DEFAULT 'native', "notes" text, "chat_id" integer, "cancellation_time" timestamptz, PRIMARY KEY ("id") , FOREIGN KEY ("customer_id") REFERENCES "customer"."customer"("user_id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("chat_id") REFERENCES "public"."chat"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("business_id") REFERENCES "business"."business"("id") ON UPDATE restrict ON DELETE restrict);

alter table "business"."business" drop column "service_type" cascade;

CREATE TABLE "business"."rental" ("id" serial NOT NULL, "name_id" integer NOT NULL, "description_id" integer, "position" integer NOT NULL DEFAULT 1, "business_id" integer NOT NULL, "available" boolean NOT NULL DEFAULT true, "cost" money NOT NULL, "image" text, PRIMARY KEY ("id") , FOREIGN KEY ("business_id") REFERENCES "business"."business"("id") ON UPDATE restrict ON DELETE cascade, FOREIGN KEY ("name_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("description_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "business"."class" ("id" serial NOT NULL, "name_id" integer NOT NULL, "description_id" integer, "position" integer NOT NULL DEFAULT 1, "business_id" integer NOT NULL, "schedule_type" text NOT NULL, "available" boolean NOT NULL DEFAULT true, "cost" money NOT NULL, "image" text, "schedule" jsonb, PRIMARY KEY ("id") , FOREIGN KEY ("name_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("description_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("business_id") REFERENCES "business"."business"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "business"."event" ("id" serial NOT NULL, "name_id" integer NOT NULL, "description_id" integer, "position" integer NOT NULL DEFAULT 1, "business_id" integer NOT NULL, "schedule_type" text NOT NULL, "cost" money NOT NULL, "image" text, "schedule" jsonb, "available" boolean NOT NULL DEFAULT true, PRIMARY KEY ("id") , FOREIGN KEY ("name_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("description_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("business_id") REFERENCES "business"."business"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "business"."order_request_item" ("id" serial NOT NULL, "service_id" integer NOT NULL, "service_type" text NOT NULL, "available" boolean NOT NULL DEFAULT true, "quantity" integer NOT NULL DEFAULT 1, "final_cost_per_one" money, PRIMARY KEY ("id") );

CREATE TABLE "business"."operator" ("id" serial NOT NULL, "user_id" integer NOT NULL, "business_id" integer NOT NULL, "details_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("business_id") REFERENCES "business"."business"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("details_id") REFERENCES "service_provider"."operator_details"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("user_id"), UNIQUE ("details_id"));

alter table "business"."business"
  add constraint "business_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

comment on column "business"."class"."schedule_type" is E'scheduled or onDemand';

comment on column "business"."event"."schedule_type" is E'scheduled or OnDemand';


alter table "delivery"."details" alter column "cost_per_km_from_base" set default '0';
alter table "delivery"."details" alter column "cost_per_km_from_base" set not null;

alter table "service_provider"."delivery_partner" add constraint "delivery_partner_service_provider_id_service_provider_type_key" unique ("service_provider_id", "service_provider_type");


alter table "business"."order_request_item" add column "order_request_id" integer
 not null;

alter table "business"."order_request_item"
  add constraint "order_request_item_order_request_id_fkey"
  foreign key ("order_request_id")
  references "business"."order_request"
  ("id") on update restrict on delete restrict;

CREATE FUNCTION business.estCostPerOne(order_request_item_row business."order_request_item")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT 
        CASE 
            WHEN order_request_item_row.service_type = 'rental'
            THEN (SELECT cost FROM business.rental WHERE id = order_request_item_row.service_id)
            WHEN order_request_item_row.service_type = 'class'
            THEN (SELECT cost FROM business.class WHERE id = order_request_item_row.service_id)
            WHEN order_request_item_row.service_type = 'event'
            THEN (SELECT cost FROM business.event WHERE id = order_request_item_row.service_id)
        END
$function$;

CREATE TABLE "business"."cart" ("customer_id" integer NOT NULL, "business_id" integer NOT NULL, "discount_value" money NOT NULL DEFAULT 0, PRIMARY KEY ("customer_id") , FOREIGN KEY ("business_id") REFERENCES "business"."business"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("customer_id") REFERENCES "customer"."customer"("user_id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "business"."cart_item" ("id" serial NOT NULL, "service_id" integer NOT NULL, "service_type" text NOT NULL, "customer_id" integer NOT NULL, "quantity" integer NOT NULL DEFAULT 1, "cost_per_one" money NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("customer_id") REFERENCES "customer"."customer"("user_id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("customer_id", "service_id", "service_type"));

CREATE FUNCTION business.cartCost(cart_row business.cart)
 RETURNS money
 LANGUAGE sql
 STABLE
AS $$
    SELECT SUM(quantity * cost_per_one)
    FROM business.cart_item
    WHERE customer_id = cart_row.customer_id;
$$;

alter table "business"."order_request" alter column "review_id" drop not null;

CREATE FUNCTION business.estOrderCost(order_request_row business.order_request)
 RETURNS money
 LANGUAGE sql
 STABLE
AS $$
    SELECT SUM(quantity * business.estcostperone(i))
    FROM business.order_request_item i
    WHERE i.order_request_id = order_request_row.id;
$$;

CREATE FUNCTION business.finalOrderCost(order_request_row business.order_request)
 RETURNS money
 LANGUAGE sql
 STABLE
AS $$
    SELECT SUM(quantity * final_cost_per_one)
    FROM business.order_request_item i
    WHERE i.order_request_id = order_request_row.id;
$$;


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

alter table "delivery"."courier_order" add column "bill_image" text
 null;


alter table "service_provider"."details" add column "unique_id" text
 null;

alter table "service_provider"."details" alter column "unique_id" set not null;


alter table "service_provider"."details" drop column "unique_id" cascade;

alter table "service_provider"."details" add column "unique_id" text
 null;


alter table "delivery"."order" add column "change_price_request" jsonb
 null;

comment on column "delivery"."order"."change_price_request" is E'{ status: {requested, accepted, rejected}, newPrice: number, oldPrice: number, reason: string}';


alter table "delivery"."order" add column "lock_time" timestamptz
 null;

alter table "delivery"."order" drop column "lock_time" cascade;

alter table "delivery"."order" add column "lock_timestamp" integer
 null;

alter table "delivery"."order" drop column "lock_timestamp" cascade;

alter table "delivery"."order" add column "lock_time" Timestamp
 null;

alter table "laundry"."operator" drop constraint "operator_details_id_fkey",
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update cascade on delete cascade;

alter table "delivery"."details" alter column "customer_pickup" set default 'false';

CREATE FUNCTION delivery.packagecost(delivery_row delivery."order")
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
            -- WHEN delivery_row.order_type = 'courier'
            -- ELSE delivery.itemscost(c) FROM delivery.courier_order c WHERE c.delivery_id = delivery_row.id
        END
    
$function$;

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


CREATE OR REPLACE FUNCTION delivery.deliverytotalcost(delivery_row delivery."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT delivery.packagecost(delivery_row) + (SELECT delivery_cost FROM delivery."order" o WHERE o.id = delivery_row.id)
    
$function$;

CREATE OR REPLACE FUNCTION delivery.deliverytotalcost(delivery_row delivery."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT COALESCE(delivery.packagecost(delivery_row), 0::money) + (SELECT delivery_cost FROM delivery."order" o WHERE o.id = delivery_row.id)
$function$;



alter table "delivery"."courier_order" alter column "payment_type" set default 'cash'::text;


alter table "delivery"."order" alter column "payment_type" set default 'cash'::text;

alter table "restaurant"."order" alter column "payment_type" set default 'cash'::text;

alter table "laundry"."order" alter column "payment_type" set default 'cash'::text;


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


alter table "business"."rental" add column "category" text
 not null default 'uncategorized';

alter table "business"."rental" drop column "image" cascade;

alter table "business"."rental" add column "image" jsonb
 null;

alter table "business"."class" drop column "image" cascade;

alter table "business"."class" add column "image" jsonb
 null;

alter table "business"."class" add column "category" text
 not null default 'uncategorized';

alter table "business"."event" drop column "image" cascade;

alter table "business"."event" add column "image" jsonb
 null;

alter table "business"."event" add column "category" text
 null default 'uncategorized';

alter table "business"."event" rename column "category" to "category1";

alter table "business"."class" rename column "category" to "category1";

alter table "business"."rental" rename column "category" to "category1";

alter table "business"."rental" drop column "cost" cascade;

alter table "business"."rental" add column "cost" jsonb
 not null;

alter table "business"."rental" add column "additional_parameters" jsonb
 null;

alter table "business"."event" drop column "cost" cascade;

alter table "business"."event" add column "cost" jsonb
 not null;

alter table "business"."event" add column "additional_parameters" jsonb
 null;

alter table "business"."class" drop column "cost" cascade;

alter table "business"."class" add column "cost" jsonb
 not null;

alter table "business"."class" add column "additional_parameters" jsonb
 null;

alter table "business"."order_request" add column "commence_time" timestamptz
 null;

CREATE OR REPLACE FUNCTION delivery.packagecost(delivery_row delivery."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT 
        CASE 
            WHEN delivery_row.order_type = 'restaurant'
            THEN public.itemscost((SELECT r.*::restaurant."order" FROM restaurant."order" r WHERE r.delivery_id = delivery_row.id)) 
                + (SELECT r.tax FROM restaurant."order" r WHERE r.delivery_id = delivery_row.id)
            WHEN delivery_row.order_type = 'laundry'
            THEN laundry.itemscost((SELECT l.*::laundry."order" FROM laundry."order" l WHERE (l.from_customer_delivery_id = delivery_row.id OR l.to_customer_delivery_id = delivery_row.id))) 
                + (SELECT l.tax FROM laundry."order" l WHERE (l.from_customer_delivery_id = delivery_row.id OR l.to_customer_delivery_id = delivery_row.id))
            WHEN delivery_row.order_type = 'courier'
            THEN delivery.actualitemscost((SELECT c.*::delivery."courier_order" FROM delivery."courier_order" c WHERE c.delivery_order_id = delivery_row.id))
                + (SELECT c.tax FROM delivery."courier_order" c WHERE c.delivery_order_id = delivery_row.id)
        END
    
$function$;





CREATE TABLE "business"."service" ("id" serial NOT NULL, "name_id" integer NOT NULL, "description_id" integer, "position" integer NOT NULL DEFAULT 1, "business_id" integer NOT NULL, "available" boolean NOT NULL DEFAULT true, "category1" text NOT NULL DEFAULT 'uncategorized', "image" jsonb, "cost" jsonb NOT NULL, "additional_parameters" jsonb, PRIMARY KEY ("id") );

alter table "business"."service"
  add constraint "service_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "business"."service" drop column "business_id" cascade;

alter table "business"."class" drop column "name_id" cascade;

alter table "business"."class" drop column "description_id" cascade;

alter table "business"."class" drop column "position" cascade;

alter table "business"."class" drop column "available" cascade;

alter table "business"."class" drop column "image" cascade;

alter table "business"."class" drop column "category1" cascade;

alter table "business"."class" drop column "cost" cascade;

alter table "business"."class" drop column "additional_parameters" cascade;

alter table "business"."event" drop column "name_id" cascade;

alter table "business"."event" drop column "description_id" cascade;

alter table "business"."event" drop column "position" cascade;

alter table "business"."event" drop column "available" cascade;

alter table "business"."event" drop column "image" cascade;

alter table "business"."event" drop column "category1" cascade;

alter table "business"."event" drop column "cost" cascade;

alter table "business"."event" drop column "additional_parameters" cascade;

alter table "business"."rental" drop column "name_id" cascade;

alter table "business"."rental" drop column "description_id" cascade;

alter table "business"."rental" drop column "position" cascade;

alter table "business"."rental" drop column "available" cascade;

alter table "business"."rental" drop column "category1" cascade;

alter table "business"."rental" drop column "image" cascade;

alter table "business"."rental" drop column "cost" cascade;

alter table "business"."rental" drop column "additional_parameters" cascade;

alter table "business"."rental" add column "service_id" integer
 not null;

alter table "business"."rental" add constraint "rental_service_id_key" unique ("service_id");

alter table "business"."rental"
  add constraint "rental_service_id_fkey"
  foreign key ("service_id")
  references "business"."service"
  ("id") on update restrict on delete restrict;

alter table "business"."event" add column "service_id" integer
 not null unique;

alter table "business"."event"
  add constraint "event_service_id_fkey"
  foreign key ("service_id")
  references "business"."service"
  ("id") on update restrict on delete restrict;

alter table "business"."class" add column "service_id" integer
 not null unique;

alter table "business"."class"
  add constraint "class_service_id_fkey"
  foreign key ("service_id")
  references "business"."service"
  ("id") on update restrict on delete restrict;

alter table "business"."cart_item" drop column "cost_per_one" cascade;

alter table "business"."cart_item" drop column "quantity" cascade;

alter table "business"."cart_item" add column "cost" jsonb
 not null;

alter table "business"."order_request" drop column "commence_time" cascade;

alter table "business"."order_request_item" add column "commence_time" timestamptz
 null;

alter table "business"."order_request_item" drop column "quantity" cascade;

alter table "business"."order_request_item" drop column "final_cost_per_one" cascade;

alter table "business"."order_request_item" add column "cost" jsonb
 not null;

alter table "business"."order_request" add column "estimated_cost" money
 not null;

alter table "business"."order_request" add column "final_cost" money
 null;


alter table "business"."service"
  add constraint "service_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "business"."service"
  add constraint "service_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

CREATE OR REPLACE FUNCTION delivery.tax(delivery_row delivery."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT 
        CASE 
            WHEN delivery_row.order_type = 'restaurant'
            THEN (SELECT r.tax FROM restaurant."order" r WHERE r.delivery_id = delivery_row.id)
            WHEN delivery_row.order_type = 'laundry'
            THEN  (SELECT l.tax FROM laundry."order" l WHERE (l.from_customer_delivery_id = delivery_row.id OR l.to_customer_delivery_id = delivery_row.id))
            WHEN delivery_row.order_type = 'courier'
            THEN  (SELECT c.tax FROM delivery."courier_order" c WHERE c.delivery_order_id = delivery_row.id)
        END
    
$function$;

CREATE OR REPLACE FUNCTION delivery.deliverytotalcost(delivery_row delivery."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT COALESCE(delivery.packagecost(delivery_row), 0::money) + (SELECT COALESCE(delivery.tax(delivery_row), 0::money)) + (SELECT delivery_cost FROM delivery."order" o WHERE o.id = delivery_row.id)
$function$;

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


CREATE OR REPLACE FUNCTION public.fromName(review_row public.review)
 RETURNS varchar
 LANGUAGE sql
 STABLE
AS $function$
    SELECT 
        CASE
            WHEN review_row.from_entity_type = 'customer'
            THEN (SELECT name FROM public.user u WHERE u.id = review_row.from_entity_id)
            -- WHEN review_row.from_entity_type = 'driver'
            -- THEN (SELECT name FROM user u WHERE u.id = (
            --     SELECT user_id FROM delivery.driver d WHERE d.id = review_row.from_entity_id
            -- ))
            -- WHEN review_row.from_entity_type = 'restaurant'
            -- THEN (SELECT name FROM service_provider.details s WHERE s.id = (
            --     SELECT details_id FROM restaurant.restaurant r WHERE r.id =  review_row.from_entity_id
            -- ))
            -- WHEN review_row.from_entity_type = 'laundry'
            -- THEN (SELECT name FROM service_provider.details s WHERE s.id = (
            --     SELECT details_id FROM laundry.laundry l WHERE l.id =  review_row.from_entity_id
            -- ))
        END
$function$;

CREATE OR REPLACE FUNCTION public.fromName(review_row public.review)
 RETURNS varchar
 LANGUAGE sql
 STABLE
AS $function$
    SELECT 
        CASE
            WHEN review_row.from_entity_type = 'customer'
            THEN (SELECT name FROM public.user u WHERE u.id = review_row.from_entity_id)
            WHEN review_row.from_entity_type = 'driver'
            THEN (SELECT name FROM public.user u WHERE u.id = (
                SELECT user_id FROM delivery.driver d WHERE d.id = review_row.from_entity_id
            ))
            WHEN review_row.from_entity_type = 'restaurant'
            THEN (SELECT name FROM service_provider.details s WHERE s.id = (
                SELECT details_id FROM restaurant.restaurant r WHERE r.id =  review_row.from_entity_id
            ))
            WHEN review_row.from_entity_type = 'laundry'
            THEN (SELECT name FROM service_provider.details s WHERE s.id = (
                SELECT details_id FROM laundry.store l WHERE l.id =  review_row.from_entity_id
            ))
        END
$function$;

CREATE OR REPLACE FUNCTION public.fromImage(review_row public.review)
 RETURNS varchar
 LANGUAGE sql
 STABLE
AS $function$
    SELECT 
        CASE
            WHEN review_row.from_entity_type = 'customer'
            THEN (SELECT image FROM public.user u WHERE u.id = review_row.from_entity_id)
            WHEN review_row.from_entity_type = 'driver'
            THEN (SELECT image FROM public.user u WHERE u.id = (
                SELECT user_id FROM delivery.driver d WHERE d.id = review_row.from_entity_id
            ))
            WHEN review_row.from_entity_type = 'restaurant'
            THEN (SELECT image FROM service_provider.details s WHERE s.id = (
                SELECT details_id FROM restaurant.restaurant r WHERE r.id =  review_row.from_entity_id
            ))
            WHEN review_row.from_entity_type = 'laundry'
            THEN (SELECT image FROM service_provider.details s WHERE s.id = (
                SELECT details_id FROM laundry.store l WHERE l.id =  review_row.from_entity_id
            ))
        END
$function$;

CREATE OR REPLACE FUNCTION public.toName(review_row public.review)
 RETURNS varchar
 LANGUAGE sql
 STABLE
AS $function$
    SELECT 
        CASE
            WHEN review_row.to_entity_type = 'customer'
            THEN (SELECT name FROM public.user u WHERE u.id = review_row.to_entity_id)
            WHEN review_row.to_entity_type = 'driver'
            THEN (SELECT name FROM public.user u WHERE u.id = (
                SELECT user_id FROM delivery.driver d WHERE d.id = review_row.to_entity_id
            ))
            WHEN review_row.to_entity_type = 'restaurant'
            THEN (SELECT name FROM service_provider.details s WHERE s.id = (
                SELECT details_id FROM restaurant.restaurant r WHERE r.id =  review_row.to_entity_id
            ))
            WHEN review_row.to_entity_type = 'laundry'
            THEN (SELECT name FROM service_provider.details s WHERE s.id = (
                SELECT details_id FROM laundry.store l WHERE l.id =  review_row.to_entity_id
            ))
        END
$function$;

CREATE OR REPLACE FUNCTION public.toImage(review_row public.review)
 RETURNS varchar
 LANGUAGE sql
 STABLE
AS $function$
    SELECT 
        CASE
            WHEN review_row.to_entity_type = 'customer'
            THEN (SELECT image FROM public.user u WHERE u.id = review_row.to_entity_id)
            WHEN review_row.to_entity_type = 'driver'
            THEN (SELECT image FROM public.user u WHERE u.id = (
                SELECT user_id FROM delivery.driver d WHERE d.id = review_row.to_entity_id
            ))
            WHEN review_row.to_entity_type = 'restaurant'
            THEN (SELECT image FROM service_provider.details s WHERE s.id = (
                SELECT details_id FROM restaurant.restaurant r WHERE r.id =  review_row.to_entity_id
            ))
            WHEN review_row.to_entity_type = 'laundry'
            THEN (SELECT image FROM service_provider.details s WHERE s.id = (
                SELECT details_id FROM laundry.store l WHERE l.id =  review_row.to_entity_id
            ))
        END
$function$;



CREATE TABLE "business"."home_rental" ("id" serial NOT NULL, "rental_id" integer NOT NULL, "bedrooms" integer NOT NULL DEFAULT 1, "bathrooms" integer NOT NULL DEFAULT 1, "gps_location" geography NOT NULL, "homeType" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("rental_id") REFERENCES "business"."rental"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("rental_id"));

alter table "business"."event" add column "gps_location" geography
 null;

alter table "business"."class" add column "gps_location" geography
 null;

CREATE TABLE "business"."referral" ("customer_id" integer NOT NULL, "business_id" integer NOT NULL, PRIMARY KEY ("customer_id") );

alter table "business"."referral"
  add constraint "referral_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "business"."referral"
  add constraint "referral_customer_id_fkey"
  foreign key ("customer_id")
  references "customer"."customer"
  ("user_id") on update restrict on delete restrict;

alter table "business"."business" add column "points" integer
 not null default '0';

alter table "business"."event" add column "time" timestamptz
 null;

alter table "business"."class" add column "time" timestamptz
 null;

alter table "business"."service" add column "category2" text
 null;

BEGIN TRANSACTION;
ALTER TABLE "business"."home_rental" DROP CONSTRAINT "home_rental_pkey";

ALTER TABLE "business"."home_rental"
    ADD CONSTRAINT "home_rental_pkey" PRIMARY KEY ("rental_id");
COMMIT TRANSACTION;

alter table "business"."home_rental" drop column "id" cascade;


alter table "public"."service_provider_customer_chat"
  add constraint "service_provider_customer_chat_chat_id_fkey"
  foreign key ("chat_id")
  references "public"."chat"
  ("id") on update restrict on delete restrict;

alter table "public"."service_provider_customer_chat"
  add constraint "service_provider_customer_chat_customer_id_fkey"
  foreign key ("customer_id")
  references "customer"."customer"
  ("user_id") on update restrict on delete restrict;



alter table "business"."business" rename column "points" to "referral_points";

alter table "business"."business" alter column "profile" set default 'surfShop, vehicleRental, homeRental, wellnessClass, party, volunteer, tourAgency, therapy';

ALTER TABLE "business"."business" ALTER COLUMN "profile" drop default;
comment on column "business"."business"."profile" is E'surfShop, vehicleRental, homeRental, wellnessClass, party, volunteer, tourAgency, therapy';

alter table "business"."service" alter column "category2" set default 'uncategorized';
alter table "business"."service" alter column "category2" set not null;

DROP table "business"."class";

alter table "business"."rental" add column "category3" text
 not null default 'uncategorized';

alter table "business"."service" add column "tags" jsonb
 null;

alter table "business"."service" rename to "item_details";

alter table "business"."home_rental" rename column "homeType" to "home_type";

CREATE TABLE "business"."service" ("id" serial NOT NULL, "details_id" integer NOT NULL, "business_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("details_id") REFERENCES "business"."item_details"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("business_id") REFERENCES "business"."business"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("details_id"));

alter table "business"."event" rename column "service_id" to "details_id";

alter table "business"."rental" rename column "service_id" to "details_id";

CREATE TABLE "business"."product" ("id" serial NOT NULL, "business_id" integer NOT NULL, "details_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("details_id") REFERENCES "business"."item_details"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("business_id") REFERENCES "business"."business"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("details_id"));

alter table "business"."item_details" alter column "tags" set default jsonb_build_array();
alter table "business"."item_details" alter column "tags" set not null;

alter table "public"."chat" add column "last_message_sent" timestamptz
 null;


alter table "business"."event" add column "address" text
 null;

alter table "public"."chat" alter column "last_message_sent" set default now();
alter table "public"."chat" alter column "last_message_sent" set not null;

alter table "business"."home_rental" add column "address" text
 not null;


ALTER TABLE business.referral SET SCHEMA public;

ALTER TABLE referral SET SCHEMA service_provider;

alter table "service_provider"."referral" rename column "business_id" to "service_provider_id";

alter table "service_provider"."referral" add column "service_provider_type" text
 not null;

alter table "business"."business" drop column "referral_points" cascade;

alter table "service_provider"."details" add column "referral_points" integer
 not null default '0';

alter table "service_provider"."referral" drop constraint "referral_business_id_fkey";

CREATE TABLE "public"."data_consumption" ("id" serial NOT NULL, "name_of_subscription" text NOT NULL, "date" date NOT NULL DEFAULT now(), "total_size" integer NOT NULL DEFAULT 0, "user_id" integer NOT NULL, PRIMARY KEY ("id") );

alter table "public"."data_consumption" add column "number_of_events" integer
 not null default '1';


alter table "service_provider"."details" add column "currency" text
 not null default 'Peso';

alter table "service_provider"."details" alter column "currency" set default 'peso';

alter table "restaurant"."cart_item" drop constraint "restaurant_cart_item_customer_id_restaurant_item_id_key";


alter table "business"."event" drop column "time" cascade;

alter table "business"."event" add column "starts_at" time
 null;

alter table "business"."event" drop column "starts_at" cascade;

alter table "business"."event" add column "starts_at" timestamp with time zone
 null;

alter table "business"."event" add column "ends_at" timestamp with time zone
 null;


alter table "business"."service" add column "schedule" jsonb
 null;

alter table "business"."item_details" add column "business_id" integer
 not null;

alter table "business"."item_details"
  add constraint "item_details_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;


alter table "service_provider"."details" alter column "language" set default '"{\"primary\": \"es\",\"secondary\": \"en\"}"'::jsonb;

alter table "public"."chat" add column "last_message" jsonb
 null;


alter table "business"."home_rental" drop constraint "home_rental_rental_id_fkey",
  add constraint "home_rental_rental_id_fkey"
  foreign key ("rental_id")
  references "business"."rental"
  ("id") on update restrict on delete cascade;

alter table "service_provider"."details" alter column "open_status" set default 'closedIndefinitely';


alter table "public"."mez_admin_chat" rename column "user_id" to "recipient_id";

alter table "public"."mez_admin_chat" rename column "app_type" to "recipient_type";

comment on column "public"."mez_admin_chat"."recipient_type" is E'customer/business/restaurant/laundry/deliveryCompany/deliveryDriver';

alter table "public"."mez_admin_chat" drop constraint "mez_admin_chat_app_type_fkey";

alter table "public"."mez_admin_chat" add constraint "mez_admin_chat_recipient_id_recipient_type_key" unique ("recipient_id", "recipient_type");


alter table "business"."cart_item" rename column "service_id" to "business_item_id";

alter table "business"."cart_item" rename column "service_type" to "item_type";

alter table "business"."cart_item" rename column "cost" to "parameters";

alter table "business"."order_request" add column "commence_time" timestamptz
 null;

alter table "business"."order_request_item" rename column "service_id" to "item_id";

alter table "business"."order_request_item" rename column "service_type" to "item_type";

alter table "business"."order_request_item" rename column "cost" to "parameters";

alter table "business"."order_request_item" drop column "commence_time" cascade;

alter table "business"."cart_item" drop column "item_type" cascade;

alter table "business"."order_request_item" drop column "item_type" cascade;

alter table "business"."cart_item" rename column "business_item_id" to "item_details_id";

alter table "business"."order_request_item" rename column "item_id" to "item_details_id";


alter table "business"."rental" add column "offering_type" text
 not null default 'rental';

alter table "business"."event" add column "offering_type" text
 not null default 'event';

alter table "business"."product" add column "offering_type" text
 not null default 'product';

alter table "business"."service" add column "offering_type" text
 not null default 'service';

alter table "business"."cart_item" rename column "item_details_id" to "item_id";

alter table "business"."cart_item" add column "offering_type" text
 not null;

alter table "business"."order_request_item" add column "offering_type" text
 not null;

alter table "business"."order_request_item" rename column "item_details_id" to "item_id";

alter table "business"."cart_item" add column "time" Timestamp
 null;

alter table "business"."cart_item" add column "cost" money
 not null;

alter table "business"."order_request_item" add column "time" timestamptz
 null;

alter table "business"."order_request_item" add column "cost" money
 not null;

CREATE OR REPLACE FUNCTION business.cartcost(cart_row business.cart)
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT SUM(cost)
    FROM business.cart_item
    WHERE customer_id = cart_row.customer_id;
$function$;

CREATE OR REPLACE FUNCTION business.ordercost(order_row business.order_request)
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT SUM(cost)
    FROM business.order_request_item
    WHERE order_request_id = order_row.id;
$function$;

CREATE OR REPLACE FUNCTION business.ordercommencetime(order_row business.order_request)
 RETURNS timestamp
 LANGUAGE sql
 STABLE
AS $function$
    SELECT MIN(time)
    FROM business.order_request_item
    WHERE order_request_id = order_row.id;
$function$;

CREATE OR REPLACE FUNCTION business.ordercommencetime(order_row business.order_request)
 RETURNS timestamp
 LANGUAGE sql
 STABLE
AS $function$
    SELECT MIN(time)
    FROM business.order_request_item
    WHERE order_request_id = order_row.id;
$function$;

alter table "business"."order_request" drop column "commence_time" cascade;

alter table "business"."order_request" drop column "estimated_cost" cascade;

alter table "business"."order_request" drop column "final_cost" cascade;

alter table "business"."cart" alter column "business_id" drop not null;


alter table "service_provider"."details" add column "last_active_time" timestamp
 null;

alter table "delivery"."operator" drop constraint "delivery_operator_delivery_company_id_fkey",
  add constraint "operator_delivery_company_id_fkey"
  foreign key ("delivery_company_id")
  references "delivery"."company"
  ("id") on update restrict on delete cascade;

alter table "business"."cart" drop constraint "cart_business_id_fkey",
  add constraint "cart_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete cascade;

alter table "business"."event" drop constraint "event_business_id_fkey",
  add constraint "event_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete cascade;

alter table "business"."item_details" drop constraint "item_details_business_id_fkey",
  add constraint "item_details_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete cascade;

alter table "business"."operator" drop constraint "operator_business_id_fkey",
  add constraint "operator_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete cascade;

alter table "business"."order_request" drop constraint "order_request_business_id_fkey",
  add constraint "order_request_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete cascade;

alter table "business"."order_request_item" drop constraint "order_request_item_order_request_id_fkey",
  add constraint "order_request_item_order_request_id_fkey"
  foreign key ("order_request_id")
  references "business"."order_request"
  ("id") on update restrict on delete cascade;

alter table "business"."product" drop constraint "product_business_id_fkey",
  add constraint "product_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete cascade;

alter table "business"."service" drop constraint "service_business_id_fkey",
  add constraint "service_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete cascade;


CREATE OR REPLACE FUNCTION business.get_home_rentals(location geography) 
RETURNS SETOF business.home_rental 
LANGUAGE sql
STABLE
AS $$
    SELECT 
        *
    FROM 
        business.home_rental h
    ORDER BY 
        (SELECT referral_points 
            FROM service_provider.details s 
            WHERE s.id = (
                SELECT details_id
                FROM business.business b
                WHERE b.id = (
                    SELECT business_id
                    FROM business.rental r
                    WHERE r.id = h.rental_id
                )
            )
        ) DESC,
        ST_Distance(location, gps_location);
$$;

CREATE OR REPLACE FUNCTION business.get_home_rentals(location geography) 
RETURNS SETOF business.home_rental 
LANGUAGE sql
STABLE
AS $$
    SELECT 
        *
    FROM 
        business.home_rental h
    ORDER BY 
        (SELECT referral_points 
            FROM service_provider.details s 
            WHERE s.id = (
                SELECT details_id
                FROM business.business b
                WHERE b.id = (
                    SELECT business_id
                    FROM business.rental r
                    WHERE r.id = h.rental_id
                )
            )
        ) DESC,
        ST_Distance(location, gps_location);
$$;


alter table "service_provider"."referral" drop constraint "referral_customer_id_fkey";

alter table "service_provider"."referral"
  add constraint "referral_customer_id_fkey"
  foreign key ("customer_id")
  references "public"."user"
  ("id") on update restrict on delete restrict;


ALTER TABLE "service_provider"."details" ALTER COLUMN "last_active_time" TYPE timestamp without time zone;

ALTER TABLE "service_provider"."details" ALTER COLUMN "last_active_time" drop default;

alter table "service_provider"."details" alter column "last_active_time" set default now();

alter table "service_provider"."details" alter column "last_active_time" set not null;

alter table "service_provider"."details" add column "timezone" text
 null default 'America/Mexico_City';

CREATE OR REPLACE FUNCTION service_provider.is_open(details service_provider.details)
 RETURNS boolean
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
DECLARE
    day_name TEXT;
    open_hours JSONB;
    from_time TIME;
    to_time TIME;
    num_hours INT;
    is_open BOOLEAN := FALSE;
    tz TEXT;
BEGIN
    -- Get the day of the week from the current time
    CASE extract(isodow from now())
        WHEN 1 THEN day_name := 'monday';
        WHEN 2 THEN day_name := 'tuesday';
        WHEN 3 THEN day_name := 'wednesday';
        WHEN 4 THEN day_name := 'thursday';
        WHEN 5 THEN day_name := 'friday';
        WHEN 6 THEN day_name := 'saturday';
        WHEN 7 THEN day_name := 'sunday';
    END CASE;

    -- Get the open hours for the day from the details parameter
    open_hours := details.schedule->day_name->'openHours';

    -- Check if open_hours is not null and is an array
    IF open_hours IS NOT NULL AND jsonb_typeof(open_hours) = 'array' THEN
        num_hours := jsonb_array_length(open_hours);

        -- If there are no open periods, return false
        IF num_hours = 0 THEN
            RETURN FALSE;
        END IF;
        IF details.open_status != 'open' THEN
            RETURN FALSE;
        END IF;

        -- Get the time zone from the details.time_zone column
        tz := details.time_zone;

        -- Check each open period for the day
        FOR i IN 0..num_hours - 1 LOOP
            from_time := (open_hours->i->>'from')::TIME;
            to_time := (open_hours->i->>'to')::TIME;
            -- return now()::TIME AT TIME ZONE tz  || ' || ' || from_time || ' || ' || to_time || ' || ' || tz || ' || ' || (open_hours->i->>'from');
            -- If the current_time is within the open hours, set is_open to true and exit the loop
            IF from_time <= to_time THEN
                IF extract(hour from  now()::TIME AT TIME ZONE tz) >= extract(hour from from_time) AND
                  extract(hour from  now()::TIME AT TIME ZONE tz) <= extract(hour from to_time) THEN
                    is_open := TRUE;
                    EXIT;
                END IF;
            ELSE
                IF extract(hour from  now()::TIME AT TIME ZONE tz) >= extract(hour from from_time) OR
                  extract(hour from  now()::TIME AT TIME ZONE tz) <= extract(hour from to_time) THEN
                    is_open := TRUE;
                    EXIT;
                END IF;
            END IF;
        END LOOP;
    END IF;

    -- Return the value of is_open
    RETURN is_open;
END;
$function$;

CREATE OR REPLACE FUNCTION service_provider.is_open(details service_provider.details)
RETURNS boolean
LANGUAGE plpgsql
IMMUTABLE
AS $function$
DECLARE
    day_name TEXT;
    open_hours JSONB;
    from_time TIME;
    to_time TIME;
    num_hours INT;
    is_open BOOLEAN := FALSE;
    tz TEXT;
BEGIN
    -- Get the day of the week from the current time
    CASE extract(isodow from now())
        WHEN 1 THEN day_name := 'monday';
        WHEN 2 THEN day_name := 'tuesday';
        WHEN 3 THEN day_name := 'wednesday';
        WHEN 4 THEN day_name := 'thursday';
        WHEN 5 THEN day_name := 'friday';
        WHEN 6 THEN day_name := 'saturday';
        WHEN 7 THEN day_name := 'sunday';
    END CASE;

    -- Get the open hours for the day from the details parameter
    open_hours := details.schedule->day_name->'openHours';

    -- Check if open_hours is not null and is an array, and isOpen is true
    IF open_hours IS NOT NULL AND jsonb_typeof(open_hours) = 'array' AND details.schedule->day_name->'isOpen' = 'true' THEN
        num_hours := jsonb_array_length(open_hours);

        -- If there are no open periods, return false
        IF num_hours = 0 THEN
            RETURN FALSE;
        END IF;
        IF details.open_status != 'open' THEN
            RETURN FALSE;
        END IF;

        -- Get the time zone from the details.time_zone column
        tz := details.time_zone;

        -- Check each open period for the day
        FOR i IN 0..num_hours - 1 LOOP
            from_time := (open_hours->i->>'from')::TIME;
            to_time := (open_hours->i->>'to')::TIME;
            -- return now()::TIME AT TIME ZONE tz  || ' || ' || from_time || ' || ' || to_time || ' || ' || tz || ' || ' || (open_hours->i->>'from');
            -- If the current_time is within the open hours, set is_open to true and exit the loop
            IF from_time <= to_time THEN
                IF extract(hour from  now()::TIME AT TIME ZONE tz) >= extract(hour from from_time) AND
                  extract(hour from  now()::TIME AT TIME ZONE tz) <= extract(hour from to_time) THEN
                    is_open := TRUE;
                    EXIT;
                END IF;
            ELSE
                IF extract(hour from  now()::TIME AT TIME ZONE tz) >= extract(hour from from_time) OR
                  extract(hour from  now()::TIME AT TIME ZONE tz) <= extract(hour from to_time) THEN
                    is_open := TRUE;
                    EXIT;
                END IF;
            END IF;
        END LOOP;
    END IF;

    -- Return the value of is_open
    RETURN is_open;
END;
$function$;

alter table "service_provider"."details" drop column "timezone" cascade;

alter table "service_provider"."details" add column "time_zone" text
 null default 'America/Mexico_City';



alter table "business"."home_rental" drop constraint "home_rental_rental_id_fkey";

alter table "business"."home_rental" rename column "rental_id" to "id";

DROP FUNCTION "business"."get_home_rentals"("geography");

alter table "business"."home_rental" rename to "home";

alter table "business"."home" add column "business_id" integer
 not null;

BEGIN TRANSACTION;
ALTER TABLE "business"."home" DROP CONSTRAINT "home_rental_pkey";

ALTER TABLE "business"."home"
    ADD CONSTRAINT "home_rental_pkey" PRIMARY KEY ("business_id");
COMMIT TRANSACTION;

alter table "business"."home" drop column "id" cascade;

alter table "business"."home" add column "id" serial
 not null;

BEGIN TRANSACTION;
ALTER TABLE "business"."home" DROP CONSTRAINT "home_rental_pkey";

ALTER TABLE "business"."home"
    ADD CONSTRAINT "home_rental_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;

DROP table "business"."home";

CREATE TABLE "business"."home" ("id" serial NOT NULL, "details_id" integer NOT NULL, "business_id" integer NOT NULL, "available_for" text NOT NULL, "location_id" integer NOT NULL, PRIMARY KEY ("id") );

CREATE TABLE "business"."home_location" ("id" serial NOT NULL, "name" text NOT NULL, "gps" geography NOT NULL, "address" text NOT NULL, PRIMARY KEY ("id") );

alter table "business"."home"
  add constraint "home_details_id_fkey"
  foreign key ("details_id")
  references "business"."item_details"
  ("id") on update restrict on delete restrict;

alter table "business"."home" drop constraint "home_details_id_fkey",
  add constraint "home_details_id_fkey"
  foreign key ("details_id")
  references "business"."item_details"
  ("id") on update cascade on delete cascade;

alter table "business"."home" drop constraint "home_details_id_fkey",
  add constraint "home_details_id_fkey"
  foreign key ("details_id")
  references "business"."item_details"
  ("id") on update restrict on delete cascade;

alter table "business"."home"
  add constraint "home_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete cascade;

alter table "business"."home"
  add constraint "home_location_id_fkey"
  foreign key ("location_id")
  references "business"."home_location"
  ("id") on update restrict on delete cascade;

alter table "business"."home" add column "bedrooms" integer
 not null default '1';

alter table "business"."home" add column "bathrooms" integer
 not null default '1';

alter table "business"."home" add column "offering_type" text
 not null default 'home';


alter table "service_provider"."details" alter column "unique_id" set not null;
alter table "service_provider"."details" add constraint "details_unique_id_key" unique ("unique_id");

alter table "service_provider"."details" add column "advertise_only" boolean
 not null default 'false';
