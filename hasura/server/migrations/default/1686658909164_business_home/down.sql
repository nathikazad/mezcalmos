
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
