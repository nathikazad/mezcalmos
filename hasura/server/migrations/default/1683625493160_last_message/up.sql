
alter table "service_provider"."details" alter column "language" set default '"{\"primary\": \"es\",\"secondary\": \"en\"}"'::jsonb;

alter table "public"."chat" add column "last_message" jsonb
 null;
