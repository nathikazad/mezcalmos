
alter table "public"."delivery_messages" rename column "resolved_time" to "finished_time";

alter table "public"."delivery_messages" add column "responded_time" Timestamp 
 null;

ALTER TABLE "public"."delivery_messages" ALTER COLUMN "responded_time" TYPE timestamptz;
