
CREATE TABLE "service_provider"."post_comment" ("id" serial NOT NULL, "message" text NOT NULL, "likes" jsonb NOT NULL DEFAULT jsonb_build_array(), "post_id" integer NOT NULL, "commented_on" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("post_id") REFERENCES "service_provider"."post"("id") ON UPDATE restrict ON DELETE restrict);

alter table "service_provider"."post" drop column "comments" cascade;

alter table "service_provider"."post_comment" add column "user_id" integer
 not null;

alter table "service_provider"."post_comment"
  add constraint "post_comment_user_id_fkey"
  foreign key ("user_id")
  references "public"."user"
  ("id") on update restrict on delete restrict;
