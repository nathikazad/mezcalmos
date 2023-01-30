
alter table "public"."chat" alter column "agora_info" drop not null;
alter table "public"."chat" add column "agora_info" jsonb;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP FUNCTION public.deliop_notification_token;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."operator" add column "app_type_id" text
--  not null default 'delivery_admin';

alter table "delivery"."driver"
  add constraint "deliverer_notification_id_fkey"
  foreign key (notification_info_id)
  references "public"."notification_info"
  (id) on update restrict on delete restrict;
alter table "delivery"."driver" alter column "notification_info_id" drop not null;
alter table "delivery"."driver" add column "notification_info_id" int4;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP FUNCTION public.driver_notification_token;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."driver" add column "app_type_id" Text
--  not null default 'delivery';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."operator" add column "app_type_id" text
--  not null default 'restaurant';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP FUNCTION public.restaurant_operator_notification_token;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."customer" add column "app_type_id" text
--  not null default 'customer';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP FUNCTION public.customer_notification_token;

alter table "public"."mez_admin" rename column "app_type_id" to "app_typ_id";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP FUNCTION public.mez_admin_notification_info;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."mez_admin" add column "app_typ_id" text
--  not null default 'mez_admin';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP FUNCTION public.mez_admin_notification_token;
-- CREATE OR REPLACE FUNCTION public.mez_admin_notification_info(mez_admin_row mez_admin)
--  RETURNS notification_info
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM notification_info n
--     WHERE n.user_id = mez_admin_row.user_id
--     AND n.app_type_id = 'mez_admin';
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."notification_info" add column "turn_off_notifications" boolean
--  not null default 'false';

alter table "public"."mez_admin" alter column "online" set default true;
alter table "public"."mez_admin" alter column "online" drop not null;
alter table "public"."mez_admin" add column "online" bool;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."mez_admin" add column "online" boolean
--  not null default 'true';

comment on column "public"."chat"."chat_type" is E'service, direct, group';
alter table "public"."chat" alter column "chat_type" set default 'service'::text;

comment on column "public"."chat"."chat_type" is NULL;

alter table "public"."chat" alter column "chat_type" set default 'group'::text;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."operator" add column "online" boolean
--  not null default 'true';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."restaurant" add column "phone_number" text
--  null;
