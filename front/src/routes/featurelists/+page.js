import sqlite3 from 'sqlite3';

export async function load() {
  return new Promise((resolve, reject) => {
    const db = new sqlite3.Database('path/to/your/database.db', (err) => {
      if (err) {
        console.error("Failed to open database", err);
        reject(err);
      }
    });

    db.all("SELECT * FROM features", [], (err, rows) => {
      if (err) {
        console.error("Error fetching features", err);
        reject(err);
      }
      resolve({ features: rows });
    });
  });
}

