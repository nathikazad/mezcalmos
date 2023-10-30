
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE TABLE taxi.driver AS SELECT * FROM delivery.driver;

DROP TABLE "taxi"."order";

drop schema "taxi" cascade;
