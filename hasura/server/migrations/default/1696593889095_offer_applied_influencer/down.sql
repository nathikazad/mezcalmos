
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."offer_applied" add column "order_total" money
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."offer_applied" add column "comission" money
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."offer_applied" add column "influencer_id" integer
--  null;

alter table "service_provider"."offer_applied" drop constraint "offer_applied_pkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."offer_applied" add column "id" serial
--  not null unique;

alter table "service_provider"."offer_applied" alter column "order_id" set not null;

alter table "service_provider"."offer_applied"
    add constraint "offer_applied_pkey"
    primary key ("offer_id", "order_id", "order_type");
