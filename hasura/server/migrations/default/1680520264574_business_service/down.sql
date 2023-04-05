
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request" add column "final_cost" money
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request" add column "estimated_cost" money
--  not null;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request_item" add column "cost" jsonb
--  not null;


alter table "business"."order_request_item" alter column "final_cost_per_one" drop not null;
alter table "business"."order_request_item" add column "final_cost_per_one" money;

alter table "business"."order_request_item" alter column "quantity" set default 1;
alter table "business"."order_request_item" alter column "quantity" drop not null;
alter table "business"."order_request_item" add column "quantity" int4;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request_item" add column "commence_time" timestamptz
--  null;

alter table "business"."order_request" alter column "commence_time" drop not null;
alter table "business"."order_request" add column "commence_time" timestamptz;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."cart_item" add column "cost" jsonb
--  not null;

alter table "business"."cart_item" alter column "quantity" set default 1;
alter table "business"."cart_item" alter column "quantity" drop not null;
alter table "business"."cart_item" add column "quantity" int4;

alter table "business"."cart_item" alter column "cost_per_one" drop not null;
alter table "business"."cart_item" add column "cost_per_one" money;


alter table "business"."class" drop constraint "class_service_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."class" add column "service_id" integer
--  not null unique;

alter table "business"."event" drop constraint "event_service_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "service_id" integer
--  not null unique;

alter table "business"."rental" drop constraint "rental_service_id_fkey";

alter table "business"."rental" drop constraint "rental_service_id_key";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."rental" add column "service_id" integer
--  not null;

alter table "business"."rental" alter column "additional_parameters" drop not null;
alter table "business"."rental" add column "additional_parameters" jsonb;

alter table "business"."rental" alter column "cost" drop not null;
alter table "business"."rental" add column "cost" jsonb;

alter table "business"."rental" alter column "image" drop not null;
alter table "business"."rental" add column "image" jsonb;

alter table "business"."rental" alter column "category1" set default ''uncategorized'::text';
alter table "business"."rental" alter column "category1" drop not null;
alter table "business"."rental" add column "category1" text;

alter table "business"."rental" alter column "available" set default true;
alter table "business"."rental" alter column "available" drop not null;
alter table "business"."rental" add column "available" bool;

alter table "business"."rental" alter column "position" set default 1;
alter table "business"."rental" alter column "position" drop not null;
alter table "business"."rental" add column "position" int4;

alter table "business"."rental"
  add constraint "rental_description_id_fkey"
  foreign key (description_id)
  references "public"."translation"
  (id) on update restrict on delete restrict;
alter table "business"."rental" alter column "description_id" drop not null;
alter table "business"."rental" add column "description_id" int4;

alter table "business"."rental"
  add constraint "rental_name_id_fkey"
  foreign key (name_id)
  references "public"."translation"
  (id) on update restrict on delete restrict;
alter table "business"."rental" alter column "name_id" drop not null;
alter table "business"."rental" add column "name_id" int4;

alter table "business"."event" alter column "additional_parameters" drop not null;
alter table "business"."event" add column "additional_parameters" jsonb;

alter table "business"."event" alter column "cost" drop not null;
alter table "business"."event" add column "cost" jsonb;

alter table "business"."event" alter column "category1" set default ''uncategorized'::text';
alter table "business"."event" alter column "category1" drop not null;
alter table "business"."event" add column "category1" text;

alter table "business"."event" alter column "image" drop not null;
alter table "business"."event" add column "image" jsonb;

alter table "business"."event" alter column "available" set default true;
alter table "business"."event" alter column "available" drop not null;
alter table "business"."event" add column "available" bool;

alter table "business"."event" alter column "position" set default 1;
alter table "business"."event" alter column "position" drop not null;
alter table "business"."event" add column "position" int4;

alter table "business"."event"
  add constraint "event_description_id_fkey"
  foreign key (description_id)
  references "public"."translation"
  (id) on update restrict on delete restrict;
alter table "business"."event" alter column "description_id" drop not null;
alter table "business"."event" add column "description_id" int4;

alter table "business"."event"
  add constraint "event_name_id_fkey"
  foreign key (name_id)
  references "public"."translation"
  (id) on update restrict on delete restrict;
alter table "business"."event" alter column "name_id" drop not null;
alter table "business"."event" add column "name_id" int4;

alter table "business"."class" alter column "additional_parameters" drop not null;
alter table "business"."class" add column "additional_parameters" jsonb;

alter table "business"."class" alter column "cost" drop not null;
alter table "business"."class" add column "cost" jsonb;

alter table "business"."class" alter column "category1" set default ''uncategorized'::text';
alter table "business"."class" alter column "category1" drop not null;
alter table "business"."class" add column "category1" text;

alter table "business"."class" alter column "image" drop not null;
alter table "business"."class" add column "image" jsonb;

alter table "business"."class" alter column "available" set default true;
alter table "business"."class" alter column "available" drop not null;
alter table "business"."class" add column "available" bool;

alter table "business"."class" alter column "position" set default 1;
alter table "business"."class" alter column "position" drop not null;
alter table "business"."class" add column "position" int4;

alter table "business"."class"
  add constraint "class_description_id_fkey"
  foreign key (description_id)
  references "public"."translation"
  (id) on update restrict on delete restrict;
alter table "business"."class" alter column "description_id" drop not null;
alter table "business"."class" add column "description_id" int4;

alter table "business"."class"
  add constraint "class_name_id_fkey"
  foreign key (name_id)
  references "public"."translation"
  (id) on update restrict on delete restrict;
alter table "business"."class" alter column "name_id" drop not null;
alter table "business"."class" add column "name_id" int4;

alter table "business"."service"
  add constraint "service_business_id_fkey"
  foreign key (business_id)
  references "business"."business"
  (id) on update restrict on delete restrict;
alter table "business"."service" alter column "business_id" drop not null;
alter table "business"."service" add column "business_id" int4;

alter table "business"."service" drop constraint "service_business_id_fkey";

DROP TABLE "business"."service";
