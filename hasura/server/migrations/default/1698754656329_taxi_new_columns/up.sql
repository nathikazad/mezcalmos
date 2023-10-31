
alter table "taxi"."order" add column "ride_cost" money
 not null;

alter table "taxi"."order" add column "carType" text
 not null;

alter table "taxi"."order" rename column "carType" to "car_type";

alter table "taxi"."order" add column "order_time" text
 not null;

alter table "taxi"."order" add column "trip_polyline" text
 not null;

alter table "taxi"."order" add column "trip_duration" numeric
 not null;

alter table "taxi"."order" add column "trip_distance" numeric
 not null;
