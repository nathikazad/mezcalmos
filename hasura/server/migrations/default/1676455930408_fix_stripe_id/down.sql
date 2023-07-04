
alter table "service_provider"."stripe_info" alter column "sp_id" drop not null;
alter table "service_provider"."stripe_info" add column "sp_id" int4;

alter table "service_provider"."stripe_info"
  add constraint "stripe_info_sp_id_fkey"
  foreign key ("sp_id")
  references "service_provider"."details"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."details" drop constraint "details_stripe_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "stripe_id" integer
--  null;

alter table "service_provider"."stripe_info" drop constraint "stripe_info_pkey";

alter table "service_provider"."stripe_info"
    add constraint "stripe_info_pkey"
    primary key ("sp_id");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."stripe_info" add column "id" serial
--  not null;
