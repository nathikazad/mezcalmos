
create schema "taxi";

CREATE TABLE "taxi"."company" ("id" serial NOT NULL, "details_id" integer NOT NULL, "service_provider_type" text NOT NULL DEFAULT 'taxiCompany', "cost_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("details_id") REFERENCES "service_provider"."details"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("details_id"), UNIQUE ("cost_id"));

ALTER TABLE "taxi"."company" ALTER COLUMN "cost_id" TYPE money;
alter table "taxi"."company" drop constraint "company_cost_id_key";
alter table "taxi"."company" rename column "cost_id" to "minimum_cost";

alter table "taxi"."company" add column "cost_per_km" money
 not null;

INSERT INTO "valid_types"."service_provider_type"("id") VALUES (E'taxiCompany');

alter table "taxi"."company"
  add constraint "company_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

CREATE TABLE "taxi"."operator" ("id" serial NOT NULL, "user_id" integer NOT NULL, "company_id" integer NOT NULL, "details_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("company_id") REFERENCES "taxi"."company"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("details_id") REFERENCES "service_provider"."operator_details"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("user_id"), UNIQUE ("details_id"));

CREATE TABLE "taxi"."driver" ("id" serial NOT NULL, "user_id" integer NOT NULL, "taxi_company_id" integer NOT NULL, "status" text NOT NULL, "app_version" text, "current_location" geography, "online" boolean NOT NULL DEFAULT false, "app_type_id" text NOT NULL DEFAULT 'taxi', PRIMARY KEY ("id") , FOREIGN KEY ("app_type_id") REFERENCES "valid_types"."app_type"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("taxi_company_id") REFERENCES "taxi"."company"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("user_id"));

INSERT INTO "valid_types"."app_type"("id") VALUES (E'taxi');

INSERT INTO "valid_types"."app_type"("id") VALUES (E'taxiAdmin');

CREATE TABLE "taxi"."order" ("id" serial NOT NULL, "from_location_gps" geography NOT NULL, "from_location_text" text NOT NULL, "to_location_gps" geography NOT NULL, "to_location_address" text NOT NULL, "customer_id" integer NOT NULL, "order_time" timestamptz NOT NULL DEFAULT now(), "status" text NOT NULL, "payment_type" text NOT NULL DEFAULT 'cash', "tax" money NOT NULL DEFAULT 0, "stripe_fees" money NOT NULL DEFAULT 0, "discount_value" money NOT NULL DEFAULT 0, "customer_app_type" text NOT NULL DEFAULT 'native', "refund_amount" money NOT NULL DEFAULT 0, "chat_with_customer_id" integer NOT NULL, "cost" money NOT NULL, "driver_id" integer, "cancellation_time" timestamptz, "estimated_arrival_at_pickup_time" timestamptz, "actual_arrival_at_pickup_time" timestamptz, "estimated_arrival_at_dropoff_time" timestamptz, "actual_arrival_at_dropoff_time" timestamptz, "stripe_info" jsonb, "driver_review_by_customer_id" integer, "customer_review_by_driver_id" integer, "taxi_company_id" integer, "trip_polyline" text, "trip_distance" integer, "trip_duration" integer, "bill_image" text, "current_gps" geography, "schedule_time" text, "notified_drivers" jsonb, "chosen_companies" jsonb, "counter_offers" jsonb, PRIMARY KEY ("id") , FOREIGN KEY ("chat_with_customer_id") REFERENCES "public"."chat"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("customer_id") REFERENCES "customer"."customer"("user_id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("customer_review_by_driver_id") REFERENCES "public"."review"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("driver_review_by_customer_id") REFERENCES "public"."review"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("driver_id") REFERENCES "taxi"."driver"("id") ON UPDATE restrict ON DELETE restrict);

alter table "taxi"."order" rename column "chat_with_customer_id" to "chat_id";

alter table "taxi"."order"
  add constraint "order_taxi_company_id_fkey"
  foreign key ("taxi_company_id")
  references "taxi"."company"
  ("id") on update restrict on delete restrict;
