alter table "service_provider"."post_comment" drop constraint "post_comment_post_id_fkey",
  add constraint "post_comment_post_id_fkey"
  foreign key ("post_id")
  references "service_provider"."post"
  ("id") on update restrict on delete cascade;
