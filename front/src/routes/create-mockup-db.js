import sqlite3 from 'sqlite3';
sqlite3.verbose();

// Create a new SQLite database (it will be created if it doesn't exist)
const db = new sqlite3.Database('./features.db', (err) => {
  if (err) {
    console.error("Error opening database:", err.message);
    return;
  }
  console.log("Database opened successfully.");
});

// Create the 'features' table
const createFeaturesTableQuery = `
  CREATE TABLE IF NOT EXISTS features (
    feature_id INTEGER PRIMARY KEY AUTOINCREMENT,
    tag TEXT NOT NULL,
    client_list TEXT NOT NULL,
    status TEXT NOT NULL
  )
`;

db.run(createFeaturesTableQuery, function(err) {
  if (err) {
    console.error("Error creating features table:", err.message);
    return;
  }
  console.log("Features table created successfully.");
});

// Create the 'feature_backlog' table with a foreign key reference to 'features'
const createBacklogTableQuery = `
  CREATE TABLE IF NOT EXISTS feature_backlog (
    backlog_id INTEGER PRIMARY KEY AUTOINCREMENT,
    feature_id INTEGER,
    status TEXT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (feature_id) REFERENCES features (feature_id) ON DELETE CASCADE
  )
`;

db.run(createBacklogTableQuery, function(err) {
  if (err) {
    console.error("Error creating feature_backlog table:", err.message);
    return;
  }
  console.log("Feature backlog table created successfully.");
});

// Insert mock data into the 'features' table
const insertFeaturesQuery = `
  INSERT INTO features (tag, client_list, status)
  VALUES
    ('Feature A', 'Client 1, Client 2', 'active'),
    ('Feature B', 'Client 3, Client 4', 'inactive'),
    ('Feature C', 'Client 5, Client 6', 'active'),
    ('Feature D', 'Client 7, Client 8', 'inactive'),
    ('Feature E', 'Client 9, Client 10', 'active')
`;

db.run(insertFeaturesQuery, function(err) {
  if (err) {
    console.error("Error inserting features data:", err.message);
    return;
  }
  console.log("Mock features inserted successfully.");
});

// Insert mock data into the 'feature_backlog' ta

