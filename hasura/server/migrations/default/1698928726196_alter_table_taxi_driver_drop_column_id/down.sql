alter table "taxi"."driver" alter column "id" drop not null;
alter table "taxi"."driver" add column "id" int4;
