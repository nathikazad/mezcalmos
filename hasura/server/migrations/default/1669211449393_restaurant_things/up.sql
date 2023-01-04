
alter table "public"."restaurant_item" drop constraint "restaurant_item_category_id_fkey",
  add constraint "restaurant_item_category_id_fkey"
  foreign key ("category_id")
  references "public"."restaurant_category"
  ("id") on update restrict on delete cascade;

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_item_id_fkey",
  add constraint "restaurant_item_option_map_item_id_fkey"
  foreign key ("item_id")
  references "public"."restaurant_item"
  ("id") on update restrict on delete cascade;

alter table "public"."restaurant_option_choice_map" drop constraint "restaurant_option_choice_map_option_id_fkey",
  add constraint "restaurant_option_choice_map_option_id_fkey"
  foreign key ("option_id")
  references "public"."restaurant_option"
  ("id") on update restrict on delete cascade;

alter table "public"."restaurant_option_choice_map" drop constraint "restaurant_option_choice_map_option_id_fkey",
  add constraint "restaurant_option_choice_map_option_id_fkey"
  foreign key ("option_id")
  references "public"."restaurant_option"
  ("id") on update restrict on delete cascade;
