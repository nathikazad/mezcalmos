
alter table "public"."customer" add column "service_provider_type" text
 null default 'customer';

alter table "public"."review" add column "created_at" timestamptz
 not null default now();
