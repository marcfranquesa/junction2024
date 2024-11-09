CREATE TABLE
    features (
        feature_id INTEGER PRIMARY KEY AUTOINCREMENT,
        tag TEXT NOT NULL,
        status TEXT NOT NULL
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
        description TEXT NOT NULL,
        timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (feature_id) REFERENCES features (feature_id) ON DELETE CASCADE
    );

INSERT INTO
    features (tag, status)
VALUES
    ('Feature A', 'active'),
    ('Feature B', 'inactive'),
    ('Feature C', 'active'),
    ('Feature D', 'inactive'),
    ('Feature E', 'active');

INSERT INTO
    feature_users (feature_id, user_id)
VALUES
    (1, 101),
    (1, 102),
    (2, 103),
    (3, 101),
    (4, 104),
    (5, 105);

INSERT INTO
    feature_backlog (feature_id, status, description, timestamp)
VALUES
    (
        1,
        'backlog',
        'this is the description of this changes 123',
        '2024-11-01 10:00:00'
    ),
    (
        1,
        'in progress',
        'this is the description of this changes 456',
        '2024-11-02 12:30:00'
    ),
    (
        2,
        'backlog',
        'this is the description of this changes 789',
        '2024-11-01 14:00:00'
    ),
    (
        2,
        'deployed',
        'this is the description of this changes 123',
        '2024-11-03 16:00:00'
    ),
    (
        3,
        'backlog',
        'this is the description of this changes 456',
        '2024-11-01 09:00:00'
    ),
    (
        4,
        'in progress',
        'this is the description of this changes 789',
        '2024-11-02 11:00:00'
    ),
    (
        5,
        'deployed',
        'this is the description of this changes 000',
        '2024-11-03 17:00:00'
    );
