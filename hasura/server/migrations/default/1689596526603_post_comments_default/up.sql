
alter table "service_provider"."post" alter column "likes" set default jsonb_build_array();
alter table "service_provider"."post" alter column "likes" set not null;

alter table "service_provider"."post" alter column "comments" set default jsonb_build_array();
alter table "service_provider"."post" alter column "comments" set not null;
comment on column "service_provider"."post"."comments" is E'Array of { message, date }';
