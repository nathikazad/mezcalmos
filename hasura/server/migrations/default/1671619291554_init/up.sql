

CREATE TABLE "public"."order" ("id" text NOT NULL, "order_type" text NOT NULL, "service_provider_id" text NOT NULL, "payment_type" text NOT NULL, "to_address_gps" geography NOT NULL, "to_address_text" text NOT NULL, "customer_id" text NOT NULL, "order_time" timestamptz NOT NULL DEFAULT now(), "original_cost" float8 NOT NULL, "refund_amount" float8 NOT NULL, "final_cost" float8 NOT NULL, PRIMARY KEY ("id") );

DROP table "public"."order";

CREATE TABLE "public"."restaurant_order" ("id" serial NOT NULL, "user_id" integer NOT NULL, "restaurant_id" integer NOT NULL, "payment_type" text NOT NULL DEFAULT 'Cash', "to_location_gps" geography NOT NULL, "to_location_address" text NOT NULL, "estimated_food_ready_time" timestamptz, "actual_food_ready_time" timestamptz, "stripe_payment_id" integer, "refund_amount" integer NOT NULL DEFAULT 0, "delivery_id" integer, "status" text NOT NULL, "review_rating" integer DEFAULT 0, "review_text" text, "order_type" text NOT NULL DEFAULT 'delivery', "order_time" timestamptz NOT NULL, PRIMARY KEY ("id") );

CREATE TABLE "public"."restaurant" ("id" serial NOT NULL, "name" text NOT NULL, "image" text NOT NULL, "location_gps" geography NOT NULL, "location_text" text NOT NULL, "description_id" integer, "firebase_id" text, "language_id" integer NOT NULL, "schedule_id" integer NOT NULL, "payment_info_id" integer, PRIMARY KEY ("id") );

CREATE TABLE "topology"."language" ("id" text NOT NULL, PRIMARY KEY ("id") );

CREATE TABLE "public"."translation" ("id" serial NOT NULL, "language_id" integer NOT NULL, "value" text NOT NULL, "shared" boolean NOT NULL DEFAULT false, "group_id" integer NOT NULL, PRIMARY KEY ("id") , UNIQUE ("group_id", "language_id"));

alter table "public"."translation" drop column "language_id" cascade;

alter table "public"."translation" drop column "value" cascade;

alter table "public"."translation" drop column "group_id" cascade;

