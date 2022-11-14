
comment on column "public"."restaurant"."status" is E'open, closed_temporarily, closed_indefinitely';
alter table "public"."restaurant" rename column "status" to "open_status";

alter table "public"."restaurant" add column "approved" boolean
 null default 'false';

alter table "public"."restaurant" alter column "approved" set not null;

alter table "public"."restaurant" alter column "open_status" set default 'closed_indefinitely'::text;

alter table "public"."restaurant_cart"
  add constraint "restaurant_cart_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "public"."restaurant"
  ("id") on update restrict on delete restrict;

comment on column "public"."restaurant_order"."status" is E'orderReceived, preparing, ready, onTheWay, delivered, cancelledByCustomer, cancelledByRestaurant';
