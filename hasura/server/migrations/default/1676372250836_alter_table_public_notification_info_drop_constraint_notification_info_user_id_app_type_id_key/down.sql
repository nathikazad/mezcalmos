alter table "public"."notification_info" add constraint "notification_info_user_id_app_type_id_key" unique ("user_id", "app_type_id");
