
alter table "delivery"."order" alter column "delivery_driver_type" drop not null;
alter table "delivery"."order" add column "delivery_driver_type" text;

alter table "delivery"."order" drop constraint "order_delivery_driver_id_fkey";

comment on column "service_provider"."details"."language" is NULL;
ALTER TABLE "service_provider"."details" ALTER COLUMN "language" drop default;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "language" jsonb
--  not null;

alter table "service_provider"."details" alter column "language_id" set default ''en'::text';
alter table "service_provider"."details" alter column "language_id" drop not null;
alter table "service_provider"."details" add column "language_id" text;

DROP TABLE "service_provider"."stripe_info";

DROP TABLE "customer"."stripe_cards";

alter table "customer"."stripe_info" alter column "id" set default nextval('customer.stripe_info_id_seq'::regclass);
alter table "customer"."stripe_info" alter column "id" drop not null;
alter table "customer"."stripe_info" add column "id" int4;

alter table "customer"."stripe_info" drop constraint "stripe_info_pkey";
alter table "customer"."stripe_info"
    add constraint "stripe_info_pkey"
    primary key ("id");

DROP TABLE "customer"."stripe_info";

alter table "service_provider"."details" alter column "self_delivery" set default false;
alter table "service_provider"."details" alter column "self_delivery" drop not null;
alter table "service_provider"."details" add column "self_delivery" bool;

alter table "service_provider"."details" alter column "customer_pickup" set default true;
alter table "service_provider"."details" alter column "customer_pickup" drop not null;
alter table "service_provider"."details" add column "customer_pickup" bool;

alter table "service_provider"."details" alter column "delivery" set default true;
alter table "service_provider"."details" alter column "delivery" drop not null;
alter table "service_provider"."details" add column "delivery" bool;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."details" add column "self_delivery" boolean
--  not null default 'false';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."details" add column "customer_pickup" boolean
--  not null default 'true';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."details" add column "delivery_available" boolean
--  not null default 'true';

alter table "service_provider"."operator_details" drop constraint "operator_details_app_type_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE delivery.operator
--     DROP COLUMN status,
--     DROP COLUMN owner,
--     DROP COLUMN app_version,
--     DROP COLUMN current_gps,
--     DROP COLUMN app_type_id;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE laundry.operator
--     DROP COLUMN status,
--     DROP COLUMN owner,
--     DROP COLUMN app_version,
--     DROP COLUMN current_gps,
--     DROP COLUMN online,
--     DROP COLUMN app_type_id;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE restaurant.operator
--     DROP COLUMN status,
--     DROP COLUMN owner,
--     DROP COLUMN app_version,
--     DROP COLUMN current_gps,
--     DROP COLUMN online,
--     DROP COLUMN app_type_id;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE delivery.company
--     DROP COLUMN name,
--     DROP COLUMN image,
--     DROP COLUMN open_status,
--     DROP COLUMN approved,
--     DROP COLUMN description_id;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE delivery.company DROP COLUMN delivery_details_id, DROP COLUMN creation_time;

alter table "delivery"."company" add constraint "company_location_id_key" unique (location_id);
alter table "delivery"."company" alter column "location_id" drop not null;
alter table "delivery"."company" add column "location_id" int4;

alter table "delivery"."company"
  add constraint "delivery_company_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "delivery"."company"
  add constraint "company_location_id_fkey"
  foreign key ("location_id")
  references "service_provider"."location"
  ("id") on update cascade on delete cascade;

alter table "delivery"."company"
  add constraint "company_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update cascade on delete cascade;

alter table "laundry"."store" alter column "schedule" drop not null;
alter table "laundry"."store" add column "schedule" jsonb;

alter table "laundry"."store" alter column "phone_number" drop not null;
alter table "laundry"."store" add column "phone_number" text;

alter table "laundry"."store" alter column "location_id" drop not null;
alter table "laundry"."store" add column "location_id" int4;

alter table "laundry"."store" alter column "creation_time" set default now();
alter table "laundry"."store" alter column "creation_time" drop not null;
alter table "laundry"."store" add column "creation_time" timestamptz;

alter table "laundry"."store" alter column "self_delivery" set default false;
alter table "laundry"."store" alter column "self_delivery" drop not null;
alter table "laundry"."store" add column "self_delivery" bool;

