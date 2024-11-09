import os
import json
from pathlib import Path

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


def read_json_files_from_directory(directory_path):
    # Directory path as a Path object
    directory = Path(directory_path)
    
    # List to store data from each JSON file
    json_data_list = []
    
    # Loop through all JSON files in the directory
    for json_file in directory.glob('*.json'):
        try:
            with open(json_file, 'r', encoding='utf-8') as file:
                data = json.load(file)
                json_data_list.append(data)  # Append JSON data to the list
        except Exception as e:
            print(f"Error reading {json_file}: {e}")

    return json_data_list

# Example usage
directory_path = "data/outputs"
for x, _, _ in os.walk(directory_path):
    data = read_json_files_from_directory(x)
    if len(data) > 0:
        data = data[0]["resp"]
        

    query = f"""

    """
cur.execute("SELECT * FROM backlog;")

print("Rows in backlog table:")
rows = cur.fetchall()

for row in rows:
    print(row)

cur.close()
conn.close()
