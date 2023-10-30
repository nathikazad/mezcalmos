
create schema "taxi";

CREATE TABLE "taxi"."order" ("id" serial NOT NULL, "driver_id" integer NOT NULL, "customer_id" integer NOT NULL, "status" text NOT NULL, "pickup_gps" geography NOT NULL, "pickup_address" text NOT NULL, "dropoff_gps" geography NOT NULL, "dropoff_address" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("id"));

CREATE TABLE taxi.driver AS SELECT * FROM delivery.driver;
