
alter table "service_provider"."subscriber"
  add constraint "subscriber_customer_id_fkey"
  foreign key ("customer_id")
  references "customer"."customer"
  ("user_id") on update restrict on delete cascade;

alter table "service_provider"."location" alter column "address" set not null;

comment on column "service_provider"."post"."likes" is E'Array of customerIds';

comment on column "service_provider"."post"."comments" is E'Array of { message, date, Array of customerIds }';

CREATE TABLE "restaurant"."favourited_item" ("id" serial NOT NULL, "customer_id" integer NOT NULL, "restaurant_id" integer NOT NULL, "restaurant_item_id" integer NOT NULL, PRIMARY KEY ("id") );

alter table "restaurant"."favourited_item"
  add constraint "favourited_item_customer_id_fkey"
  foreign key ("customer_id")
  references "customer"."customer"
  ("user_id") on update restrict on delete cascade;

alter table "restaurant"."favourited_item"
  add constraint "favourited_item_restaurant_item_id_fkey"
  foreign key ("restaurant_item_id")
  references "restaurant"."item"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."favourited_item"
  add constraint "favourited_item_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete cascade;

ALTER TABLE restaurant.favourited_item SET SCHEMA customer;
