CREATE TABLE
    features (
        feature_id SERIAL PRIMARY KEY,
        name TEXT NOT NULL,
        tag TEXT NOT NULL,
        description TEXT NOT NULL,
        status TEXT NOT NULL,
        pdf TEXT NOT NULL
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
        timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (feature_id, timestamp),
        FOREIGN KEY (feature_id) REFERENCES features (feature_id) ON DELETE CASCADE
    );

-- Insert features into the 'features' table
INSERT INTO
    features (name, tag, description, status, pdf)
VALUES
    (
        'Outage Monitoring',
        'System Reliability',
        'Monitoring and reporting of Datahub outages.',
        'existing',
        'pdf15'
    ),
    (
        'B2B Interface Response Times',
        'Performance',
        'Monitoring and reporting of stable B2B interface response times.',
        'existing',
        'pdf03'
    ),
    (
        'Service Request Processing',
        'Service Management',
        'Improved response times and reduced number of open service requests.',
        'existing',
        'pdf28'
    ),
    (
        'Customer Portal Reliability',
        'System Reliability',
        'Monitoring and improving the reliability of the customer portal process.',
        'existing',
        'pdf07'
    ),
    (
        'Data Quality Improvement',
        'Data Management',
        'Improving and monitoring the quality of customer and address information.',
        'existing',
        'pdf18'
    ),
    (
        'Unnecessary Data Updates',
        'Data Management',
        'Reducing unnecessary updates to customer and contract information.',
        'existing',
        'pdf09'
    ),
    (
        'Datahub 2.0 Delivery',
        'Software Delivery',
        'Ensuring the delivery of Datahub 2.0.',
        'new',
        'pdf26'
    ),
    (
        'Patch Version 1.9.0 Delivery',
        'Software Delivery',
        'Delivery of patch version 1.9.0 in September.',
        'new',
        'pdf12'
    ),
    (
        'Software Bug Repairs',
        'Bug Fixes',
        'Repair of software bugs in the backlog.',
        'existing',
        'pdf33'
    ),
    (
        'Improving Service Request Processing',
        'Service Management',
        'Improving the processing of service requests.',
        'existing',
        'pdf05'
    ),
    (
        'Transmission of the information required for the refund of installment 2 of the electricity subsidy from the data hub',
        'Transmission',
        'Transmission of the information required for the refund of installment 2 of the electricity subsidy from the data hub',
        'new',
        'pdf21'
    ),
    (
        'Telma and file format',
        'Format',
        'Telma and file format',
        'new',
        'pdf08'
    ),
    ('Change', 'Change', 'Change', 'modified', 'pdf14'),
    (
        'Disconnection/connection times with minute accuracy',
        'Time Accuracy',
        'Reporting and processing disconnection/connection times with minute accuracy to Datahub.',
        'new',
        'pdf02'
    ),
    (
        'Metering data reminders',
        'Data Reminders',
        'Development needed for metering data reminders to avoid incorrect reminders.',
        'modified',
        'pdf16'
    ),
    (
        'New attribute for exact disconnection/connection time',
        'Data Attribute',
        'A new attribute is needed to handle the exact disconnection/connection time.',
        'new',
        'pdf30'
    ),
    (
        'Disconnection/connection times reported with minute accuracy',
        'Time Accuracy',
        'Disconnection/connection times are reported to Datahub with minute accuracy.',
        'new',
        'pdf01'
    ),
    (
        'Balance agreement situation at the beginning of the time step',
        'Balance Agreement',
        'The party whose balance the consumption goes to is determined according to the balance agreement situation at the beginning of the time step (15 min or 1 h).',
        'new',
        'pdf22'
    ),
    (
        'Balance agreement ends at the end of the time step',
        'Balance Agreement',
        'The balance agreement remains valid until the end of the disconnection time step (15 min/1 h) at the moment of disconnection.',
        'new',
        'pdf11'
    ),
    (
        'Balance agreement created from the beginning of the connection time step',
        'Balance Agreement',
        'The balance agreement is created from the beginning of the connection time step.',
        'new',
        'pdf25'
    ),
    (
        'Status of the point of use handled similarly to the balance agreement',
        'Point of Use Status',
        'The status of the point of use is handled similarly to the balance agreement.',
        'new',
        'pdf24'
    ),
    (
        'Disconnection time corresponds to the actual situation',
        'Disconnection Time',
        'The disconnection time in the system data corresponds to the actual situation.',
        'new',
        'pdf06'
    ),
    (
        'Handling of disconnection and connection in the same 15 min period',
        'Disconnection/Connection Handling',
        'Special rules for handling disconnection and connection in the same 15 min period to avoid overlap in balance agreements.',
        'new',
        'pdf17'
    ),
    (
        'Handling of disconnection and connection in the same hour',
        'Disconnection/Connection Handling',
        'Special rules for handling disconnection and connection in the same hour to avoid overlap in balance agreements.',
        'new',
        'pdf19'
    ),
    (
        'Point of use process',
        'Process',
        'More information in the appendix "Amendment proposal 57 - options 1 and 2"',
        'existing',
        'pdf29'
    ),
    (
        'Point of use process',
        'Process',
        '',
        'existing',
        'pdf04'
    ),
    (
        'Contract process',
        'Process',
        'More information in the appendices "Development proposal-33 - review" and "Development condition-sockets 33 and 114"',
        'existing',
        'pdf27'
    ),
    (
        'Contract process',
        'Process',
        '',
        'existing',
        'pdf23'
    ),
    (
        'Measurement data process',
        'Process',
        '',
        'existing',
        'pdf10'
    ),
    (
        'measurement data process',
        'Measurement Data',
        'Change request based on Appendix 2 for the measurement data process.',
        'new',
        'pdf20'
    ),
    (
        'unified model for measurement data',
        'Measurement Data',
        'Aim for a unified model but revert to the DH 1.0 model due to current challenges.',
        'new',
        'pdf32'
    ),
    (
        'deliver zero measurement data',
        'Measurement Data',
        'Generate zero measurement data until the target is connected.',
        'new',
        'pdf31'
    ),
    (
        'measurement data ownership',
        'Measurement Data',
        'Determine the ownership of measurement data processed by the datahub.',
        'new',
        'pdf13'
    ),
    (
        'invoicing for less than a day',
        'Invoicing',
        'Enable invoicing for periods less than a day.',
        'new',
        'pdf28'
    ),
    (
        'billing based on the quarter',
        'Invoicing',
        'Support for billing based on quarterly data.',
        'new',
        'pdf34'
    ),
    (
        'return to DH 1.0 model',
        'Operating Model',
        'Revert to the DH 1.0 model as a temporary solution.',
        'new',
        'pdf35'
    ),
    (
        'mandatory measurement data',
        'Measurement Data',
        'Make sending measurement data mandatory for all parties.',
        'new',
        'pdf36'
    ),
    (
        'datahub returns missing values',
        'Measurement Data',
        'Datahub will return missing measurement values to the seller.',
        'new',
        'pdf38'
    ),
    (
        'final long-term operating model',
        'Operating Model',
        'Determine the final long-term operating model for the measurement data process.',
        'new',
        'pdf39'
    ),
    (
        'no temporary solution',
        'Operating Model',
        'Proceed without implementing a temporary solution, focus on the final model.',
        'new',
        'pdf40'
    ),
    (
        'netting calculation correction',
        'Netting Calculation',
        'Correction of object processing history for netting calculation under construction status.',
        'new',
        'pdf37'
    );

