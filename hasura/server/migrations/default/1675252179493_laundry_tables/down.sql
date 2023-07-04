
alter table "laundry"."order_category" rename column "category_id" to "type_id";

alter table "laundry"."store" alter column "delivery_details_id" set not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "discount_value" money
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "stripe_fees" money
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "stripe_info" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "scheduled_time" timestamptz
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "refund_amount" money
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."category" add column "position" integer
--  not null default '1';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "tax" money
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "cancellation_time" timestamptz
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "customer_app_type" text
--  not null default 'native';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "firebase_id" text
--  null unique;

alter table "laundry"."order_category" rename to "order_type";

alter table "laundry"."category" rename to "type";

alter table "laundry"."store" drop constraint "store_delivery_details_id_fkey",
  add constraint "store_delivery_details_id_fkey"
  foreign key ("location_id")
  references "service_provider"."location"
  ("id") on update restrict on delete restrict;

alter table "laundry"."store" drop constraint "store_delivery_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "delivery_details_id" integer
--  not null unique;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "customer_pickup" boolean
--  not null default 'true';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "delivery" boolean
--  not null default 'true';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "accepted_payments" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "stripe_info" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "schedule" jsonb
--  null;

alter table "laundry"."store" alter column "payment_type" set default ''Cash'::text';
alter table "laundry"."store" alter column "payment_type" drop not null;
alter table "laundry"."store" add column "payment_type" text;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "payment_type" text
--  not null default 'Cash';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "phone_number" text
--  null;

alter table "laundry"."order" drop constraint "order_chat_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "chat_id" integer
--  null;

DROP TABLE "laundry"."operator";

DROP TABLE "laundry"."order_type";

DROP TABLE "laundry"."type";

DROP TABLE "laundry"."order";

DROP TABLE "laundry"."store";

drop schema "laundry" cascade;
