
create schema "business";

CREATE TABLE "business"."business" ("id" serial NOT NULL, "service_type" text NOT NULL, "profile" text NOT NULL, "details_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("details_id") REFERENCES "service_provider"."details"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("details_id"));

alter table "business"."business" add column "service_provider_type" text
 not null default 'business';

CREATE TABLE "business"."order_request" ("id" serial NOT NULL, "customer_id" integer NOT NULL, "business_id" integer NOT NULL, "status" text NOT NULL, "review_id" integer NOT NULL, "order_time" timestamptz NOT NULL DEFAULT now(), "customer_app_type" text NOT NULL DEFAULT 'native', "notes" text, "chat_id" integer, "cancellation_time" timestamptz, PRIMARY KEY ("id") , FOREIGN KEY ("customer_id") REFERENCES "customer"."customer"("user_id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("chat_id") REFERENCES "public"."chat"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("business_id") REFERENCES "business"."business"("id") ON UPDATE restrict ON DELETE restrict);

alter table "business"."business" drop column "service_type" cascade;

CREATE TABLE "business"."rental" ("id" serial NOT NULL, "name_id" integer NOT NULL, "description_id" integer, "position" integer NOT NULL DEFAULT 1, "business_id" integer NOT NULL, "available" boolean NOT NULL DEFAULT true, "cost" money NOT NULL, "image" text, PRIMARY KEY ("id") , FOREIGN KEY ("business_id") REFERENCES "business"."business"("id") ON UPDATE restrict ON DELETE cascade, FOREIGN KEY ("name_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("description_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "business"."class" ("id" serial NOT NULL, "name_id" integer NOT NULL, "description_id" integer, "position" integer NOT NULL DEFAULT 1, "business_id" integer NOT NULL, "schedule_type" text NOT NULL, "available" boolean NOT NULL DEFAULT true, "cost" money NOT NULL, "image" text, "schedule" jsonb, PRIMARY KEY ("id") , FOREIGN KEY ("name_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("description_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("business_id") REFERENCES "business"."business"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "business"."event" ("id" serial NOT NULL, "name_id" integer NOT NULL, "description_id" integer, "position" integer NOT NULL DEFAULT 1, "business_id" integer NOT NULL, "schedule_type" text NOT NULL, "cost" money NOT NULL, "image" text, "schedule" jsonb, "available" boolean NOT NULL DEFAULT true, PRIMARY KEY ("id") , FOREIGN KEY ("name_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("description_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("business_id") REFERENCES "business"."business"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "business"."order_request_item" ("id" serial NOT NULL, "service_id" integer NOT NULL, "service_type" text NOT NULL, "available" boolean NOT NULL DEFAULT true, "quantity" integer NOT NULL DEFAULT 1, "final_cost_per_one" money, PRIMARY KEY ("id") );

CREATE TABLE "business"."operator" ("id" serial NOT NULL, "user_id" integer NOT NULL, "business_id" integer NOT NULL, "details_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("business_id") REFERENCES "business"."business"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("details_id") REFERENCES "service_provider"."operator_details"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("user_id"), UNIQUE ("details_id"));

alter table "business"."business"
  add constraint "business_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

comment on column "business"."class"."schedule_type" is E'scheduled or onDemand';

comment on column "business"."event"."schedule_type" is E'scheduled or OnDemand';
