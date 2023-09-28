

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "advertise_only" boolean
--  not null default 'false';

alter table "service_provider"."details" drop constraint "details_unique_id_key";
alter table "service_provider"."details" alter column "unique_id" drop not null;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."home" add column "offering_type" text
--  not null default 'home';


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."home" add column "bathrooms" integer
--  not null default '1';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."home" add column "bedrooms" integer
--  not null default '1';

alter table "business"."home" drop constraint "home_location_id_fkey";

alter table "business"."home" drop constraint "home_business_id_fkey";

alter table "business"."home" drop constraint "home_details_id_fkey",
  add constraint "home_details_id_fkey"
  foreign key ("details_id")
  references "business"."item_details"
  ("id") on update cascade on delete cascade;

alter table "business"."home" drop constraint "home_details_id_fkey",
  add constraint "home_details_id_fkey"
  foreign key ("details_id")
  references "business"."item_details"
  ("id") on update restrict on delete restrict;

alter table "business"."home" drop constraint "home_details_id_fkey";

DROP TABLE "business"."home_location";

DROP TABLE "business"."home";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP table "business"."home";

alter table "business"."home" drop constraint "home_pkey";
alter table "business"."home"
    add constraint "home_rental_pkey"
    primary key ("business_id");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."home" add column "id" serial
--  not null;

alter table "business"."home" add constraint "home_rental_rental_id_key" unique (id);
alter table "business"."home" alter column "id" drop not null;
alter table "business"."home" add column "id" int4;

alter table "business"."home" drop constraint "home_pkey";
alter table "business"."home"
    add constraint "home_rental_pkey"
    primary key ("id");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."home" add column "business_id" integer
--  not null;

alter table "business"."home" rename to "home_rental";

CREATE OR REPLACE FUNCTION business.get_home_rentals(location geography)
 RETURNS SETOF business.home_rental
 LANGUAGE sql
 STABLE
AS $function$
    SELECT 
        *
    FROM 
        business.home_rental h
    ORDER BY 
        (SELECT referral_points 
            FROM service_provider.details s 
            WHERE s.id = (
                SELECT details_id
                FROM business.business b
                WHERE b.id = (
                    SELECT business_id
                    FROM business.rental r
                    WHERE r.id = h.rental_id
                )
            )
        ) DESC,
        ST_Distance(location, gps_location);
$function$;

alter table "business"."home_rental" rename column "id" to "rental_id";

alter table "business"."home_rental"
  add constraint "home_rental_rental_id_fkey"
  foreign key ("rental_id")
  references "business"."rental"
  ("id") on update restrict on delete cascade;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "time_zone" text
--  null default 'America/Mexico_City';

alter table "service_provider"."details" alter column "timezone" set default ''America/Mexico_City'::text';
alter table "service_provider"."details" alter column "timezone" drop not null;
alter table "service_provider"."details" add column "timezone" text;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION service_provider.is_open(details service_provider.details)
--  RETURNS boolean
--  LANGUAGE plpgsql
--  IMMUTABLE
-- AS $function$
-- DECLARE
--     day_name TEXT;
--     open_hours JSONB;
--     from_time TIME;
--     to_time TIME;
--     num_hours INT;
--     is_open BOOLEAN := FALSE;
--     tz TEXT;
-- BEGIN
--     -- Get the day of the week from the current time
--     CASE extract(isodow from now())
--         WHEN 1 THEN day_name := 'monday';
--         WHEN 2 THEN day_name := 'tuesday';
--         WHEN 3 THEN day_name := 'wednesday';
--         WHEN 4 THEN day_name := 'thursday';
--         WHEN 5 THEN day_name := 'friday';
--         WHEN 6 THEN day_name := 'saturday';
--         WHEN 7 THEN day_name := 'sunday';
--     END CASE;
--
--     -- Get the open hours for the day from the details parameter
--     open_hours := details.schedule->day_name->'openHours';
--
--     -- Check if open_hours is not null and is an array
--     IF open_hours IS NOT NULL AND jsonb_typeof(open_hours) = 'array' THEN
--         num_hours := jsonb_array_length(open_hours);
--
--         -- If there are no open periods, return false
--         IF num_hours = 0 THEN
--             RETURN FALSE;
--         END IF;
--         IF details.open_status != 'open' THEN
--             RETURN FALSE;
--         END IF;
--
--         -- Get the time zone from the details.time_zone column
--         tz := details.time_zone;
--
--         -- Check each open period for the day
--         FOR i IN 0..num_hours - 1 LOOP
--             from_time := (open_hours->i->>'from')::TIME;
--             to_time := (open_hours->i->>'to')::TIME;
--             -- return now()::TIME AT TIME ZONE tz  || ' || ' || from_time || ' || ' || to_time || ' || ' || tz || ' || ' || (open_hours->i->>'from');
--             -- If the current_time is within the open hours, set is_open to true and exit the loop
--             IF from_time <= to_time THEN
--                 IF extract(hour from  now()::TIME AT TIME ZONE tz) >= extract(hour from from_time) AND
--                   extract(hour from  now()::TIME AT TIME ZONE tz) <= extract(hour from to_time) THEN
--                     is_open := TRUE;
--                     EXIT;
--                 END IF;
--             ELSE
--                 IF extract(hour from  now()::TIME AT TIME ZONE tz) >= extract(hour from from_time) OR
--                   extract(hour from  now()::TIME AT TIME ZONE tz) <= extract(hour from to_time) THEN
--                     is_open := TRUE;
--                     EXIT;
--                 END IF;
--             END IF;
--         END LOOP;
--     END IF;
--
--     -- Return the value of is_open
--     RETURN is_open;
-- END;
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "timezone" text
--  null default 'America/Mexico_City';


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION service_provider.is_open(details service_provider.details)
--  RETURNS boolean
--  LANGUAGE plpgsql
--  IMMUTABLE
-- AS $function$
-- DECLARE
--     day_name TEXT;
--     open_hours JSONB;
--     from_time TIME;
--     to_time TIME;
--     num_hours INT;
--     is_open BOOLEAN := FALSE;
--     tz TEXT;
-- BEGIN
--     -- Get the day of the week from the current time
--     CASE extract(isodow from now())
--         WHEN 1 THEN day_name := 'monday';
--         WHEN 2 THEN day_name := 'tuesday';
--         WHEN 3 THEN day_name := 'wednesday';
--         WHEN 4 THEN day_name := 'thursday';
--         WHEN 5 THEN day_name := 'friday';
--         WHEN 6 THEN day_name := 'saturday';
--         WHEN 7 THEN day_name := 'sunday';
--     END CASE;
--
--     -- Get the open hours for the day from the details parameter
--     open_hours := details.schedule->day_name->'openHours';
--
--     -- Check if open_hours is not null and is an array
--     IF open_hours IS NOT NULL AND jsonb_typeof(open_hours) = 'array' THEN
--         num_hours := jsonb_array_length(open_hours);
--
--         -- If there are no open periods, return false
--         IF num_hours = 0 THEN
--             RETURN FALSE;
--         END IF;
--         IF details.open_status != 'open' THEN
--             RETURN FALSE;
--         END IF;
--
--         -- Get the time zone from the details.time_zone column
--         tz := details.time_zone;
--
--         -- Check each open period for the day
--         FOR i IN 0..num_hours - 1 LOOP
--             from_time := (open_hours->i->>'from')::TIME;
--             to_time := (open_hours->i->>'to')::TIME;
--             -- return now()::TIME AT TIME ZONE tz  || ' || ' || from_time || ' || ' || to_time || ' || ' || tz || ' || ' || (open_hours->i->>'from');
--             -- If the current_time is within the open hours, set is_open to true and exit the loop
--             IF from_time <= to_time THEN
--                 IF extract(hour from  now()::TIME AT TIME ZONE tz) >= extract(hour from from_time) AND
--                   extract(hour from  now()::TIME AT TIME ZONE tz) <= extract(hour from to_time) THEN
--                     is_open := TRUE;
--                     EXIT;
--                 END IF;
--             ELSE
--                 IF extract(hour from  now()::TIME AT TIME ZONE tz) >= extract(hour from from_time) OR
--                   extract(hour from  now()::TIME AT TIME ZONE tz) <= extract(hour from to_time) THEN
--                     is_open := TRUE;
--                     EXIT;
--                 END IF;
--             END IF;
--         END LOOP;
--     END IF;
--
--     -- Return the value of is_open
--     RETURN is_open;
-- END;
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "timezone" text
--  null default 'America/Mexico_City';


ALTER TABLE "service_provider"."details" ALTER COLUMN "last_active_time" drop default;

alter table "service_provider"."details" alter column "last_active_time" set default now();

alter table "service_provider"."details" alter column "last_active_time" drop not null;
ALTER TABLE "service_provider"."details" ALTER COLUMN "last_active_time" TYPE timestamp without time zone;


alter table "service_provider"."referral" drop constraint "referral_customer_id_fkey";

alter table "service_provider"."referral"
  add constraint "referral_customer_id_fkey"
  foreign key ("customer_id")
  references "customer"."customer"
  ("user_id") on update restrict on delete restrict;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION business.get_home_rentals(location geography)
-- RETURNS SETOF business.home_rental
-- LANGUAGE sql
-- STABLE
-- AS $$
--     SELECT
--         *
--     FROM
--         business.home_rental h
--     ORDER BY
--         (SELECT referral_points
--             FROM service_provider.details s
--             WHERE s.id = (
--                 SELECT details_id
--                 FROM business.business b
--                 WHERE b.id = (
--                     SELECT business_id
--                     FROM business.rental r
--                     WHERE r.id = h.rental_id
--                 )
--             )
--         ) DESC,
--         ST_Distance(location, gps_location);
-- $$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION business.get_home_rentals(location geography)
-- RETURNS SETOF business.home_rental
-- LANGUAGE sql
-- STABLE
-- AS $$
--     SELECT
--         *
--     FROM
--         business.home_rental h
--     ORDER BY
--         (SELECT referral_points
--             FROM service_provider.details s
--             WHERE s.id = (
--                 SELECT details_id
--                 FROM business.business b
--                 WHERE b.id = (
--                     SELECT business_id
--                     FROM business.rental r
--                     WHERE r.id = h.rental_id
--                 )
--             )
--         ) DESC,
--         ST_Distance(location, gps_location);
-- $$;


alter table "business"."service" drop constraint "service_business_id_fkey",
  add constraint "service_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "business"."product" drop constraint "product_business_id_fkey",
  add constraint "product_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "business"."order_request_item" drop constraint "order_request_item_order_request_id_fkey",
  add constraint "order_request_item_order_request_id_fkey"
  foreign key ("order_request_id")
  references "business"."order_request"
  ("id") on update restrict on delete restrict;

