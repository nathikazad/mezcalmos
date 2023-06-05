
alter table "business"."service" drop constraint "service_business_id_fkey",
  add constraint "service_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "business"."product" drop constraint "product_business_id_fkey",
  add constraint "product_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "business"."order_request_item" drop constraint "order_request_item_order_request_id_fkey",
  add constraint "order_request_item_order_request_id_fkey"
  foreign key ("order_request_id")
  references "business"."order_request"
  ("id") on update restrict on delete restrict;

alter table "business"."order_request" drop constraint "order_request_business_id_fkey",
  add constraint "order_request_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "business"."operator" drop constraint "operator_business_id_fkey",
  add constraint "operator_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "business"."item_details" drop constraint "item_details_business_id_fkey",
  add constraint "item_details_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "business"."event" drop constraint "event_business_id_fkey",
  add constraint "event_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "business"."cart" drop constraint "cart_business_id_fkey",
  add constraint "cart_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "delivery"."operator" drop constraint "operator_delivery_company_id_fkey",
  add constraint "delivery_operator_delivery_company_id_fkey"
  foreign key ("delivery_company_id")
  references "delivery"."company"
  ("id") on update restrict on delete restrict;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "last_active_time" timestamp
--  null;
