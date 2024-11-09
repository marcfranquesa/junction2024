CREATE TABLE
    features (
        feature_id SERIAL PRIMARY KEY,
        name TEXT NOT NULL,
        tag TEXT NOT NULL,
        description TEXT NOT NULL,
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
        timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (feature_id, timestamp),
        FOREIGN KEY (feature_id) REFERENCES features (feature_id) ON DELETE CASCADE
    );

-- Insert features into the 'features' table
INSERT INTO features (name, tag, description, status)
VALUES 
    ('Outage Monitoring', 'System Reliability', 'Monitoring and reporting of Datahub outages.', 'existing'),
    ('B2B Interface Response Times', 'Performance', 'Monitoring and reporting of stable B2B interface response times.', 'existing'),
    ('Service Request Processing', 'Service Management', 'Improved response times and reduced number of open service requests.', 'existing'),
    ('Customer Portal Reliability', 'System Reliability', 'Monitoring and improving the reliability of the customer portal process.', 'existing'),
    ('Data Quality Improvement', 'Data Management', 'Improving and monitoring the quality of customer and address information.', 'existing'),
    ('Unnecessary Data Updates', 'Data Management', 'Reducing unnecessary updates to customer and contract information.', 'existing'),
    ('Datahub 2.0 Delivery', 'Software Delivery', 'Ensuring the delivery of Datahub 2.0.', 'new'),
    ('Patch Version 1.9.0 Delivery', 'Software Delivery', 'Delivery of patch version 1.9.0 in September.', 'new'),
    ('Software Bug Repairs', 'Bug Fixes', 'Repair of software bugs in the backlog.', 'existing'),
    ('Improving Service Request Processing', 'Service Management', 'Improving the processing of service requests.', 'existing'),
    ('Transmission of the information required for the refund of installment 2 of the electricity subsidy from the data hub', 'Transmission', 'Transmission of the information required for the refund of installment 2 of the electricity subsidy from the data hub', 'new'),
    ('Telma and file format', 'Format', 'Telma and file format', 'new'),
    ('Change', 'Change', 'Change', 'modified'),
    ('Disconnection/connection times with minute accuracy', 'Time Accuracy', 'Reporting and processing disconnection/connection times with minute accuracy to Datahub.', 'new'),
    ('Metering data reminders', 'Data Reminders', 'Development needed for metering data reminders to avoid incorrect reminders.', 'modified'),
    ('New attribute for exact disconnection/connection time', 'Data Attribute', 'A new attribute is needed to handle the exact disconnection/connection time.', 'new'),
    ('Disconnection/connection times reported with minute accuracy', 'Time Accuracy', 'Disconnection/connection times are reported to Datahub with minute accuracy.', 'new'),
    ('Balance agreement situation at the beginning of the time step', 'Balance Agreement', 'The party whose balance the consumption goes to is determined according to the balance agreement situation at the beginning of the time step (15 min or 1 h).', 'new'),
    ('Balance agreement ends at the end of the time step', 'Balance Agreement', 'The balance agreement remains valid until the end of the disconnection time step (15 min/1 h) at the moment of disconnection.', 'new'),
    ('Balance agreement created from the beginning of the connection time step', 'Balance Agreement', 'The balance agreement is created from the beginning of the connection time step.', 'new'),
    ('Status of the point of use handled similarly to the balance agreement', 'Point of Use Status', 'The status of the point of use is handled similarly to the balance agreement.', 'new'),
    ('Disconnection time corresponds to the actual situation', 'Disconnection Time', 'The disconnection time in the system data corresponds to the actual situation.', 'new'),
    ('Handling of disconnection and connection in the same 15 min period', 'Disconnection/Connection Handling', 'Special rules for handling disconnection and connection in the same 15 min period to avoid overlap in balance agreements.', 'new'),
    ('Handling of disconnection and connection in the same hour', 'Disconnection/Connection Handling', 'Special rules for handling disconnection and connection in the same hour to avoid overlap in balance agreements.', 'new'),
    ('Point of use process', 'Process', 'More information in the appendix ''Amendment proposal 57 - options 1 and 2''', 'existing'),
    ('Point of use process', 'Process', '', 'existing'),
    ('Contract process', 'Process', 'More information in the appendices ''Development proposal-33 - review'' and ''Development condition-sockets 33 and 114''', 'existing'),
    ('Contract process', 'Process', '', 'existing'),
    ('Measurement data process', 'Process', '', 'existing'),
    ('measurement data process', 'Measurement Data', 'Change request based on Appendix 2 for the measurement data process.', 'new'),
    ('unified model for measurement data', 'Measurement Data', 'Aim for a unified model but revert to the DH 1.0 model due to current challenges.', 'new'),
    ('deliver zero measurement data', 'Measurement Data', 'Generate zero measurement data until the target is connected.', 'new'),
    ('measurement data ownership', 'Measurement Data', 'Determine the ownership of measurement data processed by the datahub.', 'new'),
    ('invoicing for less than a day', 'Invoicing', 'Enable invoicing for periods less than a day.', 'new'),
    ('billing based on the quarter', 'Invoicing', 'Support for billing based on quarterly data.', 'new'),
    ('return to DH 1.0 model', 'Operating Model', 'Revert to the DH 1.0 model as a temporary solution.', 'new'),
    ('mandatory measurement data', 'Measurement Data', 'Make sending measurement data mandatory for all parties.', 'new'),
    ('datahub returns missing values', 'Measurement Data', 'Datahub will return missing measurement values to the seller.', 'new'),
    ('final long-term operating model', 'Operating Model', 'Determine the final long-term operating model for the measurement data process.', 'new'),
    ('no temporary solution', 'Operating Model', 'Proceed without implementing a temporary solution, focus on the final model.', 'new'),
    ('netting calculation correction', 'Netting Calculation', 'Correction of object processing history for netting calculation under construction status.', 'new');


-- Insert feature-user associations into the 'feature_users' table
INSERT INTO feature_users (feature_id, user_id)
VALUES
    (1, 1), -- Example assuming feature ID starts from 1
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (6, 1),
    (7, 1),
    (8, 1),
    (9, 1),
    (10, 1),
    (11, 1),
    (12, 1),
    (13, 1),
    (14, 1),
    (15, 1),
    (16, 1),
    (17, 1),
    (18, 1),
    (19, 1),
    (20, 1),
    (21, 1),
    (22, 1),
    (23, 1),
    (24, 1),
    (25, 1),
    (26, 1),
    (27, 1),
    (28, 1),
    (29, 1),
    (30, 1),
    (31, 1),
    (32, 1),
    (33, 1),
    (34, 1),
    (35, 1),
    (36, 1),
    (37, 1),
    (38, 1),
    (39, 1),
    (40, 1);

-- Insert into feature backlog
INSERT INTO feature_backlog (feature_id, status)
VALUES
    (1, 'existing'),
    (2, 'existing'),
    (3, 'existing'),
    (4, 'existing'),
    (5, 'existing'),
    (6, 'existing'),
    (7, 'new'),
    (8, 'new'),
    (9, 'existing'),
    (10, 'existing'),
    (11, 'new'),
    (12, 'new'),
    (13, 'modified'),
    (14, 'new'),
    (15, 'modified'),
    (16, 'new'),
    (17, 'new'),
    (18, 'new'),
    (19, 'new'),
    (20, 'new'),
    (21, 'new'),
    (22, 'new'),
    (23, 'new'),
    (24, 'new'),
    (25, 'new'),
    (26, 'new'),
    (27, 'new'),
    (28, 'new');


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
