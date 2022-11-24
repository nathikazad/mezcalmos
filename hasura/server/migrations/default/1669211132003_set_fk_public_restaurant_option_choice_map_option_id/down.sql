alter table "public"."restaurant_option_choice_map" drop constraint "restaurant_option_choice_map_option_id_fkey",
  add constraint "restaurant_option_choice_map_option_id_fkey"
  foreign key ("option_id")
  references "public"."restaurant_option"
  ("id") on update restrict on delete restrict;
