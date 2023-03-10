
alter table "delivery"."order" add column "change_price_request" jsonb
 null;

comment on column "delivery"."order"."change_price_request" is E'{ status: {requested, accepted, rejected}, newPrice: number, oldPrice: number, reason: string}';
