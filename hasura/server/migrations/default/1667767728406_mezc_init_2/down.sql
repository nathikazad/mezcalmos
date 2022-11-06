
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_operator" add column "current_gps" geography
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."deliverer" add column "current_location" geography
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "current_gps" geography
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order_item" add column "cost_per_one" money
--  not null default '0';

comment on column "public"."restaurant_order_item"."cost_per_one" is E'in_json:[name(en,es), selected_options]';
alter table "public"."restaurant_order_item" alter column "cost_per_one" set default 0;
alter table "public"."restaurant_order_item" alter column "cost_per_one" drop not null;
alter table "public"."restaurant_order_item" add column "cost_per_one" float8;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "delivery_cost" money
--  not null default '0';

alter table "public"."restaurant_order" alter column "delivery_cost" set default '0'::double precision;
alter table "public"."restaurant_order" alter column "delivery_cost" drop not null;
alter table "public"."restaurant_order" add column "delivery_cost" float8;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_option" add column "cost_per_extra" money
--  not null default '0';

alter table "public"."restaurant_option" alter column "cost_per_extra" set default 0;
alter table "public"."restaurant_option" alter column "cost_per_extra" drop not null;
alter table "public"."restaurant_option" add column "cost_per_extra" float8;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_item" add column "cost" money
--  not null;

alter table "public"."restaurant_item" alter column "cost" set default 0;
alter table "public"."restaurant_item" alter column "cost" drop not null;
alter table "public"."restaurant_item" add column "cost" float8;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_choice" add column "cost" money
--  not null default '0';

alter table "public"."restaurant_choice" alter column "cost" drop not null;
alter table "public"."restaurant_choice" add column "cost" float8;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_cart_item" add column "cost_per_one" money
--  not null;

alter table "public"."restaurant_cart_item" alter column "cost_per_one" drop not null;
alter table "public"."restaurant_cart_item" add column "cost_per_one" float8;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "package_cost" money
--  not null default '0';

alter table "public"."delivery" alter column "package_cost" drop not null;
alter table "public"."delivery" add column "package_cost" float8;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "delivery_cost" money
--  not null default '0';

alter table "public"."delivery" alter column "delivery_cost" set default 0;
alter table "public"."delivery" alter column "delivery_cost" drop not null;
alter table "public"."delivery" add column "delivery_cost" float8;

DROP INDEX IF EXISTS "public"."user_firebase_id";

DROP INDEX IF EXISTS "public"."restaurant_order_item_order_id";

DROP INDEX IF EXISTS "public"."restaurant_order_restaurant_id_index";

DROP INDEX IF EXISTS "public"."restaurant_order_customer_id";

alter table "public"."restaurant_order" drop constraint "restaurant_order_customer_id_fkey";

comment on column "public"."restaurant_operator"."status" is NULL;

DROP INDEX IF EXISTS "public"."restaurant_operator_restaurant_id";

DROP INDEX IF EXISTS "public"."restaurant_operator_user_id";

DROP INDEX IF EXISTS "public"."restaurant_item_category_id";

DROP INDEX IF EXISTS "public"."restaurant_category_restaurant_id";

alter table "public"."restaurant_cart" drop constraint "restaurant_cart_customer_id_fkey";

DROP INDEX IF EXISTS "public"."restaurant_cart_customer_id";

alter table "public"."restaurant_cart_item" drop constraint "restaurant_cart_item_customer_id_fkey";

alter table "public"."restaurant_cart_item" rename column "customer_id" to "cart_id";

CREATE  INDEX "restaurant_cart_customer_id_key" on
  "public"."restaurant_cart" using btree ("customer_id");

alter table "public"."restaurant_cart" add constraint "restaurant_cart_customer_id_key" unique ("customer_id");

alter table "public"."restaurant_cart_item"
  add constraint "restaurant_cart_customer_id_fkey"
  foreign key ("cart_id")
  references "public"."customer"
  ("user_id") on update restrict on delete restrict;

