
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_option_choice_map" add column "id" serial
--  not null;

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_item_id_option_id_key";

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_pkey";
alter table "public"."restaurant_item_option_map"
    add constraint "restaurant_item_option_map_pkey"
    primary key ("option_id", "item_id");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_item_option_map" add column "id" serial
--  not null;

alter table "public"."restaurant_item_option_map"
  add constraint "restaurant_item_option_map_option_id_fkey"
  foreign key ("option_id")
  references "public"."restaurant_option"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_option_id_fkey";

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_pkey";
alter table "public"."restaurant_item_option_map"
    add constraint "restaurant_item_option_map_pkey"
    primary key ("item_id");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_item_option_map" add column "option_id" serial
--  not null;

alter table "public"."restaurant_item_option_map" alter column "option_id" drop not null;
alter table "public"."restaurant_item_option_map" add column "option_id" int4;

alter table "public"."restaurant_item_option_map"
  add constraint "restaurant_item_option_map_option_id_fkey"
  foreign key ("option_id")
  references "public"."restaurant_option"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_pkey";
alter table "public"."restaurant_item_option_map"
    add constraint "restaurant_item_option_map_pkey"
    primary key ("option_id", "item_id");