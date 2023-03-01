alter table "public"."chat" alter column "messages" set default jsonb_build_array();
alter table "public"."chat" alter column "messages" set not null;