CREATE  INDEX "restaurant_customer_index" on
  "public"."restaurant_cart" using btree ("customer_id");

alter table "public"."restaurant_cart" drop constraint "restaurant_cart_pkey";
alter table "public"."restaurant_cart"
    add constraint "restaurant_cart_pkey1"
    primary key ("restaurant_id", "customer_id");

alter table "public"."restaurant_cart" drop constraint "restaurant_cart_customer_id_key";

alter table "public"."restaurant_cart_item" rename column "cart_id" to "customer_id";

DROP INDEX IF EXISTS "public"."restaurant_customer_index";

DROP TABLE "public"."restaurant_cart";

alter table "public"."restaurant_cart_item" add constraint "restaurant_cart_item_customer_id_key" unique ("customer_id");

alter table "public"."restaurant_cart_item" rename to "restaurant_cart";

alter table "public"."restaurant_cart" drop constraint "restaurant_cart_customer_id_key";

alter table "public"."restaurant_cart" drop constraint "restaurant_cart_customer_id_fkey";

alter table "public"."restaurant_cart" rename column "customer_id" to "user_id";

DROP INDEX IF EXISTS "public"."restaurant_gps_index";

CREATE  INDEX "notification_info_app_type" on
  "public"."notification_info" using btree ("app_type_id", "user_id");

DROP INDEX IF EXISTS "public"."notification_info_app_type";

alter table "public"."delivery" drop constraint "delivery_deliverer_app_type_id_fkey";

alter table "public"."delivery" rename column "deliverer_app_type_id" to "deliverer_app_type";

DROP INDEX IF EXISTS "public"."service_provider_index";

DROP INDEX IF EXISTS "public"."status_index";

DROP INDEX IF EXISTS "public"."deliverer_id_index";

DROP INDEX IF EXISTS "public"."customer_id_index";

alter table "public"."customer" drop constraint "customer_user_id_fkey";

alter table "public"."customer" alter column "id" set default nextval('customer_id_seq'::regclass);
alter table "public"."customer" alter column "id" drop not null;
alter table "public"."customer" add column "id" int4;

alter table "public"."customer" drop constraint "customer_pkey";
alter table "public"."customer"
    add constraint "customer_pkey"
    primary key ("id");

alter table "public"."delivery" drop constraint "delivery_customer_id_fkey",
  add constraint "delivery_customer_id_fkey"
  foreign key ("customer_id")
  references "public"."customer"
  ("id") on update restrict on delete restrict;

alter table "public"."customer"
  add constraint "customer_user_id_fkey"
  foreign key ("user_id")
  references "public"."user"
  ("id") on update restrict on delete restrict;

alter table "public"."customer"
  add constraint "customer_notification_info_id_fkey"
  foreign key ("notification_info_id")
  references "public"."notification_info"
  ("id") on update restrict on delete restrict;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "trip_polyline" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "trip_duration" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "trip_distance" text
--  null;

alter table "public"."restaurant_order" drop constraint "restaurant_order_delivery_id_key";

alter table "public"."delivery" drop constraint "delivery_customer_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "service_provider_type" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery" add column "service_provider_id" integer
--  null;

alter table "public"."delivery" alter column "chat_with_service_provider_id" set not null;

comment on column "public"."deliverer"."status" is NULL;

alter table "public"."customer" drop constraint "customer_user_id_key";

DROP TABLE "public"."customer";

alter table "public"."restaurant" rename column "status" to "open_status";

alter table "public"."restaurant" rename column "open_status" to "closed_temporarily";
comment on column "public"."restaurant"."closed_temporarily" is NULL;
alter table "public"."restaurant" alter column "closed_temporarily" set default 'false';
ALTER TABLE "public"."restaurant" ALTER COLUMN "closed_temporarily" TYPE boolean;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant" add column "closed_temporarily" boolean
--  not null default 'false';

alter table "public"."deliverer" rename column "app_version" to "version_number";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."deliverer" add column "version_number" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_operator" add column "app_version" text
--  null;
