
comment on column "public"."restaurant_cart_item"."selected_options" is E'{<option-id>:[<choice-id>]';

comment on column "public"."delivery"."status" is E'orderReceived, packageReady, atPickup, onTheWayToDropoff, atDropoff, delivered, cancelledByCustomer, cancelledByDeliverer, cancelledByServiceProvider';

alter table "public"."delivery" add column "cancellation_time" timestamptz
 null;

alter table "public"."chat" add column "creation_time" timestamptz
 not null default now();
