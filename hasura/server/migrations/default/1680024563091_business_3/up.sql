
alter table "business"."rental" add column "category" text
 not null default 'uncategorized';

alter table "business"."rental" drop column "image" cascade;

alter table "business"."rental" add column "image" jsonb
 null;

alter table "business"."class" drop column "image" cascade;

alter table "business"."class" add column "image" jsonb
 null;

alter table "business"."class" add column "category" text
 not null default 'uncategorized';

alter table "business"."event" drop column "image" cascade;

alter table "business"."event" add column "image" jsonb
 null;

alter table "business"."event" add column "category" text
 null default 'uncategorized';

alter table "business"."event" rename column "category" to "category1";

alter table "business"."class" rename column "category" to "category1";

alter table "business"."rental" rename column "category" to "category1";

alter table "business"."rental" drop column "cost" cascade;

alter table "business"."rental" add column "cost" jsonb
 not null;

alter table "business"."rental" add column "additional_parameters" jsonb
 null;

alter table "business"."event" drop column "cost" cascade;

alter table "business"."event" add column "cost" jsonb
 not null;

alter table "business"."event" add column "additional_parameters" jsonb
 null;

alter table "business"."class" drop column "cost" cascade;

alter table "business"."class" add column "cost" jsonb
 not null;

alter table "business"."class" add column "additional_parameters" jsonb
 null;

alter table "business"."order_request" add column "commence_time" timestamptz
 null;
