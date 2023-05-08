
alter table "business"."event" drop column "time" cascade;

alter table "business"."event" add column "starts_at" time
 null;

alter table "business"."event" drop column "starts_at" cascade;

alter table "business"."event" add column "starts_at" timestamp with time zone
 null;

alter table "business"."event" add column "ends_at" timestamp with time zone
 null;
