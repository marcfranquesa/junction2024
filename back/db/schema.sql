CREATE TABLE IF NOT EXISTS backlog (
    feature_id INTEGER PRIMARY KEY,
    status TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- start db with values
INSERT INTO backlog (feature_id, status)
VALUES
    (1, 'In Progress'),
    (2, 'Completed'),
    (3, 'Pending'),
    (4, 'In Progress'),
    (5, 'Completed');

