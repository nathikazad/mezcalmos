alter table "service_provider"."influencer" add constraint "influencer_user_id_key" unique (user_id);
alter table "service_provider"."influencer" alter column "user_id" drop not null;
alter table "service_provider"."influencer" add column "user_id" text;
