
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
