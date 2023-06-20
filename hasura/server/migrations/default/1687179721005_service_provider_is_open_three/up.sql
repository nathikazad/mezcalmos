
CREATE OR REPLACE FUNCTION service_provider.is_open(details service_provider.details)
RETURNS boolean
LANGUAGE plpgsql
IMMUTABLE
AS $function$
DECLARE
    day_name TEXT;
    open_hours JSONB;
    from_time TIME;
    to_time TIME;
    num_hours INT;
    is_open BOOLEAN := FALSE;
    tz TEXT;
    cur_time TIME;
BEGIN
    -- Get the current day's name
    tz := details.time_zone;
    
    CASE extract(isodow from now() AT TIME ZONE tz)
        WHEN 1 THEN day_name := 'monday';
        WHEN 2 THEN day_name := 'tuesday';
        WHEN 3 THEN day_name := 'wednesday';
        WHEN 4 THEN day_name := 'thursday';
        WHEN 5 THEN day_name := 'friday';
        WHEN 6 THEN day_name := 'saturday';
        WHEN 7 THEN day_name := 'sunday';
    END CASE;
    -- Get the open hours for the day from the details parameter
    open_hours := details.schedule->day_name->'openHours';
    
    -- Check if open_hours is not null and is an array, and isOpen is true
    IF open_hours IS NOT NULL AND jsonb_typeof(open_hours) = 'array' AND details.schedule->day_name->'isOpen' = 'true' THEN
        num_hours := jsonb_array_length(open_hours);

        -- If there are no open periods, return false
        IF num_hours = 0 THEN
            RETURN FALSE;
        END IF;

        -- Get the time zone from the details.time_zone column
        

        -- Get the current time in the specified time zone
        cur_time := now()::TIME AT TIME ZONE tz;

        -- Check if the open status is not 'open', return false
        IF details.open_status != 'open' THEN
            RETURN FALSE;
        END IF;

        
        -- Check each open period for the day
        FOR i IN 0..num_hours - 1 LOOP
            from_time := (open_hours->i->>'from')::TIME;
            to_time := (open_hours->i->>'to')::TIME;

            -- If the cur_time is within the open hours, set is_open to true and exit the loop
            IF from_time <= to_time THEN
                IF cur_time >= from_time AND cur_time <= to_time THEN
                    is_open := TRUE;
                    EXIT;
                END IF;
            ELSE
                IF cur_time >= from_time OR cur_time <= to_time THEN
                    is_open := TRUE;
                    EXIT;
                END IF;
            END IF;
        END LOOP;
    END IF;

    -- Return the value of is_open
    RETURN is_open;
END;
$function$;