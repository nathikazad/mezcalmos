
alter table "delivery"."courier_order" drop column "notes" cascade;

alter table "delivery"."courier_order_item" add column "notes" text
 null;

alter table "delivery"."courier_order_item" drop column "quantity" cascade;

alter table "delivery"."courier_order_item" rename column "estimated_cost_per_one" to "estimated_cost";

alter table "delivery"."courier_order_item" rename column "actual_cost_per_one" to "actual_cost";

alter table "delivery"."courier_order" rename column "from_location_adress" to "from_location_text";

alter table "delivery"."order" alter column "pickup_gps" drop not null;

alter table "delivery"."order" alter column "pickup_address" drop not null;

alter table "delivery"."courier_order_item"
  add constraint "courier_order_item_order_id_fkey"
  foreign key ("order_id")
  references "delivery"."courier_order"
  ("id") on update restrict on delete cascade;

alter table "delivery"."courier_order" add column "customer_id" integer
 not null;

alter table "delivery"."courier_order"
  add constraint "courier_order_customer_id_fkey"
  foreign key ("customer_id")
  references "customer"."customer"
  ("user_id") on update restrict on delete restrict;

alter table "delivery"."courier_order" add column "order_time" timestamptz
 not null default now();

alter table "delivery"."courier_order" add column "stripe_info" jsonb
 null;

comment on column "delivery"."courier_order"."stripe_info" is E'{ id: string, stripeFees: number, amountCharged: number, amountRefunded: number, chargeFeesOnCustomer: boolean |null; brand?: string, expMonth?: number, expYear?: number, last4?: string, status: (authorized, captured, cancelled), serviceProviderAccount: string }';

alter table "delivery"."courier_order" add column "payment_type" text
 not null default 'Cash';

alter table "delivery"."courier_order" add column "tax" money
 not null default '0';

alter table "delivery"."courier_order" add column "stripe_fees" money
 not null default '0';

alter table "delivery"."courier_order" add column "discount_value" money
 not null default '0';

alter table "delivery"."courier_order" add column "customer_app_type" text
 not null default 'native';

alter table "delivery"."courier_order" add column "refund_amount" money
 null;

alter table "delivery"."courier_order" add column "cancellation_time" timestamptz
 null;
