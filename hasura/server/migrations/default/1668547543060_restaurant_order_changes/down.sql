
alter table "public"."delivery" drop constraint "delivery_chat_with_service_provider_id_fkey",
  add constraint "delivery_chat_with_service_provider_id_fkey"
  foreign key ("chat_with_service_provider_id")
  references "public"."chat"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_order_item" drop constraint "restaurant_order_item_restaurant_order_id_fkey",
  add constraint "restaurant_order_item_restaurant_order_id_fkey"
  foreign key ("restaurant_order_id")
  references "public"."restaurant_order"
  ("id") on update restrict on delete restrict;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "order_time" timestamptz
--  not null default now();

alter table "public"."restaurant_order" alter column "review_id" set default '0';

alter table "public"."chat_participant" drop constraint "chat_participant_pkey";
alter table "public"."chat_participant"
    add constraint "chat_participants_pkey"
    primary key ("participant_id", "chat_id");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."chat_participant" add column "id" serial
--  not null;

alter table "public"."chat" alter column "chat_info" set not null;

alter table "public"."delivery" alter column "deliverer_id" set not null;

alter table "public"."delivery" alter column "deliverer_app_type_id" set not null;

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "order_time" drop default;
ALTER TABLE "public"."restaurant_order" ALTER COLUMN "order_time" TYPE timestamp without time zone;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION totalCost(order_row restaurant_order)
--     RETURNS money
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT order_row.delivery_cost + order_row.itemsCost
-- $$;
-- -- DROP FUNCTION cost;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION itemsCost(order_row restaurant_order)
--     RETURNS money
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT SUM(quantity * cost_per_one)
--     FROM restaurant_order_item
--     WHERE restaurant_order_id = order_row.id;
-- $$;
--
-- -- CREATE FUNCTION totalCost(order_row restaurant_order)
-- --     RETURNS money
-- --     LANGUAGE sql
-- --     STABLE
-- -- AS $$
-- --     SELECT order_row.delivery_cost + order_row.itemsCost
-- -- $$;
-- -- DROP FUNCTION cost;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION cost(cart_row restaurant_cart)
--     RETURNS money
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT SUM(quantity * cost_per_one)
--     FROM restaurant_cart_item
--     WHERE customer_id = cart_row.customer_id;
-- $$;
--
-- -- CREATE FUNCTION totalCost(order_row restaurant_order)
-- --     RETURNS money
-- --     LANGUAGE sql
-- --     STABLE
-- -- AS $$
-- --     SELECT order_row.delivery_cost + order_row.itemsCost
-- -- $$;
-- -- DROP FUNCTION cost;

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "order_time" TYPE timestamp with time zone;
