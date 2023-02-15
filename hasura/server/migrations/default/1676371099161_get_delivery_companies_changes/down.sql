
alter table "service_provider"."details" alter column "language" set default '{"en": true, "es": true}'::jsonb;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION delivery.get_delivery_companies(location geography)
--  RETURNS SETOF delivery.company
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM delivery.company c
--     WHERE ST_Distance(
--     (
--         SELECT gps
--         FROM service_provider.location l
--         WHERE l.id = (SELECT location_id FROM service_provider.details d WHERE d.id = c.details_id)
--     ), location) <=
--     (
--         SELECT radius
--         FROM delivery.details d
--         WHERE d.id = c.delivery_details_id
--     )
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION delivery.get_delivery_companies(location geography)
--  RETURNS SETOF delivery.company
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM delivery.company c
--     WHERE ST_Distance(
--     (
--         SELECT gps
--         FROM service_provider.location l
--         WHERE l.id = (SELECT location_id FROM service_provider.details d WHERE d.id = c.details_id)
--     ), location) <=
--     (
--         SELECT radius
--         FROM delivery.details d
--         WHERE d.id = c.delivery_details_id
--     )
-- $function$;
