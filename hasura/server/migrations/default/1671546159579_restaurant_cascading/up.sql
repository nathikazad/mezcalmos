
alter table "public"."restaurant_cart_item" drop constraint "restaurant_cart_restaurant_item_id_fkey",
  add constraint "restaurant_cart_item_restaurant_item_id_fkey"
  foreign key ("restaurant_item_id")
  references "public"."restaurant_item"
  ("id") on update cascade on delete cascade;

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_item_id_fkey",
  add constraint "restaurant_item_option_map_item_id_fkey"
  foreign key ("item_id")
  references "public"."restaurant_item"
  ("id") on update cascade on delete cascade;

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_restaurant_id_fkey",
  add constraint "restaurant_item_option_map_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "public"."restaurant"
  ("id") on update cascade on delete cascade;

alter table "public"."restaurant_item" drop constraint "restaurant_item_category_id_fkey",
  add constraint "restaurant_item_category_id_fkey"
  foreign key ("category_id")
  references "public"."restaurant_category"
  ("id") on update set null on delete set null;

alter table "public"."restaurant_option_choice_map" drop constraint "restaurant_option_choice_map_option_id_fkey",
  add constraint "restaurant_option_choice_map_option_id_fkey"
  foreign key ("option_id")
  references "public"."restaurant_option"
  ("id") on update cascade on delete cascade;

alter table "public"."restaurant_option_choice_map"
  add constraint "restaurant_option_choice_map_choice_id_fkey"
  foreign key ("choice_id")
  references "public"."restaurant_choice"
  ("id") on update cascade on delete cascade;

alter table "public"."restaurant" alter column "schedule" set default '"{\"monday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"tuesday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"wednesday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"thursday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"friday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"saturday\":{\"from\":\"8:0\",\"to\":\"19:0\",\"isOpen\":false},\"sunday\":{\"from\":\"8:0\",\"to\":\"16:0\",\"isOpen\":false}}"';
