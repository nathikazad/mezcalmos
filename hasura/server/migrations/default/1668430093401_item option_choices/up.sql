
alter table "public"."restaurant_option_choice_map" add constraint "restaurant_option_choice_map_option_id_choice_id_key" unique ("option_id", "choice_id");

BEGIN TRANSACTION;
ALTER TABLE "public"."restaurant_option_choice_map" DROP CONSTRAINT "restaurant_option_choice_map_pkey";

ALTER TABLE "public"."restaurant_option_choice_map"
    ADD CONSTRAINT "restaurant_option_choice_map_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;

alter table "public"."restaurant_option_choice_map" drop column "choice_id" cascade;

alter table "public"."restaurant_option_choice_map" add column "choice_id" serial
 not null;

alter table "public"."restaurant_option_choice_map" add constraint "restaurant_option_choice_map_option_id_choice_id_key" unique ("option_id", "choice_id");

ALTER TABLE "public"."restaurant_item_option_map" ALTER COLUMN "option_id" drop default;

alter table "public"."restaurant_item_option_map" alter column "option_id" set default nextval('restaurant_item_option_map_option_id_seq'::regclass);

alter table "public"."restaurant_item_option_map" alter column "option_id" set default nextval('restaurant_option_id_seq'::regclass);

alter table "public"."restaurant_item_option_map" alter column "option_id" set default nextval('restaurant_item_option_map_option_id_seq'::regclass);

alter table "public"."restaurant_option" alter column "id" set default nextval('restaurant_item_option_map_option_id_seq'::regclass);

alter table "public"."restaurant_choice" alter column "id" set default nextval('restaurant_option_choice_map_choice_id_seq'::regclass);
