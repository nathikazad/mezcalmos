
alter table "customer"."customer" alter column "stripe_info" drop not null;
alter table "customer"."customer" add column "stripe_info" jsonb;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."stripe_cards" add column "exp_month" integer
--  null;

alter table "customer"."stripe_cards" alter column "exp_month" drop not null;
alter table "customer"."stripe_cards" add column "exp_month" text;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."stripe_cards" add column "exp_year" integer
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."stripe_cards" add column "exp_month" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."stripe_cards" add column "brand" text
--  null;

alter table "customer"."stripe_cards" rename column "last_4" to "last4";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."stripe_cards" add column "last4" text
--  null;

comment on column "customer"."stripe_cards"."sp_card_ids" is NULL;

alter table "customer"."stripe_cards" drop constraint "stripe_cards_pkey";
alter table "customer"."stripe_cards"
    add constraint "stripe_cards_pkey"
    primary key ("card_id");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."stripe_cards" add column "id" serial
--  not null;

alter table "customer"."stripe_sp_id" drop constraint "stripe_sp_id_pkey";
alter table "customer"."stripe_sp_id"
    add constraint "stripe_info_pkey"
    primary key ("stripe_id");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."stripe_sp_id" add column "id" serial
--  not null;

alter table "customer"."stripe_sp_id" rename to "stripe_info";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."customer" add column "stripe_id" text
--  null;

alter table "delivery"."company" alter column "service_provider_type" set default 'delivery_company'::text;
