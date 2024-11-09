CREATE TABLE
    features (
        feature_id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        tag TEXT NOT NULL,
        client_list TEXT NOT NULL,
        status TEXT NOT NULL,
        description TEXT NOT NULL
    );

CREATE TABLE
    feature_users (
        feature_id INTEGER,
        user_id INTEGER,
        PRIMARY KEY (feature_id, user_id),
        FOREIGN KEY (feature_id) REFERENCES features (feature_id) ON DELETE CASCADE,
        FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE
    );

CREATE TABLE
    feature_backlog (
        backlog_id INTEGER PRIMARY KEY AUTOINCREMENT,
        feature_id INTEGER,
        status TEXT NOT NULL,
        timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (feature_id) REFERENCES features (feature_id) ON DELETE CASCADE
    );

INSERT INTO
    features (name, tag, client_list, description, status)
VALUES
    (
        'Feature A',
        'Tag 1',
        'Client 1, Client 2',
        'this is the description of this changes 123',
        'active'
    ),
    (
        'Feature B',
        'Tag 1',
        'Client 3, Client 4',
        'this is the description of this changes 123',
        'inactive'
    ),
    (
        'Feature C',
        'Tag 1',
        'Client 5, Client 6',
        'this is the description of this changes 123',
        'active'
    ),
    (
        'Feature D',
        'Tag 2',
        'Client 7, Client 8',
        'this is the description of this changes 123',
        'inactive'
    ),
    (
        'Feature E',
        'Tag 3',
        'Client 9, Client 10',
        'this is the description of this changes 123',
        'active'
    );

INSERT INTO
    feature_backlog (feature_id, status, timestamp)
VALUES
    (1, 'backlog', '2024-11-01 10:00:00'),
    (1, 'in progress', '2024-11-02 12:30:00'),
    (2, 'backlog', '2024-11-01 14:00:00'),
    (2, 'deployed', '2024-11-03 16:00:00'),
    (3, 'backlog', '2024-11-01 09:00:00'),
    (4, 'in progress', '2024-11-02 11:00:00'),
    (5, 'deployed', '2024-11-03 17:00:00');

INSERT INTO
    feature_users (feature_id, user_id)
VALUES
    (1, 101),
    (1, 102),
    (2, 103),
    (3, 101),
    (4, 104),
    (5, 105);