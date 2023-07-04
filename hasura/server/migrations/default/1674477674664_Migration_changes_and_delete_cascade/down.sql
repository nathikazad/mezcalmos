
alter table "restaurant"."order" alter column "chat_id" set not null;

alter table "restaurant"."choice" drop constraint "choice_restaurant_id_fkey",
  add constraint "restaurant_choice_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."choice" drop constraint "choice_name_id_fkey",
  add constraint "restaurant_choice_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."option_choice_map" drop constraint "option_choice_map_restaurant_id_fkey",
  add constraint "restaurant_option_choice_map_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."option" drop constraint "option_restaurant_id_fkey",
  add constraint "restaurant_option_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."option" drop constraint "option_name_id_fkey",
  add constraint "restaurant_option_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."item" drop constraint "item_restaurant_id_fkey",
  add constraint "restaurant_item_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."item" drop constraint "item_name_id_fkey",
  add constraint "restaurant_item_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."item" drop constraint "item_description_id_fkey",
  add constraint "restaurant_item_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."item" drop constraint "item_category_id_fkey",
  add constraint "restaurant_item_category_id_fkey"
  foreign key ("category_id")
  references "restaurant"."category"
  ("id") on update set null on delete set null;

alter table "restaurant"."category" drop constraint "category_description_id_fkey",
  add constraint "restaurant_category_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."category" drop constraint "category_name_id_fkey",
  add constraint "restaurant_category_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."category" drop constraint "category_restaurant_id_fkey",
  add constraint "restaurant_category_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."restaurant" drop constraint "restaurant_description_id_fkey",
  add constraint "restaurant_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."option_choice_map"
  add constraint "restaurant_option_choice_map_choice_id_fkey"
  foreign key ("choice_id")
  references "restaurant"."choice"
  ("id") on update cascade on delete cascade;
