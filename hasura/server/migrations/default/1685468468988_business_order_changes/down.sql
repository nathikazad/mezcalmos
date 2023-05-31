
alter table "business"."order_request_item" rename column "item_details_id" to "item_id";

alter table "business"."cart_item" rename column "item_details_id" to "business_item_id";

alter table "business"."order_request_item" alter column "item_type" drop not null;
alter table "business"."order_request_item" add column "item_type" text;

alter table "business"."cart_item" add constraint "cart_item_customer_id_service_id_service_type_key" unique (item_type, customer_id, business_item_id);
alter table "business"."cart_item" alter column "item_type" drop not null;
alter table "business"."cart_item" add column "item_type" text;

alter table "business"."order_request_item" alter column "commence_time" drop not null;
alter table "business"."order_request_item" add column "commence_time" timestamptz;

alter table "business"."order_request_item" rename column "parameters" to "cost";

alter table "business"."order_request_item" rename column "item_type" to "service_type";

alter table "business"."order_request_item" rename column "item_id" to "service_id";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request" add column "commence_time" timestamptz
--  null;

alter table "business"."cart_item" rename column "parameters" to "cost";

alter table "business"."cart_item" rename column "item_type" to "service_type";

alter table "business"."cart_item" rename column "business_item_id" to "service_id";
