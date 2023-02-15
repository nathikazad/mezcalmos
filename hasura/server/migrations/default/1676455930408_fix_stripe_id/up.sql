
alter table "service_provider"."stripe_info" add column "id" serial
 not null;

alter table "service_provider"."stripe_info" drop constraint "stripe_info_pkey";

alter table "service_provider"."stripe_info"
    add constraint "stripe_info_pkey"
    primary key ("id");

alter table "service_provider"."details" add column "stripe_id" integer
 null;

alter table "service_provider"."details"
  add constraint "details_stripe_id_fkey"
  foreign key ("stripe_id")
  references "service_provider"."stripe_info"
  ("id") on update restrict on delete cascade;

alter table "service_provider"."stripe_info" drop constraint "stripe_info_sp_id_fkey";

alter table "service_provider"."stripe_info" drop column "sp_id" cascade;
