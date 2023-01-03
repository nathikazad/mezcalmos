
alter table "public"."restaurant_operator" drop constraint "restaurant_operator_user_id_key";
alter table "public"."restaurant_operator" add constraint "restaurant_operator_restaurant_id_user_id_key" unique ("restaurant_id", "user_id");

alter table "public"."delivery_operator" drop constraint "delivery_operator_user_id_key";

alter table "public"."delivery_driver" drop constraint "delivery_driver_user_id_key";
alter table "public"."delivery_driver" add constraint "delivery_driver_delivery_company_type_delivery_company_id_user_id_key" unique ("delivery_company_type", "delivery_company_id", "user_id");
