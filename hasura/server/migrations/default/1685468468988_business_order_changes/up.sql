
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
