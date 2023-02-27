
comment on column "business"."event"."schedule_type" is NULL;

comment on column "business"."class"."schedule_type" is NULL;

alter table "business"."business" drop constraint "business_service_provider_type_fkey";

DROP TABLE "business"."operator";

DROP TABLE "business"."order_request_item";

DROP TABLE "business"."event";

DROP TABLE "business"."class";

DROP TABLE "business"."rental";

alter table "business"."business" alter column "service_type" drop not null;
alter table "business"."business" add column "service_type" text;

DROP TABLE "business"."order_request";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."business" add column "service_provider_type" text
--  not null default 'business';

DROP TABLE "business"."business";

drop schema "business" cascade;
