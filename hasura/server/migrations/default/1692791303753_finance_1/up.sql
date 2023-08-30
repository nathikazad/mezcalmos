
CREATE TABLE "finance"."job" ("id" serial NOT NULL, "name_id" integer NOT NULL, "description_id" Integer, "job_type" text NOT NULL, "minimum_experience" float8 NOT NULL, "salary_from" money NOT NULL, "salary_to" money NOT NULL, "availability" boolean NOT NULL DEFAULT true, "business_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("name_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("description_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("business_id") REFERENCES "business"."business"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "finance"."job_applicant" ("id" serial NOT NULL, "customer_id" integer NOT NULL, "job_id" integer NOT NULL, "resume_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("customer_id") REFERENCES "customer"."customer"("user_id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("job_id") REFERENCES "finance"."job"("id") ON UPDATE restrict ON DELETE restrict);

CREATE TABLE "customer"."resume" ("id" serial NOT NULL, "customer_id" integer NOT NULL, "resume" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("customer_id") REFERENCES "customer"."customer"("user_id") ON UPDATE restrict ON DELETE restrict);

alter table "finance"."job_applicant"
  add constraint "job_applicant_resume_id_fkey"
  foreign key ("resume_id")
  references "customer"."resume"
  ("id") on update restrict on delete restrict;

alter table "finance"."job_applicant" drop constraint "job_applicant_resume_id_fkey";

alter table "finance"."job_applicant" drop column "resume_id" cascade;

DROP table "customer"."resume";

alter table "customer"."customer" add column "resume" text
 null;

alter table "finance"."job_applicant" add column "status" text
 not null default 'pending';

CREATE TABLE "finance"."investment_opportunity" ("id" serial NOT NULL, "name_id" integer NOT NULL, "description_id" integer NOT NULL, "business_id" integer NOT NULL, "investment_goal" money NOT NULL, "funding_stage" text NOT NULL, "availability" boolean NOT NULL DEFAULT true, PRIMARY KEY ("id") , FOREIGN KEY ("name_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("description_id") REFERENCES "public"."translation"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("business_id") REFERENCES "business"."business"("id") ON UPDATE restrict ON DELETE restrict);
