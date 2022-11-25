SET check_function_bodies = false;
INSERT INTO public.restaurant (id, name, image, location_gps, location_text, description_id, firebase_id, schedule_id, payment_info_id, open_status, language_id, approved, service_provider_type, self_delivery) VALUES (1, 'Restaurant name', 'imageUrl', '0101000020E6100000CB4A9352D0E14540BF9A030473842640', 'Restaurant adress', NULL, NULL, 1, NULL, 'open', 'en', true, 'restaurant', true);
INSERT INTO public.restaurant_operator (id, user_id, restaurant_id, status, owner, notification_info_id, app_version, current_gps) VALUES (1, 3, 1, 'authorized', true, NULL, NULL, NULL);
SELECT pg_catalog.setval('public.restaurant_id_seq', 1, true);
SELECT pg_catalog.setval('public.restaurant_operator_id_seq', 1, true);
