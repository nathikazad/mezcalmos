
alter table "restaurant"."restaurant" add column "phone_number" text
 null;

alter table "restaurant"."operator" add column "online" boolean
 not null default 'true';

alter table "public"."chat" alter column "chat_type" set default 'service';

comment on column "public"."chat"."chat_type" is E'service, direct, group';

alter table "public"."chat" alter column "chat_type" set default 'group';
comment on column "public"."chat"."chat_type" is E'direct, group';

alter table "public"."mez_admin" add column "online" boolean
 not null default 'true';

alter table "public"."mez_admin" drop column "online" cascade;

alter table "public"."notification_info" add column "turn_off_notifications" boolean
 not null default 'false';

DROP FUNCTION public.mez_admin_notification_token;
CREATE OR REPLACE FUNCTION public.mez_admin_notification_info(mez_admin_row mez_admin)
 RETURNS notification_info
 LANGUAGE sql
 STABLE
AS $function$
    SELECT *
    FROM notification_info n
    WHERE n.user_id = mez_admin_row.user_id
    AND n.app_type_id = 'mez_admin';
$function$;

alter table "public"."mez_admin" add column "app_typ_id" text
 not null default 'mez_admin';

DROP FUNCTION public.mez_admin_notification_info;

alter table "public"."mez_admin" rename column "app_typ_id" to "app_type_id";

DROP FUNCTION public.customer_notification_token;

alter table "customer"."customer" add column "app_type_id" text
 not null default 'customer';

DROP FUNCTION public.restaurant_operator_notification_token;

alter table "restaurant"."operator" add column "app_type_id" text
 not null default 'restaurant';

alter table "delivery"."driver" add column "app_type_id" Text
 not null default 'delivery';

DROP FUNCTION public.driver_notification_token;

alter table "delivery"."driver" drop column "notification_info_id" cascade;

alter table "delivery"."operator" add column "app_type_id" text
 not null default 'delivery_admin';

DROP FUNCTION public.deliop_notification_token;

alter table "public"."chat" drop column "agora_info" cascade;
