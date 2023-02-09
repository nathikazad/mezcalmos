
alter table "laundry"."operator" alter column "id" set default nextval('laundry.type_id_seq'::regclass);

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE SEQUENCE laundry.op_seq
--   MINVALUE 1
--
--   START WITH 1
--   INCREMENT BY 1;

ALTER TABLE "laundry"."operator" ALTER COLUMN "id" drop default;
