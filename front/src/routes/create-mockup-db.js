import sqlite3 from 'sqlite3';
sqlite3.verbose();

// Create a new SQLite database (it will be created if it doesn't exist)
const db = new sqlite3.Database('./src/routes/features.db', (err) => {
	if (err) {
		console.error('Error opening database:', err.message);
		return;
	}
	console.log('Database opened successfully.');
});

// Create the 'features' table
const createFeaturesTableQuery = `
  DROP TABLE IF EXISTS features;
  CREATE TABLE features (
    feature_id INTEGER PRIMARY KEY AUTOINCREMENT,
    tag TEXT NOT NULL,
    client_list TEXT NOT NULL,
    status TEXT NOT NULL
  )
`;

db.run(createFeaturesTableQuery, function (err) {
	if (err) {
		console.error('Error creating features table:', err.message);
		return;
	}
	console.log('Features table created successfully.');
});

// Create the 'feature_backlog' table with a foreign key reference to 'features'
const createBacklogTableQuery = `
  DROP TABLE IF EXISTS feature_backlog;
  CREATE TABLE feature_backlog (
    backlog_id INTEGER PRIMARY KEY AUTOINCREMENT,
    feature_id INTEGER,
    status TEXT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (feature_id) REFERENCES features (feature_id) ON DELETE CASCADE
  )
`;

db.run(createBacklogTableQuery, function (err) {
	if (err) {
		console.error('Error creating feature_backlog table:', err.message);
		return;
	}
	console.log('Feature backlog table created successfully.');
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

db.run(insertFeaturesQuery, function (err) {
	if (err) {
		console.error('Error inserting features data:', err.message);
		return;
	}
	console.log('Mock features inserted successfully.');
});

// Insert mock data into the 'feature_backlog' table
const insertBacklogQuery = `
  INSERT INTO feature_backlog (feature_id, status, timestamp)
  VALUES
    (1, 'backlog', '2024-11-01 10:00:00'),
    (1, 'in progress', '2024-11-02 12:30:00'),
    (2, 'backlog', '2024-11-01 14:00:00'),
    (2, 'deployed', '2024-11-03 16:00:00'),
    (3, 'backlog', '2024-11-01 09:00:00'),
    (4, 'in progress', '2024-11-02 11:00:00'),
    (5, 'deployed', '2024-11-03 17:00:00')
`;

db.run(insertBacklogQuery, function (err) {
	if (err) {
		console.error('Error inserting feature_backlog data:', err.message);
		return;
	}
	console.log('Mock feature_backlog inserted successfully.');
});
