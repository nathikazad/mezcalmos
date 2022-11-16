
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."chat" add column "creation_time" timestamptz
--  not null default now();

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "cancellation_time" timestamptz
--  null;

comment on column "public"."delivery"."status" is E'orderReceived';

comment on column "public"."restaurant_cart_item"."selected_options" is NULL;
