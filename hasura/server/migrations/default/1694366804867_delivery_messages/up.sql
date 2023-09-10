
alter table "restaurant"."restaurant" add column "restaurant_type" text
 not null default 'restaurant';

alter table "restaurant"."item" add column "tags" jsonb
 null;

CREATE TABLE "public"."delivery_messages" ("id" serial NOT NULL, "entry" jsonb NOT NULL, "phone_number" text NOT NULL, "driver_id" integer, PRIMARY KEY ("id") , FOREIGN KEY ("driver_id") REFERENCES "delivery"."driver"("id") ON UPDATE restrict ON DELETE restrict);

alter table "public"."delivery_messages" add column "received_time" timestamptz
 not null default now();

alter table "public"."delivery_messages" add column "resolved_time" timestamptz
 null;