-- Insert feature-user associations into the 'feature_users' table
INSERT INTO
    feature_users (feature_id, user_id)
VALUES
    (1, 3),
    (1, 7),
    (2, 2),
    (2, 5),
    (2, 9),
    (3, 1),
    (3, 4),
    (4, 6),
    (4, 10),
    (5, 2),
    (5, 8),
    (6, 3),
    (7, 5),
    (8, 1),
    (8, 6),
    (8, 7),
    (9, 4),
    (10, 3),
    (10, 10),
    (11, 1),
    (11, 2),
    (11, 8),
    (12, 5),
    (12, 6),
    (13, 2),
    (14, 7),
    (15, 3),
    (15, 9),
    (16, 4),
    (16, 10),
    (17, 5),
    (18, 1),
    (19, 8),
    (19, 7),
    (20, 6),
    (20, 3),
    (21, 9),
    (21, 10),
    (22, 2),
    (23, 4),
    (24, 7),
    (24, 8),
    (25, 5),
    (26, 6),
    (27, 9),
    (28, 10),
    (29, 1),
    (30, 2),
    (31, 3),
    (31, 5),
    (32, 4),
    (33, 7),
    (34, 6),
    (35, 8),
    (36, 10),
    (37, 2),
    (38, 3),
    (39, 1),
    (40, 9),
    (40, 7);

