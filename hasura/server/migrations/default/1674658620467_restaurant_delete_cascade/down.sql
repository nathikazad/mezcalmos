
alter table "restaurant"."cart" drop constraint "cart_restaurant_id_fkey",
  add constraint "restaurant_cart_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."order_item" drop constraint "order_item_restaurant_item_id_fkey",
  add constraint "restaurant_order_item_restaurant_item_id_fkey"
  foreign key ("restaurant_item_id")
  references "restaurant"."item"
  ("id") on update restrict on delete restrict;
