
CREATE TABLE "service_provider"."details" ("id" serial NOT NULL, "service_provider_type" text NOT NULL, "name" text NOT NULL, "image" text NOT NULL, "description_id" integer, "firebase_id" text, "open_status" text NOT NULL DEFAULT 'closed_indefinitely', "language_id" text NOT NULL DEFAULT 'en', "approved" boolean NOT NULL DEFAULT false, "delivery" boolean NOT NULL DEFAULT true, "customer_pickup" boolean NOT NULL DEFAULT true, "self_delivery" boolean NOT NULL DEFAULT false, "creation_time" timestamptz NOT NULL DEFAULT now(), "schedule" jsonb, "stripe_info" jsonb, "accepted_payments" jsonb, "delivery_details_id" integer, "location_id" integer NOT NULL, "phone_number" text, PRIMARY KEY ("id") , UNIQUE ("firebase_id"), UNIQUE ("delivery_details_id"), UNIQUE ("location_id"));

alter table "service_provider"."details" drop column "service_provider_type" cascade;

CREATE TABLE "service_provider"."operator_details" ("id" serial NOT NULL, "user_id" integer NOT NULL, "status" text NOT NULL DEFAULT 'awaiting_approval', "owner" boolean NOT NULL DEFAULT false, "app_version" text, "current_gps" geography, "delivery_driver_type" text NOT NULL, "online" boolean NOT NULL DEFAULT true, "app_type_id" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("user_id"));

alter table "service_provider"."details"
  add constraint "details_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."details"
  add constraint "details_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete cascade;

alter table "service_provider"."details"
  add constraint "details_location_id_fkey"
  foreign key ("location_id")
  references "service_provider"."location"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."operator_details"
  add constraint "operator_details_user_id_fkey"
  foreign key ("user_id")
  references "public"."user"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."details" add column "service_provider_type" text
 not null;

alter table "restaurant"."restaurant" add column "details_id" integer
 not null;

alter table "restaurant"."restaurant"
  add constraint "restaurant_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."details"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."restaurant" add constraint "restaurant_details_id_key" unique ("details_id");

alter table "laundry"."order" drop constraint "order_store_id_fkey",
  add constraint "order_store_id_fkey"
  foreign key ("store_id")
  references "laundry"."store"
  ("id") on update restrict on delete cascade;

alter table "laundry"."category" drop constraint "type_store_id_fkey",
  add constraint "category_store_id_fkey"
  foreign key ("store_id")
  references "laundry"."store"
  ("id") on update restrict on delete cascade;

alter table "laundry"."operator" drop constraint "operator_store_id_fkey",
  add constraint "operator_store_id_fkey"
  foreign key ("store_id")
  references "laundry"."store"
  ("id") on update restrict on delete cascade;

alter table "laundry"."order_category" drop constraint "order_type_order_id_fkey",
  add constraint "order_category_order_id_fkey"
  foreign key ("order_id")
  references "laundry"."order"
  ("id") on update restrict on delete cascade;

alter table "laundry"."order_category" drop constraint "order_type_type_id_fkey",
  add constraint "order_category_category_id_fkey"
  foreign key ("category_id")
  references "laundry"."category"
  ("id") on update restrict on delete cascade;

alter table "laundry"."store" add column "details_id" integer
 not null unique;

alter table "laundry"."store"
  add constraint "store_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."details"
  ("id") on update restrict on delete restrict;

alter table "delivery"."company" add column "details_id" integer
 not null unique;

alter table "delivery"."company"
  add constraint "company_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."details"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."operator" add column "details_id" integer
 not null unique;

alter table "restaurant"."operator"
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete restrict;

alter table "laundry"."operator" add column "details_id" integer
 not null unique;

alter table "laundry"."operator"
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete restrict;

alter table "delivery"."operator" add column "details_id" integer
 not null unique;

alter table "delivery"."operator"
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."restaurant" drop constraint "restaurant_delivery_details_id_fkey";

alter table "restaurant"."restaurant" drop column "delivery_details_id" cascade;

alter table "restaurant"."restaurant" drop column "phone_number" cascade;

alter table "restaurant"."restaurant" drop constraint "restaurant_location_id_fkey";

alter table "restaurant"."restaurant" drop column "location_id" cascade;

alter table "restaurant"."restaurant" drop column "creation_time" cascade;

alter table "restaurant"."restaurant" drop column "customer_pickup" cascade;

alter table "restaurant"."restaurant" drop column "delivery" cascade;

alter table "restaurant"."restaurant" drop column "accepted_payments" cascade;

alter table "restaurant"."restaurant" drop column "stripe_info" cascade;

alter table "restaurant"."restaurant" drop column "schedule" cascade;

alter table "restaurant"."restaurant" drop column "self_delivery" cascade;

alter table "restaurant"."restaurant" drop column "approved" cascade;

alter table "restaurant"."restaurant" drop column "language_id" cascade;

alter table "restaurant"."restaurant" drop column "open_status" cascade;

alter table "restaurant"."restaurant" drop column "firebase_id" cascade;

alter table "restaurant"."restaurant" drop column "description_id" cascade;

alter table "restaurant"."restaurant" drop column "image" cascade;

alter table "restaurant"."restaurant" drop column "name" cascade;

alter table "laundry"."store" drop constraint "store_delivery_details_id_key";

