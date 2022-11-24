
alter table "public"."restaurant_choice" alter column "id" set default nextval('restaurant_choice_id_seq'::regclass);

alter table "public"."restaurant_option" alter column "id" set default nextval('restaurant_option_id_seq'::regclass);

alter table "public"."restaurant_item_option_map" alter column "option_id" set default nextval('restaurant_option_id_seq'::regclass);

alter table "public"."restaurant_item_option_map" alter column "option_id" set default nextval('restaurant_item_option_map_option_id_seq'::regclass);

ALTER TABLE "public"."restaurant_item_option_map" ALTER COLUMN "option_id" drop default;

alter table "public"."restaurant_item_option_map" alter column "option_id" set default nextval('restaurant_item_option_map_option_id_seq'::regclass);

alter table "public"."restaurant_option_choice_map" drop constraint "restaurant_option_choice_map_option_id_choice_id_key";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_option_choice_map" add column "choice_id" serial
--  not null;

alter table "public"."restaurant_option_choice_map" add constraint "restaurant_option_choice_map_option_id_choice_id_key" unique (option_id, choice_id);
alter table "public"."restaurant_option_choice_map"
  add constraint "restaurant_option_choice_map_choice_id_fkey"
  foreign key (choice_id)
  references "public"."restaurant_choice"
  (id) on update restrict on delete restrict;
alter table "public"."restaurant_option_choice_map" alter column "choice_id" drop not null;
alter table "public"."restaurant_option_choice_map" add column "choice_id" int4;

alter table "public"."restaurant_option_choice_map" drop constraint "restaurant_option_choice_map_pkey";
alter table "public"."restaurant_option_choice_map"
    add constraint "restaurant_option_choice_map_pkey"
    primary key ("choice_id", "option_id");

alter table "public"."restaurant_option_choice_map" drop constraint "restaurant_option_choice_map_option_id_choice_id_key";
