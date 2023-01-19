
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