alter table "laundry"."store" drop constraint "store_location_id_key";

alter table "laundry"."store" drop constraint "store_delivery_details_id_fkey";

alter table "laundry"."store" drop constraint "store_description_id_fkey";

alter table "laundry"."store" drop constraint "store_location_id_fkey";

alter table "laundry"."store" drop column "delivery_details_id" cascade;

alter table "laundry"."store" drop column "customer_pickup" cascade;

alter table "laundry"."store" drop column "delivery" cascade;

alter table "laundry"."store" drop column "accepted_payments" cascade;

alter table "laundry"."store" drop column "stripe_info" cascade;

alter table "laundry"."store" drop column "name" cascade;

alter table "laundry"."store" drop column "image" cascade;

alter table "laundry"."store" drop column "description_id" cascade;

alter table "laundry"."store" drop column "open_status" cascade;

alter table "laundry"."store" drop column "language_id" cascade;

alter table "laundry"."store" drop column "approved" cascade;

alter table "laundry"."store" drop column "self_delivery" cascade;

alter table "laundry"."store" drop column "creation_time" cascade;

alter table "laundry"."store" drop column "location_id" cascade;

alter table "laundry"."store" drop column "phone_number" cascade;

alter table "laundry"."store" drop column "schedule" cascade;

alter table "delivery"."company" drop constraint "company_delivery_details_id_fkey";

alter table "delivery"."company" drop constraint "company_location_id_fkey";

alter table "delivery"."company" drop constraint "delivery_company_description_id_fkey";

alter table "delivery"."company" drop column "location_id" cascade;

ALTER TABLE delivery.company DROP COLUMN delivery_details_id, DROP COLUMN creation_time;

ALTER TABLE delivery.company 
    DROP COLUMN name,
    DROP COLUMN image,
    DROP COLUMN open_status,
    DROP COLUMN approved,
    DROP COLUMN description_id;

ALTER TABLE restaurant.operator 
    DROP COLUMN status,
    DROP COLUMN owner,
    DROP COLUMN app_version,
    DROP COLUMN current_gps,
    DROP COLUMN online,
    DROP COLUMN app_type_id;

ALTER TABLE laundry.operator 
    DROP COLUMN status,
    DROP COLUMN owner,
    DROP COLUMN app_version,
    DROP COLUMN current_gps,
    DROP COLUMN online,
    DROP COLUMN app_type_id;

ALTER TABLE delivery.operator 
    DROP COLUMN status,
    DROP COLUMN owner,
    DROP COLUMN app_version,
    DROP COLUMN current_gps,
    DROP COLUMN app_type_id;

alter table "service_provider"."operator_details"
  add constraint "operator_details_app_type_id_fkey"
  foreign key ("app_type_id")
  references "public"."app_type"
  ("id") on update restrict on delete restrict;

alter table "delivery"."details" add column "delivery_available" boolean
 not null default 'true';

alter table "delivery"."details" add column "customer_pickup" boolean
 not null default 'true';

alter table "delivery"."details" add column "self_delivery" boolean
 not null default 'false';

alter table "service_provider"."details" drop column "delivery" cascade;

alter table "service_provider"."details" drop column "customer_pickup" cascade;

alter table "service_provider"."details" drop column "self_delivery" cascade;

CREATE TABLE "customer"."stripe_info" ("id" serial NOT NULL, "customer_id" integer NOT NULL, "sp_id" integer NOT NULL, "stripe_id" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("customer_id") REFERENCES "customer"."customer"("user_id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("sp_id") REFERENCES "service_provider"."details"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("customer_id", "sp_id"));

BEGIN TRANSACTION;
ALTER TABLE "customer"."stripe_info" DROP CONSTRAINT "stripe_info_pkey";

ALTER TABLE "customer"."stripe_info"
    ADD CONSTRAINT "stripe_info_pkey" PRIMARY KEY ("stripe_id");
COMMIT TRANSACTION;

alter table "customer"."stripe_info" drop column "id" cascade;

CREATE TABLE "customer"."stripe_cards" ("card_id" text NOT NULL, "customer_id" integer NOT NULL, "sp_card_ids" jsonb, PRIMARY KEY ("card_id") , FOREIGN KEY ("customer_id") REFERENCES "customer"."customer"("user_id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "service_provider"."stripe_info" ("sp_id" integer NOT NULL, "stripe_id" text NOT NULL, "status" text NOT NULL, "charge_fees_on_customer" boolean, "charges_enabled" boolean NOT NULL, "payouts_enabled" boolean NOT NULL, "details_submitted" boolean NOT NULL, "requirements" text, "email" text, PRIMARY KEY ("sp_id") , FOREIGN KEY ("sp_id") REFERENCES "service_provider"."details"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("stripe_id"));

alter table "service_provider"."details" drop column "language_id" cascade;

alter table "service_provider"."details" add column "language" jsonb
 not null;

alter table "service_provider"."details" alter column "language" set default '{     "en": true,     "es": true }';
comment on column "service_provider"."details"."language" is E'Record <language_id, bool>';

alter table "delivery"."order"
  add constraint "order_delivery_driver_id_fkey"
  foreign key ("delivery_driver_id")
  references "delivery"."driver"
  ("id") on update restrict on delete restrict;

alter table "delivery"."order" drop column "delivery_driver_type" cascade;