INSERT INTO
    feature_backlog (feature_id, status, timestamp)
VALUES
    (
        28,
        'modified after a client request',
        '2024-11-09 13:00:00'
    ),
    (
        28,
        'new feature added to backlog',
        '2024-11-08 12:15:00'
    ),
    (
        27,
        'modified after solving a bug',
        '2024-11-09 12:55:00'
    ),
    (
        27,
        'new feature identified',
        '2024-11-08 12:10:00'
    ),
    (
        26,
        'modified after team review',
        '2024-11-09 12:50:00'
    ),
    (
        26,
        'new feature added to planning',
        '2024-11-08 12:05:00'
    ),
    (
        25,
        'modified after feedback',
        '2024-11-09 12:55:00'
    ),
    (
        25,
        'initial feature creation',
        '2024-11-08 12:00:00'
    ),
    (
        24,
        'updated with new requirements',
        '2024-11-09 12:50:00'
    ),
    (24, 'new feature proposed', '2024-11-08 11:55:00'),
    (
        23,
        'adjusted after client review',
        '2024-11-09 12:00:00'
    ),
    (
        23,
        'feature added to project',
        '2024-11-08 11:50:00'
    ),
    (
        22,
        'revised for performance improvements',
        '2024-11-09 12:45:00'
    ),
    (22, 'new feature creation', '2024-11-08 11:45:00'),
    (
        21,
        'modified after testing',
        '2024-11-09 12:30:00'
    ),
    (
        21,
        'feature added to development',
        '2024-11-08 11:40:00'
    ),
    (
        20,
        'feature re-added after client feedback',
        '2024-11-09 12:40:00'
    ),
    (
        20,
        'modified after discussing in a meeting',
        '2024-11-09 12:25:00'
    ),
    (
        20,
        'initial feature creation',
        '2024-11-08 11:35:00'
    ),
    (
        19,
        'updated after bug fix',
        '2024-11-09 12:00:00'
    ),
    (
        19,
        'new feature requested by client',
        '2024-11-08 11:30:00'
    ),
    (
        18,
        'adjusted to align with project goals',
        '2024-11-09 12:20:00'
    ),
    (
        18,
        'feature proposal added',
        '2024-11-08 11:25:00'
    ),
    (
        17,
        'modified after meeting',
        '2024-11-09 12:00:00'
    ),
    (17, 'new feature added', '2024-11-08 11:20:00'),
    (
        16,
        'updated based on testing feedback',
        '2024-11-09 11:50:00'
    ),
    (16, 'new feature draft', '2024-11-08 11:15:00'),
    (
        15,
        're-added after discussion with stakeholders',
        '2024-11-09 11:55:00'
    ),
    (
        15,
        'modified for improved performance',
        '2024-11-09 11:40:00'
    ),
    (
        15,
        'feature removed due to change in scope',
        '2024-11-09 11:25:00'
    ),
    (
        15,
        'new feature initiated',
        '2024-11-08 11:10:00'
    ),
    (
        14,
        're-added after internal feedback',
        '2024-11-09 11:50:00'
    ),
    (
        14,
        'adjusted after team review',
        '2024-11-09 11:35:00'
    ),
    (
        14,
        'feature removed for restructuring',
        '2024-11-09 11:45:00'
    ),
    (
        14,
        'initial feature setup',
        '2024-11-08 11:05:00'
    ),
    (
        13,
        're-added after review session',
        '2024-11-09 11:25:00'
    ),
    (
        13,
        'feature removed after decision',
        '2024-11-09 11:10:00'
    ),
    (13, 'new feature added', '2024-11-08 11:00:00'),
    (
        12,
        'modified after bug report',
        '2024-11-09 11:30:00'
    ),
    (
        12,
        'feature added to queue',
        '2024-11-08 10:55:00'
    ),
    (
        11,
        'revised for better functionality',
        '2024-11-09 11:10:00'
    ),
    (11, 'new feature added', '2024-11-08 10:50:00'),
    (
        10,
        're-added after revision',
        '2024-11-09 11:15:00'
    ),
    (
        10,
        'modified after client feedback',
        '2024-11-09 11:00:00'
    ),
    (10, 'new feature proposal', '2024-11-08 10:45:00'),
    (
        9,
        'feature re-added after discussion',
        '2024-11-09 11:20:00'
    ),
    (
        9,
        'feature removed due to budget constraints',
        '2024-11-09 11:10:00'
    ),
    (9, 'updated after review', '2024-11-09 11:00:00'),
    (
        9,
        'initial feature creation',
        '2024-11-08 10:40:00'
    ),
    (
        8,
        'feature re-added for further review',
        '2024-11-09 11:20:00'
    ),
    (
        8,
        'feature removed due to change in direction',
        '2024-11-09 11:05:00'
    ),
    (8, 'updated after bug fix', '2024-11-09 10:45:00'),
    (8, 'new feature initiated', '2024-11-08 10:35:00'),
    (
        7,
        'modified for UI improvements',
        '2024-11-09 10:55:00'
    ),
    (7, 'new feature proposed', '2024-11-08 10:30:00'),
    (
        6,
        'adjusted after client request',
        '2024-11-09 10:30:00'
    ),
    (6, 'new feature added', '2024-11-08 10:25:00'),
    (
        5,
        're-added for functionality review',
        '2024-11-09 10:55:00'
    ),
    (
        5,
        'feature removed for technical reasons',
        '2024-11-09 10:40:00'
    ),
    (5, 'new feature added', '2024-11-08 10:20:00'),
    (
        4,
        'feature re-added after technical evaluation',
        '2024-11-09 11:00:00'
    ),
    (
        4,
        'feature removed after review',
        '2024-11-09 10:50:00'
    ),
    (
        4,
        'updated for new requirements',
        '2024-11-09 10:45:00'
    ),
    (4, 'new feature proposal', '2024-11-08 10:15:00'),
    (
        3,
        're-added after bug resolution',
        '2024-11-09 10:40:00'
    ),
    (
        3,
        'feature removed after stakeholder decision',
        '2024-11-09 10:25:00'
    ),
    (
        3,
        'modified after design changes',
        '2024-11-09 10:15:00'
    ),
    (
        3,
        'initial feature created',
        '2024-11-08 10:10:00'
    ),
    (
        2,
        're-added after scope review',
        '2024-11-09 10:50:00'
    ),
    (
        2,
        'modified after testing',
        '2024-11-09 10:35:00'
    ),
    (2, 'new feature added', '2024-11-08 10:05:00'),
    (
        1,
        're-added for user testing',
        '2024-11-09 10:40:00'
    ),
    (
        1,
        'modified after feedback session',
        '2024-11-09 10:25:00'
    ),
    (
        1,
        'feature removed after meeting',
        '2024-11-09 10:30:00'
    ),
    (1, 'new feature proposal', '2024-11-08 10:00:00');

