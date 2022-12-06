
alter table "public"."restaurant" alter column "operator_deep_link" drop not null;
alter table "public"."restaurant" add column "operator_deep_link" text;

alter table "public"."restaurant" alter column "operator_qr_image_link" drop not null;
alter table "public"."restaurant" add column "operator_qr_image_link" text;
