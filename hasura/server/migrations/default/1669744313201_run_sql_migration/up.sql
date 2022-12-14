CREATE FUNCTION driver_notification_token(deliverer_row deliverer) 
    RETURNS varchar
    LANGUAGE sql
    STABLE
AS $$
    SELECT token
    FROM notification_info n
    WHERE n.user_id = deliverer_row.user_id
    AND n.app_type_id = 'delivery';
$$;