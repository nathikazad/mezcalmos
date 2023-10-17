
comment on column "service_provider"."offer"."details" is E'{ "offerForOrder":"any_order/first_order "offerForItems": "particular_items/particular_categories", "discountType":"flat_amount/percentage/another_same/store_credit", "discountValue":<numeric>, "items": Array<items-ids>, "categories": Array<category-ids>, "another_same_discount: percentage validity_range_start:date_time validity_range_end:date_time weekly_repeat: boolean, influencerCommission: InfluencerCommission }';

alter table "service_provider"."offer_applied" rename column "loss" to "discount";

CREATE OR REPLACE FUNCTION service_provider.offer_loss(offer_applied_row service_provider.offer_applied)
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT offer_applied_row.discount + offer_applied_row.comission;
$function$;
