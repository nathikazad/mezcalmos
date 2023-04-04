



CREATE TABLE "business"."service" ("id" serial NOT NULL, "name_id" integer NOT NULL, "description_id" integer, "position" integer NOT NULL DEFAULT 1, "business_id" integer NOT NULL, "available" boolean NOT NULL DEFAULT true, "category1" text NOT NULL DEFAULT 'uncategorized', "image" jsonb, "cost" jsonb NOT NULL, "additional_parameters" jsonb, PRIMARY KEY ("id") );

alter table "business"."service"
  add constraint "service_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "business"."service" drop column "business_id" cascade;

alter table "business"."class" drop column "name_id" cascade;

alter table "business"."class" drop column "description_id" cascade;

alter table "business"."class" drop column "position" cascade;

alter table "business"."class" drop column "available" cascade;

alter table "business"."class" drop column "image" cascade;

alter table "business"."class" drop column "category1" cascade;

alter table "business"."class" drop column "cost" cascade;

alter table "business"."class" drop column "additional_parameters" cascade;

alter table "business"."event" drop column "name_id" cascade;

alter table "business"."event" drop column "description_id" cascade;

alter table "business"."event" drop column "position" cascade;

alter table "business"."event" drop column "available" cascade;

alter table "business"."event" drop column "image" cascade;

alter table "business"."event" drop column "category1" cascade;

alter table "business"."event" drop column "cost" cascade;

alter table "business"."event" drop column "additional_parameters" cascade;

alter table "business"."rental" drop column "name_id" cascade;

alter table "business"."rental" drop column "description_id" cascade;

alter table "business"."rental" drop column "position" cascade;

alter table "business"."rental" drop column "available" cascade;

alter table "business"."rental" drop column "category1" cascade;

alter table "business"."rental" drop column "image" cascade;

alter table "business"."rental" drop column "cost" cascade;

alter table "business"."rental" drop column "additional_parameters" cascade;

alter table "business"."rental" add column "service_id" integer
 not null;

alter table "business"."rental" add constraint "rental_service_id_key" unique ("service_id");

alter table "business"."rental"
  add constraint "rental_service_id_fkey"
  foreign key ("service_id")
  references "business"."service"
  ("id") on update restrict on delete restrict;

alter table "business"."event" add column "service_id" integer
 not null unique;

alter table "business"."event"
  add constraint "event_service_id_fkey"
  foreign key ("service_id")
  references "business"."service"
  ("id") on update restrict on delete restrict;

alter table "business"."class" add column "service_id" integer
 not null unique;

alter table "business"."class"
  add constraint "class_service_id_fkey"
  foreign key ("service_id")
  references "business"."service"
  ("id") on update restrict on delete restrict;

alter table "business"."cart_item" drop column "cost_per_one" cascade;

alter table "business"."cart_item" drop column "quantity" cascade;

alter table "business"."cart_item" add column "cost" jsonb
 not null;

alter table "business"."order_request" drop column "commence_time" cascade;

alter table "business"."order_request_item" add column "commence_time" timestamptz
 null;

alter table "business"."order_request_item" drop column "quantity" cascade;

alter table "business"."order_request_item" drop column "final_cost_per_one" cascade;

alter table "business"."order_request_item" add column "cost" jsonb
 not null;

alter table "business"."order_request" add column "estimated_cost" money
 not null;

alter table "business"."order_request" add column "final_cost" money
 null;
