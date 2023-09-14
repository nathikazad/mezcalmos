CREATE OR REPLACE FUNCTION get_unresolved_messages()
RETURNS SETOF delivery_messages AS $$
BEGIN
  RETURN QUERY
  SELECT a.*
  FROM delivery_messages a
  WHERE 
    a.resolved_time IS NULL 
    AND 
    (
      NOT EXISTS (
        SELECT 1
        FROM delivery_messages b
        WHERE 
          b.phone_number = a.phone_number 
          AND b.resolved_time IS NOT NULL
      )
      OR
      EXISTS (
        SELECT 1
        FROM delivery_messages c
        WHERE 
          c.phone_number = a.phone_number 
          AND c.resolved_time IS NOT NULL 
          AND a.received_time > c.resolved_time + INTERVAL '10 minutes'
        ORDER BY c.resolved_time DESC
        LIMIT 1
      )
    );
END;
$$ LANGUAGE plpgsql;