
comment on column "public"."restaurant_order"."stripe_info" is NULL;

comment on column "public"."restaurant"."accepted_payments" is NULL;

comment on column "public"."customer"."stripe_info" is NULL;

comment on column "public"."restaurant"."stripe_info" is E'{   id: string;   status: string;   chargeFeesOnCustomer : boolean | null;   chargesEnabled: boolean;   payoutsEnabled: boolean;   detailsSubmitted: boolean;   requirements?: Array<string> | null;   email: string | null; }';


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP table "public"."stripe_info";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP table "public"."service_provider_payment_info";

alter table "public"."restaurant"
  add constraint "restaurant_payment_info_id_fkey"
  foreign key ("payment_info_id")
  references "public"."service_provider_payment_info"
  ("id") on update restrict on delete restrict;
