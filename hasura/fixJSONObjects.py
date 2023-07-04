import psycopg2
import json

# Connect to your postgres DB
# For Staging
conn = psycopg2.connect(
    dbname="neondb", 
    user="nathikazad", 
    password="ytbG5ZqMg0HL", 
    host="delicate-hat-528922.us-east-2.aws.neon.tech",
    options="project=delicate-hat-528922",
    sslmode="require"
)

# For Production
# conn = psycopg2.connect(
#     dbname="dflqbscupue298",
#     user="u71kjd2ku3jskj",
#     password="p95a268ff6113c0aa26cc4edb853c47b7dd49acfe64fe5d56190f8cd7a7791ff1",
#     host="ec2-54-236-225-47.compute-1.amazonaws.com",
#     port="5432",
#     sslmode="require"
# )

# Open a cursor to perform database operations
cur = conn.cursor()

# Execute a query
cur.execute("SELECT id, schedule FROM service_provider.details WHERE schedule IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE service_provider.details SET schedule = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, schedule FROM business.event WHERE schedule IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE business.event SET schedule = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, image FROM business.item_details WHERE image IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE business.item_details SET image = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, additional_parameters FROM business.item_details WHERE additional_parameters IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE business.item_details SET additional_parameters = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, parameters FROM business.order_request_item WHERE parameters IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE business.order_request_item SET parameters = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, schedule FROM business.service WHERE schedule IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE business.service SET schedule = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, sp_card_ids FROM customer.stripe_cards WHERE sp_card_ids IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE customer.stripe_cards SET sp_card_ids = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, stripe_info FROM delivery.courier_order WHERE stripe_info IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE delivery.courier_order SET stripe_info = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, stripe_info FROM delivery.courier_order WHERE stripe_info IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE delivery.courier_order SET stripe_info = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, change_price_request FROM delivery.order WHERE change_price_request IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE delivery.order SET change_price_request = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, stripe_info FROM laundry.order WHERE stripe_info IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE laundry.order SET stripe_info = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, messages FROM public.chat WHERE messages IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE public.chat SET messages = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, chat_info FROM public.chat WHERE chat_info IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE public.chat SET chat_info = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, last_message FROM public.chat WHERE last_message IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE public.chat SET last_message = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, selected_options FROM restaurant.cart_item WHERE selected_options IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE restaurant.cart_item SET selected_options = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, stripe_info FROM restaurant.order WHERE stripe_info IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE restaurant.order SET stripe_info = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, in_json FROM restaurant.order_item WHERE in_json IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE restaurant.order_item SET in_json = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, schedule FROM service_provider.details WHERE schedule IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE service_provider.details SET schedule = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, accepted_payments FROM service_provider.details WHERE accepted_payments IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE service_provider.details SET accepted_payments = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, language FROM service_provider.details WHERE language IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE service_provider.details SET language = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")


# Execute a query
cur.execute("SELECT id, requirements FROM service_provider.stripe_info WHERE requirements IS NOT NULL")

# Fetch all the rows
rows = cur.fetchall()

for row in rows:
    try:
        # parse the JSON
        parsed_json = json.loads(row[1])

        # write it back to the database
        cur.execute("UPDATE service_provider.stripe_info SET requirements = %s WHERE id = %s", 
                    (json.dumps(parsed_json), row[0]))
        conn.commit()  # Don't forget to commit after each update to save changes
    except TypeError:
        print(f"Skipping row with id {row[0]} due to TypeError")

# Close communication with the database
cur.close()
conn.close()