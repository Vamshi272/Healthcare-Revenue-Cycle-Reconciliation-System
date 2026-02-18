-- ========================================
-- Sample Data for Healthcare RCM System
-- ========================================

-- Patients
INSERT INTO patients VALUES
(1, 'John Smith', '1985-03-12', 'Medicare'),
(2, 'Emma Johnson', '1990-07-25', 'Private'),
(3, 'Michael Brown', '1978-11-02', 'Medicaid'),
(4, 'Sophia Davis', '2001-05-15', 'Private'),
(5, 'Daniel Wilson', '1969-09-30', 'Medicare');

-- Providers
INSERT INTO providers VALUES
(1, 'Dr. Adams', 'Cardiology'),
(2, 'Dr. Lee', 'Orthopedics'),
(3, 'Dr. Patel', 'Internal Medicine');

-- Encounters
INSERT INTO encounters VALUES
(101, 1, 1, '2026-01-05', 'I10', '93000'),
(102, 2, 2, '2026-01-10', 'M54.5', '72100'),
(103, 3, 1, '2026-01-12', 'E11.9', '80053'),
(104, 4, 3, '2026-01-15', 'J20.9', '71020'),
(105, 5, 2, '2026-01-18', 'S83.241A', '73560');

-- Claims
INSERT INTO claims VALUES
(1001, 101, 500.00, 'Approved', '2026-01-06'),
(1002, 102, 1200.00, 'Denied', '2026-01-11'),
(1003, 103, 750.00, 'Approved', '2026-01-13'),
(1004, 104, 300.00, 'Approved', '2026-01-16'),
(1005, 105, 950.00, 'Denied', '2026-01-19');

-- Payments
INSERT INTO payments VALUES
(5001, 1001, 480.00, '2026-01-20'),
(5002, 1003, 750.00, '2026-01-25'),
(5003, 1004, 300.00, '2026-01-28');

-- Denials
INSERT INTO denials VALUES
(9001, 1002, 'Missing documentation', '2026-01-18'),
(9002, 1005, 'Coverage not eligible', '2026-01-25');
