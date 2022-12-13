
alter table "public"."user" add column "big_image" text
 null;

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_restaurant_id_key";

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_user_id_key";
alter table "public"."restaurant_operator" add constraint "restaurant_operator_user_id_restaurant_id_key" unique ("user_id", "restaurant_id");

CREATE FUNCTION deliOp_notification_token(delivery_operator_row delivery_operator) 
    RETURNS varchar
    LANGUAGE sql
    STABLE
AS $$
    SELECT token
    FROM notification_info n
    WHERE n.user_id = delivery_operator_row.user_id
    AND n.app_type_id = 'delivery_admin';
$$;

DROP INDEX IF EXISTS "public"."delivery_company_index";

comment on column "public"."delivery_driver"."delivery_driver_type" is E'Just for relationship';

alter table "public"."delivery_order" drop constraint "delivery_deliverer_app_type_id_fkey";