alter table "laundry"."store" alter column "approved" set default false;
alter table "laundry"."store" alter column "approved" drop not null;
alter table "laundry"."store" add column "approved" bool;

alter table "laundry"."store" alter column "language_id" set default ''en'::text';
alter table "laundry"."store" alter column "language_id" drop not null;
alter table "laundry"."store" add column "language_id" text;

alter table "laundry"."store" alter column "open_status" set default ''closed'::text';
alter table "laundry"."store" alter column "open_status" drop not null;
alter table "laundry"."store" add column "open_status" text;

alter table "laundry"."store" alter column "description_id" drop not null;
alter table "laundry"."store" add column "description_id" int4;

alter table "laundry"."store" alter column "image" drop not null;
alter table "laundry"."store" add column "image" text;

alter table "laundry"."store" alter column "name" drop not null;
alter table "laundry"."store" add column "name" text;

alter table "laundry"."store" alter column "stripe_info" drop not null;
alter table "laundry"."store" add column "stripe_info" jsonb;

alter table "laundry"."store" alter column "accepted_payments" drop not null;
alter table "laundry"."store" add column "accepted_payments" jsonb;

alter table "laundry"."store" alter column "delivery" set default true;
alter table "laundry"."store" alter column "delivery" drop not null;
alter table "laundry"."store" add column "delivery" bool;

alter table "laundry"."store" alter column "customer_pickup" set default true;
alter table "laundry"."store" alter column "customer_pickup" drop not null;
alter table "laundry"."store" add column "customer_pickup" bool;

alter table "laundry"."store" alter column "delivery_details_id" drop not null;
alter table "laundry"."store" add column "delivery_details_id" int4;

alter table "laundry"."store"
  add constraint "store_location_id_fkey"
  foreign key ("location_id")
  references "service_provider"."location"
  ("id") on update restrict on delete restrict;

alter table "laundry"."store"
  add constraint "store_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "laundry"."store"
  add constraint "store_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update restrict on delete cascade;

alter table "laundry"."store" add constraint "store_location_id_key" unique ("location_id");

alter table "laundry"."store" add constraint "store_delivery_details_id_key" unique ("delivery_details_id");

alter table "restaurant"."restaurant" alter column "name" drop not null;
alter table "restaurant"."restaurant" add column "name" text;

alter table "restaurant"."restaurant" alter column "image" drop not null;
alter table "restaurant"."restaurant" add column "image" text;

alter table "restaurant"."restaurant"
  add constraint "restaurant_description_id_fkey"
  foreign key (description_id)
  references "public"."translation"
  (id) on update restrict on delete cascade;
alter table "restaurant"."restaurant" alter column "description_id" drop not null;
alter table "restaurant"."restaurant" add column "description_id" int4;

alter table "restaurant"."restaurant" add constraint "restaurant_firebase_id_key" unique (firebase_id);
alter table "restaurant"."restaurant" alter column "firebase_id" drop not null;
alter table "restaurant"."restaurant" add column "firebase_id" text;

alter table "restaurant"."restaurant" alter column "open_status" set default ''closed_indefinitely'::text';
alter table "restaurant"."restaurant" alter column "open_status" drop not null;
alter table "restaurant"."restaurant" add column "open_status" text;

alter table "restaurant"."restaurant" alter column "language_id" set default ''en'::text';
alter table "restaurant"."restaurant" alter column "language_id" drop not null;
alter table "restaurant"."restaurant" add column "language_id" text;

alter table "restaurant"."restaurant" alter column "approved" set default false;
alter table "restaurant"."restaurant" alter column "approved" drop not null;
alter table "restaurant"."restaurant" add column "approved" bool;

alter table "restaurant"."restaurant" alter column "self_delivery" set default false;
alter table "restaurant"."restaurant" alter column "self_delivery" drop not null;
alter table "restaurant"."restaurant" add column "self_delivery" bool;

alter table "restaurant"."restaurant" alter column "schedule" drop not null;
alter table "restaurant"."restaurant" add column "schedule" jsonb;

alter table "restaurant"."restaurant" alter column "stripe_info" drop not null;
alter table "restaurant"."restaurant" add column "stripe_info" jsonb;

