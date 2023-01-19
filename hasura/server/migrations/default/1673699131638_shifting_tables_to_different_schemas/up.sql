
create schema "restaurant";

ALTER TABLE restaurant SET SCHEMA restaurant;

ALTER TABLE restaurant_cart_item SET SCHEMA restaurant;

ALTER TABLE restaurant_category SET SCHEMA restaurant;

ALTER TABLE restaurant_item SET SCHEMA restaurant;

ALTER TABLE restaurant_item_option_map SET SCHEMA restaurant;

ALTER TABLE restaurant_option SET SCHEMA restaurant;

ALTER TABLE restaurant_option_choice_map SET SCHEMA restaurant;

ALTER TABLE restaurant_choice SET SCHEMA restaurant;

ALTER TABLE restaurant_operator SET SCHEMA restaurant;

ALTER TABLE restaurant_order_item SET SCHEMA restaurant;

ALTER TABLE restaurant_order_public SET SCHEMA restaurant;

create schema "customer";

ALTER TABLE saved_location SET SCHEMA customer;

create schema "delivery";

ALTER TABLE delivery_company SET SCHEMA delivery;

ALTER TABLE delivery_operator SET SCHEMA delivery;

ALTER TABLE delivery_cost SET SCHEMA delivery;

ALTER TABLE delivery_order_public SET SCHEMA delivery;

ALTER TABLE app_type SET SCHEMA public;

ALTER TABLE language SET SCHEMA public;

create schema "service_provider";

ALTER TABLE post SET SCHEMA service_provider;

ALTER TABLE service_link SET SCHEMA service_provider;

ALTER TABLE subscriber SET SCHEMA service_provider;
