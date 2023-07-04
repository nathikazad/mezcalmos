
create schema "laundry";

CREATE TABLE "laundry"."store" ("id" serial NOT NULL, "name" text NOT NULL, "image" text NOT NULL, "description_id" integer NOT NULL, "open_status" text NOT NULL DEFAULT 'closed', "language_id" text NOT NULL DEFAULT 'en', "approved" boolean NOT NULL DEFAULT false, "self_delivery" boolean NOT NULL DEFAULT false, "creation_time" timestamptz NOT NULL DEFAULT now(), "location_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("description_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("location_id") REFERENCES "service_provider"."location"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("location_id"));

CREATE TABLE "laundry"."order" ("id" serial NOT NULL, "customer_id" integer NOT NULL, "store_id" integer NOT NULL, "payment_type" text NOT NULL DEFAULT 'Cash', "estimated_ready_time" timestamptz, "actual_ready_time" timestamptz, "from_customer_delivery_id" integer, "to_customer_delivery_id" integer, "status" text NOT NULL, "review_id" integer, "delivery_type" text NOT NULL DEFAULT 'delivery', "order_time" timestamptz NOT NULL DEFAULT now(), "notes" text, "delivery_cost" money NOT NULL DEFAULT 0, "customer_location_gps" geography, "customer_address" text, PRIMARY KEY ("id") , FOREIGN KEY ("store_id") REFERENCES "laundry"."store"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("customer_id") REFERENCES "customer"."customer"("user_id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("from_customer_delivery_id") REFERENCES "delivery"."order"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("to_customer_delivery_id") REFERENCES "delivery"."order"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("review_id") REFERENCES "public"."review"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "laundry"."type" ("id" serial NOT NULL, "name_id" integer NOT NULL, "store_id" integer NOT NULL, "cost_by_kilo" money NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("store_id") REFERENCES "laundry"."store"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("name_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "laundry"."order_type" ("id" serial NOT NULL, "type_id" integer NOT NULL, "weight_in_kilo" float8 NOT NULL, "order_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("type_id") REFERENCES "laundry"."type"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("order_id") REFERENCES "laundry"."order"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "laundry"."operator" ("id" integer NOT NULL, "user_id" integer NOT NULL, "store_id" integer NOT NULL, "status" text NOT NULL DEFAULT 'awaiting_approval', "owner" boolean NOT NULL DEFAULT false, "app_version" text, "current_gps" geography, "delivery_driver_type" text NOT NULL DEFAULT 'laundry_operator', "online" boolean NOT NULL DEFAULT true, "app_type_id" text NOT NULL DEFAULT 'laundry', PRIMARY KEY ("id") , FOREIGN KEY ("store_id") REFERENCES "laundry"."store"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("user_id"));

alter table "laundry"."order" add column "chat_id" integer
 null;

alter table "laundry"."order"
  add constraint "order_chat_id_fkey"
  foreign key ("chat_id")
  references "public"."chat"
  ("id") on update restrict on delete restrict;

alter table "laundry"."store" add column "phone_number" text
 null;

alter table "laundry"."store" add column "payment_type" text
 not null default 'Cash';

alter table "laundry"."store" drop column "payment_type" cascade;

alter table "laundry"."store" add column "schedule" jsonb
 null;

alter table "laundry"."store" add column "stripe_info" jsonb
 null;

alter table "laundry"."store" add column "accepted_payments" jsonb
 null;

alter table "laundry"."store" add column "delivery" boolean
 not null default 'true';

alter table "laundry"."store" add column "customer_pickup" boolean
 not null default 'true';

alter table "laundry"."store" add column "delivery_details_id" integer
 not null unique;

alter table "laundry"."store"
  add constraint "store_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update restrict on delete restrict;

alter table "laundry"."store" drop constraint "store_delivery_details_id_fkey",
  add constraint "store_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update restrict on delete cascade;

alter table "laundry"."type" rename to "category";

alter table "laundry"."order_type" rename to "order_category";

alter table "laundry"."order" add column "firebase_id" text
 null unique;

alter table "laundry"."order" add column "customer_app_type" text
 not null default 'native';

alter table "laundry"."order" add column "cancellation_time" timestamptz
 null;

alter table "laundry"."order" add column "tax" money
 not null default '0';

alter table "laundry"."category" add column "position" integer
 not null default '1';

alter table "laundry"."order" add column "refund_amount" money
 not null default '0';

alter table "laundry"."order" add column "scheduled_time" timestamptz
 null;

alter table "laundry"."order" add column "stripe_info" jsonb
 null;

alter table "laundry"."order" add column "stripe_fees" money
 not null default '0';

alter table "laundry"."order" add column "discount_value" money
 not null default '0';

alter table "laundry"."store" alter column "delivery_details_id" drop not null;

alter table "laundry"."order_category" rename column "type_id" to "category_id";
