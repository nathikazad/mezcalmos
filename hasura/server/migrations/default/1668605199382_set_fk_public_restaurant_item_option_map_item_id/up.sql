alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_item_id_fkey",
  add constraint "restaurant_item_option_map_item_id_fkey"
  foreign key ("item_id")
  references "public"."restaurant_item"
  ("id") on update restrict on delete cascade;
