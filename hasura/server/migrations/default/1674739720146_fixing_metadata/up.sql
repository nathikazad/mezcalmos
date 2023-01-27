
alter table "restaurant"."restaurant" add constraint "restaurant_location_id_key" unique ("location_id");

alter table "restaurant"."restaurant" add constraint "restaurant_delivery_details_id_key" unique ("delivery_details_id");

alter table "delivery"."company" add constraint "company_location_id_key" unique ("location_id");

alter table "delivery"."company" add constraint "company_delivery_details_id_key" unique ("delivery_details_id");
