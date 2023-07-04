alter table "business"."item_details" alter column "tags" set default jsonb_build_array();
alter table "business"."item_details" alter column "tags" set not null;
