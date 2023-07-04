CREATE
OR REPLACE VIEW "delivery"."order_public" AS
SELECT
  "order".id AS restaurant_id,
  "order".review_id,
  "order".order_time,
  "order".estimated_food_ready_time,
  "order".actual_food_ready_time,
  "order".customer_id,
  "order".status
FROM
  restaurant."order";