-- INSERT INTO
--     features (feature_id, name, tag, description, status)
-- VALUES
--     (1, 'Feature A', 'Feature A', 'Description for Feature A', 'active'),
--     (2, 'Feature B', 'Feature B', 'Description for Feature B', 'inactive'),
--     (3, 'Feature C', 'Feature C', 'Description for Feature C', 'active'),
--     (4, 'Feature D', 'Feature D', 'Description for Feature D', 'inactive'),
--     (5, 'Feature E', 'Feature E', 'Description for Feature E', 'active');
-- 
-- INSERT INTO
--     feature_users (feature_id, user_id)
-- VALUES
--     (1, 101),
--     (1, 102),
--     (2, 103),
--     (3, 101),
--     (4, 104),
--     (5, 105);
-- 
-- INSERT INTO
--     feature_backlog (feature_id, status, timestamp)
-- VALUES
--     (
--         1,
--         'backlog',
--         '2024-11-01 10:00:00'
--     ),
--     (
--         1,
--         'in progress',
--         '2024-11-02 12:30:00'
--     ),
--     (
--         2,
--         'backlog',
--         '2024-11-01 14:00:00'
--     ),
--     (
--         2,
--         'deployed',
--         '2024-11-03 16:00:00'
--     ),
--     (
--         3,
--         'backlog',
--         '2024-11-01 09:00:00'
--     ),
--     (
--         4,
--         'in progress',
--         '2024-11-02 11:00:00'
--     ),
--     (
--         5,
--         'deployed',
--         '2024-11-03 17:00:00'
--     );
--