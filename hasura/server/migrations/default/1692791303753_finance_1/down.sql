
DROP TABLE "finance"."investment_opportunity";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "finance"."job_applicant" add column "status" text
--  not null default 'pending';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."customer" add column "resume" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP table "customer"."resume";

alter table "finance"."job_applicant" alter column "resume_id" drop not null;
alter table "finance"."job_applicant" add column "resume_id" int4;

alter table "finance"."job_applicant"
  add constraint "job_applicant_resume_id_fkey"
  foreign key ("resume_id")
  references "customer"."resume"
  ("id") on update restrict on delete restrict;

alter table "finance"."job_applicant" drop constraint "job_applicant_resume_id_fkey";

DROP TABLE "customer"."resume";

DROP TABLE "finance"."job_applicant";

DROP TABLE "finance"."job";
