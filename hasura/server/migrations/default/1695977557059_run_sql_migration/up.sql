DROP VIEW IF EXISTS delivery.minimal_order;
CREATE VIEW delivery.minimal_order AS
SELECT 
  o.id,
  'order' AS delivery_order_type,
  o.customer_id as user_id,
  o.service_provider_id,
  o.delivery_driver_id as driver_id,
  NULL AS phone_number,
  o.order_time AS time,
  CASE 
    WHEN o.status = 'orderReceived' THEN 'open'
    WHEN public.delivery_in_process(o) THEN 'inProcess'
    ELSE 'finished'
  END AS status
FROM delivery.order o

UNION ALL

SELECT
  m.id,
  'message' AS delivery_order_type,
  (SELECT id FROM public.user u WHERE u.phone = m.phone_number LIMIT 1) AS user_id,
  NULL AS service_provider_id,
  m.driver_id,
  m.phone_number,
  m.received_time AS time,
  CASE
    WHEN (
        SELECT COUNT(*)
        FROM delivery_messages dm2
        WHERE dm2.phone_number = m.phone_number AND dm2.finished_time IS NULL
    ) = 0 THEN 'finished'
    WHEN (
        SELECT COUNT(*)
        FROM delivery_messages dm2
        WHERE dm2.phone_number = m.phone_number AND dm2.finished_time IS NULL
    ) = (
        SELECT COUNT(*)
        FROM delivery_messages dm2
        WHERE dm2.phone_number = m.phone_number AND dm2.finished_time IS NULL AND dm2.driver_id IS NULL
    ) THEN 'open'
    ELSE 'inProcess'
  END AS status
FROM (
  SELECT DISTINCT ON (phone_number) * FROM delivery_messages
  ORDER BY phone_number, driver_id, received_time DESC
) m;
