
alter table "delivery"."company" alter column "service_provider_type" set default 'deliveryCompany'::text;

alter table "customer"."customer" add column "stripe_id" text
 null;

alter table "customer"."stripe_info" rename to "stripe_sp_id";

alter table "customer"."stripe_sp_id" add column "id" serial
 not null;

BEGIN TRANSACTION;
ALTER TABLE "customer"."stripe_sp_id" DROP CONSTRAINT "stripe_info_pkey";

ALTER TABLE "customer"."stripe_sp_id"
    ADD CONSTRAINT "stripe_info_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;

alter table "customer"."stripe_cards" add column "id" serial
 not null;

BEGIN TRANSACTION;
ALTER TABLE "customer"."stripe_cards" DROP CONSTRAINT "stripe_cards_pkey";

ALTER TABLE "customer"."stripe_cards"
    ADD CONSTRAINT "stripe_cards_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;

comment on column "customer"."stripe_cards"."sp_card_ids" is E'Record<sp_details_id, card_sp_id>';

alter table "customer"."stripe_cards" add column "last4" text
 null;

alter table "customer"."stripe_cards" rename column "last4" to "last_4";

alter table "customer"."stripe_cards" add column "brand" text
 null;

alter table "customer"."stripe_cards" add column "exp_month" text
 null;

alter table "customer"."stripe_cards" add column "exp_year" integer
 null;

alter table "customer"."stripe_cards" drop column "exp_month" cascade;

alter table "customer"."stripe_cards" add column "exp_month" integer
 null;

alter table "customer"."customer" drop column "stripe_info" cascade;
