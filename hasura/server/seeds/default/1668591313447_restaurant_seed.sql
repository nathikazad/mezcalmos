SET check_function_bodies = false;
-- INSERT INTO public."user" (id, firebase_id, name, image, language_id, deleted) VALUES (1, '1', 'asd', NULL, 'en', false);
-- INSERT INTO public."user" (id, firebase_id, name, image, language_id, deleted) VALUES (2, '2', 'testop', 'abc', 'en', false);
-- -- INSERT INTO topology.language (id) VALUES ('en');
-- -- INSERT INTO topology.language (id) VALUES ('es');

INSERT INTO topology.app_type (id) VALUES ('restaurant');
-- INSERT INTO topology.app_type (id) VALUES ('customer_mobile');
-- INSERT INTO topology.app_type (id) VALUES ('customer_web');
-- INSERT INTO public.notification_info (id, user_id, app_type_id, token) VALUES (3, 3, 'RestaurantApp', 'abc');
-- INSERT INTO public.notification_info (id, user_id, app_type_id, token) VALUES (2, 2, 'CustomerMobile', 'xyz');
-- -- INSERT INTO public.mez_admin (user_id, notification_info_id, version) VALUES (3, 3, NULL);

INSERT INTO public.restaurant (id, name, image, location_gps, location_text, description_id, firebase_id, schedule, payment_info_id, open_status, language_id, approved) VALUES (1, 'qwe', 'qwe', '0101000020E6100000CB4A9352D0E14540BF9A030473842640', 'abc', NULL, NULL, NULL, NULL, 'open', 'en', true);
INSERT INTO public.translation (id,service_provider_id,service_provider_type) VALUES (1,1,'restaurant');
INSERT INTO public.translation (id,service_provider_id,service_provider_type) VALUES (2,1,'restaurant');
INSERT INTO public.translation (id,service_provider_id,service_provider_type) VALUES (3,1,'restaurant');

INSERT INTO public.customer (user_id, app_version) VALUES (3, '1.0');
INSERT INTO public.restaurant_cart (customer_id , restaurant_id ) VALUES (3, 1);
INSERT INTO public.restaurant_category (id, name_id, description_id, "position", restaurant_id, schedule_id) VALUES (1, 3, NULL, 1, 1, NULL);

INSERT INTO public.restaurant_item (id, name_id, description_id, "position", category_id, available, item_type, restaurant_id, special_period_start, special_period_end, archived, cost) VALUES (1, 1, NULL, 0, 1, true, 'daily', 1, NULL, NULL, false, '$25.00');
INSERT INTO public.restaurant_item (id, name_id, description_id, "position", category_id, available, item_type, restaurant_id, special_period_start, special_period_end, archived, cost) VALUES (2, 2, NULL, 0, 1, true, 'daily', 1, NULL, NULL, false, '$30.00');
INSERT INTO public.restaurant_cart_item (id, restaurant_item_id, customer_id, selected_options, quantity, cost_per_one, note) VALUES (10, 1, 3, '{}', 1, '$25.00', NULL);
INSERT INTO public.restaurant_cart_item (id, restaurant_item_id, customer_id, selected_options, quantity, cost_per_one, note) VALUES (11, 2, 3, '{}', 1, '$25.00', NULL);
INSERT INTO public.restaurant_operator (id, user_id, restaurant_id, status, owner, app_version, current_gps) VALUES (1, 4, 1, 'authorized', false, NULL, NULL);
INSERT INTO public.translation_value (translation_id, language_id, value) VALUES (1, 'en', 'item 1 description en');
INSERT INTO public.translation_value (translation_id, language_id, value) VALUES (1, 'es', 'item 1 description es');
INSERT INTO public.translation_value (translation_id, language_id, value) VALUES (2, 'en', 'item 2 description en');
INSERT INTO public.translation_value (translation_id, language_id, value) VALUES (2, 'es', 'item 2 description es');
INSERT INTO public.translation_value (translation_id, language_id, value) VALUES (3, 'en', 'category 1 en');
INSERT INTO public.translation_value (translation_id, language_id, value) VALUES (3, 'es', 'category 1 es');
SELECT pg_catalog.setval('public.notification_info_id_seq', 3, true);
SELECT pg_catalog.setval('public.restaurant_cart_id_seq', 11, true);
SELECT pg_catalog.setval('public.restaurant_category_id_seq', 1, true);
SELECT pg_catalog.setval('public.restaurant_id_seq', 1, true);
SELECT pg_catalog.setval('public.restaurant_item_id_seq', 2, true);
SELECT pg_catalog.setval('public.restaurant_operator_id_seq', 1, true);
SELECT pg_catalog.setval('public.translation_id_seq', 3, true);
SELECT pg_catalog.setval('public.user_id_seq', 3, true);
