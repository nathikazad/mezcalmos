


alter table "public"."chat_participant" drop constraint "chat_participants_chat_id_fkey",
  add constraint "chat_participant_chat_id_fkey"
  foreign key ("chat_id")
  references "public"."chat"
  ("id") on update restrict on delete cascade;

alter table "public"."notification_info" drop constraint "notification_info_app_type_id_fkey",
  add constraint "notification_info_app_type_id_fkey"
  foreign key ("app_type_id")
  references "topology"."app_type"
  ("id") on update cascade on delete restrict;

CREATE FUNCTION special_items(restaurant_row restaurant) 
    RETURNS SETOF restaurant_item
    LANGUAGE sql
    STABLE
AS $$
    SELECT *
    FROM restaurant_item r
    WHERE r.restaurant_id = restaurant_row.id AND r.item_type = 'special';
    
$$;
-- DROP FUNCTION cost;

alter table "public"."notification_info" add constraint "notification_info_user_id_app_type_id_key" unique ("user_id", "app_type_id");

CREATE FUNCTION notification_token(delivery_row delivery) 
    RETURNS varchar
    LANGUAGE sql
    STABLE
AS $$
    SELECT token
    FROM notification_info n
    WHERE n.user_id = (SELECT user_id FROM deliverer WHERE deliverer.id = delivery_row.deliverer_id)
    AND n.app_type_id = delivery_row.deliverer_app_type_id;
    
$$;
-- DROP FUNCTION cost;

CREATE FUNCTION customer_notification_token(customer_row customer) 
    RETURNS varchar
    LANGUAGE sql
    STABLE
AS $$
    SELECT token
    FROM notification_info n
    WHERE n.user_id = customer_row.user_id
    AND n.app_type_id = 'customer_mobile';
$$;
-- DROP FUNCTION cost;

alter table "public"."customer" drop column "notification_info_id" cascade;

alter table "public"."mez_admin" drop column "notification_info_id" cascade;

CREATE FUNCTION mez_admin_notification_token(mez_admin_row mez_admin) 
    RETURNS varchar
    LANGUAGE sql
    STABLE
AS $$
    SELECT token
    FROM notification_info n
    WHERE n.user_id = mez_admin_row.user_id
    AND n.app_type_id = 'mez_admin';
$$;
-- DROP FUNCTION cost;

CREATE FUNCTION restaurant_operator_notification_token(restaurant_operator_row restaurant_operator) 
    RETURNS varchar
    LANGUAGE sql
    STABLE
AS $$
    SELECT token
    FROM notification_info n
    WHERE n.user_id = restaurant_operator_row.user_id
    AND n.app_type_id = 'restaurant';
$$;
-- DROP FUNCTION cost;

CREATE FUNCTION delivery_notification_token(delivery_row delivery) 
    RETURNS varchar
    LANGUAGE sql
    STABLE
AS $$
    SELECT token
    FROM notification_info n
    WHERE n.user_id = (
    CASE
        WHEN delivery_row.deliverer_app_type_id = 'restaurant' THEN (SELECT user_id FROM restaurant_operator r WHERE r.id = delivery_row.deliverer_id)
        ELSE (SELECT user_id FROM deliverer WHERE deliverer.id = delivery_row.deliverer_id)
    END
    )
    AND n.app_type_id = delivery_row.deliverer_app_type_id;
$$;
-- DROP FUNCTION cost;

alter table "public"."restaurant_operator" drop column "notification_info_id" cascade;
