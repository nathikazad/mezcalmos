
CREATE TABLE "public"."service_provider_type" ("id" text NOT NULL, PRIMARY KEY ("id") );

create schema "valid_types";

ALTER TABLE app_type SET SCHEMA valid_types;

ALTER TABLE service_provider_type SET SCHEMA valid_types;

INSERT INTO valid_types.service_provider_type (id)
VALUES ('restaurant');
INSERT INTO valid_types.service_provider_type (id)
VALUES ('delivery_company');
INSERT INTO valid_types.service_provider_type (id)
VALUES ('laundry');

alter table "customer"."customer"
  add constraint "customer_app_type_id_fkey"
  foreign key ("app_type_id")
  references "valid_types"."app_type"
  ("id") on update restrict on delete restrict;

alter table "delivery"."company"
  add constraint "company_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "delivery"."driver"
  add constraint "driver_app_type_id_fkey"
  foreign key ("app_type_id")
  references "valid_types"."app_type"
  ("id") on update restrict on delete restrict;

alter table "delivery"."driver"
  add constraint "driver_delivery_company_type_fkey"
  foreign key ("delivery_company_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "delivery"."order"
  add constraint "order_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "laundry"."store"
  add constraint "store_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "public"."mez_admin" alter column "app_type_id" set default 'mezAdmin';

alter table "public"."mez_admin"
  add constraint "mez_admin_app_type_id_fkey"
  foreign key ("app_type_id")
  references "valid_types"."app_type"
  ("id") on update restrict on delete restrict;

alter table "public"."mez_admin_chat"
  add constraint "mez_admin_chat_app_type_fkey"
  foreign key ("app_type")
  references "valid_types"."app_type"
  ("id") on update restrict on delete restrict;

alter table "public"."service_provider_customer_chat"
  add constraint "service_provider_customer_chat_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "public"."translation"
  add constraint "translation_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."restaurant"
  add constraint "restaurant_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."delivery_partner"
  add constraint "delivery_partner_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."details"
  add constraint "details_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."post"
  add constraint "post_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."subscriber"
  add constraint "subscriber_service_provider_type_fkey"
  foreign key ("service_provider_type")
  references "valid_types"."service_provider_type"
  ("id") on update restrict on delete restrict;