CREATE TABLE "public"."translation_value" ("translation_id" integer NOT NULL, "language_id" text NOT NULL, "value" text NOT NULL, PRIMARY KEY ("translation_id","language_id") , FOREIGN KEY ("language_id") REFERENCES "topology"."language"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("translation_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict);

alter table "public"."restaurant"
  add constraint "restaurant_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

CREATE TABLE "public"."restaurant_category" ("id" serial NOT NULL, "name_id" integer NOT NULL, "description_id" integer, "position" integer NOT NULL DEFAULT 1, "restaurant_id" integer NOT NULL, "schedule_id" integer, PRIMARY KEY ("id") , FOREIGN KEY ("restaurant_id") REFERENCES "public"."restaurant"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("name_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("description_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict);

alter table "public"."restaurant_order"
  add constraint "restaurant_order_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "public"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_order" add column "firebase_id" text
 null;

alter table "public"."restaurant_order" add constraint "restaurant_order_firebase_id_key" unique ("firebase_id");

alter table "public"."restaurant" add constraint "restaurant_firebase_id_key" unique ("firebase_id");

CREATE TABLE "public"."restaurant_item" ("id" serial NOT NULL, "name_id" integer NOT NULL, "description_id" integer, "position" integer NOT NULL DEFAULT 0, "category_id" integer, "cost" integer NOT NULL DEFAULT 0, "available" boolean NOT NULL DEFAULT true, "item_type" text NOT NULL, "restaurant_id" integer NOT NULL, "special_period_start" timestamptz, "special_period_end" timestamptz, PRIMARY KEY ("id") , FOREIGN KEY ("category_id") REFERENCES "public"."restaurant_category"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("name_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("description_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "public"."restaurant_option" ("id" serial NOT NULL, "name_id" integer NOT NULL, "position" integer NOT NULL DEFAULT 0, "option_type" text NOT NULL DEFAULT 'chooseOne', "minimum_choice" integer NOT NULL DEFAULT 0, "maximum_choice" integer NOT NULL DEFAULT 0, "free_choice" integer NOT NULL DEFAULT 0, "cost_per_extra" float8 NOT NULL DEFAULT 0, PRIMARY KEY ("id") );

CREATE TABLE "public"."restaurant_item_option_map" ("item_id" integer NOT NULL, "option_id" integer NOT NULL, PRIMARY KEY ("item_id","option_id") , FOREIGN KEY ("item_id") REFERENCES "public"."restaurant_item"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("option_id") REFERENCES "public"."restaurant_option"("id") ON UPDATE restrict ON DELETE restrict);

ALTER TABLE "public"."restaurant_item" ALTER COLUMN "cost" TYPE float8;

CREATE TABLE "public"."restaurant_choice" ("id" serial NOT NULL, "name_id" integer NOT NULL, "cost" float8 NOT NULL, "available" boolean NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("name_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "public"."restaurant_option_choice_map" ("option_id" integer NOT NULL, "choice_id" integer NOT NULL, PRIMARY KEY ("option_id","choice_id") , FOREIGN KEY ("choice_id") REFERENCES "public"."restaurant_choice"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("option_id") REFERENCES "public"."restaurant_option"("id") ON UPDATE restrict ON DELETE restrict);

alter table "public"."restaurant_order" add column "customer_medium" text
 not null default 'native';

CREATE TABLE "public"."service_provider_payment_info" ("id" serial NOT NULL, "cash" boolean NOT NULL DEFAULT true, "card" boolean NOT NULL DEFAULT false, "bank_transfer" boolean NOT NULL DEFAULT false, "stripe_info_id" integer, "service_provider_id" integer NOT NULL, "service_provider_type" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("service_provider_id") REFERENCES "public"."restaurant"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("service_provider_id"));

alter table "public"."service_provider_payment_info"
  add constraint "service_provider_payment_info_service_provider_id_fkey2"
  foreign key ("service_provider_id")
  references "public"."restaurant_item"
  ("id") on update restrict on delete restrict;

alter table "public"."service_provider_payment_info" drop constraint "service_provider_payment_info_service_provider_id_fkey2";

alter table "public"."restaurant"
  add constraint "restaurant_payment_info_id_fkey"
  foreign key ("payment_info_id")
  references "public"."service_provider_payment_info"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant" add constraint "restaurant_payment_info_id_key" unique ("payment_info_id");

alter table "public"."service_provider_payment_info" drop column "service_provider_id" cascade;

CREATE TABLE "public"."stripe_info" ("id" serial NOT NULL, "stripe_status" text NOT NULL, "stripe_id" text NOT NULL, "pass_fees_to_customer" boolean NOT NULL DEFAULT false, "charges_enabled" boolean NOT NULL DEFAULT false, "payouts_enabled" boolean NOT NULL DEFAULT false, "details_submitted" boolean NOT NULL DEFAULT false, "requirements" json, PRIMARY KEY ("id") , UNIQUE ("stripe_id"));

alter table "public"."service_provider_payment_info"
  add constraint "service_provider_payment_info_stripe_info_id_fkey"
  foreign key ("stripe_info_id")
  references "public"."stripe_info"
  ("id") on update restrict on delete restrict;

alter table "public"."service_provider_payment_info" add constraint "service_provider_payment_info_stripe_info_id_key" unique ("stripe_info_id");

alter table "public"."restaurant_order" add column "notes" text
 null;

alter table "public"."restaurant_order" rename column "customer_medium" to "customer_app_medium";

alter table "public"."restaurant_item" add column "archived" boolean
 not null default 'false';

CREATE TABLE "public"."restaurant_order_item" ("id" serial NOT NULL, "restaurant_item_id" integer NOT NULL, "in_json" json NOT NULL, "cost_per_one" float8 NOT NULL DEFAULT 0, "review_rating" integer, "review_text" text, "notes" text, "unavailable" boolean NOT NULL DEFAULT false, "quantity" integer NOT NULL DEFAULT 1, PRIMARY KEY ("id") , FOREIGN KEY ("restaurant_item_id") REFERENCES "public"."restaurant_item"("id") ON UPDATE restrict ON DELETE restrict);

alter table "public"."restaurant_order_item" add column "restaurant_order_id" integer
 not null;

alter table "public"."restaurant_order_item"
  add constraint "restaurant_order_item_restaurant_order_id_fkey"
  foreign key ("restaurant_order_id")
  references "public"."restaurant_order"
  ("id") on update restrict on delete restrict;

CREATE TABLE "public"."restaurant_cart" ("id" serial NOT NULL, "restaurant_item_id" integer NOT NULL, "user_id" integer NOT NULL, "selected_options" json NOT NULL, "cost_per_one" float8 NOT NULL, "quantity" integer NOT NULL DEFAULT 1, PRIMARY KEY ("id") , FOREIGN KEY ("restaurant_item_id") REFERENCES "public"."restaurant_item"("id") ON UPDATE restrict ON DELETE restrict);

alter table "public"."restaurant_order" alter column "to_location_gps" drop not null;

alter table "public"."restaurant_order" alter column "to_location_address" drop not null;

alter table "public"."restaurant_order" add column "delivery_cost" float8
 null default '0';

alter table "public"."restaurant_order" add column "tax" float8
 not null default '0';

alter table "public"."restaurant_order" alter column "delivery_cost" set not null;

CREATE TABLE "public"."delivery" ("id" serial NOT NULL, "pickup_gps" geography NOT NULL, "pickup_address" text NOT NULL, "dropoff_gps" geography NOT NULL, "dropoff_address" text NOT NULL, "deliverer_type" text NOT NULL, "deliverer_id" integer NOT NULL, "delivery_company_type" text NOT NULL, "delivery_company_id" integer NOT NULL, "chat_with_service_provider_id" integer NOT NULL, "chat_with_customer_id" integer NOT NULL, "package_cost" float8, "delivery_cost" float8 NOT NULL DEFAULT 0, "payment_type" text NOT NULL DEFAULT 'Cash', "stripe_payment_id" integer, "estimated_package_ready_time" timestamptz, "actual_package_ready_time" timestamptz, "estimated_pickup_time" timestamptz, "actual_pickup_time" timestamptz, "estimated_arrival_at_dropoff_time" timestamptz, "actual_arrival_at_dropoff_time" timestamptz, "actual_delivered_time" timestamptz, "status" text NOT NULL, "driver_review_by_service_provider_id" integer, "driver_review_by_customer_id" integer, "service_provider_review_by_driver" integer, "customer_review_by_driver" integer, PRIMARY KEY ("id") );

alter table "public"."restaurant_order" rename column "review_rating" to "review_id";

alter table "public"."restaurant_order" drop column "review_text" cascade;

alter table "public"."restaurant_order_item" rename column "review_rating" to "review_id";

alter table "public"."restaurant_order_item" drop column "review_text" cascade;

alter table "public"."delivery" rename column "estimated_pickup_time" to "estimated_arrival_at_pickup_time";

alter table "public"."delivery" rename column "actual_pickup_time" to "actual_arrival_at_pickup_time";

alter table "public"."restaurant_order" add column "chat_id" integer
 not null;

alter table "public"."restaurant_order"
  add constraint "restaurant_order_delivery_id_fkey"
  foreign key ("delivery_id")
  references "public"."delivery"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_order" rename column "user_id" to "customer_id";

alter table "public"."delivery" add column "customer_id" integer
 not null;

CREATE TABLE "public"."chat" ("id" serial NOT NULL, "messages" jsonb, "participants" jsonb NOT NULL, PRIMARY KEY ("id") );

alter table "public"."chat" add column "parent_link" text
 null;

alter table "public"."chat" drop column "parent_link" cascade;

alter table "public"."restaurant_order"
  add constraint "restaurant_order_chat_id_fkey"
  foreign key ("chat_id")
  references "public"."chat"
  ("id") on update restrict on delete restrict;

alter table "public"."chat" rename column "participants" to "chat_info";

alter table "public"."delivery" rename column "deliverer_type" to "deliverer_app_type";

alter table "public"."delivery"
  add constraint "delivery_chat_with_service_provider_id_fkey"
  foreign key ("chat_with_service_provider_id")
  references "public"."chat"
  ("id") on update restrict on delete restrict;

alter table "public"."delivery"
  add constraint "delivery_chat_with_customer_id_fkey"
  foreign key ("chat_with_customer_id")
  references "public"."chat"
  ("id") on update restrict on delete restrict;

CREATE TABLE "public"."chat_participants" ("id" serial NOT NULL, "chat_id" integer NOT NULL, "participant_id" integer NOT NULL, "notification_info_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("chat_id") REFERENCES "public"."chat"("id") ON UPDATE restrict ON DELETE restrict);

alter table "public"."chat_participants" rename to "chat_participant";

CREATE TABLE "public"."notification_info" ("id" serial NOT NULL, "user_id" integer NOT NULL, "app_type" text NOT NULL, "token" text NOT NULL, PRIMARY KEY ("id") );

CREATE TABLE "public"."review" ("id" serial NOT NULL, "rating" integer NOT NULL, "note" text, "from_entity_id" integer NOT NULL, "from_entity_type" text NOT NULL, "to_entity_id" integer NOT NULL, "to_entity_type" text NOT NULL, PRIMARY KEY ("id") );

alter table "public"."restaurant_order" rename column "customer_app_medium" to "customer_app_type";

alter table "public"."restaurant_order"
  add constraint "restaurant_order_review_id_fkey"
  foreign key ("review_id")
  references "public"."review"
  ("id") on update restrict on delete restrict;

alter table "public"."delivery" rename column "service_provider_review_by_driver" to "service_provider_review_by_driver_id";

alter table "public"."delivery" rename column "customer_review_by_driver" to "customer_review_by_driver_id";

alter table "public"."delivery"
  add constraint "delivery_driver_review_by_service_provider_id_fkey"
  foreign key ("driver_review_by_service_provider_id")
  references "public"."review"
  ("id") on update restrict on delete restrict;

alter table "public"."delivery"
  add constraint "delivery_driver_review_by_customer_id_fkey"
  foreign key ("driver_review_by_customer_id")
  references "public"."review"
  ("id") on update restrict on delete restrict;

alter table "public"."delivery"
  add constraint "delivery_service_provider_review_by_driver_id_fkey"
  foreign key ("service_provider_review_by_driver_id")
  references "public"."review"
  ("id") on update restrict on delete restrict;

alter table "public"."delivery"
  add constraint "delivery_customer_review_by_driver_id_fkey"
  foreign key ("customer_review_by_driver_id")
  references "public"."review"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_order_item"
  add constraint "restaurant_order_item_review_id_fkey"
  foreign key ("review_id")
  references "public"."review"
  ("id") on update restrict on delete restrict;

CREATE TABLE "public"."user" ("id" serial NOT NULL, "firebase_id" text NOT NULL, "name" text, "image" text, "language_id" text NOT NULL, "deleted" boolean NOT NULL DEFAULT false, PRIMARY KEY ("id") , FOREIGN KEY ("language_id") REFERENCES "topology"."language"("id") ON UPDATE restrict ON DELETE restrict);

alter table "public"."notification_info"
  add constraint "notification_info_user_id_fkey"
  foreign key ("user_id")
  references "public"."user"
  ("id") on update restrict on delete restrict;

CREATE  INDEX "notification_info_user_id" on
  "public"."notification_info" using btree ("user_id", "app_type");

CREATE TABLE "topology"."app_type" ("id" text NOT NULL, PRIMARY KEY ("id") );

alter table "public"."notification_info" rename column "app_type" to "app_type_id";

alter table "public"."notification_info"
  add constraint "notification_info_app_type_id_fkey"
  foreign key ("app_type_id")
  references "topology"."app_type"
  ("id") on update restrict on delete restrict;

BEGIN TRANSACTION;
ALTER TABLE "public"."chat_participant" DROP CONSTRAINT "chat_participants_pkey";

ALTER TABLE "public"."chat_participant"
    ADD CONSTRAINT "chat_participants_pkey" PRIMARY KEY ("chat_id", "participant_id");
COMMIT TRANSACTION;

alter table "public"."chat_participant" drop column "id" cascade;

CREATE TABLE "public"."driver" ("id" serial NOT NULL, "user_id" integer NOT NULL, "delivery_company_type" text NOT NULL, "delivery_company_id" integer NOT NULL, "status" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON UPDATE restrict ON DELETE restrict);

alter table "public"."delivery" drop column "delivery_company_type" cascade;

alter table "public"."delivery" drop column "delivery_company_id" cascade;

alter table "public"."delivery"
  add constraint "delivery_deliverer_id_fkey"
  foreign key ("deliverer_id")
  references "public"."driver"
  ("id") on update restrict on delete restrict;

alter table "public"."driver" rename to "deliverer";

CREATE TABLE "public"."restaurant_operator" ("id" serial NOT NULL, "user_id" integer NOT NULL, "restaurant_id" integer NOT NULL, "status" text NOT NULL, "owner" boolean NOT NULL DEFAULT false, "notification_info_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("notification_info_id") REFERENCES "public"."notification_info"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("restaurant_id") REFERENCES "public"."restaurant"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON UPDATE restrict ON DELETE restrict);

comment on table "public"."restaurant_order_item" is E'in_json:[name(en,es), selected_options]';

alter table "public"."delivery" add column "current_location" geography
 null;

alter table "public"."delivery" drop column "current_location" cascade;

CREATE UNIQUE INDEX "delivery_company_index" on
  "public"."deliverer" using btree ("delivery_company_type", "delivery_company_id");

alter table "public"."chat_participant"
  add constraint "chat_participant_participant_id_fkey"
  foreign key ("participant_id")
  references "public"."user"
  ("id") on update restrict on delete restrict;

alter table "public"."chat_participant"
  add constraint "chat_participant_notification_info_id_fkey"
  foreign key ("notification_info_id")
  references "public"."notification_info"
  ("id") on update restrict on delete restrict;


alter table "public"."restaurant_operator" add column "app_version" text
 null;

alter table "public"."deliverer" add column "version_number" text
 null;

alter table "public"."deliverer" rename column "version_number" to "app_version";

alter table "public"."restaurant" add column "closed_temporarily" boolean
 not null default 'false';

ALTER TABLE "public"."restaurant" ALTER COLUMN "closed_temporarily" TYPE text;
alter table "public"."restaurant" alter column "closed_temporarily" set default 'awaiting_verification';
comment on column "public"."restaurant"."closed_temporarily" is E'awaiting_verification, open, closed_temporarily, closed_indefinitely';
alter table "public"."restaurant" rename column "closed_temporarily" to "open_status";

alter table "public"."restaurant" rename column "open_status" to "status";

CREATE TABLE "public"."customer" ("id" serial NOT NULL, "user_id" integer NOT NULL, "app_version" text NOT NULL, "notification_info_id" integer, PRIMARY KEY ("id") , FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("notification_info_id") REFERENCES "public"."notification_info"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("id"));

alter table "public"."customer" add constraint "customer_user_id_key" unique ("user_id");

comment on column "public"."deliverer"."status" is E'awaiting_approval, authorized, banned';

alter table "public"."delivery" alter column "chat_with_service_provider_id" drop not null;

alter table "public"."delivery" add column "service_provider_id" integer
 null;

alter table "public"."delivery" add column "service_provider_type" text
 null;

alter table "public"."delivery"
  add constraint "delivery_customer_id_fkey"
  foreign key ("customer_id")
  references "public"."customer"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_order" add constraint "restaurant_order_delivery_id_key" unique ("delivery_id");

alter table "public"."delivery" add column "trip_distance" text
 null;

alter table "public"."delivery" add column "trip_duration" text
 null;

alter table "public"."delivery" add column "trip_polyline" text
 null;

alter table "public"."customer" drop constraint "customer_notification_info_id_fkey";

alter table "public"."customer" drop constraint "customer_user_id_fkey";

alter table "public"."delivery" drop constraint "delivery_customer_id_fkey",
  add constraint "delivery_customer_id_fkey"
  foreign key ("customer_id")
  references "public"."customer"
  ("user_id") on update restrict on delete restrict;

BEGIN TRANSACTION;
ALTER TABLE "public"."customer" DROP CONSTRAINT "customer_pkey";

ALTER TABLE "public"."customer"
    ADD CONSTRAINT "customer_pkey" PRIMARY KEY ("user_id");
COMMIT TRANSACTION;

alter table "public"."customer" drop column "id" cascade;

alter table "public"."customer"
  add constraint "customer_user_id_fkey"
  foreign key ("user_id")
  references "public"."user"
  ("id") on update restrict on delete restrict;

CREATE  INDEX "customer_id_index" on
  "public"."delivery" using btree ("customer_id");

CREATE  INDEX "deliverer_id_index" on
  "public"."delivery" using btree ("deliverer_id");

CREATE  INDEX "status_index" on
  "public"."delivery" using btree ("status");

CREATE  INDEX "service_provider_index" on
  "public"."delivery" using btree ("service_provider_id", "service_provider_type");

alter table "public"."delivery" rename column "deliverer_app_type" to "deliverer_app_type_id";

alter table "public"."delivery"
  add constraint "delivery_deliverer_app_type_id_fkey"
  foreign key ("deliverer_app_type_id")
  references "topology"."app_type"
  ("id") on update restrict on delete restrict;

CREATE  INDEX "notification_info_app_type" on
  "public"."notification_info" using btree ("user_id", "app_type_id");

DROP INDEX IF EXISTS "public"."notification_info_app_type";

CREATE  INDEX "restaurant_gps_index" on
  "public"."restaurant" using gist ("location_gps");

alter table "public"."restaurant_cart" rename column "user_id" to "customer_id";

alter table "public"."restaurant_cart"
  add constraint "restaurant_cart_customer_id_fkey"
  foreign key ("customer_id")
  references "public"."customer"
  ("user_id") on update restrict on delete restrict;

alter table "public"."restaurant_cart" add constraint "restaurant_cart_customer_id_key" unique ("customer_id");

alter table "public"."restaurant_cart" rename to "restaurant_cart_item";

alter table "public"."restaurant_cart_item" drop constraint "restaurant_cart_customer_id_key";

CREATE TABLE "public"."restaurant_cart" ("customer_id" integer NOT NULL, "restaurant_id" integer NOT NULL, PRIMARY KEY ("customer_id","restaurant_id") );

CREATE  INDEX "restaurant_customer_index" on
  "public"."restaurant_cart" using btree ("customer_id");

alter table "public"."restaurant_cart_item" rename column "customer_id" to "cart_id";

alter table "public"."restaurant_cart" add constraint "restaurant_cart_customer_id_key" unique ("customer_id");

BEGIN TRANSACTION;
ALTER TABLE "public"."restaurant_cart" DROP CONSTRAINT "restaurant_cart_pkey1";

ALTER TABLE "public"."restaurant_cart"
    ADD CONSTRAINT "restaurant_cart_pkey1" PRIMARY KEY ("customer_id");
COMMIT TRANSACTION;

DROP INDEX IF EXISTS "public"."restaurant_customer_index";

alter table "public"."restaurant_cart_item" drop constraint "restaurant_cart_customer_id_fkey";

alter table "public"."restaurant_cart" drop constraint "restaurant_cart_customer_id_key";

DROP INDEX IF EXISTS "public"."restaurant_cart_customer_id_key";

alter table "public"."restaurant_cart_item" rename column "cart_id" to "customer_id";

alter table "public"."restaurant_cart_item"
  add constraint "restaurant_cart_item_customer_id_fkey"
  foreign key ("customer_id")
  references "public"."restaurant_cart"
  ("customer_id") on update restrict on delete restrict;

CREATE  INDEX "restaurant_cart_customer_id" on
  "public"."restaurant_cart_item" using btree ("customer_id");

alter table "public"."restaurant_cart"
  add constraint "restaurant_cart_customer_id_fkey"
  foreign key ("customer_id")
  references "public"."customer"
  ("user_id") on update restrict on delete restrict;

CREATE  INDEX "restaurant_category_restaurant_id" on
  "public"."restaurant_category" using btree ("restaurant_id");

CREATE  INDEX "restaurant_item_category_id" on
  "public"."restaurant_item" using btree ("category_id");

CREATE  INDEX "restaurant_operator_user_id" on
  "public"."restaurant_operator" using btree ("user_id");

CREATE  INDEX "restaurant_operator_restaurant_id" on
  "public"."restaurant_operator" using btree ("restaurant_id");

comment on column "public"."restaurant_operator"."status" is E'awaiting_approval,authorized,banned';

alter table "public"."restaurant_order"
  add constraint "restaurant_order_customer_id_fkey"
  foreign key ("customer_id")
  references "public"."customer"
  ("user_id") on update restrict on delete restrict;

CREATE  INDEX "restaurant_order_customer_id" on
  "public"."restaurant_order" using btree ("customer_id");

CREATE  INDEX "restaurant_order_restaurant_id_index" on
  "public"."restaurant_order" using btree ("restaurant_id");

CREATE  INDEX "restaurant_order_item_order_id" on
  "public"."restaurant_order_item" using btree ("restaurant_order_id");

CREATE  INDEX "user_firebase_id" on
  "public"."user" using btree ("firebase_id");

alter table "public"."delivery" drop column "delivery_cost" cascade;

alter table "public"."delivery" add column "delivery_cost" money
 not null default '0';

alter table "public"."delivery" drop column "package_cost" cascade;

alter table "public"."delivery" add column "package_cost" money
 not null default '0';

alter table "public"."restaurant_cart_item" drop column "cost_per_one" cascade;

alter table "public"."restaurant_cart_item" add column "cost_per_one" money
 not null;

alter table "public"."restaurant_choice" drop column "cost" cascade;

alter table "public"."restaurant_choice" add column "cost" money
 not null default '0';

alter table "public"."restaurant_item" drop column "cost" cascade;

alter table "public"."restaurant_item" add column "cost" money
 not null;

alter table "public"."restaurant_option" drop column "cost_per_extra" cascade;

alter table "public"."restaurant_option" add column "cost_per_extra" money
 not null default '0';

alter table "public"."restaurant_order" drop column "delivery_cost" cascade;

alter table "public"."restaurant_order" add column "delivery_cost" money
 not null default '0';

alter table "public"."restaurant_order_item" drop column "cost_per_one" cascade;

alter table "public"."restaurant_order_item" add column "cost_per_one" money
 not null default '0';

alter table "public"."delivery" add column "current_gps" geography
 null;

alter table "public"."deliverer" add column "current_location" geography
 null;

alter table "public"."restaurant_operator" add column "current_gps" geography
 null;


alter table "public"."restaurant" drop column "language_id" cascade;

alter table "public"."restaurant" add column "language_id" text
 not null default 'en';

alter table "public"."restaurant_item" alter column "item_type" set default 'daily';
comment on column "public"."restaurant_item"."item_type" is E'daily, special';

alter table "public"."restaurant_option"
  add constraint "restaurant_option_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;


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


comment on column "public"."restaurant"."status" is E'open, closed_temporarily, closed_indefinitely';
alter table "public"."restaurant" rename column "status" to "open_status";

alter table "public"."restaurant" add column "approved" boolean
 null default 'false';

alter table "public"."restaurant" alter column "approved" set not null;

alter table "public"."restaurant" alter column "open_status" set default 'closed_indefinitely'::text;

alter table "public"."restaurant_cart"
  add constraint "restaurant_cart_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "public"."restaurant"
  ("id") on update restrict on delete restrict;

comment on column "public"."restaurant_order"."status" is E'orderReceived, preparing, ready, onTheWay, delivered, cancelledByCustomer, cancelledByRestaurant';

alter table "public"."chat_participant" rename column "notification_info_id" to "app_type_id";

alter table "public"."chat_participant" drop column "app_type_id" cascade;

alter table "public"."chat_participant" add column "app_type_id" text
 not null;

alter table "public"."chat_participant"
  add constraint "chat_participant_app_type_id_fkey"
  foreign key ("app_type_id")
  references "topology"."app_type"
  ("id") on update restrict on delete restrict;

comment on column "public"."delivery"."status" is E'orderReceived';

alter table "public"."restaurant_cart_item" add column "note" text
 null;

alter table "public"."restaurant_cart" alter column "restaurant_id" drop not null;

CREATE TABLE "public"."mez_admin" ("user_id" Integer NOT NULL, "notification_info_id" integer, "version" text, PRIMARY KEY ("user_id") , FOREIGN KEY ("notification_info_id") REFERENCES "public"."notification_info"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "public"."saved_location" ("id" serial NOT NULL, "customer_id" integer NOT NULL, "location_gps" geography NOT NULL, "location_text" text NOT NULL, "name" text NOT NULL, "default" boolean NOT NULL DEFAULT false, PRIMARY KEY ("id") , FOREIGN KEY ("customer_id") REFERENCES "public"."customer"("user_id") ON UPDATE restrict ON DELETE restrict);COMMENT ON TABLE "public"."saved_location" IS E'Customer\'s saved locations';

alter table "public"."user" add column "email" text
 null;

alter table "public"."user" add column "phone" text
 null;


alter table "public"."delivery" drop column "trip_distance" cascade;

alter table "public"."delivery" drop column "trip_duration" cascade;

alter table "public"."delivery" add column "trip_distance" integer
 null;

alter table "public"."delivery" add column "trip_duration" integer
 null;

comment on column "public"."delivery"."trip_duration" is E'in seconds';

comment on column "public"."delivery"."trip_distance" is E'in meters';


ALTER TABLE "public"."restaurant_order" ALTER COLUMN "order_time" TYPE timestamp without time zone;

CREATE FUNCTION cost(cart_row restaurant_cart) 
    RETURNS money
    LANGUAGE sql
    STABLE
AS $$
    SELECT SUM(quantity * cost_per_one)
    FROM restaurant_cart_item
    WHERE customer_id = cart_row.customer_id;
$$;

-- CREATE FUNCTION totalCost(order_row restaurant_order) 
--     RETURNS money
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT order_row.delivery_cost + order_row.itemsCost
-- $$;
-- DROP FUNCTION cost;

CREATE FUNCTION itemsCost(order_row restaurant_order) 
    RETURNS money
    LANGUAGE sql
    STABLE
AS $$
    SELECT SUM(quantity * cost_per_one)
    FROM restaurant_order_item
    WHERE restaurant_order_id = order_row.id;
$$;

-- CREATE FUNCTION totalCost(order_row restaurant_order) 
--     RETURNS money
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT order_row.delivery_cost + order_row.itemsCost
-- $$;
-- DROP FUNCTION cost;

CREATE FUNCTION totalCost(order_row restaurant_order) 
    RETURNS money
    LANGUAGE sql
    STABLE
AS $$
    SELECT order_row.delivery_cost + order_row.itemsCost
$$;
-- DROP FUNCTION cost;

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "order_time" TYPE timestamptz;
alter table "public"."restaurant_order" alter column "order_time" set default now();

alter table "public"."delivery" alter column "deliverer_app_type_id" drop not null;

alter table "public"."delivery" alter column "deliverer_id" drop not null;

alter table "public"."chat" alter column "chat_info" drop not null;

alter table "public"."chat_participant" add column "id" serial
 not null;

BEGIN TRANSACTION;
ALTER TABLE "public"."chat_participant" DROP CONSTRAINT "chat_participants_pkey";

ALTER TABLE "public"."chat_participant"
    ADD CONSTRAINT "chat_participants_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "review_id" drop default;

alter table "public"."delivery" add column "order_time" timestamptz
 not null default now();

alter table "public"."restaurant_order_item" drop constraint "restaurant_order_item_restaurant_order_id_fkey",
  add constraint "restaurant_order_item_restaurant_order_id_fkey"
  foreign key ("restaurant_order_id")
  references "public"."restaurant_order"
  ("id") on update restrict on delete cascade;

alter table "public"."delivery" drop constraint "delivery_chat_with_service_provider_id_fkey",
  add constraint "delivery_chat_with_service_provider_id_fkey"
  foreign key ("chat_with_service_provider_id")
  references "public"."chat"
  ("id") on update restrict on delete cascade;


comment on column "public"."restaurant_cart_item"."selected_options" is E'{<option-id>:[<choice-id>]';

comment on column "public"."delivery"."status" is E'orderReceived, packageReady, atPickup, onTheWayToDropoff, atDropoff, delivered, cancelledByCustomer, cancelledByDeliverer, cancelledByServiceProvider';

alter table "public"."delivery" add column "cancellation_time" timestamptz
 null;

alter table "public"."chat" add column "creation_time" timestamptz
 not null default now();


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

CREATE FUNCTION special_items(restaurant_row restaurant)
    RETURNS SETOF restaurant_item
    LANGUAGE sql
    STABLE
AS $$
    SELECT *
    FROM restaurant_item r
    WHERE r.restaurant_id = restaurant_row.id AND r.item_type = 'special';
$$;




alter table "public"."chat_participant" drop constraint "chat_participants_chat_id_fkey",
  add constraint "chat_participant_chat_id_fkey"
  foreign key ("chat_id")
  references "public"."chat"
  ("id") on update restrict on delete cascade;

alter table "public"."notification_info" drop constraint "notification_info_app_type_id_fkey",
  add constraint "notification_info_app_type_id_fkey"
  foreign key ("app_type_id")
  references "topology"."app_type"
  ("id") on update cascade on delete restrict;

alter table "public"."notification_info" add constraint "notification_info_user_id_app_type_id_key" unique ("user_id", "app_type_id");

CREATE FUNCTION notification_token(delivery_row delivery) 
    RETURNS varchar
    LANGUAGE sql
    STABLE
AS $$
    SELECT token
    FROM notification_info n
    WHERE n.user_id = (SELECT user_id FROM deliverer WHERE deliverer.id = delivery_row.deliverer_id)
    AND n.app_type_id = delivery_row.deliverer_app_type_id;
    
$$;
-- DROP FUNCTION cost;

CREATE FUNCTION customer_notification_token(customer_row customer) 
    RETURNS varchar
    LANGUAGE sql
    STABLE
AS $$
    SELECT token
    FROM notification_info n
    WHERE n.user_id = customer_row.user_id
    AND n.app_type_id = 'customer_mobile';
$$;
-- DROP FUNCTION cost;

alter table "public"."customer" drop column "notification_info_id" cascade;

alter table "public"."mez_admin" drop column "notification_info_id" cascade;

CREATE FUNCTION mez_admin_notification_token(mez_admin_row mez_admin) 
    RETURNS varchar
    LANGUAGE sql
    STABLE
AS $$
    SELECT token
    FROM notification_info n
    WHERE n.user_id = mez_admin_row.user_id
    AND n.app_type_id = 'mez_admin';
$$;
-- DROP FUNCTION cost;

CREATE FUNCTION restaurant_operator_notification_token(restaurant_operator_row restaurant_operator) 
    RETURNS varchar
    LANGUAGE sql
    STABLE
AS $$
    SELECT token
    FROM notification_info n
    WHERE n.user_id = restaurant_operator_row.user_id
    AND n.app_type_id = 'restaurant';
$$;
-- DROP FUNCTION cost;

CREATE FUNCTION delivery_notification_token(delivery_row delivery) 
    RETURNS varchar
    LANGUAGE sql
    STABLE
AS $$
    SELECT token
    FROM notification_info n
    WHERE n.user_id = (
    CASE
        WHEN delivery_row.deliverer_app_type_id = 'restaurant' THEN (SELECT user_id FROM restaurant_operator r WHERE r.id = delivery_row.deliverer_id)
        ELSE (SELECT user_id FROM deliverer WHERE deliverer.id = delivery_row.deliverer_id)
    END
    )
    AND n.app_type_id = delivery_row.deliverer_app_type_id;
$$;
-- DROP FUNCTION cost;

alter table "public"."restaurant_operator" drop column "notification_info_id" cascade;


alter table "public"."restaurant" add column "service_provider_type" text
 not null default 'restaurant';

comment on column "public"."delivery"."deliverer_app_type_id" is E'restaurant_operator, deliverer';

comment on column "topology"."app_type"."id" is E'customer, delivery, restaurant, admin';

comment on column "public"."delivery"."deliverer_app_type_id" is E'restaurant, delivery';

alter table "public"."deliverer" add column "online" boolean
 not null default 'false';

alter table "public"."deliverer" add column "notification_id" integer
 null;

alter table "public"."deliverer"
  add constraint "deliverer_notification_id_fkey"
  foreign key ("notification_id")
  references "public"."notification_info"
  ("id") on update restrict on delete restrict;

alter table "public"."deliverer" rename column "notification_id" to "notification_info_id";

alter table "public"."notification_info" add constraint "notification_info_app_type_id_user_id_key" unique ("app_type_id", "user_id");

alter table "public"."deliverer" add constraint "deliverer_user_id_delivery_company_type_delivery_company_id_key" unique ("user_id", "delivery_company_type", "delivery_company_id");


alter table "public"."restaurant_choice" add column "restaurant_id" integer
 not null;

alter table "public"."restaurant_choice"
  add constraint "restaurant_choice_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "public"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_option" add column "restaurant_id" integer
 not null;

alter table "public"."restaurant_option"
  add constraint "restaurant_option_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "public"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant" add column "self_delivery" boolean
 not null default 'false';

alter table "public"."restaurant_item"
  add constraint "restaurant_item_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "public"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_item_option_map" add column "restaurant_id" integer
 not null;

alter table "public"."restaurant_item_option_map"
  add constraint "restaurant_item_option_map_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "public"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "public"."restaurant_operator" alter column "status" set default 'awaiting_approval';

alter table "public"."restaurant_option_choice_map" add column "restaurant_id" integer
 not null;

alter table "public"."restaurant_option_choice_map"
  add constraint "restaurant_option_choice_map_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "public"."restaurant"
  ("id") on update restrict on delete restrict;

CREATE VIEW restaurant_order_public AS
  SELECT id AS restaurant_id, review_id
    FROM restaurant_order;

alter table "public"."translation_value" drop constraint "translation_value_translation_id_fkey",
  add constraint "translation_value_translation_id_fkey"
  foreign key ("translation_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "public"."translation" drop column "shared" cascade;

alter table "public"."translation" add column "service_provider_id" integer
 not null;

alter table "public"."translation" add column "service_provider_type" text
 not null;

CREATE
OR REPLACE VIEW "public"."restaurant_order_public" AS
SELECT
  restaurant_order.id AS restaurant_id,
  restaurant_order.review_id,
  restaurant_order.order_time,
  restaurant_order.estimated_food_ready_time,
  restaurant_order.actual_food_ready_time,
  restaurant_order.customer_id,
  restaurant_order.status
FROM
  restaurant_order;

alter table "public"."delivery" rename to "delivery_order";

alter table "public"."restaurant_order" add column "cancellation_time" timestamptz
 null;

CREATE
OR REPLACE VIEW "public"."delivery_order_public" AS
SELECT
  delivery_order.id AS 
  deliverer_id,
  delivery_order.deliverer_app_type_id,
  delivery_order.order_time,
  delivery_order.estimated_package_ready_time,
  delivery_order.actual_package_ready_time,
  delivery_order.estimated_arrival_at_pickup_time,
  delivery_order.actual_arrival_at_pickup_time,
  delivery_order.estimated_arrival_at_dropoff_time,
  delivery_order.actual_arrival_at_dropoff_time,
  delivery_order.actual_delivered_time,
  delivery_order.status,
  delivery_order.driver_review_by_service_provider_id,
  delivery_order.driver_review_by_customer_id,
  delivery_order.service_provider_review_by_driver_id,
  delivery_order.customer_review_by_driver_id,
  delivery_order.customer_id,
  delivery_order.service_provider_id,
  delivery_order.service_provider_type,
  delivery_order.trip_distance,
  delivery_order.trip_duration
FROM
  delivery_order;


alter table "public"."restaurant" drop column "schedule_id" cascade;

alter table "public"."restaurant" add column "schedule" jsonb
 null;

alter table "public"."restaurant_operator" add constraint "restaurant_operator_restaurant_id_user_id_key" unique ("restaurant_id", "user_id");

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_restaurant_id_user_id_key";
alter table "public"."restaurant_operator" add constraint "restaurant_operator_restaurant_id_user_id_key" unique ("restaurant_id", "user_id");

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_restaurant_id_user_id_key";
alter table "public"."restaurant_operator" add constraint "restaurant_operator_restaurant_id_key" unique ("restaurant_id");

alter table "public"."restaurant_operator" add constraint "restaurant_operator_user_id_key" unique ("user_id");

CREATE FUNCTION driver_notification_token(deliverer_row deliverer) 
    RETURNS varchar
    LANGUAGE sql
    STABLE
AS $$
    SELECT token
    FROM notification_info n
    WHERE n.user_id = deliverer_row.user_id
    AND n.app_type_id = 'delivery';
$$;



CREATE TABLE "public"."delivery_company" ("id" serial NOT NULL, "name" text NOT NULL, "image" text NOT NULL, "open_status" text NOT NULL DEFAULT 'closed_indefinitely', "approved" boolean NOT NULL DEFAULT false, "service_provider_type" text NOT NULL DEFAULT 'delivery', "description_id" integer, PRIMARY KEY ("id") , FOREIGN KEY ("description_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "public"."delivery_operator" ("id" serial NOT NULL, "user_id" integer NOT NULL, "delivery_company_id" integer NOT NULL, "status" text NOT NULL DEFAULT 'awaiting_approval', "owner" boolean NOT NULL DEFAULT false, "app_version" text NOT NULL, "current_gps" geography NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("delivery_company_id") REFERENCES "public"."delivery_company"("id") ON UPDATE restrict ON DELETE restrict);

alter table "public"."deliverer" rename to "delivery_driver";

alter table "public"."delivery_order" rename column "deliverer_id" to "delivery_driver_id";

alter table "public"."delivery_order" rename column "deliverer_app_type_id" to "delivery_driver_app_type_id";

comment on column "public"."delivery_order"."service_provider_type" is E'restaurant, delivery_company';

alter table "public"."delivery_company" alter column "service_provider_type" set default 'delivery_company'::text;

comment on column "public"."delivery_order"."delivery_driver_app_type_id" is E'restaurant, delivery_driver, delivery_operator';

alter table "public"."delivery_order" add column "delivery_company_type" text
 not null;

alter table "public"."delivery_order" add column "delivery_company_id" integer
 not null;

alter table "public"."delivery_operator" add column "delivery_driver_type" text
 not null default 'delivery_operator';

alter table "public"."delivery_driver" add column "delivery_driver_type" text
 not null default 'delivery_driver';

alter table "public"."restaurant_operator" add column "delivery_driver_type" text
 not null default 'restaurant_operator';

alter table "public"."delivery_order" drop column "delivery_company_type" cascade;

alter table "public"."delivery_order" drop column "delivery_company_id" cascade;

alter table "public"."delivery_order" drop constraint "delivery_deliverer_id_fkey";

alter table "public"."delivery_order" rename column "delivery_driver_app_type_id" to "delivery_driver_type";

comment on column "public"."delivery_order"."delivery_driver_type" is E'restaurant_operator, delivery_driver, delivery_operator';

DROP VIEW "public"."delivery_order_public";

CREATE OR REPLACE VIEW "public"."delivery_order_public" AS 
 SELECT delivery_order.id AS delivery_driver_id,
    delivery_order.delivery_driver_type,
    delivery_order.order_time,
    delivery_order.estimated_package_ready_time,
    delivery_order.actual_package_ready_time,
    delivery_order.estimated_arrival_at_pickup_time,
    delivery_order.actual_arrival_at_pickup_time,
    delivery_order.estimated_arrival_at_dropoff_time,
    delivery_order.actual_arrival_at_dropoff_time,
    delivery_order.actual_delivered_time,
    delivery_order.status,
    delivery_order.driver_review_by_service_provider_id,
    delivery_order.driver_review_by_customer_id,
    delivery_order.service_provider_review_by_driver_id,
    delivery_order.customer_review_by_driver_id,
    delivery_order.customer_id,
    delivery_order.service_provider_id,
    delivery_order.service_provider_type,
    delivery_order.trip_distance,
    delivery_order.trip_duration
   FROM delivery_order;



alter table "public"."restaurant" add column "operator_deep_link" text
 null;

alter table "public"."restaurant" add column "operator_qr_image_link" text
 null;

alter table "public"."restaurant" alter column "operator_deep_link" set default 'deepLink';

alter table "public"."restaurant" alter column "operator_qr_image_link" set default 'qr_image';

ALTER TABLE "public"."restaurant" ALTER COLUMN "operator_deep_link" drop default;

ALTER TABLE "public"."restaurant" ALTER COLUMN "operator_qr_image_link" drop default;

CREATE TABLE "public"."service_links" ("provider_id" integer NOT NULL, "operator_deep_link" text, "operator_qr_image_link" text, "driver_qr_image_link" text, "driver_deep_link" text, "id" serial NOT NULL, "provider_type" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("provider_id"), UNIQUE ("id"));

alter table "public"."service_links" rename column "provider_type" to "service_provider_type";

alter table "public"."service_links" rename to "service_link";

alter table "public"."service_link" rename column "provider_id" to "service_provider_id";

alter table "public"."service_link" alter column "driver_deep_link" set not null;

alter table "public"."service_link" alter column "driver_qr_image_link" set not null;

alter table "public"."service_link" alter column "driver_qr_image_link" drop not null;

alter table "public"."service_link" alter column "driver_deep_link" drop not null;


alter table "public"."restaurant_order" drop column "tax" cascade;

alter table "public"."restaurant_order" add column "tax" money
 not null default '0';

alter table "public"."restaurant_order" drop column "refund_amount" cascade;

alter table "public"."restaurant_order" add column "refund_amount" money
 not null default '0';

alter table "public"."restaurant_order" drop constraint "restaurant_order_customer_id_fkey",
  add constraint "restaurant_order_customer_id_fkey"
  foreign key ("customer_id")
  references "public"."customer"
  ("user_id") on update restrict on delete restrict;


alter table "public"."restaurant" drop column "operator_qr_image_link" cascade;

alter table "public"."restaurant" drop column "operator_deep_link" cascade;

alter table "public"."chat" alter column "chat_info" set default jsonb_build_array();


comment on column "public"."delivery_driver"."delivery_company_type" is E'restaurant,laundry,delivery_company';

CREATE TABLE "public"."delivery_cost" ("id" serial NOT NULL, "minimum_cost" money NOT NULL DEFAULT 0, "cost_per_km" money NOT NULL DEFAULT 0, "free_delivery_minimum_cost" money, "free_delivery_km_range" float8, "service_provider_id" integer NOT NULL, "service_provider_type" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("service_provider_id"), UNIQUE ("service_provider_type"));

ALTER TABLE "public"."delivery_cost" ALTER COLUMN "free_delivery_km_range" TYPE float4;

alter table "public"."delivery_cost" drop constraint "delivery_cost_service_provider_id_key";
alter table "public"."delivery_cost" add constraint "delivery_cost_service_provider_id_service_provider_type_key" unique ("service_provider_id", "service_provider_type");

alter table "public"."delivery_cost" drop constraint "delivery_cost_service_provider_type_key";

CREATE OR REPLACE FUNCTION public.in_process(order_row restaurant_order)
 RETURNS boolean
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.status = 'orderReceived' OR order_row.status = 'preparing' OR order_row.status = 'ready' OR order_row.status = 'onTheWay'
$function$;


alter table "public"."customer" add column "service_provider_type" text
 null default 'customer';

alter table "public"."review" add column "created_at" timestamptz
 not null default now();


alter table "public"."user" add column "big_image" text
 null;

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_restaurant_id_key";

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_user_id_key";
alter table "public"."restaurant_operator" add constraint "restaurant_operator_user_id_restaurant_id_key" unique ("user_id", "restaurant_id");

CREATE FUNCTION deliOp_notification_token(delivery_operator_row delivery_operator) 
    RETURNS varchar
    LANGUAGE sql
    STABLE
AS $$
    SELECT token
    FROM notification_info n
    WHERE n.user_id = delivery_operator_row.user_id
    AND n.app_type_id = 'delivery_admin';
$$;

DROP INDEX IF EXISTS "public"."delivery_company_index";

comment on column "public"."delivery_driver"."delivery_driver_type" is E'Just for relationship';

alter table "public"."delivery_order" drop constraint "delivery_deliverer_app_type_id_fkey";


alter table "public"."service_link" add column "customer_qr_image_link" text
 null;

alter table "public"."service_link" add column "customer_deep_link" text
 null;

alter table "public"."customer" alter column "app_version" drop not null;

alter table "public"."restaurant_cart_item" add constraint "restaurant_cart_item_customer_id_restaurant_item_id_key" unique ("customer_id", "restaurant_item_id");

alter table "public"."restaurant_item" add column "image" text
 null;

alter table "public"."restaurant_order" add column "scheduled_time" timestamptz
 null;


alter table "public"."delivery_order" alter column "chat_with_customer_id" drop not null;

alter table "public"."user" add constraint "user_firebase_id_key" unique ("firebase_id");

alter table "public"."user" drop constraint "user_firebase_id_key";

alter table "public"."restaurant_order" alter column "chat_id" drop not null;

alter table "public"."delivery_order" alter column "chat_with_customer_id" set not null;

alter table "public"."delivery_operator" alter column "app_version" drop not null;

alter table "public"."delivery_operator" alter column "current_gps" drop not null;


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


alter table "public"."delivery_driver" drop constraint "deliverer_user_id_delivery_company_type_delivery_company_id_key";
alter table "public"."delivery_driver" add constraint "delivery_driver_user_id_key" unique ("user_id");

alter table "public"."delivery_operator" add constraint "delivery_operator_user_id_key" unique ("user_id");

alter table "public"."restaurant_operator" drop constraint "restaurant_operator_user_id_restaurant_id_key";
alter table "public"."restaurant_operator" add constraint "restaurant_operator_user_id_key" unique ("user_id");
