
alter table "public"."restaurant" drop column "language_id" cascade;

alter table "public"."restaurant" add column "language_id" text
 not null default 'en';

alter table "public"."restaurant_item" alter column "item_type" set default 'daily';
comment on column "public"."restaurant_item"."item_type" is E'daily, special';

alter table "public"."restaurant_option"
  add constraint "restaurant_option_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;
