
alter table "business"."home_rental" drop constraint "home_rental_rental_id_fkey",
  add constraint "home_rental_rental_id_fkey"
  foreign key ("rental_id")
  references "business"."rental"
  ("id") on update restrict on delete restrict;