alter table "restaurant"."restaurant" alter column "accepted_payments" drop not null;
alter table "restaurant"."restaurant" add column "accepted_payments" jsonb;

alter table "restaurant"."restaurant" alter column "delivery" set default true;
alter table "restaurant"."restaurant" alter column "delivery" drop not null;
alter table "restaurant"."restaurant" add column "delivery" bool;

alter table "restaurant"."restaurant" alter column "customer_pickup" set default true;
alter table "restaurant"."restaurant" alter column "customer_pickup" drop not null;
alter table "restaurant"."restaurant" add column "customer_pickup" bool;

alter table "restaurant"."restaurant" alter column "creation_time" set default now();
alter table "restaurant"."restaurant" alter column "creation_time" drop not null;
alter table "restaurant"."restaurant" add column "creation_time" timestamptz;

alter table "restaurant"."restaurant" add constraint "restaurant_location_id_key" unique (location_id);
alter table "restaurant"."restaurant" alter column "location_id" drop not null;
alter table "restaurant"."restaurant" add column "location_id" int4;

alter table "restaurant"."restaurant"
  add constraint "restaurant_location_id_fkey"
  foreign key ("location_id")
  references "service_provider"."location"
  ("id") on update cascade on delete cascade;

alter table "restaurant"."restaurant" alter column "phone_number" drop not null;
alter table "restaurant"."restaurant" add column "phone_number" text;

alter table "restaurant"."restaurant" add constraint "restaurant_delivery_details_id_key" unique (delivery_details_id);
alter table "restaurant"."restaurant" alter column "delivery_details_id" drop not null;
alter table "restaurant"."restaurant" add column "delivery_details_id" int4;

alter table "restaurant"."restaurant"
  add constraint "restaurant_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update cascade on delete cascade;

alter table "delivery"."operator" drop constraint "operator_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."operator" add column "details_id" integer
--  not null unique;

alter table "laundry"."operator" drop constraint "operator_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."operator" add column "details_id" integer
--  not null unique;

alter table "restaurant"."operator" drop constraint "operator_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."operator" add column "details_id" integer
--  not null unique;

alter table "delivery"."company" drop constraint "company_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."company" add column "details_id" integer
--  not null unique;

alter table "laundry"."store" drop constraint "store_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "details_id" integer
--  not null unique;

alter table "laundry"."order_category" drop constraint "order_category_category_id_fkey",
  add constraint "order_type_type_id_fkey"
  foreign key ("category_id")
  references "laundry"."category"
  ("id") on update restrict on delete restrict;

alter table "laundry"."order_category" drop constraint "order_category_order_id_fkey",
  add constraint "order_type_order_id_fkey"
  foreign key ("order_id")
  references "laundry"."order"
  ("id") on update restrict on delete restrict;

alter table "laundry"."operator" drop constraint "operator_store_id_fkey",
  add constraint "operator_store_id_fkey"
  foreign key ("store_id")
  references "laundry"."store"
  ("id") on update restrict on delete restrict;

alter table "laundry"."category" drop constraint "category_store_id_fkey",
  add constraint "type_store_id_fkey"
  foreign key ("store_id")
  references "laundry"."store"
  ("id") on update restrict on delete restrict;

alter table "laundry"."order" drop constraint "order_store_id_fkey",
  add constraint "order_store_id_fkey"
  foreign key ("store_id")
  references "laundry"."store"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."restaurant" drop constraint "restaurant_details_id_key";

alter table "restaurant"."restaurant" drop constraint "restaurant_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."restaurant" add column "details_id" integer
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "service_provider_type" text
--  not null;

alter table "service_provider"."operator_details" drop constraint "operator_details_user_id_fkey";

alter table "service_provider"."details" drop constraint "details_location_id_fkey";

alter table "service_provider"."details" drop constraint "details_description_id_fkey";

alter table "service_provider"."details" drop constraint "details_delivery_details_id_fkey";

DROP TABLE "service_provider"."operator_details";

alter table "service_provider"."details" alter column "service_provider_type" drop not null;
alter table "service_provider"."details" add column "service_provider_type" text;

DROP TABLE "service_provider"."details";
