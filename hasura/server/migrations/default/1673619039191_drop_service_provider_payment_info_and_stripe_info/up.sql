
alter table "public"."restaurant" drop constraint "restaurant_payment_info_id_fkey";

DROP table "public"."service_provider_payment_info";

DROP table "public"."stripe_info";

comment on column "public"."restaurant"."stripe_info" is E'{ id: string; status: string; chargeFeesOnCustomer: boolean | null; chargesEnabled: boolean; payoutsEnabled: boolean; detailsSubmitted: boolean; requirements: string[] | null; email: string | null }';

comment on column "public"."customer"."stripe_info" is E'{     id: string,     idsWithServiceProvider: (Record of orderType and ids Object) {         restaurant: {Record of restaurantIds and stripeIdsWithServiceProvider}     },     cards: Record of cardId(string) and card object: {             id: string,             last4?: string,             brand?: string,             expMonth?: number,             expYear?: number,             idsWithServiceProvider: same as above,         }     } }';

comment on column "public"."restaurant"."accepted_payments" is E'Record of PaymentType(cash, card, bank transfer) and boolean';

comment on column "public"."restaurant_order"."stripe_info" is E'{ id: string, stripeFees: number, amountCharged: number, amountRefunded: number, chargeFeesOnCustomer: boolean |null; brand?: string, expMonth?: number, expYear?: number, last4?: string, status: (authorized, captured, cancelled), serviceProviderAccount: string }';
