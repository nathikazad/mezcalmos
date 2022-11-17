
BEGIN TRANSACTION;
ALTER TABLE "public"."restaurant_item_option_map" DROP CONSTRAINT "restaurant_item_option_map_pkey";

ALTER TABLE "public"."restaurant_item_option_map"
    ADD CONSTRAINT "restaurant_item_option_map_pkey" PRIMARY KEY ("item_id");
COMMIT TRANSACTION;

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_option_id_fkey";

alter table "public"."restaurant_item_option_map" drop column "option_id" cascade;

alter table "public"."restaurant_item_option_map" add column "option_id" serial
 not null;

BEGIN TRANSACTION;
ALTER TABLE "public"."restaurant_item_option_map" DROP CONSTRAINT "restaurant_item_option_map_pkey";

ALTER TABLE "public"."restaurant_item_option_map"
    ADD CONSTRAINT "restaurant_item_option_map_pkey" PRIMARY KEY ("item_id", "option_id");
COMMIT TRANSACTION;

alter table "public"."restaurant_item_option_map"
  add constraint "restaurant_item_option_map_option_id_fkey"
  foreign key ("option_id")
  references "public"."restaurant_option"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_item_option_map" drop constraint "restaurant_item_option_map_option_id_fkey";

alter table "public"."restaurant_item_option_map" add column "id" serial
 not null;

BEGIN TRANSACTION;
ALTER TABLE "public"."restaurant_item_option_map" DROP CONSTRAINT "restaurant_item_option_map_pkey";

ALTER TABLE "public"."restaurant_item_option_map"
    ADD CONSTRAINT "restaurant_item_option_map_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;

alter table "public"."restaurant_item_option_map" add constraint "restaurant_item_option_map_item_id_option_id_key" unique ("item_id", "option_id");

alter table "public"."restaurant_option_choice_map" add column "id" serial
 not null;