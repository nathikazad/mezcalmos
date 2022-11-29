
CREATE TABLE "public"."delivery_company" ("id" serial NOT NULL, "name" text NOT NULL, "image" text NOT NULL, "open_status" text NOT NULL DEFAULT 'closed_indefinitely', "approved" boolean NOT NULL DEFAULT false, "service_provider_type" text NOT NULL DEFAULT 'delivery', "description_id" integer, PRIMARY KEY ("id") , FOREIGN KEY ("description_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "public"."delivery_operator" ("id" serial NOT NULL, "user_id" integer NOT NULL, "delivery_company_id" integer NOT NULL, "status" text NOT NULL DEFAULT 'awaiting_approval', "owner" boolean NOT NULL DEFAULT false, "app_version" text NOT NULL, "current_gps" geography NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("delivery_company_id") REFERENCES "public"."delivery_company"("id") ON UPDATE restrict ON DELETE restrict);

alter table "public"."deliverer" rename to "delivery_driver";

alter table "public"."delivery_order" rename column "deliverer_id" to "delivery_driver_id";

alter table "public"."delivery_order" rename column "deliverer_app_type_id" to "delivery_driver_app_type_id";

comment on column "public"."delivery_order"."service_provider_type" is E'restaurant, delivery_company';

alter table "public"."delivery_company" alter column "service_provider_type" set default 'delivery_company'::text;

comment on column "public"."delivery_order"."delivery_driver_app_type_id" is E'restaurant, delivery_driver, delivery_operator';

alter table "public"."delivery_order" add column "delivery_company_type" text
 not null;

alter table "public"."delivery_order" add column "delivery_company_id" integer
 not null;

alter table "public"."delivery_operator" add column "delivery_driver_type" text
 not null default 'delivery_operator';

alter table "public"."delivery_driver" add column "delivery_driver_type" text
 not null default 'delivery_driver';

alter table "public"."restaurant_operator" add column "delivery_driver_type" text
 not null default 'restaurant_operator';

alter table "public"."delivery_order" drop column "delivery_company_type" cascade;

alter table "public"."delivery_order" drop column "delivery_company_id" cascade;

alter table "public"."delivery_order" drop constraint "delivery_deliverer_id_fkey";

alter table "public"."delivery_order" rename column "delivery_driver_app_type_id" to "delivery_driver_type";

comment on column "public"."delivery_order"."delivery_driver_type" is E'restaurant_operator, delivery_driver, delivery_operator';
