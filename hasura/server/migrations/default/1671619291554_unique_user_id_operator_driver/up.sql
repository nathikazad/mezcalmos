
alter table "public"."delivery_driver" drop constraint "deliverer_user_id_delivery_company_type_delivery_company_id_key";
alter table "public"."delivery_driver" add constraint "delivery_driver_user_id_key" unique ("user_id");

alter table "public"."delivery_operator" add constraint "delivery_operator_user_id_key" unique ("user_id");

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_user_id_restaurant_id_key";
alter table "public"."restaurant_operator" add constraint "restaurant_operator_user_id_key" unique ("user_id");
