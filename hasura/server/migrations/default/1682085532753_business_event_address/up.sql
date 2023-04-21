
alter table "business"."event" add column "address" text
 null;

alter table "public"."chat" alter column "last_message_sent" set default now();
alter table "public"."chat" alter column "last_message_sent" set not null;
