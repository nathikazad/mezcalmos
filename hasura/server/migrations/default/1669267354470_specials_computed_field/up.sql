CREATE FUNCTION special_items(restaurant_row restaurant)
    RETURNS SETOF restaurant_item
    LANGUAGE sql
    STABLE
AS $$
    SELECT *
    FROM restaurant_item r
    WHERE r.restaurant_id = restaurant_row.id AND r.item_type = 'special';
$$;
