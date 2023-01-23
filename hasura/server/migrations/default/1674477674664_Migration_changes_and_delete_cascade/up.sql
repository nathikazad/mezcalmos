
alter table "restaurant"."option_choice_map" drop constraint "restaurant_option_choice_map_choice_id_fkey";

alter table "restaurant"."restaurant" drop constraint "restaurant_description_id_fkey",
  add constraint "restaurant_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."category" drop constraint "restaurant_category_restaurant_id_fkey",
  add constraint "category_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."category" drop constraint "restaurant_category_name_id_fkey",
  add constraint "category_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."category" drop constraint "restaurant_category_description_id_fkey",
  add constraint "category_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."item" drop constraint "restaurant_item_category_id_fkey",
  add constraint "item_category_id_fkey"
  foreign key ("category_id")
  references "restaurant"."category"
  ("id") on update set null on delete cascade;

alter table "restaurant"."item" drop constraint "restaurant_item_description_id_fkey",
  add constraint "item_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."item" drop constraint "restaurant_item_name_id_fkey",
  add constraint "item_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."item" drop constraint "restaurant_item_restaurant_id_fkey",
  add constraint "item_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."option" drop constraint "restaurant_option_name_id_fkey",
  add constraint "option_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."option" drop constraint "restaurant_option_restaurant_id_fkey",
  add constraint "option_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."option_choice_map" drop constraint "restaurant_option_choice_map_restaurant_id_fkey",
  add constraint "option_choice_map_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."choice" drop constraint "restaurant_choice_name_id_fkey",
  add constraint "choice_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."choice" drop constraint "restaurant_choice_restaurant_id_fkey",
  add constraint "choice_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."order" alter column "chat_id" drop not null;
