
CREATE OR REPLACE VIEW "delivery"."minimal_order" AS 
 SELECT o.id,
    'order'::text AS delivery_order_type,
    o.customer_id AS user_id,
    o.service_provider_id,
    o.delivery_driver_id AS driver_id,
    NULL::text AS phone_number,
    o.order_time AS "time",
        CASE
            WHEN o.delivery_driver_id IS NULL THEN 'open'::text
            WHEN delivery_in_process(o.*) THEN 'inProcess'::text
            ELSE 'finished'::text
        END AS status
   FROM delivery."order" o
UNION ALL
 SELECT m.id,
    'message'::text AS delivery_order_type,
    ( SELECT u.id
           FROM "user" u
          WHERE (u.phone = m.phone_number)
         LIMIT 1) AS user_id,
    NULL::integer AS service_provider_id,
    m.driver_id,
    m.phone_number,
    m.received_time AS "time",
        CASE
            WHEN (( SELECT count(*) AS count
               FROM delivery_messages dm2
              WHERE ((dm2.phone_number = m.phone_number) AND (dm2.responded_time IS NULL) AND (dm2.finished_time IS NULL))) > 0) THEN 'open'::text
            WHEN (( SELECT count(*) AS count
               FROM delivery_messages dm2
              WHERE ((dm2.phone_number = m.phone_number) AND (dm2.responded_time IS NOT NULL) AND (dm2.finished_time IS NULL))) > 0) THEN 'inProcess'::text
            ELSE 'finished'::text
        END AS status
   FROM ( SELECT DISTINCT ON (delivery_messages.phone_number) delivery_messages.id,
            delivery_messages.entry,
            delivery_messages.phone_number,
            delivery_messages.driver_id,
            delivery_messages.received_time,
            delivery_messages.finished_time,
            delivery_messages.responded_time,
            delivery_messages.user_id
           FROM delivery_messages
          ORDER BY delivery_messages.phone_number, delivery_messages.received_time DESC) m;

CREATE OR REPLACE VIEW "delivery"."minimal_order" AS 
 SELECT o.id,
    'order'::text AS delivery_order_type,
    o.customer_id AS user_id,
    o.service_provider_id,
    o.delivery_driver_id AS driver_id,
    NULL::text AS phone_number,
    o.order_time AS "time",
        CASE
            WHEN o.delivery_driver_id IS NULL AND NOT delivery_in_process(o.*) THEN 'open'::text
            WHEN delivery_in_process(o.*) THEN 'inProcess'::text
            ELSE 'finished'::text
        END AS status
   FROM delivery."order" o
UNION ALL
 SELECT m.id,
    'message'::text AS delivery_order_type,
    ( SELECT u.id
           FROM "user" u
          WHERE (u.phone = m.phone_number)
         LIMIT 1) AS user_id,
    NULL::integer AS service_provider_id,
    m.driver_id,
    m.phone_number,
    m.received_time AS "time",
        CASE
            WHEN (( SELECT count(*) AS count
               FROM delivery_messages dm2
              WHERE ((dm2.phone_number = m.phone_number) AND (dm2.responded_time IS NULL) AND (dm2.finished_time IS NULL))) > 0) THEN 'open'::text
            WHEN (( SELECT count(*) AS count
               FROM delivery_messages dm2
              WHERE ((dm2.phone_number = m.phone_number) AND (dm2.responded_time IS NOT NULL) AND (dm2.finished_time IS NULL))) > 0) THEN 'inProcess'::text
            ELSE 'finished'::text
        END AS status
   FROM ( SELECT DISTINCT ON (delivery_messages.phone_number) delivery_messages.id,
            delivery_messages.entry,
            delivery_messages.phone_number,
            delivery_messages.driver_id,
            delivery_messages.received_time,
            delivery_messages.finished_time,
            delivery_messages.responded_time,
            delivery_messages.user_id
           FROM delivery_messages
          ORDER BY delivery_messages.phone_number, delivery_messages.received_time DESC) m;

CREATE OR REPLACE VIEW "delivery"."minimal_order" AS 
 SELECT o.id,
    'order'::text AS delivery_order_type,
    o.customer_id AS user_id,
    o.service_provider_id,
    o.delivery_driver_id AS driver_id,
    NULL::text AS phone_number,
    o.order_time AS "time",
        CASE
            WHEN o.delivery_driver_id IS NULL AND (o.status = 'orderReceived'::text) THEN 'open'::text
            WHEN delivery_in_process(o.*) THEN 'inProcess'::text
            ELSE 'finished'::text
        END AS status
   FROM delivery."order" o
UNION ALL
 SELECT m.id,
    'message'::text AS delivery_order_type,
    ( SELECT u.id
           FROM "user" u
          WHERE (u.phone = m.phone_number)
         LIMIT 1) AS user_id,
    NULL::integer AS service_provider_id,
    m.driver_id,
    m.phone_number,
    m.received_time AS "time",
        CASE
            WHEN (( SELECT count(*) AS count
               FROM delivery_messages dm2
              WHERE ((dm2.phone_number = m.phone_number) AND (dm2.responded_time IS NULL) AND (dm2.finished_time IS NULL))) > 0) THEN 'open'::text
            WHEN (( SELECT count(*) AS count
               FROM delivery_messages dm2
              WHERE ((dm2.phone_number = m.phone_number) AND (dm2.responded_time IS NOT NULL) AND (dm2.finished_time IS NULL))) > 0) THEN 'inProcess'::text
            ELSE 'finished'::text
        END AS status
   FROM ( SELECT DISTINCT ON (delivery_messages.phone_number) delivery_messages.id,
            delivery_messages.entry,
            delivery_messages.phone_number,
            delivery_messages.driver_id,
            delivery_messages.received_time,
            delivery_messages.finished_time,
            delivery_messages.responded_time,
            delivery_messages.user_id
           FROM delivery_messages
          ORDER BY delivery_messages.phone_number, delivery_messages.received_time DESC) m;
