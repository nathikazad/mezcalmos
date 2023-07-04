
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
