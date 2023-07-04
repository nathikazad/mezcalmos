
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
