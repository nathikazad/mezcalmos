CREATE OR REPLACE VIEW delivery.open_delivery_messages AS
SELECT *
FROM delivery_messages dm1
WHERE responded_time IS NULL AND NOT EXISTS (
  SELECT 1 FROM delivery_messages dm2
  WHERE dm2.phone_number = dm1.phone_number
        AND dm2.driver_id IS NOT NULL
        AND dm2.finished_time IS NULL
);
-- DROP VIEW delivery.open_delivery_messages;
