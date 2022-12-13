
alter table "public"."delivery_order"
  add constraint "delivery_deliverer_app_type_id_fkey"
  foreign key ("delivery_driver_type")
  references "topology"."app_type"
  ("id") on update restrict on delete restrict;

comment on column "public"."delivery_driver"."delivery_driver_type" is NULL;

CREATE  INDEX "delivery_company_index" on
  "public"."delivery_driver" using btree ("delivery_company_id", "delivery_company_type");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION deliOp_notification_token(delivery_operator_row delivery_operator)
--     RETURNS varchar
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT token
--     FROM notification_info n
--     WHERE n.user_id = delivery_operator_row.user_id
--     AND n.app_type_id = 'delivery_admin';
-- $$;

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_user_id_restaurant_id_key";
alter table "public"."restaurant_operator" add constraint "restaurant_operator_user_id_key" unique ("user_id");

alter table "public"."restaurant_operator" add constraint "restaurant_operator_restaurant_id_key" unique ("restaurant_id");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."user" add column "big_image" text
--  null;
