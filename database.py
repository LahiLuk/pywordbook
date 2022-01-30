import psycopg2
import json


def get_conn_info():
    with open('config.json') as config:
        conn_info = json.load(config)
    return conn_info


def get_password(email):
    conn_info = get_conn_info()
    with psycopg2.connect(**conn_info) as conn:
        with conn.cursor() as cur:
            cur.execute("SELECT password from pywordbook.users WHERE email=%s", (email, ))
            password = cur.fetchone()

    if password:
        return password[0]
