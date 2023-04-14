
alter table "business"."business" rename column "points" to "referral_points";

alter table "business"."business" alter column "profile" set default 'surfShop, vehicleRental, homeRental, wellnessClass, party, volunteer, tourAgency, therapy';

ALTER TABLE "business"."business" ALTER COLUMN "profile" drop default;
comment on column "business"."business"."profile" is E'surfShop, vehicleRental, homeRental, wellnessClass, party, volunteer, tourAgency, therapy';

alter table "business"."service" alter column "category2" set default 'uncategorized';
alter table "business"."service" alter column "category2" set not null;

DROP table "business"."class";

alter table "business"."rental" add column "category3" text
 not null default 'uncategorized';
