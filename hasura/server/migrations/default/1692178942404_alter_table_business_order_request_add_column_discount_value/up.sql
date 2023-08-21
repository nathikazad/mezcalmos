alter table "business"."order_request" add column "discount_value" money
 not null default '0';
