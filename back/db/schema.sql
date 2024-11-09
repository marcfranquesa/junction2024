CREATE TABLE
    features (
        feature_id INTEGER PRIMARY KEY,
        tag TEXT NOT NULL,
        status TEXT NOT NULL
    );

CREATE TABLE
    feature_users (
        feature_id INTEGER,
        user_id INTEGER,
        PRIMARY KEY (feature_id, user_id),
        FOREIGN KEY (feature_id) REFERENCES features (feature_id) ON DELETE CASCADE
    );


CREATE TABLE
    feature_backlog (
        feature_id INTEGER,
        status TEXT NOT NULL,
        description TEXT NOT NULL,
        timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (feature_id, timestamp),
        FOREIGN KEY (feature_id) REFERENCES features (feature_id) ON DELETE CASCADE
    );

INSERT INTO
    features (feature_id, tag, status)
VALUES
    (1, 'Feature A', 'active'),
    (2, 'Feature B', 'inactive'),
    (3, 'Feature C', 'active'),
    (4, 'Feature D', 'inactive'),
    (5, 'Feature E', 'active');

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