alter table "business"."order_request" drop constraint "order_request_business_id_fkey",
  add constraint "order_request_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "business"."operator" drop constraint "operator_business_id_fkey",
  add constraint "operator_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "business"."item_details" drop constraint "item_details_business_id_fkey",
  add constraint "item_details_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "business"."event" drop constraint "event_business_id_fkey",
  add constraint "event_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "business"."cart" drop constraint "cart_business_id_fkey",
  add constraint "cart_business_id_fkey"
  foreign key ("business_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;

alter table "delivery"."operator" drop constraint "operator_delivery_company_id_fkey",
  add constraint "delivery_operator_delivery_company_id_fkey"
  foreign key ("delivery_company_id")
  references "delivery"."company"
  ("id") on update restrict on delete restrict;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "last_active_time" timestamp
--  null;

alter table "business"."cart" alter column "business_id" set not null;


alter table "business"."order_request" alter column "final_cost" drop not null;
alter table "business"."order_request" add column "final_cost" money;

alter table "business"."order_request" alter column "estimated_cost" drop not null;
alter table "business"."order_request" add column "estimated_cost" money;

alter table "business"."order_request" alter column "commence_time" drop not null;
alter table "business"."order_request" add column "commence_time" timestamptz;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION business.ordercommencetime(order_row business.order_request)
--  RETURNS timestamp
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT MIN(time)
--     FROM business.order_request_item
--     WHERE order_request_id = order_row.id;
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION business.ordercommencetime(order_row business.order_request)
--  RETURNS timestamp
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT MIN(time)
--     FROM business.order_request_item
--     WHERE order_request_id = order_row.id;
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION business.ordercost(order_row business.order_request)
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT SUM(cost)
--     FROM business.order_request_item
--     WHERE order_request_id = order_row.id;
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION business.cartcost(cart_row business.cart)
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT SUM(cost)
--     FROM business.cart_item
--     WHERE customer_id = cart_row.customer_id;
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request_item" add column "cost" money
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request_item" add column "time" timestamptz
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."cart_item" add column "cost" money
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."cart_item" add column "time" Timestamp
--  null;

alter table "business"."order_request_item" rename column "item_id" to "item_details_id";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request_item" add column "offering_type" text
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."cart_item" add column "offering_type" text
--  not null;

alter table "business"."cart_item" rename column "item_id" to "item_details_id";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."service" add column "offering_type" text
--  not null default 'service';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."product" add column "offering_type" text
--  not null default 'product';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "offering_type" text
--  not null default 'event';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."rental" add column "offering_type" text
--  not null default 'rental';


alter table "business"."order_request_item" rename column "item_details_id" to "item_id";

alter table "business"."cart_item" rename column "item_details_id" to "business_item_id";

alter table "business"."order_request_item" alter column "item_type" drop not null;
alter table "business"."order_request_item" add column "item_type" text;

alter table "business"."cart_item" add constraint "cart_item_customer_id_service_id_service_type_key" unique (item_type, customer_id, business_item_id);
alter table "business"."cart_item" alter column "item_type" drop not null;
alter table "business"."cart_item" add column "item_type" text;

alter table "business"."order_request_item" alter column "commence_time" drop not null;
alter table "business"."order_request_item" add column "commence_time" timestamptz;

alter table "business"."order_request_item" rename column "parameters" to "cost";

alter table "business"."order_request_item" rename column "item_type" to "service_type";

alter table "business"."order_request_item" rename column "item_id" to "service_id";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request" add column "commence_time" timestamptz
--  null;

alter table "business"."cart_item" rename column "parameters" to "cost";

alter table "business"."cart_item" rename column "item_type" to "service_type";

alter table "business"."cart_item" rename column "business_item_id" to "service_id";


alter table "public"."mez_admin_chat" drop constraint "mez_admin_chat_recipient_id_recipient_type_key";

alter table "public"."mez_admin_chat"
  add constraint "mez_admin_chat_app_type_fkey"
  foreign key ("recipient_type")
  references "valid_types"."app_type"
  ("id") on update restrict on delete restrict;

comment on column "public"."mez_admin_chat"."recipient_type" is NULL;

alter table "public"."mez_admin_chat" rename column "recipient_type" to "app_type";

alter table "public"."mez_admin_chat" rename column "recipient_id" to "user_id";

alter table "service_provider"."details" alter column "open_status" set default 'closed_indefinitely'::text;


alter table "business"."home_rental" drop constraint "home_rental_rental_id_fkey",
  add constraint "home_rental_rental_id_fkey"
  foreign key ("rental_id")
  references "business"."rental"
  ("id") on update restrict on delete restrict;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."chat" add column "last_message" jsonb
--  null;

alter table "service_provider"."details" alter column "language" set default '"{\"en\":true,\"es\":true}"'::jsonb;


alter table "business"."item_details" drop constraint "item_details_business_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."item_details" add column "business_id" integer
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."service" add column "schedule" jsonb
--  null;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "ends_at" timestamp with time zone
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "starts_at" timestamp with time zone
--  null;

alter table "business"."event" alter column "starts_at" drop not null;
alter table "business"."event" add column "starts_at" time;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "starts_at" time
--  null;

alter table "business"."event" alter column "time" drop not null;
alter table "business"."event" add column "time" timestamptz;

alter table "restaurant"."cart_item" add constraint "cart_item_customer_id_restaurant_item_id_key" unique ("customer_id", "restaurant_item_id");


alter table "service_provider"."details" alter column "currency" set default 'Peso'::text;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "currency" text
--  not null default 'Peso';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."data_consumption" add column "number_of_events" integer
--  not null default '1';

DROP TABLE "public"."data_consumption";

alter table "service_provider"."referral"
  add constraint "referral_business_id_fkey"
  foreign key ("service_provider_id")
  references "business"."business"
  ("id") on update restrict on delete restrict;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "referral_points" integer
--  not null default '0';

alter table "business"."business" alter column "referral_points" set default 0;
alter table "business"."business" alter column "referral_points" drop not null;
alter table "business"."business" add column "referral_points" int4;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."referral" add column "service_provider_type" text
--  not null;

alter table "service_provider"."referral" rename column "service_provider_id" to "business_id";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE referral SET SCHEMA service_provider;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE business.referral SET SCHEMA public;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."home_rental" add column "address" text
--  not null;


alter table "public"."chat" alter column "last_message_sent" drop not null;
ALTER TABLE "public"."chat" ALTER COLUMN "last_message_sent" drop default;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "address" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."chat" add column "last_message_sent" timestamptz
--  null;

alter table "business"."item_details" alter column "tags" drop not null;
ALTER TABLE "business"."item_details" ALTER COLUMN "tags" drop default;


DROP TABLE "business"."product";

alter table "business"."rental" rename column "details_id" to "service_id";

alter table "business"."event" rename column "details_id" to "service_id";

DROP TABLE "business"."service";

alter table "business"."home_rental" rename column "home_type" to "homeType";

alter table "business"."item_details" rename to "service";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."service" add column "tags" jsonb
--  null;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."rental" add column "category3" text
--  not null default 'uncategorized';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP table "business"."class";

alter table "business"."service" alter column "category2" drop not null;
ALTER TABLE "business"."service" ALTER COLUMN "category2" drop default;

comment on column "business"."business"."profile" is NULL;
alter table "business"."business" alter column "profile" set default 'surfShop, vehicleRental, homeRental, wellnessClass, party, volunteer, tourAgency, therapy'::text;

ALTER TABLE "business"."business" ALTER COLUMN "profile" drop default;

alter table "business"."business" rename column "referral_points" to "points";


alter table "public"."service_provider_customer_chat" drop constraint "service_provider_customer_chat_customer_id_fkey";

alter table "public"."service_provider_customer_chat" drop constraint "service_provider_customer_chat_chat_id_fkey";


alter table "business"."home_rental" alter column "id" set default nextval('business.home_rental_id_seq'::regclass);
alter table "business"."home_rental" alter column "id" drop not null;
alter table "business"."home_rental" add column "id" int4;

alter table "business"."home_rental" drop constraint "home_rental_pkey";
alter table "business"."home_rental"
    add constraint "home_rental_pkey"
    primary key ("id");


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."service" add column "category2" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."class" add column "time" timestamptz
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "time" timestamptz
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."business" add column "points" integer
--  not null default '0';

alter table "business"."referral" drop constraint "referral_customer_id_fkey";

alter table "business"."referral" drop constraint "referral_business_id_fkey";

DROP TABLE "business"."referral";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."class" add column "gps_location" geography
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "gps_location" geography
--  null;

DROP TABLE "business"."home_rental";


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.toImage(review_row public.review)
--  RETURNS varchar
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT
--         CASE
--             WHEN review_row.to_entity_type = 'customer'
--             THEN (SELECT image FROM public.user u WHERE u.id = review_row.to_entity_id)
--             WHEN review_row.to_entity_type = 'driver'
--             THEN (SELECT image FROM public.user u WHERE u.id = (
--                 SELECT user_id FROM delivery.driver d WHERE d.id = review_row.to_entity_id
--             ))
--             WHEN review_row.to_entity_type = 'restaurant'
--             THEN (SELECT image FROM service_provider.details s WHERE s.id = (
--                 SELECT details_id FROM restaurant.restaurant r WHERE r.id =  review_row.to_entity_id
--             ))
--             WHEN review_row.to_entity_type = 'laundry'
--             THEN (SELECT image FROM service_provider.details s WHERE s.id = (
--                 SELECT details_id FROM laundry.store l WHERE l.id =  review_row.to_entity_id
--             ))
--         END
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.toName(review_row public.review)
--  RETURNS varchar
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT
--         CASE
--             WHEN review_row.to_entity_type = 'customer'
--             THEN (SELECT name FROM public.user u WHERE u.id = review_row.to_entity_id)
--             WHEN review_row.to_entity_type = 'driver'
--             THEN (SELECT name FROM public.user u WHERE u.id = (
--                 SELECT user_id FROM delivery.driver d WHERE d.id = review_row.to_entity_id
--             ))
--             WHEN review_row.to_entity_type = 'restaurant'
--             THEN (SELECT name FROM service_provider.details s WHERE s.id = (
--                 SELECT details_id FROM restaurant.restaurant r WHERE r.id =  review_row.to_entity_id
--             ))
--             WHEN review_row.to_entity_type = 'laundry'
--             THEN (SELECT name FROM service_provider.details s WHERE s.id = (
--                 SELECT details_id FROM laundry.store l WHERE l.id =  review_row.to_entity_id
--             ))
--         END
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.fromImage(review_row public.review)
--  RETURNS varchar
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT
--         CASE
--             WHEN review_row.from_entity_type = 'customer'
--             THEN (SELECT image FROM public.user u WHERE u.id = review_row.from_entity_id)
--             WHEN review_row.from_entity_type = 'driver'
--             THEN (SELECT image FROM public.user u WHERE u.id = (
--                 SELECT user_id FROM delivery.driver d WHERE d.id = review_row.from_entity_id
--             ))
--             WHEN review_row.from_entity_type = 'restaurant'
--             THEN (SELECT image FROM service_provider.details s WHERE s.id = (
--                 SELECT details_id FROM restaurant.restaurant r WHERE r.id =  review_row.from_entity_id
--             ))
--             WHEN review_row.from_entity_type = 'laundry'
--             THEN (SELECT image FROM service_provider.details s WHERE s.id = (
--                 SELECT details_id FROM laundry.store l WHERE l.id =  review_row.from_entity_id
--             ))
--         END
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.fromName(review_row public.review)
--  RETURNS varchar
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT
--         CASE
--             WHEN review_row.from_entity_type = 'customer'
--             THEN (SELECT name FROM public.user u WHERE u.id = review_row.from_entity_id)
--             WHEN review_row.from_entity_type = 'driver'
--             THEN (SELECT name FROM public.user u WHERE u.id = (
--                 SELECT user_id FROM delivery.driver d WHERE d.id = review_row.from_entity_id
--             ))
--             WHEN review_row.from_entity_type = 'restaurant'
--             THEN (SELECT name FROM service_provider.details s WHERE s.id = (
--                 SELECT details_id FROM restaurant.restaurant r WHERE r.id =  review_row.from_entity_id
--             ))
--             WHEN review_row.from_entity_type = 'laundry'
--             THEN (SELECT name FROM service_provider.details s WHERE s.id = (
--                 SELECT details_id FROM laundry.store l WHERE l.id =  review_row.from_entity_id
--             ))
--         END
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.fromName(review_row public.review)
--  RETURNS varchar
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT
--         CASE
--             WHEN review_row.from_entity_type = 'customer'
--             THEN (SELECT name FROM public.user u WHERE u.id = review_row.from_entity_id)
--             -- WHEN review_row.from_entity_type = 'driver'
--             -- THEN (SELECT name FROM user u WHERE u.id = (
--             --     SELECT user_id FROM delivery.driver d WHERE d.id = review_row.from_entity_id
--             -- ))
--             -- WHEN review_row.from_entity_type = 'restaurant'
--             -- THEN (SELECT name FROM service_provider.details s WHERE s.id = (
--             --     SELECT details_id FROM restaurant.restaurant r WHERE r.id =  review_row.from_entity_id
--             -- ))
--             -- WHEN review_row.from_entity_type = 'laundry'
--             -- THEN (SELECT name FROM service_provider.details s WHERE s.id = (
--             --     SELECT details_id FROM laundry.laundry l WHERE l.id =  review_row.from_entity_id
--             -- ))
--         END
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION delivery.packagecost(delivery_row delivery."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT
--         CASE
--             WHEN delivery_row.order_type = 'restaurant'
--             THEN public.itemscost((SELECT r.*::restaurant."order" FROM restaurant."order" r WHERE r.delivery_id = delivery_row.id))
--
--             WHEN delivery_row.order_type = 'laundry'
--             THEN laundry.itemscost((SELECT l.*::laundry."order" FROM laundry."order" l WHERE (l.from_customer_delivery_id = delivery_row.id OR l.to_customer_delivery_id = delivery_row.id)))
--
--             WHEN delivery_row.order_type = 'courier'
--             THEN delivery.actualitemscost((SELECT c.*::delivery."courier_order" FROM delivery."courier_order" c WHERE c.delivery_order_id = delivery_row.id))
--
--         END
--
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION delivery.deliverytotalcost(delivery_row delivery."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT COALESCE(delivery.packagecost(delivery_row), 0::money) + (SELECT COALESCE(delivery.tax(delivery_row), 0::money)) + (SELECT delivery_cost FROM delivery."order" o WHERE o.id = delivery_row.id)
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION delivery.tax(delivery_row delivery."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT
--         CASE
--             WHEN delivery_row.order_type = 'restaurant'
--             THEN (SELECT r.tax FROM restaurant."order" r WHERE r.delivery_id = delivery_row.id)
--             WHEN delivery_row.order_type = 'laundry'
--             THEN  (SELECT l.tax FROM laundry."order" l WHERE (l.from_customer_delivery_id = delivery_row.id OR l.to_customer_delivery_id = delivery_row.id))
--             WHEN delivery_row.order_type = 'courier'
--             THEN  (SELECT c.tax FROM delivery."courier_order" c WHERE c.delivery_order_id = delivery_row.id)
--         END
--
-- $function$;


alter table "business"."service" drop constraint "service_description_id_fkey";

alter table "business"."service" drop constraint "service_name_id_fkey";


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request" add column "final_cost" money
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request" add column "estimated_cost" money
--  not null;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request_item" add column "cost" jsonb
--  not null;


alter table "business"."order_request_item" alter column "final_cost_per_one" drop not null;
alter table "business"."order_request_item" add column "final_cost_per_one" money;

alter table "business"."order_request_item" alter column "quantity" set default 1;
alter table "business"."order_request_item" alter column "quantity" drop not null;
alter table "business"."order_request_item" add column "quantity" int4;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request_item" add column "commence_time" timestamptz
--  null;

alter table "business"."order_request" alter column "commence_time" drop not null;
alter table "business"."order_request" add column "commence_time" timestamptz;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."cart_item" add column "cost" jsonb
--  not null;

alter table "business"."cart_item" alter column "quantity" set default 1;
alter table "business"."cart_item" alter column "quantity" drop not null;
alter table "business"."cart_item" add column "quantity" int4;

alter table "business"."cart_item" alter column "cost_per_one" drop not null;
alter table "business"."cart_item" add column "cost_per_one" money;


alter table "business"."class" drop constraint "class_service_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."class" add column "service_id" integer
--  not null unique;

alter table "business"."event" drop constraint "event_service_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "service_id" integer
--  not null unique;

alter table "business"."rental" drop constraint "rental_service_id_fkey";

alter table "business"."rental" drop constraint "rental_service_id_key";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."rental" add column "service_id" integer
--  not null;

alter table "business"."rental" alter column "additional_parameters" drop not null;
alter table "business"."rental" add column "additional_parameters" jsonb;

alter table "business"."rental" alter column "cost" drop not null;
alter table "business"."rental" add column "cost" jsonb;

alter table "business"."rental" alter column "image" drop not null;
alter table "business"."rental" add column "image" jsonb;

alter table "business"."rental" alter column "category1" set default ''uncategorized'::text';
alter table "business"."rental" alter column "category1" drop not null;
alter table "business"."rental" add column "category1" text;

alter table "business"."rental" alter column "available" set default true;
alter table "business"."rental" alter column "available" drop not null;
alter table "business"."rental" add column "available" bool;

alter table "business"."rental" alter column "position" set default 1;
alter table "business"."rental" alter column "position" drop not null;
alter table "business"."rental" add column "position" int4;

alter table "business"."rental"
  add constraint "rental_description_id_fkey"
  foreign key (description_id)
  references "public"."translation"
  (id) on update restrict on delete restrict;
alter table "business"."rental" alter column "description_id" drop not null;
alter table "business"."rental" add column "description_id" int4;

alter table "business"."rental"
  add constraint "rental_name_id_fkey"
  foreign key (name_id)
  references "public"."translation"
  (id) on update restrict on delete restrict;
alter table "business"."rental" alter column "name_id" drop not null;
alter table "business"."rental" add column "name_id" int4;

alter table "business"."event" alter column "additional_parameters" drop not null;
alter table "business"."event" add column "additional_parameters" jsonb;

alter table "business"."event" alter column "cost" drop not null;
alter table "business"."event" add column "cost" jsonb;

alter table "business"."event" alter column "category1" set default ''uncategorized'::text';
alter table "business"."event" alter column "category1" drop not null;
alter table "business"."event" add column "category1" text;

alter table "business"."event" alter column "image" drop not null;
alter table "business"."event" add column "image" jsonb;

alter table "business"."event" alter column "available" set default true;
alter table "business"."event" alter column "available" drop not null;
alter table "business"."event" add column "available" bool;

alter table "business"."event" alter column "position" set default 1;
alter table "business"."event" alter column "position" drop not null;
alter table "business"."event" add column "position" int4;

alter table "business"."event"
  add constraint "event_description_id_fkey"
  foreign key (description_id)
  references "public"."translation"
  (id) on update restrict on delete restrict;
alter table "business"."event" alter column "description_id" drop not null;
alter table "business"."event" add column "description_id" int4;

alter table "business"."event"
  add constraint "event_name_id_fkey"
  foreign key (name_id)
  references "public"."translation"
  (id) on update restrict on delete restrict;
alter table "business"."event" alter column "name_id" drop not null;
alter table "business"."event" add column "name_id" int4;

alter table "business"."class" alter column "additional_parameters" drop not null;
alter table "business"."class" add column "additional_parameters" jsonb;

alter table "business"."class" alter column "cost" drop not null;
alter table "business"."class" add column "cost" jsonb;

alter table "business"."class" alter column "category1" set default ''uncategorized'::text';
alter table "business"."class" alter column "category1" drop not null;
alter table "business"."class" add column "category1" text;

alter table "business"."class" alter column "image" drop not null;
alter table "business"."class" add column "image" jsonb;

alter table "business"."class" alter column "available" set default true;
alter table "business"."class" alter column "available" drop not null;
alter table "business"."class" add column "available" bool;

alter table "business"."class" alter column "position" set default 1;
alter table "business"."class" alter column "position" drop not null;
alter table "business"."class" add column "position" int4;

alter table "business"."class"
  add constraint "class_description_id_fkey"
  foreign key (description_id)
  references "public"."translation"
  (id) on update restrict on delete restrict;
alter table "business"."class" alter column "description_id" drop not null;
alter table "business"."class" add column "description_id" int4;

alter table "business"."class"
  add constraint "class_name_id_fkey"
  foreign key (name_id)
  references "public"."translation"
  (id) on update restrict on delete restrict;
alter table "business"."class" alter column "name_id" drop not null;
alter table "business"."class" add column "name_id" int4;

alter table "business"."service"
  add constraint "service_business_id_fkey"
  foreign key (business_id)
  references "business"."business"
  (id) on update restrict on delete restrict;
alter table "business"."service" alter column "business_id" drop not null;
alter table "business"."service" add column "business_id" int4;

alter table "business"."service" drop constraint "service_business_id_fkey";

DROP TABLE "business"."service";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION delivery.packagecost(delivery_row delivery."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT
--         CASE
--             WHEN delivery_row.order_type = 'restaurant'
--             THEN public.itemscost((SELECT r.*::restaurant."order" FROM restaurant."order" r WHERE r.delivery_id = delivery_row.id))
--                 + (SELECT r.tax FROM restaurant."order" r WHERE r.delivery_id = delivery_row.id)
--             WHEN delivery_row.order_type = 'laundry'
--             THEN laundry.itemscost((SELECT l.*::laundry."order" FROM laundry."order" l WHERE (l.from_customer_delivery_id = delivery_row.id OR l.to_customer_delivery_id = delivery_row.id)))
--                 + (SELECT l.tax FROM laundry."order" l WHERE (l.from_customer_delivery_id = delivery_row.id OR l.to_customer_delivery_id = delivery_row.id))
--             WHEN delivery_row.order_type = 'courier'
--             THEN delivery.actualitemscost((SELECT c.*::delivery."courier_order" FROM delivery."courier_order" c WHERE c.delivery_order_id = delivery_row.id))
--                 + (SELECT c.tax FROM delivery."courier_order" c WHERE c.delivery_order_id = delivery_row.id)
--         END
--
-- $function$;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request" add column "commence_time" timestamptz
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."class" add column "additional_parameters" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."class" add column "cost" jsonb
--  not null;

alter table "business"."class" alter column "cost" drop not null;
alter table "business"."class" add column "cost" money;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "additional_parameters" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "cost" jsonb
--  not null;

alter table "business"."event" alter column "cost" drop not null;
alter table "business"."event" add column "cost" money;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."rental" add column "additional_parameters" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."rental" add column "cost" jsonb
--  not null;

alter table "business"."rental" alter column "cost" drop not null;
alter table "business"."rental" add column "cost" money;

alter table "business"."rental" rename column "category1" to "category";

alter table "business"."class" rename column "category1" to "category";

alter table "business"."event" rename column "category1" to "category";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "category" text
--  null default 'uncategorized';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."event" add column "image" jsonb
--  null;

alter table "business"."event" alter column "image" drop not null;
alter table "business"."event" add column "image" text;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."class" add column "category" text
--  not null default 'uncategorized';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."class" add column "image" jsonb
--  null;

alter table "business"."class" alter column "image" drop not null;
alter table "business"."class" add column "image" text;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."rental" add column "image" jsonb
--  null;

alter table "business"."rental" alter column "image" drop not null;
alter table "business"."rental" add column "image" text;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."rental" add column "category" text
--  not null default 'uncategorized';


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION customer.minimal_orders(cus_id integer)
--  RETURNS SETOF customer.minimal_order
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     WITH
--     ro AS (
--         SELECT
--             id,
--             'restaurant' AS order_type,
--             status,
--             public.in_process(r) as in_process,
--             order_time,
--             COALESCE(public.totalcost(r), '0'::money) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             payment_type,
--             to_location_address as to_address,
--             delivery_cost,
--             customer_id,
--             estimated_food_ready_time as estimated_ready_time,
--             (SELECT estimated_arrival_at_dropoff_time
--                 FROM delivery.order o
--                 WHERE o.id = r.delivery_id
--             ) as estimated_delivery_time,
--             (SELECT SUM(quantity)
--                 FROM restaurant.order_item i
--                 WHERE i.restaurant_order_id = r.id
--             ) as number_of_items,
--             0 as items_weight
--         FROM restaurant.order r
--         WHERE r.customer_id = cus_id),
--     lo AS (
--         SELECT
--             id,
--             'laundry' AS order_type,
--             status,
--             laundry.order_in_process(l) as in_process,
--             order_time,
--             COALESCE(laundry.totalcost(l), '0'::money) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             payment_type,
--             customer_address as to_address,
--             delivery_cost,
--             customer_id,
--             estimated_ready_time,
--             (SELECT estimated_arrival_at_dropoff_time
--                 FROM delivery.order o
--                 WHERE o.id = l.to_customer_delivery_id
--             ) as estimated_delivery_time,
--             0 as number_of_items,
--             (SELECT SUM(weight_in_kilo)
--                 FROM laundry.order_category c
--                 WHERE c.order_id = l.id
--             ) as items_weight
--         FROM  laundry.order l
--         WHERE l.customer_id = cus_id),
--     co AS (
--         SELECT
--             c.id,
--             'courier' AS order_type,
--             d.status,
--             public.delivery_in_process(d) as in_process,
--             c.order_time,
--             COALESCE(delivery.totalcost(c), '0'::money) as total_cost,
--             (SELECT name
--                 FROM service_provider.details s
--                 WHERE s.id = (SELECT details_id FROM delivery.company WHERE id = d.service_provider_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details s
--                 WHERE s.id = (SELECT details_id FROM delivery.company WHERE id = d.service_provider_id)
--             ),
--             c.payment_type,
--             c.to_location_address as to_address,
--             d.delivery_cost,
--             c.customer_id,
--             d.estimated_arrival_at_dropoff_time as estimated_ready_time,
--             d.estimated_arrival_at_dropoff_time as estimated_delivery_time,
--             (SELECT COUNT(id)
--                 FROM delivery.courier_order_item i
--                 WHERE i.order_id = c.id
--             ) as number_of_items,
--             0 as items_weight
--         FROM  delivery.courier_order c
--         INNER JOIN delivery.order d
--         ON c.delivery_order_id = d.id
--         WHERE c.customer_id = cus_id)
--     SELECT * from ro UNION select * from lo UNION select * from co
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."minimal_order" add column "items_weight" float8
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."minimal_order" add column "number_of_items" integer
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."minimal_order" add column "estimated_delivery_time" timestamptz
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."minimal_order" add column "estimated_ready_time" timestamptz
--  null;


alter table "laundry"."order" alter column "payment_type" set default 'Cash'::text;

alter table "restaurant"."order" alter column "payment_type" set default 'Cash'::text;


alter table "delivery"."order" alter column "payment_type" set default 'Cash'::text;


alter table "delivery"."courier_order" alter column "payment_type" set default 'Cash'::text;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION delivery.deliverytotalcost(delivery_row delivery."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT COALESCE(delivery.packagecost(delivery_row), 0::money) + (SELECT delivery_cost FROM delivery."order" o WHERE o.id = delivery_row.id)
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION delivery.deliverytotalcost(delivery_row delivery."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT delivery.packagecost(delivery_row) + (SELECT delivery_cost FROM delivery."order" o WHERE o.id = delivery_row.id)
--
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION delivery.packagecost(delivery_row delivery."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT
--         CASE
--             WHEN delivery_row.order_type = 'restaurant'
--             THEN public.itemscost((SELECT r.*::restaurant."order" FROM restaurant."order" r WHERE r.delivery_id = delivery_row.id))
--             WHEN delivery_row.order_type = 'laundry'
--             THEN laundry.itemscost((SELECT l.*::laundry."order" FROM laundry."order" l WHERE (l.from_customer_delivery_id = delivery_row.id OR l.to_customer_delivery_id = delivery_row.id)))
--             WHEN delivery_row.order_type = 'courier'
--             THEN delivery.actualitemscost((SELECT c.*::delivery."courier_order" FROM delivery."courier_order" c WHERE c.delivery_order_id = delivery_row.id))
--         END
--
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION delivery.totalcost(order_row delivery.courier_order)
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT delivery.actualitemsCost(order_row) - order_row.refund_amount + order_row.stripe_fees + order_row.tax - order_row.discount_value + (
--         SELECT delivery_cost
--         FROM delivery."order" o
--         WHERE o.id = order_row.delivery_order_id
--     )
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION delivery.packagecost(delivery_row delivery."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT
--         CASE
--             WHEN delivery_row.order_type = 'restaurant'
--             THEN public.itemscost((SELECT r.*::restaurant."order" FROM restaurant."order" r WHERE r.delivery_id = delivery_row.id))
--             WHEN delivery_row.order_type = 'laundry'
--             THEN laundry.itemscost((SELECT l.*::laundry."order" FROM laundry."order" l WHERE (l.from_customer_delivery_id = delivery_row.id OR l.to_customer_delivery_id = delivery_row.id)))
--             -- WHEN delivery_row.order_type = 'courier'
--             -- ELSE delivery.itemscost(c) FROM delivery.courier_order c WHERE c.delivery_id = delivery_row.id
--         END
--
-- $function$;

alter table "delivery"."details" alter column "customer_pickup" set default 'true';

alter table "laundry"."operator" drop constraint "operator_details_id_fkey",
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete restrict;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."order" add column "lock_time" Timestamp
--  null;

alter table "delivery"."order" alter column "lock_timestamp" drop not null;
alter table "delivery"."order" add column "lock_timestamp" int4;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."order" add column "lock_timestamp" integer
--  null;

alter table "delivery"."order" alter column "lock_time" drop not null;
alter table "delivery"."order" add column "lock_time" timestamptz;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."order" add column "lock_time" timestamptz
--  null;


comment on column "delivery"."order"."change_price_request" is NULL;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."order" add column "change_price_request" jsonb
--  null;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "unique_id" text
--  null;

alter table "service_provider"."details" alter column "unique_id" drop not null;
alter table "service_provider"."details" add column "unique_id" text;


alter table "service_provider"."details" alter column "unique_id" drop not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "unique_id" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "bill_image" text
--  null;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION customer.minimal_orders(cus_id integer)
--  RETURNS SETOF customer.minimal_order
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     WITH
--     ro AS (
--         SELECT
--             id,
--             'restaurant' AS order_type,
--             status,
--             public.in_process(r) as in_process,
--             order_time,
--             COALESCE(public.totalcost(r), '0'::money) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             payment_type,
--             to_location_address as to_address,
--             delivery_cost,
--             customer_id
--         FROM restaurant.order r
--         WHERE r.customer_id = cus_id),
--     lo AS (
--         SELECT
--             id,
--             'laundry' AS order_type,
--             status,
--             laundry.order_in_process(l) as in_process,
--             order_time,
--             COALESCE(laundry.totalcost(l), '0'::money) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             payment_type,
--             customer_address as to_address,
--             delivery_cost,
--             customer_id
--         FROM  laundry.order l
--         WHERE l.customer_id = cus_id),
--     co AS (
--         SELECT
--             c.id,
--             'courier' AS order_type,
--             d.status,
--             public.delivery_in_process(d) as in_process,
--             c.order_time,
--             COALESCE(delivery.totalcost(c), '0'::money) as total_cost,
--             (SELECT name
--                 FROM service_provider.details s
--                 WHERE s.id = (SELECT details_id FROM delivery.company WHERE id = d.service_provider_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details s
--                 WHERE s.id = (SELECT details_id FROM delivery.company WHERE id = d.service_provider_id)
--             ),
--             c.payment_type,
--             c.to_location_address as to_address,
--             d.delivery_cost,
--             c.customer_id
--         FROM  delivery.courier_order c
--         INNER JOIN delivery.order d
--         ON c.delivery_order_id = d.id
--         WHERE c.customer_id = cus_id)
--     SELECT * from ro UNION select * from lo UNION select * from co
-- $function$;

alter table "delivery"."courier_order" rename column "to_location_address" to "to_location_adress";

alter table "delivery"."courier_order" alter column "refund_amount" drop not null;
ALTER TABLE "delivery"."courier_order" ALTER COLUMN "refund_amount" drop default;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION delivery.totalcost(order_row delivery."courier_order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT delivery.actualitemsCost(order_row) - order_row.refund_amount + order_row.stripe_fees - order_row.discount_value + (
--         SELECT delivery_cost
--         FROM delivery."order" o
--         WHERE o.id = order_row.delivery_order_id
--     )
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION delivery.actualitemscost(order_row delivery."courier_order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $$
--     SELECT SUM(COALESCE(actual_cost, 0::money))
--     FROM delivery.courier_order_item i
--     WHERE i.order_id = order_row.id
-- $$;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION business.finalOrderCost(order_request_row business.order_request)
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $$
--     SELECT SUM(quantity * final_cost_per_one)
--     FROM business.order_request_item i
--     WHERE i.order_request_id = order_request_row.id;
-- $$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION business.estOrderCost(order_request_row business.order_request)
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $$
--     SELECT SUM(quantity * business.estcostperone(i))
--     FROM business.order_request_item i
--     WHERE i.order_request_id = order_request_row.id;
-- $$;

alter table "business"."order_request" alter column "review_id" set not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION business.cartCost(cart_row business.cart)
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $$
--     SELECT SUM(quantity * cost_per_one)
--     FROM business.cart_item
--     WHERE customer_id = cart_row.customer_id;
-- $$;

DROP TABLE "business"."cart_item";

DROP TABLE "business"."cart";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION business.estCostPerOne(order_request_item_row business."order_request_item")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT
--         CASE
--             WHEN order_request_item_row.service_type = 'rental'
--             THEN (SELECT cost FROM business.rental WHERE id = order_request_item_row.service_id)
--             WHEN order_request_item_row.service_type = 'class'
--             THEN (SELECT cost FROM business.class WHERE id = order_request_item_row.service_id)
--             WHEN order_request_item_row.service_type = 'event'
--             THEN (SELECT cost FROM business.event WHERE id = order_request_item_row.service_id)
--         END
-- $function$;

alter table "business"."order_request_item" drop constraint "order_request_item_order_request_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."order_request_item" add column "order_request_id" integer
--  not null;


alter table "service_provider"."delivery_partner" drop constraint "delivery_partner_service_provider_id_service_provider_type_key";

alter table "delivery"."details" alter column "cost_per_km_from_base" drop not null;
alter table "delivery"."details" alter column "cost_per_km_from_base" set default '$0.00'::money;


comment on column "business"."event"."schedule_type" is NULL;

comment on column "business"."class"."schedule_type" is NULL;

alter table "business"."business" drop constraint "business_service_provider_type_fkey";

DROP TABLE "business"."operator";

DROP TABLE "business"."order_request_item";

DROP TABLE "business"."event";

DROP TABLE "business"."class";

DROP TABLE "business"."rental";

alter table "business"."business" alter column "service_type" drop not null;
alter table "business"."business" add column "service_type" text;

DROP TABLE "business"."order_request";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "business"."business" add column "service_provider_type" text
--  not null default 'business';

DROP TABLE "business"."business";

drop schema "business" cascade;

alter table "public"."chat" alter column "messages" drop not null;
ALTER TABLE "public"."chat" ALTER COLUMN "messages" drop default;


alter table "service_provider"."operator_details" alter column "current_gps" drop not null;
alter table "service_provider"."operator_details" add column "current_gps" geography;

alter table "laundry"."operator" alter column "delivery_driver_type" set default ''laundry_operator'::text';
alter table "laundry"."operator" alter column "delivery_driver_type" drop not null;
alter table "laundry"."operator" add column "delivery_driver_type" text;

alter table "restaurant"."operator" alter column "delivery_driver_type" set default ''restaurant_operator'::text';
alter table "restaurant"."operator" alter column "delivery_driver_type" drop not null;
alter table "restaurant"."operator" add column "delivery_driver_type" text;

alter table "delivery"."operator" alter column "delivery_driver_type" set default ''delivery_operator'::text';
alter table "delivery"."operator" alter column "delivery_driver_type" drop not null;
alter table "delivery"."operator" add column "delivery_driver_type" text;

alter table "delivery"."driver" alter column "delivery_driver_type" set default ''delivery_driver'::text';
alter table "delivery"."driver" alter column "delivery_driver_type" drop not null;
alter table "delivery"."driver" add column "delivery_driver_type" text;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION customer.minimal_orders(cus_id integer)
--  RETURNS SETOF customer.minimal_order
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     WITH
--     ro AS (
--         SELECT
--             id,
--             'restaurant' AS order_type,
--             status,
--             public.in_process(r) as in_process,
--             order_time,
--             COALESCE(public.totalcost(r), '0'::money) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             payment_type,
--             to_location_address as to_address,
--             delivery_cost,
--             customer_id
--         FROM restaurant.order r
--         WHERE r.customer_id = cus_id),
--     lo AS (
--         SELECT
--             id,
--             'laundry' AS order_type,
--             status,
--             laundry.order_in_process(l) as in_process,
--             order_time,
--             COALESCE(laundry.totalcost(l), '0'::money) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             payment_type,
--             customer_address as to_address,
--             delivery_cost,
--             customer_id
--         FROM  laundry.order l
--         WHERE l.customer_id = cus_id)
--     SELECT * from ro UNION select * from lo
-- $function$;

alter table "service_provider"."operator_details" drop constraint "operator_details_user_id_app_type_id_key";
alter table "service_provider"."operator_details" add constraint "operator_details_user_id_key" unique ("user_id");


alter table "service_provider"."subscriber" drop constraint "subscriber_service_provider_type_fkey";

alter table "service_provider"."post" drop constraint "post_service_provider_type_fkey";

alter table "service_provider"."details" drop constraint "details_service_provider_type_fkey";

alter table "service_provider"."delivery_partner" drop constraint "delivery_partner_service_provider_type_fkey";

alter table "restaurant"."restaurant" drop constraint "restaurant_service_provider_type_fkey";

alter table "public"."translation" drop constraint "translation_service_provider_type_fkey";

alter table "public"."service_provider_customer_chat" drop constraint "service_provider_customer_chat_service_provider_type_fkey";

alter table "public"."mez_admin_chat" drop constraint "mez_admin_chat_app_type_fkey";

alter table "public"."mez_admin" drop constraint "mez_admin_app_type_id_fkey";

alter table "public"."mez_admin" alter column "app_type_id" set default 'mez_admin'::text;

alter table "laundry"."store" drop constraint "store_service_provider_type_fkey";

alter table "delivery"."order" drop constraint "order_service_provider_type_fkey";

alter table "delivery"."driver" drop constraint "driver_delivery_company_type_fkey";

alter table "delivery"."driver" drop constraint "driver_app_type_id_fkey";

alter table "delivery"."company" drop constraint "company_service_provider_type_fkey";

alter table "customer"."customer" drop constraint "customer_app_type_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE service_provider_type SET SCHEMA valid_types;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE app_type SET SCHEMA valid_types;

drop schema "valid_types" cascade;

DROP TABLE "public"."service_provider_type";


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "cancellation_time" timestamptz
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "refund_amount" money
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "customer_app_type" text
--  not null default 'native';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "discount_value" money
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "stripe_fees" money
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "tax" money
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "payment_type" text
--  not null default 'Cash';

comment on column "delivery"."courier_order"."stripe_info" is NULL;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "stripe_info" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "order_time" timestamptz
--  not null default now();

alter table "delivery"."courier_order" drop constraint "courier_order_customer_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "customer_id" integer
--  not null;

alter table "delivery"."courier_order_item" drop constraint "courier_order_item_order_id_fkey";

alter table "delivery"."order" alter column "pickup_address" set not null;

alter table "delivery"."order" alter column "pickup_gps" set not null;

alter table "delivery"."courier_order" rename column "from_location_text" to "from_location_adress";

alter table "delivery"."courier_order_item" rename column "actual_cost" to "actual_cost_per_one";

alter table "delivery"."courier_order_item" rename column "estimated_cost" to "estimated_cost_per_one";

alter table "delivery"."courier_order_item" alter column "quantity" set default 1;
alter table "delivery"."courier_order_item" alter column "quantity" drop not null;
alter table "delivery"."courier_order_item" add column "quantity" int4;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order_item" add column "notes" text
--  null;

alter table "delivery"."courier_order" alter column "notes" drop not null;
alter table "delivery"."courier_order" add column "notes" text;


DROP TABLE "delivery"."courier_order_item";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."courier_order" add column "notes" text
--  null;

alter table "delivery"."courier_order" drop constraint "courier_order_delivery_order_id_fkey";

alter table "delivery"."courier_order" drop constraint "courier_order_delivery_order_id_key";

DROP TABLE "delivery"."courier_order";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION delivery.baselocation(details_row delivery.details)
--  RETURNS geography
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT gps
--     FROM service_provider.location l
--     INNER JOIN service_provider.details d
--     ON d.location_id = l.id
--     WHERE d.id =
--         CASE
--             WHEN d.service_provider_type = 'restaurant'
--             THEN (SELECT details_id FROM restaurant.restaurant r WHERE r.delivery_details_id = details_row.id)
--             WHEN d.service_provider_type = 'laundry'
--             THEN (SELECT details_id FROM laundry.store s WHERE s.delivery_details_id = details_row.id)
--             WHEN d.service_provider_type = 'deliveryCompany'
--             THEN (SELECT details_id FROM delivery.company c WHERE c.delivery_details_id = details_row.id)
--         END
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION delivery.baselocation(details_row delivery.details)
--  RETURNS geography
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT gps
--     FROM service_provider.location l
--     INNER JOIN service_provider.details d
--     ON d.location_id = l.id
--     WHERE d.id =
--         CASE
--             WHEN d.service_provider_type = 'restaurant'
--             THEN (SELECT details_id FROM restaurant.restaurant r WHERE r.delivery_details_id = details_row.id)
--             WHEN d.service_provider_type = 'laundry'
--             THEN (SELECT details_id FROM laundry.store s WHERE s.delivery_details_id = details_row.id)
--             ELSE
--                 (SELECT details_id FROM delivery.company c WHERE c.delivery_details_id = details_row.id)
--         END
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION delivery.baseLocation(details_row delivery.details)
--  RETURNS geography
--  LANGUAGE sql
--  STABLE
-- AS $$
--     SELECT gps
--     FROM service_provider.location l
--     INNER JOIN service_provider.details d
--     ON d.location_id = l.id
--     FULL JOIN restaurant.restaurant r ON r.delivery_details_id = details_row.id
--     FULL JOIN laundry.store s ON s.delivery_details_id = details_row.id
--     FULL JOIN delivery.company c ON c.delivery_details_id = details_row.id
-- $$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION delivery.deliveryCostFromBase(order_row delivery."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT (d.cost_per_km_from_base * order_row.distance_from_base + order_row.delivery_cost)
--     FROM delivery.details d
--     INNER JOIN delivery.company c
--     ON d.id = c.delivery_details_id
--     WHERE c.id = order_row.service_provider_id
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."details" add column "cost_per_km_from_base" money
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."order" add column "distance_from_base" integer
--  null;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION laundry.totalcost(order_row laundry."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT order_row.delivery_cost + laundry.itemsCost(order_row) - order_row.refund_amount + order_row.stripe_fees - order_row.discount_value
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION laundry.itemscost(order_row laundry."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT
--         CASE
--             WHEN (
--                 SELECT SUM(oc.weight_in_kilo * c.cost_by_kilo)
--                     FROM laundry.order_category oc
--                     INNER JOIN laundry.category c
--                     ON oc.category_id = c.id
--                     WHERE order_id = order_row.id
--             ) > (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id)
--             THEN (SELECT SUM(oc.weight_in_kilo * c.cost_by_kilo)
--                 FROM laundry.order_category oc
--                 INNER JOIN laundry.category c
--                 ON oc.category_id = c.id
--                 WHERE order_id = order_row.id)
--         ELSE (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id)
--         END
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION laundry.totalcost(order_row laundry."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     -- SELECT
--     --     CASE
--     --         WHEN (
--                 SELECT order_row.delivery_cost
--                     + laundry.itemsCost(order_row)
--                     - order_row.refund_amount
--                     + order_row.stripe_fees
--                     - order_row.discount_value
--         --     ) > (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id)
--         --     THEN (SELECT order_row.delivery_cost
--         --         + laundry.itemsCost(order_row)
--         --         - order_row.refund_amount
--         --         + order_row.stripe_fees
--         --         - order_row.discount_value)
--         -- ELSE (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id)
--         -- END
--
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION laundry.totalcost(order_row laundry."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT
--         CASE
--             WHEN (
--                 SELECT order_row.delivery_cost
--                     + laundry.itemsCost(order_row)
--                     - order_row.refund_amount
--                     + order_row.stripe_fees
--                     - order_row.discount_value
--             ) > (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id)
--             THEN (SELECT order_row.delivery_cost
--                 + laundry.itemsCost(order_row)
--                 - order_row.refund_amount
--                 + order_row.stripe_fees
--                 - order_row.discount_value)
--         ELSE (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id)
--         END
--
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "minimum_cost" money
--  not null default '0';

alter table "service_provider"."details" drop constraint "details_stripe_id_key";


alter table "service_provider"."details" alter column "accepted_payments" set default '"{\"cash\":true,\"card\":false,\"bankTransfer\":false}"'::jsonb;

alter table "service_provider"."details" alter column "accepted_payments" drop not null;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."stripe_info" add column "requirements" jsonb
--  null;

alter table "service_provider"."stripe_info" alter column "requirements" drop not null;
alter table "service_provider"."stripe_info" add column "requirements" text;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."order" add column "package_ready" boolean
--  not null default 'false';

alter table "service_provider"."delivery_partner"
  add constraint "delivery_partner_service_provider_id_fkey"
  foreign key ("service_provider_id")
  references "service_provider"."details"
  ("id") on update restrict on delete restrict;

alter table "customer"."stripe_cards" drop constraint "stripe_cards_card_id_key";


comment on column "delivery"."order"."direction" is E'to_customer, from_customer';
alter table "delivery"."order" alter column "direction" set default 'to_customer'::text;

comment on column "delivery"."order"."service_provider_type" is E'restaurant, delivery_company';


alter table "customer"."customer" alter column "stripe_info" drop not null;
alter table "customer"."customer" add column "stripe_info" jsonb;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."stripe_cards" add column "exp_month" integer
--  null;

alter table "customer"."stripe_cards" alter column "exp_month" drop not null;
alter table "customer"."stripe_cards" add column "exp_month" text;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."stripe_cards" add column "exp_year" integer
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."stripe_cards" add column "exp_month" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."stripe_cards" add column "brand" text
--  null;

alter table "customer"."stripe_cards" rename column "last_4" to "last4";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."stripe_cards" add column "last4" text
--  null;

comment on column "customer"."stripe_cards"."sp_card_ids" is NULL;

alter table "customer"."stripe_cards" drop constraint "stripe_cards_pkey";
alter table "customer"."stripe_cards"
    add constraint "stripe_cards_pkey"
    primary key ("card_id");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."stripe_cards" add column "id" serial
--  not null;

alter table "customer"."stripe_sp_id" drop constraint "stripe_sp_id_pkey";
alter table "customer"."stripe_sp_id"
    add constraint "stripe_info_pkey"
    primary key ("stripe_id");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."stripe_sp_id" add column "id" serial
--  not null;

alter table "customer"."stripe_sp_id" rename to "stripe_info";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."customer" add column "stripe_id" text
--  null;

alter table "delivery"."company" alter column "service_provider_type" set default 'delivery_company'::text;


alter table "service_provider"."stripe_info" alter column "sp_id" drop not null;
alter table "service_provider"."stripe_info" add column "sp_id" int4;

alter table "service_provider"."stripe_info"
  add constraint "stripe_info_sp_id_fkey"
  foreign key ("sp_id")
  references "service_provider"."details"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."details" drop constraint "details_stripe_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "stripe_id" integer
--  null;

alter table "service_provider"."stripe_info" drop constraint "stripe_info_pkey";

alter table "service_provider"."stripe_info"
    add constraint "stripe_info_pkey"
    primary key ("sp_id");

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."stripe_info" add column "id" serial
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP FUNCTION customer.minimal_orders;
-- CREATE OR REPLACE FUNCTION customer.minimal_orders(cus_id integer)
--  RETURNS SETOF customer.minimal_order
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     WITH
--     ro AS (
--         SELECT
--             id,
--             'restaurant' AS order_type,
--             status,
--             public.in_process(r) as in_process,
--             order_time,
--             public.totalcost(r) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             payment_type,
--             to_location_address as to_address,
--             delivery_cost,
--             customer_id
--         FROM restaurant.order r
--         WHERE r.customer_id = cus_id),
--     lo AS (
--         SELECT
--             id,
--             'laundry' AS order_type,
--             status,
--             laundry.order_in_process(l) as in_process,
--             order_time,
--             COALESCE(laundry.totalcost(l), '0'::money) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             payment_type,
--             customer_address as to_address,
--             delivery_cost,
--             customer_id
--         FROM  laundry.order l
--         WHERE l.customer_id = cus_id)
--     SELECT * from ro UNION select * from lo
-- $function$;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION customer.minimal_orders(customer_id integer)
--  RETURNS SETOF customer.minimal_order
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     WITH
--     ro AS (
--         SELECT
--             id,
--             'restaurant' AS order_type,
--             status,
--             public.in_process(r) as in_process,
--             order_time,
--             public.totalcost(r) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             payment_type,
--             to_location_address as to_address,
--             delivery_cost,
--             customer_id
--         FROM restaurant.order r
--         WHERE r.customer_id = customer_id),
--     lo AS (
--         SELECT
--             id,
--             'laundry' AS order_type,
--             status,
--             laundry.order_in_process(l) as in_process,
--             order_time,
--             COALESCE(laundry.totalcost(l), '0'::money) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             payment_type,
--             customer_address as to_address,
--             delivery_cost,
--             customer_id
--         FROM  laundry.order l
--         WHERE l.customer_id = customer_id)
--     SELECT * from ro UNION select * from lo
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION customer.minimal_orders(customer_id integer)
--  RETURNS SETOF customer.minimal_order
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     WITH
--     ro AS (
--         SELECT
--             id,
--             'restaurant' AS order_type,
--             status,
--             public.in_process(r) as in_process,
--             order_time,
--             public.totalcost(r) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             payment_type,
--             to_location_address as to_address,
--             delivery_cost,
--             customer_id
--         FROM restaurant.order r),
--     lo AS (
--         SELECT
--             id,
--             'laundry' AS order_type,
--             status,
--             laundry.order_in_process(l) as in_process,
--             order_time,
--             COALESCE(laundry.totalcost(l), '0'::money) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             payment_type,
--             customer_address as to_address,
--             delivery_cost,
--             customer_id
--         FROM  laundry.order l)
--     SELECT * from ro UNION select * from lo
-- $function$;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION customer.minimal_orders(customer_id integer)
--  RETURNS SETOF customer.minimal_order
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     WITH
--     ro AS (
--         SELECT
--             id,
--             'restaurant' AS order_type,
--             status,
--             public.in_process(r) as in_process,
--             order_time,
--             public.totalcost(r) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             payment_type,
--             to_location_address as to_address,
--             delivery_cost,
--             customer_id
--         FROM restaurant.order r),
--     lo AS (
--         SELECT
--             id,
--             'laundry' AS order_type,
--             status,
--             laundry.order_in_process(l) as in_process,
--             order_time,
--             COALESCE(laundry.totalcost(l), '0'::money) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             payment_type,
--             customer_address as to_address,
--             delivery_cost,
--             customer_id
--         FROM  laundry.order l)
--     SELECT * from ro UNION select * from lo
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."minimal_order" add column "customer_id" integer
--  not null;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION customer.minimal_orders(customer_id integer)
--  RETURNS SETOF customer.minimal_order
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     WITH
--     ro AS (
--         SELECT
--             id,
--             'restaurant' AS order_type,
--             status,
--             public.in_process(r) as in_process,
--             order_time,
--             public.totalcost(r) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             payment_type,
--             to_location_address as to_address,
--             delivery_cost
--         FROM restaurant.order r),
--     lo AS (
--         SELECT
--             id,
--             'laundry' AS order_type,
--             status,
--             laundry.order_in_process(l) as in_process,
--             order_time,
--             COALESCE(laundry.totalcost(l), '0'::money) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             payment_type,
--             customer_address as to_address,
--             delivery_cost
--         FROM  laundry.order l)
--     SELECT * from ro UNION select * from lo
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."minimal_order" add column "delivery_cost" money
--  not null default '0';

alter table "customer"."minimal_order" alter column "delivery_cost" drop not null;
alter table "customer"."minimal_order" add column "delivery_cost" money;

alter table "customer"."minimal_order" rename column "to_address" to "address";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."minimal_order" add column "address" text
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."minimal_order" add column "delivery_cost" money
--  null;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.laundry_delivery_details(laundry_row laundry.store)
--  RETURNS delivery.details
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM delivery.details d
--     WHERE d.id = (
-- 	    CASE
-- 		WHEN (SELECT self_delivery FROM delivery.details i WHERE laundry_row.delivery_details_id = i.id) = true
-- 		    THEN laundry_row.delivery_details_id
-- 		ELSE (
-- 			SELECT delivery_details_id
-- 			FROM delivery.company c
-- 			WHERE c.id = (
-- 			    SELECT delivery_company_id
-- 			    FROM service_provider.delivery_partner p
-- 			    WHERE p.service_provider_id = laundry_row.id AND p.service_provider_type = 'laundry'
-- 			)
-- 		)
-- 	    END
--     )
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.restaurant_delivery_details(restaurant_row restaurant.restaurant)
--  RETURNS delivery.details
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM delivery.details d
--     WHERE d.id = (
-- 	    CASE
-- 		WHEN (SELECT self_delivery FROM delivery.details i WHERE restaurant_row.delivery_details_id = i.id) = true
-- 		    THEN restaurant_row.delivery_details_id
-- 		ELSE (
-- 			SELECT delivery_details_id
-- 			FROM delivery.company c
-- 			WHERE c.id = (
-- 			    SELECT delivery_company_id
-- 			    FROM service_provider.delivery_partner p
-- 			    WHERE p.service_provider_id = restaurant_row.id AND p.service_provider_type = 'restaurant'
-- 			)
-- 		)
-- 	    END
--     )
-- $function$;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION restaurant.get_restaurants(location geography)
--  RETURNS SETOF restaurant.restaurant
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM restaurant.restaurant r
--     WHERE ST_Distance(
--     (
--         SELECT gps
--         FROM service_provider.location l
--         WHERE l.id = (
--     	    CASE
--     		WHEN (SELECT self_delivery FROM delivery.details i WHERE r.delivery_details_id = i.id) = true
--     		THEN (SELECT location_id FROM service_provider.details d WHERE r.details_id = d.id)
--     		ELSE (
--     			SELECT location_id
--     			FROM service_provider.details e
--     			WHERE e.id = (
--     			    SELECT details_id
--     			    FROM delivery.company c
--     			    WHERE c.id = (
--     			        SELECT delivery_company_id
--         			    FROM service_provider.delivery_partner p
--         			    WHERE p.service_provider_id = r.id AND p.service_provider_type = 'restaurant'
--     			    )
--     			)
--     		)
--     	    END
--         )
--     ), location) <=
--     (
--         SELECT radius
--         FROM delivery.details d
--         WHERE d.id = (
--     	    CASE
--     		WHEN (SELECT self_delivery FROM delivery.details i WHERE r.delivery_details_id = i.id) = true THEN r.delivery_details_id
--     		ELSE (
--     			SELECT delivery_details_id
--     			FROM delivery.company c
--     			WHERE c.id = (
--     			    SELECT delivery_company_id
--     			    FROM service_provider.delivery_partner p
--     			    WHERE p.service_provider_id = r.id AND p.service_provider_type = 'restaurant'
--     			)
--     		)
--     	    END
--         )
--     )
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION restaurant.get_restaurants(location geography)
--  RETURNS SETOF restaurant.restaurant
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM restaurant.restaurant r
--     WHERE ST_Distance(
--     (
--         SELECT gps
--         FROM service_provider.location l
--         WHERE l.id = (
--     	    CASE
--     		WHEN (SELECT self_delivery FROM delivery.details i WHERE r.delivery_details_id = i.id) = true
--     		THEN (SELECT location_id FROM service_provider.details d WHERE r.details_id = d.id)
--     		ELSE (
--     			SELECT location_id
--     			FROM service_provider.details e
--     			WHERE e.id = (
--     			    SELECT details_id
--     			    FROM delivery.company c
--     			    WHERE c.id = (
--     			        SELECT delivery_company_id
--         			    FROM service_provider.delivery_partner p
--         			    WHERE p.service_provider_id = r.id AND p.service_provider_type = 'restaurant'
--     			    )
--     			)
--     		)
--     	    END
--         )
--     ), location) <=
--     (
--         SELECT radius
--         FROM delivery.details d
--         WHERE d.id = (
--     	    CASE
--     		WHEN (SELECT self_delivery FROM delivery.details i WHERE r.delivery_details_id = i.id) = true THEN r.delivery_details_id
--     		ELSE (
--     			SELECT delivery_details_id
--     			FROM delivery.company c
--     			WHERE c.id = (
--     			    SELECT delivery_company_id
--     			    FROM service_provider.delivery_partner p
--     			    WHERE p.service_provider_id = r.id AND p.service_provider_type = 'restaurant'
--     			)
--     		)
--     	    END
--         )
--     )
-- $function$;

alter table "public"."notification_info" add constraint "notification_info_user_id_app_type_id_key" unique ("user_id", "app_type_id");


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


alter table "service_provider"."details" alter column "language" set default '"{en: true, es: true}"'::jsonb;

alter table "service_provider"."details" alter column "language" set default '{"en": true, "es": true}'::jsonb;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION customer.minimal_orders(customer_id int)
-- RETURNS SETOF customer.minimal_order
-- LANGUAGE sql
-- STABLE
-- AS $$
--     WITH
--     ro AS (
--         SELECT
--             id,
--             'restaurant' AS order_type,
--             status,
--             public.in_process(r) as in_process,
--             order_time,
--             public.totalcost(r) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
--             ),
--             payment_type
--         FROM restaurant.order r),
--     lo AS (
--         SELECT
--             id,
--             'laundry' AS order_type,
--             status,
--             laundry.order_in_process(l) as in_process,
--             order_time,
--             COALESCE(laundry.totalcost(l), '0'::money) as total_cost,
--             (SELECT name
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             (SELECT image
--                 FROM service_provider.details d
--                 WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
--             ),
--             payment_type
--         FROM  laundry.order l)
--     SELECT * from ro UNION select * from lo
-- $$;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."minimal_order" add column "payment_type" text
--  not null;

alter table "customer"."minimal_order" rename column "image" to "service_provider_image";

alter table "customer"."minimal_order" rename column "name" to "service_provider_name";

DROP TABLE "customer"."minimal_order";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.laundry_delivery_details(laundry_row laundry.store)
--  RETURNS delivery.details
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM delivery.details d
--
-- $function$;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."delivery_partner" add column "service_provider_type" text
--  not null;

alter table "delivery"."company" drop constraint "company_delivery_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."company" add column "delivery_details_id" integer
--  not null unique;

alter table "laundry"."store" drop constraint "store_delivery_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "delivery_details_id" integer
--  not null unique;

alter table "restaurant"."restaurant" drop constraint "restaurant_delivery_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."restaurant" add column "delivery_details_id" integer
--  not null unique;

alter table "service_provider"."details" add constraint "details_delivery_details_id_key" unique (delivery_details_id);
alter table "service_provider"."details"
  add constraint "details_delivery_details_id_fkey"
  foreign key (delivery_details_id)
  references "delivery"."details"
  (id) on update restrict on delete restrict;
alter table "service_provider"."details" alter column "delivery_details_id" drop not null;
alter table "service_provider"."details" add column "delivery_details_id" int4;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE
-- OR REPLACE VIEW "delivery"."order_public" AS
-- SELECT
--   "order".id AS restaurant_id,
--   "order".review_id,
--   "order".order_time,
--   "order".estimated_food_ready_time,
--   "order".actual_food_ready_time,
--   "order".customer_id,
--   "order".status
-- FROM
--   restaurant."order";


ALTER TABLE "service_provider"."stripe_info" ALTER COLUMN "charges_enabled" drop default;

ALTER TABLE "service_provider"."stripe_info" ALTER COLUMN "payouts_enabled" drop default;

ALTER TABLE "service_provider"."stripe_info" ALTER COLUMN "details_submitted" drop default;

alter table "delivery"."operator" drop constraint "operator_details_id_fkey",
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."operator" drop constraint "operator_details_id_fkey",
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete cascade;

alter table "restaurant"."operator" drop constraint "operator_details_id_fkey",
  add constraint "operator_details_id_fkey"
  foreign key ("details_id")
  references "service_provider"."operator_details"
  ("id") on update restrict on delete restrict;

alter table "service_provider"."details" alter column "delivery_details_id" drop not null;

alter table "service_provider"."operator_details" alter column "delivery_driver_type" drop not null;
alter table "service_provider"."operator_details" add column "delivery_driver_type" text;

alter table "service_provider"."delivery_partner" drop constraint "delivery_partner_service_provider_id_fkey";

alter table "service_provider"."delivery_partner" add constraint "delivery_partner_service_provider_id_service_provider_type_key" unique (service_provider_id, service_provider_type);
alter table "service_provider"."delivery_partner" alter column "service_provider_type" drop not null;
alter table "service_provider"."delivery_partner" add column "service_provider_type" text;

alter table "service_provider"."details" alter column "stripe_info" drop not null;
alter table "service_provider"."details" add column "stripe_info" jsonb;

alter table "service_provider"."service_link" alter column "service_provider_type" drop not null;
alter table "service_provider"."service_link" add column "service_provider_type" text;

alter table "service_provider"."service_link" add constraint "service_links_provider_id_key" unique (service_provider_id);
alter table "service_provider"."service_link" alter column "service_provider_id" drop not null;
alter table "service_provider"."service_link" add column "service_provider_id" int4;

alter table "service_provider"."details" drop constraint "details_service_link_id_key";

alter table "service_provider"."details" drop constraint "details_service_link_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "service_link_id" integer
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.delivery_in_process(order_row delivery."order")
--  RETURNS boolean
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT order_row.status = 'orderReceived' OR order_row.status = 'packageReady' OR order_row.status = 'atPickup' OR order_row.status = 'onTheWayToDropoff'OR order_row.status = 'onTheWayToPickup' OR order_row.status = 'atDropoff'
-- $function$;


alter table "delivery"."order" alter column "delivery_driver_type" drop not null;
alter table "delivery"."order" add column "delivery_driver_type" text;

alter table "delivery"."order" drop constraint "order_delivery_driver_id_fkey";

comment on column "service_provider"."details"."language" is NULL;
ALTER TABLE "service_provider"."details" ALTER COLUMN "language" drop default;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "language" jsonb
--  not null;

alter table "service_provider"."details" alter column "language_id" set default ''en'::text';
alter table "service_provider"."details" alter column "language_id" drop not null;
alter table "service_provider"."details" add column "language_id" text;

DROP TABLE "service_provider"."stripe_info";

DROP TABLE "customer"."stripe_cards";

alter table "customer"."stripe_info" alter column "id" set default nextval('customer.stripe_info_id_seq'::regclass);
alter table "customer"."stripe_info" alter column "id" drop not null;
alter table "customer"."stripe_info" add column "id" int4;

alter table "customer"."stripe_info" drop constraint "stripe_info_pkey";
alter table "customer"."stripe_info"
    add constraint "stripe_info_pkey"
    primary key ("id");

DROP TABLE "customer"."stripe_info";

alter table "service_provider"."details" alter column "self_delivery" set default false;
alter table "service_provider"."details" alter column "self_delivery" drop not null;
alter table "service_provider"."details" add column "self_delivery" bool;

alter table "service_provider"."details" alter column "customer_pickup" set default true;
alter table "service_provider"."details" alter column "customer_pickup" drop not null;
alter table "service_provider"."details" add column "customer_pickup" bool;

alter table "service_provider"."details" alter column "delivery" set default true;
alter table "service_provider"."details" alter column "delivery" drop not null;
alter table "service_provider"."details" add column "delivery" bool;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."details" add column "self_delivery" boolean
--  not null default 'false';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."details" add column "customer_pickup" boolean
--  not null default 'true';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."details" add column "delivery_available" boolean
--  not null default 'true';

alter table "service_provider"."operator_details" drop constraint "operator_details_app_type_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE delivery.operator
--     DROP COLUMN status,
--     DROP COLUMN owner,
--     DROP COLUMN app_version,
--     DROP COLUMN current_gps,
--     DROP COLUMN app_type_id;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE laundry.operator
--     DROP COLUMN status,
--     DROP COLUMN owner,
--     DROP COLUMN app_version,
--     DROP COLUMN current_gps,
--     DROP COLUMN online,
--     DROP COLUMN app_type_id;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE restaurant.operator
--     DROP COLUMN status,
--     DROP COLUMN owner,
--     DROP COLUMN app_version,
--     DROP COLUMN current_gps,
--     DROP COLUMN online,
--     DROP COLUMN app_type_id;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE delivery.company
--     DROP COLUMN name,
--     DROP COLUMN image,
--     DROP COLUMN open_status,
--     DROP COLUMN approved,
--     DROP COLUMN description_id;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE delivery.company DROP COLUMN delivery_details_id, DROP COLUMN creation_time;

alter table "delivery"."company" add constraint "company_location_id_key" unique (location_id);
alter table "delivery"."company" alter column "location_id" drop not null;
alter table "delivery"."company" add column "location_id" int4;

alter table "delivery"."company"
  add constraint "delivery_company_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "delivery"."company"
  add constraint "company_location_id_fkey"
  foreign key ("location_id")
  references "service_provider"."location"
  ("id") on update cascade on delete cascade;

alter table "delivery"."company"
  add constraint "company_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update cascade on delete cascade;

alter table "laundry"."store" alter column "schedule" drop not null;
alter table "laundry"."store" add column "schedule" jsonb;

alter table "laundry"."store" alter column "phone_number" drop not null;
alter table "laundry"."store" add column "phone_number" text;

alter table "laundry"."store" alter column "location_id" drop not null;
alter table "laundry"."store" add column "location_id" int4;

alter table "laundry"."store" alter column "creation_time" set default now();
alter table "laundry"."store" alter column "creation_time" drop not null;
alter table "laundry"."store" add column "creation_time" timestamptz;

alter table "laundry"."store" alter column "self_delivery" set default false;
alter table "laundry"."store" alter column "self_delivery" drop not null;
alter table "laundry"."store" add column "self_delivery" bool;

alter table "laundry"."store" alter column "approved" set default false;
alter table "laundry"."store" alter column "approved" drop not null;
alter table "laundry"."store" add column "approved" bool;

alter table "laundry"."store" alter column "language_id" set default ''en'::text';
alter table "laundry"."store" alter column "language_id" drop not null;
alter table "laundry"."store" add column "language_id" text;

alter table "laundry"."store" alter column "open_status" set default ''closed'::text';
alter table "laundry"."store" alter column "open_status" drop not null;
alter table "laundry"."store" add column "open_status" text;

alter table "laundry"."store" alter column "description_id" drop not null;
alter table "laundry"."store" add column "description_id" int4;

alter table "laundry"."store" alter column "image" drop not null;
alter table "laundry"."store" add column "image" text;

alter table "laundry"."store" alter column "name" drop not null;
alter table "laundry"."store" add column "name" text;

alter table "laundry"."store" alter column "stripe_info" drop not null;
alter table "laundry"."store" add column "stripe_info" jsonb;

alter table "laundry"."store" alter column "accepted_payments" drop not null;
alter table "laundry"."store" add column "accepted_payments" jsonb;

alter table "laundry"."store" alter column "delivery" set default true;
alter table "laundry"."store" alter column "delivery" drop not null;
alter table "laundry"."store" add column "delivery" bool;

alter table "laundry"."store" alter column "customer_pickup" set default true;
alter table "laundry"."store" alter column "customer_pickup" drop not null;
alter table "laundry"."store" add column "customer_pickup" bool;

alter table "laundry"."store" alter column "delivery_details_id" drop not null;
alter table "laundry"."store" add column "delivery_details_id" int4;

alter table "laundry"."store"
  add constraint "store_location_id_fkey"
  foreign key ("location_id")
  references "service_provider"."location"
  ("id") on update restrict on delete restrict;

alter table "laundry"."store"
  add constraint "store_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "laundry"."store"
  add constraint "store_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update restrict on delete cascade;

alter table "laundry"."store" add constraint "store_location_id_key" unique ("location_id");

alter table "laundry"."store" add constraint "store_delivery_details_id_key" unique ("delivery_details_id");

alter table "restaurant"."restaurant" alter column "name" drop not null;
alter table "restaurant"."restaurant" add column "name" text;

alter table "restaurant"."restaurant" alter column "image" drop not null;
alter table "restaurant"."restaurant" add column "image" text;

alter table "restaurant"."restaurant"
  add constraint "restaurant_description_id_fkey"
  foreign key (description_id)
  references "public"."translation"
  (id) on update restrict on delete cascade;
alter table "restaurant"."restaurant" alter column "description_id" drop not null;
alter table "restaurant"."restaurant" add column "description_id" int4;

alter table "restaurant"."restaurant" add constraint "restaurant_firebase_id_key" unique (firebase_id);
alter table "restaurant"."restaurant" alter column "firebase_id" drop not null;
alter table "restaurant"."restaurant" add column "firebase_id" text;

alter table "restaurant"."restaurant" alter column "open_status" set default ''closed_indefinitely'::text';
alter table "restaurant"."restaurant" alter column "open_status" drop not null;
alter table "restaurant"."restaurant" add column "open_status" text;

alter table "restaurant"."restaurant" alter column "language_id" set default ''en'::text';
alter table "restaurant"."restaurant" alter column "language_id" drop not null;
alter table "restaurant"."restaurant" add column "language_id" text;

alter table "restaurant"."restaurant" alter column "approved" set default false;
alter table "restaurant"."restaurant" alter column "approved" drop not null;
alter table "restaurant"."restaurant" add column "approved" bool;

alter table "restaurant"."restaurant" alter column "self_delivery" set default false;
alter table "restaurant"."restaurant" alter column "self_delivery" drop not null;
alter table "restaurant"."restaurant" add column "self_delivery" bool;

alter table "restaurant"."restaurant" alter column "schedule" drop not null;
alter table "restaurant"."restaurant" add column "schedule" jsonb;

alter table "restaurant"."restaurant" alter column "stripe_info" drop not null;
alter table "restaurant"."restaurant" add column "stripe_info" jsonb;

alter table "restaurant"."restaurant" alter column "accepted_payments" drop not null;
alter table "restaurant"."restaurant" add column "accepted_payments" jsonb;

alter table "restaurant"."restaurant" alter column "delivery" set default true;
alter table "restaurant"."restaurant" alter column "delivery" drop not null;
alter table "restaurant"."restaurant" add column "delivery" bool;

alter table "restaurant"."restaurant" alter column "customer_pickup" set default true;
alter table "restaurant"."restaurant" alter column "customer_pickup" drop not null;
alter table "restaurant"."restaurant" add column "customer_pickup" bool;

alter table "restaurant"."restaurant" alter column "creation_time" set default now();
alter table "restaurant"."restaurant" alter column "creation_time" drop not null;
alter table "restaurant"."restaurant" add column "creation_time" timestamptz;

alter table "restaurant"."restaurant" add constraint "restaurant_location_id_key" unique (location_id);
alter table "restaurant"."restaurant" alter column "location_id" drop not null;
alter table "restaurant"."restaurant" add column "location_id" int4;

alter table "restaurant"."restaurant"
  add constraint "restaurant_location_id_fkey"
  foreign key ("location_id")
  references "service_provider"."location"
  ("id") on update cascade on delete cascade;

alter table "restaurant"."restaurant" alter column "phone_number" drop not null;
alter table "restaurant"."restaurant" add column "phone_number" text;

alter table "restaurant"."restaurant" add constraint "restaurant_delivery_details_id_key" unique (delivery_details_id);
alter table "restaurant"."restaurant" alter column "delivery_details_id" drop not null;
alter table "restaurant"."restaurant" add column "delivery_details_id" int4;

alter table "restaurant"."restaurant"
  add constraint "restaurant_delivery_details_id_fkey"
  foreign key ("delivery_details_id")
  references "delivery"."details"
  ("id") on update cascade on delete cascade;

alter table "delivery"."operator" drop constraint "operator_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."operator" add column "details_id" integer
--  not null unique;

alter table "laundry"."operator" drop constraint "operator_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."operator" add column "details_id" integer
--  not null unique;

alter table "restaurant"."operator" drop constraint "operator_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."operator" add column "details_id" integer
--  not null unique;

alter table "delivery"."company" drop constraint "company_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."company" add column "details_id" integer
--  not null unique;

alter table "laundry"."store" drop constraint "store_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "details_id" integer
--  not null unique;

alter table "laundry"."order_category" drop constraint "order_category_category_id_fkey",
  add constraint "order_type_type_id_fkey"
  foreign key ("category_id")
  references "laundry"."category"
  ("id") on update restrict on delete restrict;

alter table "laundry"."order_category" drop constraint "order_category_order_id_fkey",
  add constraint "order_type_order_id_fkey"
  foreign key ("order_id")
  references "laundry"."order"
  ("id") on update restrict on delete restrict;

alter table "laundry"."operator" drop constraint "operator_store_id_fkey",
  add constraint "operator_store_id_fkey"
  foreign key ("store_id")
  references "laundry"."store"
  ("id") on update restrict on delete restrict;

alter table "laundry"."category" drop constraint "category_store_id_fkey",
  add constraint "type_store_id_fkey"
  foreign key ("store_id")
  references "laundry"."store"
  ("id") on update restrict on delete restrict;

alter table "laundry"."order" drop constraint "order_store_id_fkey",
  add constraint "order_store_id_fkey"
  foreign key ("store_id")
  references "laundry"."store"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."restaurant" drop constraint "restaurant_details_id_key";

alter table "restaurant"."restaurant" drop constraint "restaurant_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."restaurant" add column "details_id" integer
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "service_provider"."details" add column "service_provider_type" text
--  not null;

alter table "service_provider"."operator_details" drop constraint "operator_details_user_id_fkey";

alter table "service_provider"."details" drop constraint "details_location_id_fkey";

alter table "service_provider"."details" drop constraint "details_description_id_fkey";

alter table "service_provider"."details" drop constraint "details_delivery_details_id_fkey";

DROP TABLE "service_provider"."operator_details";

alter table "service_provider"."details" alter column "service_provider_type" drop not null;
alter table "service_provider"."details" add column "service_provider_type" text;

DROP TABLE "service_provider"."details";

alter table "laundry"."order" alter column "delivery_cost" set default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.laundry_delivery_details(laundry_row laundry.store)
--  RETURNS delivery.details
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM delivery.details d
--     WHERE d.id = (
-- 	    CASE
-- 		WHEN laundry_row.self_delivery = true THEN laundry_row.delivery_details_id
-- 		ELSE (
-- 			SELECT delivery_details_id
-- 			FROM delivery.company c
-- 			WHERE c.id = (
-- 			    SELECT delivery_company_id
-- 			    FROM service_provider.delivery_partner p
-- 			    WHERE p.service_provider_id = laundry_row.id AND p.service_provider_type = 'laundry'
-- 			)
-- 		)
-- 	    END
--     )
-- $function$;


alter table "delivery"."order" alter column "service_provider_type" drop not null;

alter table "delivery"."order" alter column "service_provider_id" drop not null;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION laundry.totalcost(order_row laundry."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT order_row.delivery_cost + laundry.itemsCost(order_row) - order_row.refund_amount + order_row.stripe_fees - order_row.discount_value
--
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION laundry.totalCost(order_row laundry."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT order_row.delivery_cost  - order_row.refund_amount + order_row.stripe_fees - order_row.discount_value
--
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION laundry.itemscost(order_row laundry."order")
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT SUM(oc.weight_in_kilo * c.cost_by_kilo)
--     FROM laundry.order_category oc
--     INNER JOIN laundry.category c
--     ON oc.category_id = c.id
--     WHERE order_id = order_row.id;
-- $function$;

alter table "laundry"."store" alter column "description_id" set not null;

alter table "service_provider"."delivery_partner" drop constraint "delivery_partner_delivery_company_id_fkey";


comment on column "laundry"."store"."normal_delivery_time" is NULL;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "normal_delivery_time" integer
--  not null default '1';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION laundry.order_in_process(order_row laundry."order")
--  RETURNS boolean
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT order_row.status != 'delivered' AND order_row.status != 'cancelledByCustomer' AND order_row.status != 'cancelledByAdmin'
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.laundry_in_process(order_row laundry."order")
--  RETURNS boolean
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT order_row.status != 'delivered' AND order_row.status != 'cancelledByCustomer' AND order_row.status != 'cancelledByAdmin'
-- $function$;


alter table "laundry"."operator" alter column "id" set default nextval('laundry.type_id_seq'::regclass);

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE SEQUENCE laundry.op_seq
--   MINVALUE 1
--
--   START WITH 1
--   INCREMENT BY 1;

ALTER TABLE "laundry"."operator" ALTER COLUMN "id" drop default;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "service_provider_type" text
--  not null default 'laundry';

alter table "laundry"."order_category" alter column "weight_in_kilo" set not null;


alter table "laundry"."order_category" rename column "category_id" to "type_id";

alter table "laundry"."store" alter column "delivery_details_id" set not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "discount_value" money
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "stripe_fees" money
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "stripe_info" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "scheduled_time" timestamptz
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "refund_amount" money
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."category" add column "position" integer
--  not null default '1';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "tax" money
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "cancellation_time" timestamptz
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "customer_app_type" text
--  not null default 'native';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "firebase_id" text
--  null unique;

alter table "laundry"."order_category" rename to "order_type";

alter table "laundry"."category" rename to "type";

alter table "laundry"."store" drop constraint "store_delivery_details_id_fkey",
  add constraint "store_delivery_details_id_fkey"
  foreign key ("location_id")
  references "service_provider"."location"
  ("id") on update restrict on delete restrict;

alter table "laundry"."store" drop constraint "store_delivery_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "delivery_details_id" integer
--  not null unique;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "customer_pickup" boolean
--  not null default 'true';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "delivery" boolean
--  not null default 'true';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "accepted_payments" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "stripe_info" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "schedule" jsonb
--  null;

alter table "laundry"."store" alter column "payment_type" set default ''Cash'::text';
alter table "laundry"."store" alter column "payment_type" drop not null;
alter table "laundry"."store" add column "payment_type" text;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "payment_type" text
--  not null default 'Cash';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."store" add column "phone_number" text
--  null;

alter table "laundry"."order" drop constraint "order_chat_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "laundry"."order" add column "chat_id" integer
--  null;

DROP TABLE "laundry"."operator";

DROP TABLE "laundry"."order_type";

DROP TABLE "laundry"."type";

DROP TABLE "laundry"."order";

DROP TABLE "laundry"."store";

drop schema "laundry" cascade;


alter table "public"."chat" alter column "agora_info" drop not null;
alter table "public"."chat" add column "agora_info" jsonb;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP FUNCTION public.deliop_notification_token;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."operator" add column "app_type_id" text
--  not null default 'delivery_admin';

alter table "delivery"."driver"
  add constraint "deliverer_notification_id_fkey"
  foreign key (notification_info_id)
  references "public"."notification_info"
  (id) on update restrict on delete restrict;
alter table "delivery"."driver" alter column "notification_info_id" drop not null;
alter table "delivery"."driver" add column "notification_info_id" int4;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP FUNCTION public.driver_notification_token;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."driver" add column "app_type_id" Text
--  not null default 'delivery';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."operator" add column "app_type_id" text
--  not null default 'restaurant';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP FUNCTION public.restaurant_operator_notification_token;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "customer"."customer" add column "app_type_id" text
--  not null default 'customer';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP FUNCTION public.customer_notification_token;

alter table "public"."mez_admin" rename column "app_type_id" to "app_typ_id";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP FUNCTION public.mez_admin_notification_info;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."mez_admin" add column "app_typ_id" text
--  not null default 'mez_admin';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP FUNCTION public.mez_admin_notification_token;
-- CREATE OR REPLACE FUNCTION public.mez_admin_notification_info(mez_admin_row mez_admin)
--  RETURNS notification_info
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM notification_info n
--     WHERE n.user_id = mez_admin_row.user_id
--     AND n.app_type_id = 'mez_admin';
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."notification_info" add column "turn_off_notifications" boolean
--  not null default 'false';

alter table "public"."mez_admin" alter column "online" set default true;
alter table "public"."mez_admin" alter column "online" drop not null;
alter table "public"."mez_admin" add column "online" bool;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."mez_admin" add column "online" boolean
--  not null default 'true';

comment on column "public"."chat"."chat_type" is E'service, direct, group';
alter table "public"."chat" alter column "chat_type" set default 'service'::text;

comment on column "public"."chat"."chat_type" is NULL;

alter table "public"."chat" alter column "chat_type" set default 'group'::text;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."operator" add column "online" boolean
--  not null default 'true';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."restaurant" add column "phone_number" text
--  null;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE restaurant.favourited_item SET SCHEMA customer;

alter table "restaurant"."favourited_item" drop constraint "favourited_item_restaurant_id_fkey";

alter table "restaurant"."favourited_item" drop constraint "favourited_item_restaurant_item_id_fkey";

alter table "restaurant"."favourited_item" drop constraint "favourited_item_customer_id_fkey";

DROP TABLE "restaurant"."favourited_item";

comment on column "service_provider"."post"."comments" is NULL;

comment on column "service_provider"."post"."likes" is NULL;

alter table "service_provider"."location" alter column "address" drop not null;

alter table "service_provider"."subscriber" drop constraint "subscriber_customer_id_fkey";

alter table "restaurant"."restaurant" alter column "schedule" set default '"{\"monday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"tuesday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"wednesday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"thursday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"friday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"saturday\":{\"from\":\"8:0\",\"to\":\"19:0\",\"isOpen\":false},\"sunday\":{\"from\":\"8:0\",\"to\":\"16:0\",\"isOpen\":false}}"'::jsonb;


alter table "delivery"."company" drop constraint "company_delivery_details_id_key";

alter table "delivery"."company" drop constraint "company_location_id_key";

alter table "restaurant"."restaurant" drop constraint "restaurant_delivery_details_id_key";

alter table "restaurant"."restaurant" drop constraint "restaurant_location_id_key";


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION restaurant.get_restaurants(location geography)
--  RETURNS SETOF restaurant.restaurant
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM restaurant.restaurant r
--     WHERE ST_Distance(
--     (
--         SELECT gps
--         FROM service_provider.location l
--         WHERE l.id = (
--     	    CASE
--     		WHEN r.self_delivery = true THEN r.location_id
--     		ELSE (
--     			SELECT location_id
--     			FROM delivery.company c
--     			WHERE c.id = (
--     			    SELECT delivery_company_id
--     			    FROM service_provider.delivery_partner p
--     			    WHERE p.service_provider_id = r.id AND p.service_provider_type = 'restaurant'
--     			)
--     		)
--     	    END
--         )
--     ), location) <=
--     (
--         SELECT radius
--         FROM delivery.details d
--         WHERE d.id = (
--     	    CASE
--     		WHEN r.self_delivery = true THEN r.delivery_details_id
--     		ELSE (
--     			SELECT delivery_details_id
--     			FROM delivery.company c
--     			WHERE c.id = (
--     			    SELECT delivery_company_id
--     			    FROM service_provider.delivery_partner p
--     			    WHERE p.service_provider_id = r.id AND p.service_provider_type = 'restaurant'
--     			)
--     		)
--     	    END
--         )
--     )
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.restaurant_delivery_details(restaurant_row restaurant.restaurant)
--  RETURNS delivery.details
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM delivery.details d
--     WHERE d.id = (
-- 	    CASE
-- 		WHEN restaurant_row.self_delivery = true THEN restaurant_row.delivery_details_id
-- 		ELSE (
-- 			SELECT delivery_details_id
-- 			FROM delivery.company c
-- 			WHERE c.id = (
-- 			    SELECT delivery_company_id
-- 			    FROM service_provider.delivery_partner p
-- 			    WHERE p.service_provider_id = restaurant_row.id AND p.service_provider_type = 'restaurant'
-- 			)
-- 		)
-- 	    END
--     )
-- $function$;

alter table "delivery"."details" alter column "service_provider_type" drop not null;
alter table "delivery"."details" add column "service_provider_type" text;

alter table "delivery"."details" add constraint "delivery_cost_service_provider_id_service_provider_type_key" unique (service_provider_id, service_provider_type);
alter table "delivery"."details" alter column "service_provider_id" drop not null;
alter table "delivery"."details" add column "service_provider_id" int4;

alter table "service_provider"."location" alter column "service_provider_type" drop not null;
alter table "service_provider"."location" add column "service_provider_type" text;

alter table "service_provider"."location" alter column "service_provider_id" drop not null;
alter table "service_provider"."location" add column "service_provider_id" int4;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP FUNCTION delivery.fetch_delivery_company;
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
--         WHERE l.id = c.location_id
--     ), location) <=
--     (
--         SELECT radius
--         FROM delivery.details d
--         WHERE d.id = c.delivery_details_id
--     )
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP FUNCTION restaurant.fetch_restaurants;
-- CREATE OR REPLACE FUNCTION restaurant.get_restaurants(location geography)
--  RETURNS SETOF restaurant.restaurant
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM restaurant.restaurant r
--     WHERE ST_Distance(
--     (
--         SELECT gps
--         FROM service_provider.location l
--         WHERE l.id = r.location_id
--     ), location) <=
--     (
--         SELECT radius
--         FROM delivery.details d
--         WHERE d.id = r.delivery_details_id
--     )
-- $function$;

alter table "restaurant"."restaurant" drop constraint "restaurant_location_id_fkey",
  add constraint "restaurant_location_id_fkey"
  foreign key ("location_id")
  references "service_provider"."location"
  ("id") on update restrict on delete restrict;

alter table "delivery"."company" drop constraint "company_location_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."company" add column "location_id" integer
--  not null;

alter table "restaurant"."restaurant" drop constraint "restaurant_location_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."restaurant" add column "location_id" integer
--  not null;

alter table "restaurant"."restaurant" alter column "delivery_details_id" set not null;

alter table "restaurant"."restaurant" alter column "delivery_details_id" drop not null;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION restaurant.get_restaurants(location geography)
--  RETURNS SETOF restaurant.restaurant
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM restaurant.restaurant r
--     WHERE ST_Distance(
--     (
--         SELECT gps
--         FROM service_provider.location l
--         WHERE l.service_provider_id = r.id
--         AND l.service_provider_type = 'restaurant'
--     ), location) <=
--     (
--         SELECT radius
--         FROM delivery.details d
--         WHERE d.service_provider_id = r.id
--         AND d.service_provider_type = 'restaurant'
--     )
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION delivery.get_delivery_companies(location geography)
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
--         WHERE l.service_provider_id = c.id
--         AND l.service_provider_type = 'delivery_company'
--     ), location) <=
--     (
--         SELECT radius
--         FROM delivery.details d
--         WHERE d.service_provider_id = c.id
--         AND d.service_provider_type = 'delivery_company'
--     )
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION delivery.fetch_delivery_company(location geography, radius double precision)
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
--         WHERE l.service_provider_id = c.id
--         AND l.service_provider_type = 'delivery_company'
--     ), location) <= radius
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION restaurant.fetch_restaurants(location geography, radius double precision)
--  RETURNS SETOF restaurant.restaurant
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM restaurant.restaurant r
--     WHERE ST_Distance((SELECT gps FROM restaurant.location(r)), location) <= radius
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION restaurant.fetch_restaurants(location geography, radius double precision)
--  RETURNS SETOF restaurant.restaurant
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM restaurant.restaurant r
--     WHERE ST_Distance((SELECT gps FROM restaurant.location(r)), location) <= radius
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION restaurant.location(restaurant_row restaurant.restaurant)
--  RETURNS service_provider.location
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT *
--     FROM service_provider.location l
--     WHERE l.service_provider_id = restaurant_row.id
--     AND l.service_provider_type = 'restaurant'
-- $function$;

alter table "restaurant"."restaurant" alter column "delivery_details_id" set not null;


alter table "restaurant"."cart" drop constraint "cart_restaurant_id_fkey",
  add constraint "restaurant_cart_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."order_item" drop constraint "order_item_restaurant_item_id_fkey",
  add constraint "restaurant_order_item_restaurant_item_id_fkey"
  foreign key ("restaurant_item_id")
  references "restaurant"."item"
  ("id") on update restrict on delete restrict;


alter table "delivery"."details" alter column "location_gps" drop not null;
alter table "delivery"."details" add column "location_gps" geography;

alter table "delivery"."details" alter column "location_text" drop not null;
alter table "delivery"."details" add column "location_text" text;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER table "location" set schema service_provider;

DROP TABLE "public"."location";

alter table "restaurant"."restaurant" drop constraint "restaurant_delivery_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."restaurant" add column "delivery_details_id" integer
--  not null;

alter table "delivery"."company" drop constraint "company_delivery_details_id_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."company" add column "delivery_details_id" integer
--  not null;


alter table "restaurant"."operator" drop constraint "operator_restaurant_id_fkey",
  add constraint "restaurant_operator_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."order" drop constraint "order_restaurant_id_fkey",
  add constraint "restaurant_order_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete restrict;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION public.restaurant_location_text(restaurant_row restaurant.restaurant)
--     RETURNS varchar
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT location_text
--     FROM delivery.details d
--     WHERE d.service_provider_id = restaurant_row.id AND d.service_provider_type = 'restaurant';
-- $$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION public.restaurant_location_gps(restaurant_row restaurant.restaurant)
--     RETURNS geography
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT location_gps
--     FROM delivery.details d
--     WHERE d.service_provider_id = restaurant_row.id AND d.service_provider_type = 'restaurant';
-- $$;

alter table "restaurant"."restaurant" alter column "location_text" drop not null;
alter table "restaurant"."restaurant" add column "location_text" text;

alter table "restaurant"."restaurant" alter column "location_gps" drop not null;
alter table "restaurant"."restaurant" add column "location_gps" geography;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."details" add column "location_text" text
--  null;

alter table "delivery"."details" rename column "location_gps" to "location";

alter table "delivery"."company" alter column "delivery_radius" drop not null;
alter table "delivery"."company" add column "delivery_radius" int4;

alter table "delivery"."company" alter column "location" drop not null;
alter table "delivery"."company" add column "location" geography;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."details" add column "location" geography
--  not null;

ALTER TABLE "delivery"."details" ALTER COLUMN "radius" drop default;

comment on column "delivery"."details"."radius" is NULL;
ALTER TABLE "delivery"."details" ALTER COLUMN "radius" TYPE integer;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION delivery.fetch_delivery_company(location geography(Point), radius double precision)
--     RETURNS SETOF delivery.company
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT *
--     FROM delivery.company c
--     WHERE ST_Distance(c.location, location) <= radius
-- $$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION restaurant.fetch_restaurants(location geography(Point), radius double precision)
--     RETURNS SETOF restaurant.restaurant
--     LANGUAGE sql
--     STABLE
-- AS $$
--     SELECT *
--     FROM restaurant.restaurant r
--     WHERE ST_Distance(r.location_gps, location) <= radius
-- $$;

alter table "restaurant"."order" rename column "delivery_type" to "order_type";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."company" add column "creation_time" timestamptz
--  not null default now();

alter table "delivery"."details" alter column "location" drop not null;
alter table "delivery"."details" add column "location" geography;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."user" add column "creation_time" timestamptz
--  not null default now();

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."restaurant" add column "creation_time" timestamptz
--  not null default now();

comment on column "restaurant"."restaurant"."customer_pickup" is NULL;

comment on column "restaurant"."restaurant"."delivery" is NULL;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."restaurant" add column "customer_pickup" boolean
--  not null default 'true';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "restaurant"."restaurant" add column "delivery" boolean
--  not null default 'true';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE FUNCTION public.restaurant_delivery_details(restaurant_row restaurant."restaurant")
--  RETURNS delivery.details
--  LANGUAGE sql
--  STABLE
-- AS $$
--     SELECT *
--     FROM delivery.details d
--     WHERE d.service_provider_id = (
-- 	    CASE
-- 		WHEN restaurant_row.self_delivery = true THEN restaurant_row.id
-- 		ELSE (
-- 			SELECT delivery_company_id
-- 			FROM service_provider.delivery_partner p
-- 			WHERE p.service_provider_id = restaurant_row.id AND p.service_provider_type = 'restaurant'
-- 		)
-- 	    END
--     )
--     AND d.service_provider_type = (
-- 	    CASE
-- 		WHEN restaurant_row.self_delivery = true THEN 'restaurant'
-- 		ELSE 'delivery_company'
-- 	    END
--     )
-- $$;

alter table "delivery"."details" rename to "cost";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."cost" add column "radius" integer
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."cost" add column "location" geography
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."company" add column "delivery_radius" integer
--  not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "delivery"."company" add column "location" geography
--  not null;

DROP TABLE "service_provider"."delivery_partner";

alter table "restaurant"."restaurant" alter column "schedule" set default '"{\"monday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"tuesday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"wednesday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"thursday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"friday\":{\"from\":\"8:0\",\"to\":\"20:0\",\"isOpen\":true},\"saturday\":{\"from\":\"8:0\",\"to\":\"19:0\",\"isOpen\":false},\"sunday\":{\"from\":\"8:0\",\"to\":\"16:0\",\"isOpen\":false}}"'::jsonb;


alter table "restaurant"."order" alter column "chat_id" set not null;

alter table "restaurant"."choice" drop constraint "choice_restaurant_id_fkey",
  add constraint "restaurant_choice_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."choice" drop constraint "choice_name_id_fkey",
  add constraint "restaurant_choice_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."option_choice_map" drop constraint "option_choice_map_restaurant_id_fkey",
  add constraint "restaurant_option_choice_map_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."option" drop constraint "option_restaurant_id_fkey",
  add constraint "restaurant_option_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."option" drop constraint "option_name_id_fkey",
  add constraint "restaurant_option_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."item" drop constraint "item_restaurant_id_fkey",
  add constraint "restaurant_item_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."item" drop constraint "item_name_id_fkey",
  add constraint "restaurant_item_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."item" drop constraint "item_description_id_fkey",
  add constraint "restaurant_item_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."item" drop constraint "item_category_id_fkey",
  add constraint "restaurant_item_category_id_fkey"
  foreign key ("category_id")
  references "restaurant"."category"
  ("id") on update set null on delete set null;

alter table "restaurant"."category" drop constraint "category_description_id_fkey",
  add constraint "restaurant_category_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."category" drop constraint "category_name_id_fkey",
  add constraint "restaurant_category_name_id_fkey"
  foreign key ("name_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."category" drop constraint "category_restaurant_id_fkey",
  add constraint "restaurant_category_restaurant_id_fkey"
  foreign key ("restaurant_id")
  references "restaurant"."restaurant"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."restaurant" drop constraint "restaurant_description_id_fkey",
  add constraint "restaurant_description_id_fkey"
  foreign key ("description_id")
  references "public"."translation"
  ("id") on update restrict on delete restrict;

alter table "restaurant"."option_choice_map"
  add constraint "restaurant_option_choice_map_choice_id_fkey"
  foreign key ("choice_id")
  references "restaurant"."choice"
  ("id") on update cascade on delete cascade;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP FUNCTION public.restaurant_orders_by_month;
--
-- CREATE OR REPLACE FUNCTION restaurant.orders_by_month(res_id integer DEFAULT NULL::integer)
--  RETURNS mez_json
--  LANGUAGE sql
--  STABLE
-- AS $function$
-- SELECT json_agg(r)
-- FROM (
-- SELECT
-- json_build_object('month', TO_CHAR(TO_DATE (extract(month from order_time)::text, 'MM'), 'Month'),
-- 'total_orders', count(*),
-- 'total_cost', sum(totalcost(o)),
-- 'delivered', count(*) FILTER (WHERE status = 'delivered'),
-- 'cus_cancelled', count(*) FILTER (WHERE status = 'cancelledByCustomer'),
-- 'adm_cancelled', count(*) FILTER (WHERE status = 'cancelledByAdmin')) as json
-- FROM restaurant.order o
-- WHERE res_id IS NULL OR restaurant_id = res_id
-- GROUP BY extract(month from order_time)
-- ORDER BY extract(month from order_time) DESC) r
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP FUNCTION public.restaurant_orders_by_date;
--
-- CREATE OR REPLACE FUNCTION restaurant.orders_by_date(res_id integer DEFAULT NULL::integer)
--  RETURNS mez_json
--  LANGUAGE sql
--  STABLE
-- AS $function$
-- SELECT json_agg(r)
-- FROM (
-- SELECT
-- json_build_object('date', date(order_time),
-- 'total_orders', count(*),
-- 'total_cost', sum(totalcost(o)),
-- 'delivered', count(*) FILTER (WHERE status = 'delivered'),
-- 'cus_cancelled', count(*) FILTER (WHERE status = 'cancelledByCustomer'),
-- 'adm_cancelled', count(*) FILTER (WHERE status = 'cancelledByAdmin')) as json
-- FROM restaurant.order o
-- WHERE res_id IS NULL OR restaurant_id = res_id
-- GROUP BY date(order_time)
-- ORDER BY date(order_time) DESC) r
-- $function$;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- -- DROP FUNCTION restaurant_orders_by_date;
-- CREATE OR REPLACE FUNCTION public.restaurant_orders_by_month(res_id integer default null)
--  RETURNS mez_json
--  LANGUAGE sql
--  STABLE
-- AS $function$
-- SELECT json_agg(r)
-- FROM (
-- SELECT
-- json_build_object('month', TO_CHAR(TO_DATE (extract(month from order_time)::text, 'MM'), 'Month'),
-- 'total_orders', count(*),
-- 'total_cost', sum(totalcost(restaurant_order)),
-- 'delivered', count(*) FILTER (WHERE status = 'delivered'),
-- 'cus_cancelled', count(*) FILTER (WHERE status = 'cancelledByCustomer'),
-- 'adm_cancelled', count(*) FILTER (WHERE status = 'cancelledByAdmin')) as json
-- FROM restaurant_order
-- WHERE res_id IS NULL OR restaurant_id = res_id
-- GROUP BY extract(month from order_time)
-- ORDER BY extract(month from order_time) DESC) r
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- -- DROP FUNCTION restaurant_orders_by_date;
-- CREATE OR REPLACE FUNCTION public.restaurant_orders_by_date(res_id integer default null)
--  RETURNS mez_json
--  LANGUAGE sql
--  STABLE
-- AS $function$
-- SELECT json_agg(r)
-- FROM (
-- SELECT
-- json_build_object('date', date(order_time),
-- 'total_orders', count(*),
-- 'total_cost', sum(totalcost(restaurant_order)),
-- 'delivered', count(*) FILTER (WHERE status = 'delivered'),
-- 'cus_cancelled', count(*) FILTER (WHERE status = 'cancelledByCustomer'),
-- 'adm_cancelled', count(*) FILTER (WHERE status = 'cancelledByAdmin')) as json
-- FROM restaurant_order
-- WHERE res_id IS NULL OR restaurant_id = res_id
-- GROUP BY date(order_time)
-- ORDER BY date(order_time) DESC) r
-- $function$;

DROP TABLE "public"."mez_json";


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."chat" add column "chat_type" text
--  not null default 'group';

alter table "public"."direct_chat" rename column "user_id2" to "user_id_2";

alter table "public"."direct_chat" rename column "user_id1" to "user_id_1";

alter table "public"."chat_participant" drop constraint "chat_participant_app_type_id_fkey",
  add constraint "chat_participant_app_type_id_fkey"
  foreign key ("app_type_id")
  references "topology"."app_type"
  ("id") on update restrict on delete restrict;

DROP TABLE "public"."mez_admin_chat";

DROP TABLE "public"."direct_chat";

DROP TABLE "public"."service_provider_customer_chat";


alter view "restaurant"."order_public" rename to "restaurant_order_public";

alter table "restaurant"."order_item" rename to "restaurant_order_item";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.restaurant_operator_notification_token(restaurant_operator_row restaurant.operator)
--  RETURNS character varying
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT token
--     FROM notification_info n
--     WHERE n.user_id = restaurant_operator_row.user_id
--     AND n.app_type_id = 'restaurant';
-- $function$;

alter table "restaurant"."operator" rename to "restaurant_operator";

alter table "restaurant"."option_choice_map" rename to "restaurant_option_choice_map";

alter table "restaurant"."option" rename to "restaurant_option";

alter table "restaurant"."item_option_map" rename to "restaurant_item_option_map";

alter table "restaurant"."item" rename to "restaurant_item";

alter table "restaurant"."choice" rename to "restaurant_choice";

alter table "restaurant"."category" rename to "restaurant_category";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.cost(cart_row restaurant.cart)
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT SUM(quantity * cost_per_one)
--     FROM restaurant.cart_item
--     WHERE customer_id = cart_row.customer_id;
-- $function$
-- -- SELECT schema_name
-- -- FROM information_schema.schemata;
--
-- -- SELECT * FROM restaurant.cart;

alter table "restaurant"."cart_item" rename to "restaurant_cart_item";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.driver_notification_token(deliverer_row delivery.driver)
--  RETURNS character varying
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT token
--     FROM notification_info n
--     WHERE n.user_id = deliverer_row.user_id
--     AND n.app_type_id = 'delivery';
-- $function$;

alter table "delivery"."driver" rename to "delivery_driver";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.delivery_in_process(order_row delivery.order)
--  RETURNS boolean
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT order_row.status = 'orderReceived' OR order_row.status = 'packageReady' OR order_row.status = 'atPickup' OR order_row.status = 'onTheWayToDropoff' OR order_row.status = 'atDropoff'
-- $function$
--
-- -- CREATE OR REPLACE FUNCTION public.delivery_notification_token(delivery_row delivery.order)
-- --  RETURNS character varying
-- --  LANGUAGE sql
-- --  STABLE
-- -- AS $function$
-- --     SELECT token
-- --     FROM notification_info n
-- --     WHERE n.user_id = (
-- --     CASE
-- --         WHEN delivery_row.deliverer_app_type_id = 'restaurant' THEN (SELECT user_id FROM restaurant_operator r WHERE r.id = delivery_row.deliverer_id)
-- --         ELSE (SELECT user_id FROM deliverer WHERE deliverer.id = delivery_row.deliverer_id)
-- --     END
-- --     )
-- --     AND n.app_type_id = delivery_row.deliverer_app_type_id;
-- -- $function$;

alter table "delivery"."order" rename to "delivery_order";

alter view "delivery"."order_public" rename to "delivery_order_public";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- -- DROP FUNCTION public.deliop_notification_token;
-- CREATE OR REPLACE FUNCTION public.deliop_notification_token(delivery_operator_row delivery.operator)
--  RETURNS character varying
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT token
--     FROM notification_info n
--     WHERE n.user_id = delivery_operator_row.user_id
--     AND n.app_type_id = 'delivery_admin';
-- $function$;

alter table "delivery"."operator" rename to "delivery_operator";

alter table "delivery"."cost" rename to "delivery_cost";

alter table "delivery"."company" rename to "delivery_company";


-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE subscriber SET SCHEMA service_provider;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE service_link SET SCHEMA service_provider;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE post SET SCHEMA service_provider;

-- drop schema "service_provider" cascade;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE language SET SCHEMA public;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE app_type SET SCHEMA public;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE delivery_order_public SET SCHEMA delivery;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE delivery_cost SET SCHEMA delivery;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE delivery_operator SET SCHEMA delivery;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE delivery_company SET SCHEMA delivery;

-- drop schema "delivery" cascade;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE saved_location SET SCHEMA customer;

-- drop schema "customer" cascade;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE restaurant_order_public SET SCHEMA restaurant;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE restaurant_order_item SET SCHEMA restaurant;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE restaurant_operator SET SCHEMA restaurant;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE restaurant_choice SET SCHEMA restaurant;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE restaurant_option_choice_map SET SCHEMA restaurant;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE restaurant_option SET SCHEMA restaurant;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE restaurant_item_option_map SET SCHEMA restaurant;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE restaurant_item SET SCHEMA restaurant;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE restaurant_category SET SCHEMA restaurant;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE restaurant_cart_item SET SCHEMA restaurant;

-- -- Could not auto-generate a down migration.
-- -- Please write an appropriate down migration for the SQL below:
-- -- ALTER TABLE restaurant SET SCHEMA restaurant;

-- drop schema "restaurant" cascade;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE subscriber SET SCHEMA service_provider;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE service_link SET SCHEMA service_provider;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE post SET SCHEMA service_provider;

drop schema "service_provider" cascade;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE language SET SCHEMA public;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE app_type SET SCHEMA public;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE delivery_order_public SET SCHEMA delivery;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE delivery_cost SET SCHEMA delivery;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE delivery_operator SET SCHEMA delivery;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE delivery_company SET SCHEMA delivery;

drop schema "delivery" cascade;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE saved_location SET SCHEMA customer;

drop schema "customer" cascade;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE restaurant_order_public SET SCHEMA restaurant;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE restaurant_order_item SET SCHEMA restaurant;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE restaurant_operator SET SCHEMA restaurant;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE restaurant_choice SET SCHEMA restaurant;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE restaurant_option_choice_map SET SCHEMA restaurant;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE restaurant_option SET SCHEMA restaurant;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE restaurant_item_option_map SET SCHEMA restaurant;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE restaurant_item SET SCHEMA restaurant;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE restaurant_category SET SCHEMA restaurant;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE restaurant_cart_item SET SCHEMA restaurant;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- ALTER TABLE restaurant SET SCHEMA restaurant;

drop schema "restaurant" cascade;

alter table "public"."restaurant" add constraint "restaurant_payment_info_id_key" unique (payment_info_id);
alter table "public"."restaurant" alter column "payment_info_id" drop not null;
alter table "public"."restaurant" add column "payment_info_id" int4;


comment on column "public"."restaurant_order"."stripe_info" is NULL;

comment on column "public"."restaurant"."accepted_payments" is NULL;

comment on column "public"."customer"."stripe_info" is NULL;

comment on column "public"."restaurant"."stripe_info" is E'{   id: string;   status: string;   chargeFeesOnCustomer : boolean | null;   chargesEnabled: boolean;   payoutsEnabled: boolean;   detailsSubmitted: boolean;   requirements?: Array<string> | null;   email: string | null; }';


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP table "public"."stripe_info";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- DROP table "public"."service_provider_payment_info";

alter table "public"."restaurant"
  add constraint "restaurant_payment_info_id_fkey"
  foreign key ("payment_info_id")
  references "public"."service_provider_payment_info"
  ("id") on update restrict on delete restrict;

alter table "public"."delivery_order" alter column "stripe_payment_id" drop not null;
alter table "public"."delivery_order" add column "stripe_payment_id" int4;


alter table "public"."restaurant_order" alter column "chat_id" drop not null;

alter table "public"."user" alter column "language_id" drop not null;

alter table "public"."user" alter column "language_id" set not null;

ALTER TABLE "public"."user" ALTER COLUMN "language_id" drop default;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.delivery_in_process(order_row delivery_order)
--  RETURNS boolean
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT order_row.status = 'orderReceived' OR order_row.status = 'packageReady' OR order_row.status = 'atPickup' OR order_row.status = 'onTheWayToDropoff' OR order_row.status = 'atDropoff'
-- $function$;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."chat" add column "agora_info" jsonb
--  null;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery_order" add column "order_type" text
--  not null default 'restaurant';

DROP TABLE "public"."subscriber";

DROP TABLE "public"."post";

alter table "public"."restaurant_order" alter column "stripe_payment_id" drop not null;
alter table "public"."restaurant_order" add column "stripe_payment_id" int4;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION public.totalcost(order_row restaurant_order)
--  RETURNS money
--  LANGUAGE sql
--  STABLE
-- AS $function$
--     SELECT order_row.delivery_cost + order_row.itemsCost - order_row.refund_amount + order_row.stripe_fees
-- $function$
--
-- -- SELECT to_number((stripe_info #>> '{}')::json->'stripeFees') AS stripeFees FROM restaurant_order
-- -- WHERE id = 14;
--
-- -- SELECT (chat_info #>> '{}')::json->'CustomerApp'->>'chatTitle' AS CustomerApp FROM chat
-- -- WHERE id = 84;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "stripe_fees" money
--  not null default '0';

alter table "public"."restaurant_order" alter column "stripe_fees" set default 0;
alter table "public"."restaurant_order" alter column "stripe_fees" drop not null;
alter table "public"."restaurant_order" add column "stripe_fees" money;

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "stripe_fees" TYPE integer;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "stripe_fees" integer
--  not null default '0';

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery_order" add column "schedule_time" text
--  null;

comment on column "public"."delivery_order"."direction" is NULL;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."delivery_order" add column "direction" text
--  not null default 'to_customer';

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "stripe_info" TYPE json;

ALTER TABLE "public"."restaurant_order" ALTER COLUMN "stripe_info" TYPE jsonb;


-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant_order" add column "stripe_info" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."customer" add column "stripe_info" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant" add column "accepted_payments" jsonb
--  null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."restaurant" add column "stripe_info" jsonb
--  null;
