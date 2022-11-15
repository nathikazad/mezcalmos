
alter table "public"."delivery" drop column "trip_distance" cascade;

alter table "public"."delivery" drop column "trip_duration" cascade;

alter table "public"."delivery" add column "trip_distance" integer
 null;

alter table "public"."delivery" add column "trip_duration" integer
 null;

comment on column "public"."delivery"."trip_duration" is E'in seconds';

comment on column "public"."delivery"."trip_distance" is E'in meters';
