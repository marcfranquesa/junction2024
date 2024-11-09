import os

import psycopg2

dbname = os.getenv("POSTGRES_DB", "mydatabase")
user = os.getenv("POSTGRES_USER", "myuser")
password = os.getenv("POSTGRES_PASSWORD", "mypassword")
host = "localhost"
port = os.getenv("POSTGRES_PORT", 5432)

conn = psycopg2.connect(
    dbname=dbname, user=user, password=password, host=host, port=port
)

cur = conn.cursor()

cur.execute("SELECT * FROM backlog;")

print("Rows in backlog table:")
rows = cur.fetchall()

for row in rows:
    print(row)

cur.close()
conn.close()
