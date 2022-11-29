
alter table "public"."restaurant" drop column "schedule_id" cascade;

alter table "public"."restaurant" add column "schedule" jsonb
 null;

alter table "public"."restaurant_operator" add constraint "restaurant_operator_restaurant_id_user_id_key" unique ("restaurant_id", "user_id");

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_restaurant_id_user_id_key";
alter table "public"."restaurant_operator" add constraint "restaurant_operator_restaurant_id_user_id_key" unique ("restaurant_id", "user_id");

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_restaurant_id_user_id_key";
alter table "public"."restaurant_operator" add constraint "restaurant_operator_restaurant_id_key" unique ("restaurant_id");

alter table "public"."restaurant_operator" add constraint "restaurant_operator_user_id_key" unique ("user_id");
