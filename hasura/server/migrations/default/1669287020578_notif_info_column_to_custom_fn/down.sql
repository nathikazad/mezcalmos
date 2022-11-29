


alter table "public"."restaurant_operator"
  add constraint "restaurant_operator_notification_info_id_fkey"
  foreign key (notification_info_id)
  references "public"."notification_info"
  (id) on update restrict on delete restrict;
alter table "public"."restaurant_operator" alter column "notification_info_id" drop not null;
alter table "public"."restaurant_operator" add column "notification_info_id" int4;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION delivery_notification_token(delivery_row delivery)
--     RETURNS varchar
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT token
--     FROM notification_info n
--     WHERE n.user_id = (
--     CASE
--         WHEN delivery_row.deliverer_app_type_id = 'restaurant' THEN (SELECT user_id FROM restaurant_operator r WHERE r.id = delivery_row.deliverer_id)
--         ELSE (SELECT user_id FROM deliverer WHERE deliverer.id = delivery_row.deliverer_id)
--     END
--     )
--     AND n.app_type_id = delivery_row.deliverer_app_type_id;
-- $$;
-- -- DROP FUNCTION cost;

alter table "public"."mez_admin"
  add constraint "mez_admin_notification_info_id_fkey"
  foreign key (notification_info_id)
  references "public"."notification_info"
  (id) on update restrict on delete restrict;
alter table "public"."mez_admin" alter column "notification_info_id" drop not null;
alter table "public"."mez_admin" add column "notification_info_id" int4;

alter table "public"."customer" alter column "notification_info_id" drop not null;
alter table "public"."customer" add column "notification_info_id" int4;

alter table "public"."notification_info" drop constraint "notification_info_user_id_app_type_id_key";

alter table "public"."notification_info" drop constraint "notification_info_app_type_id_fkey",
  add constraint "notification_info_app_type_id_fkey"
  foreign key ("app_type_id")
  references "topology"."app_type"
  ("id") on update restrict on delete restrict;
