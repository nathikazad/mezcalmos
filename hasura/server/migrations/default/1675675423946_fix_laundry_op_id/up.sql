
alter table "laundry"."operator" alter column "id" set default nextval('laundry.type_id_seq'::regclass);

CREATE SEQUENCE laundry.op_seq
  MINVALUE 1
  
  START WITH 1
  INCREMENT BY 1;

alter table "laundry"."operator" alter column "id" set default nextval('laundry.op_seq'::regclass);
