
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
