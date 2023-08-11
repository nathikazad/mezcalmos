
alter table "public"."data_consumption" add column "app_type_id" Text
 null;

alter table "public"."data_consumption" alter column "app_type_id" set not null;
