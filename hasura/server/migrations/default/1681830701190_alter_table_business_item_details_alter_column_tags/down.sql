alter table "business"."item_details" alter column "tags" drop not null;
ALTER TABLE "business"."item_details" ALTER COLUMN "tags" drop default;
