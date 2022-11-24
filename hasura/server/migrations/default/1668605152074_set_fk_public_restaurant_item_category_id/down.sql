alter table "public"."restaurant_item" drop constraint "restaurant_item_category_id_fkey",
  add constraint "restaurant_item_category_id_fkey"
  foreign key ("category_id")
  references "public"."restaurant_category"
  ("id") on update restrict on delete restrict;
