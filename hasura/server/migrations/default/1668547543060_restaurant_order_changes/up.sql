
ALTER TABLE "public"."restaurant_order" ALTER COLUMN "order_time" TYPE timestamp without time zone;

CREATE FUNCTION cost(cart_row restaurant_cart) 
    RETURNS money
    LANGUAGE sql
    STABLE
AS $$
    SELECT SUM(quantity * cost_per_one)
    FROM restaurant_cart_item
    WHERE customer_id = cart_row.customer_id;
$$;

-- CREATE FUNCTION totalCost(order_row restaurant_order) 
--     RETURNS money
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT order_row.delivery_cost + order_row.itemsCost
-- $$;
-- DROP FUNCTION cost;

CREATE FUNCTION itemsCost(order_row restaurant_order) 
    RETURNS money
    LANGUAGE sql
    STABLE
AS $$
    SELECT SUM(quantity * cost_per_one)
    FROM restaurant_order_item
    WHERE restaurant_order_id = order_row.id;
$$;

-- CREATE FUNCTION totalCost(order_row restaurant_order) 
--     RETURNS money
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT order_row.delivery_cost + order_row.itemsCost
-- $$;
-- DROP FUNCTION cost;

CREATE FUNCTION totalCost(order_row restaurant_order) 
    RETURNS money
    LANGUAGE sql
    STABLE
AS $$
    SELECT order_row.delivery_cost + order_row.itemsCost
$$;
-- DROP FUNCTION cost;

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "order_time" TYPE timestamptz;
alter table "public"."restaurant_order" alter column "order_time" set default now();

alter table "public"."delivery" alter column "deliverer_app_type_id" drop not null;

alter table "public"."delivery" alter column "deliverer_id" drop not null;

alter table "public"."chat" alter column "chat_info" drop not null;

alter table "public"."chat_participant" add column "id" serial
 not null;

BEGIN TRANSACTION;
ALTER TABLE "public"."chat_participant" DROP CONSTRAINT "chat_participants_pkey";

ALTER TABLE "public"."chat_participant"
    ADD CONSTRAINT "chat_participants_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "review_id" drop default;

alter table "public"."delivery" add column "order_time" timestamptz
 not null default now();

alter table "public"."restaurant_order_item" drop constraint "restaurant_order_item_restaurant_order_id_fkey",
  add constraint "restaurant_order_item_restaurant_order_id_fkey"
  foreign key ("restaurant_order_id")
  references "public"."restaurant_order"
  ("id") on update restrict on delete cascade;

alter table "public"."delivery" drop constraint "delivery_chat_with_service_provider_id_fkey",
  add constraint "delivery_chat_with_service_provider_id_fkey"
  foreign key ("chat_with_service_provider_id")
  references "public"."chat"
  ("id") on update restrict on delete cascade;
