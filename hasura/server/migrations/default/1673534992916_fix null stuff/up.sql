
alter table "public"."user" alter column "language_id" set default 'en';

alter table "public"."user" alter column "language_id" drop not null;

alter table "public"."user" alter column "language_id" set not null;

alter table "public"."restaurant_order" alter column "chat_id" set not null;
