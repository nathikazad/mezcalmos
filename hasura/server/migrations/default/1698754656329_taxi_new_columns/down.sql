
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "taxi"."order" add column "trip_distance" numeric
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "taxi"."order" add column "trip_duration" numeric
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "taxi"."order" add column "trip_polyline" text
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "taxi"."order" add column "order_time" text
--  not null;

alter table "taxi"."order" rename column "car_type" to "carType";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "taxi"."order" add column "carType" text
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "taxi"."order" add column "ride_cost" money
--  not null;
