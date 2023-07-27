
CREATE TABLE "service_provider"."store_credit" ("customer_id" integer NOT NULL, "service_provider_type" text NOT NULL DEFAULT 'restaurant', "service_provider_id" integer NOT NULL, "credit" money NOT NULL DEFAULT 0, PRIMARY KEY ("customer_id","service_provider_type","service_provider_id") );

CREATE TABLE "service_provider"."offer" ("id" serial NOT NULL, "offer_type" text NOT NULL, "coupon_code" text, "details" jsonb NOT NULL, PRIMARY KEY ("id") );

comment on column "service_provider"."offer"."details" is E'{ "offerForOrder":"any_order/first_order "offerForItems": "particular_items/particular_categories", "discountType":"flat_amount/percentage/another_same/store_credit", "discountValue":<numeric>, "items": Array<items-ids>, "categories": Array<category-ids>, "another_same_discount: percentage validity_range_start:date_time validity_range_end:date_time weekly_repeat: boolean coupon_reusable: boolean }';

alter table "service_provider"."offer" drop column "details" cascade;

alter table "service_provider"."offer" add column "name_id" Integer
 not null;

alter table "service_provider"."offer" add column "details" jsonb
 not null;

comment on column "service_provider"."offer"."details" is E'{ "offerForOrder":"any_order/first_order "offerForItems": "particular_items/particular_categories", "discountType":"flat_amount/percentage/another_same/store_credit", "discountValue":<numeric>, "items": Array<items-ids>, "categories": Array<category-ids>, "another_same_discount: percentage validity_range_start:date_time validity_range_end:date_time weekly_repeat: boolean coupon_reusable: boolean }';

alter table "service_provider"."offer" add column "service_provider_type" text
 not null default 'restaurant';

alter table "service_provider"."offer" add column "service_provider_id" integer
 not null;

alter table "restaurant"."cart" add column "discount_value" money
 not null default '0';

alter table "restaurant"."order" add column "discount_value" money
 not null default '0';

CREATE OR REPLACE FUNCTION public.totalcost(order_row restaurant."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.delivery_cost + order_row.itemsCost - order_row.refund_amount + order_row.stripe_fees - order_row.discount_value
$function$;

alter table "service_provider"."offer" add column "status" text
 not null default 'active';

CREATE TABLE "service_provider"."offer_applied" ("order_id" integer NOT NULL, "offer_id" integer NOT NULL, PRIMARY KEY ("order_id","offer_id") );

alter table "service_provider"."offer_applied" add column "loss" money
 not null default '0';

alter table "service_provider"."offer_applied" add column "service_provider_type" text
 not null default 'restaurant';

BEGIN TRANSACTION;
ALTER TABLE "service_provider"."offer_applied" DROP CONSTRAINT "offer_applied_pkey";

ALTER TABLE "service_provider"."offer_applied"
    ADD CONSTRAINT "offer_applied_pkey" PRIMARY KEY ("offer_id", "order_id", "service_provider_type");
COMMIT TRANSACTION;

BEGIN TRANSACTION;
ALTER TABLE "service_provider"."offer_applied" DROP CONSTRAINT "offer_applied_pkey";

ALTER TABLE "service_provider"."offer_applied"
    ADD CONSTRAINT "offer_applied_pkey" PRIMARY KEY ("offer_id", "order_id", "service_provider_type");
COMMIT TRANSACTION;
