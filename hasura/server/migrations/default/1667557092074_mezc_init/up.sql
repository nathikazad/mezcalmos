
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
