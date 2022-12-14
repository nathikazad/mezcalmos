alter table "public"."restaurant_cart_item" add constraint "restaurant_cart_item_customer_id_restaurant_item_id_key" unique ("customer_id", "restaurant_item_id");
