
alter table "delivery"."company" drop constraint "company_delivery_details_id_key";

alter table "delivery"."company" drop constraint "company_location_id_key";

alter table "restaurant"."restaurant" drop constraint "restaurant_delivery_details_id_key";

alter table "restaurant"."restaurant" drop constraint "restaurant_location_id_key";
