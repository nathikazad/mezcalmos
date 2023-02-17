alter table "delivery"."order" add column "package_ready" boolean
 not null default 'false';
