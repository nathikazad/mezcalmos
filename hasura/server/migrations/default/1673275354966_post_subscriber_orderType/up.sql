
CREATE TABLE "public"."post" ("id" serial NOT NULL, "service_provider_type" text NOT NULL DEFAULT '"restaurant"', "service_provider_id" integer NOT NULL, "message" text NOT NULL, "image" text, "likes" jsonb, "comments" jsonb, "posted_on" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , UNIQUE ("id"));

CREATE TABLE "public"."subscriber" ("id" serial NOT NULL, "service_provider_type" text NOT NULL DEFAULT '"restaurant"', "service_provider_id" integer NOT NULL, "customer_id" integer NOT NULL, PRIMARY KEY ("id") , UNIQUE ("customer_id", "service_provider_type", "service_provider_id"));

alter table "public"."delivery_order" add column "order_type" text
 not null default 'restaurant';
