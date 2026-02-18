-- ============================
-- Healthcare Revenue Cycle Schema
-- ============================

-- 1️⃣ Patients Table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    date_of_birth DATE,
    insurance_type VARCHAR(50)
);

-- 2️⃣ Providers Table
CREATE TABLE providers (
    provider_id INT PRIMARY KEY,
    provider_name VARCHAR(100),
    specialty VARCHAR(100)
);

-- 3️⃣ Encounters Table (Patient Visits)
CREATE TABLE encounters (
    encounter_id INT PRIMARY KEY,
    patient_id INT,
    provider_id INT,
    visit_date DATE,
    diagnosis_code VARCHAR(20),
    procedure_code VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (provider_id) REFERENCES providers(provider_id)
);

-- 4️⃣ Claims Table
CREATE TABLE claims (
    claim_id INT PRIMARY KEY,
    encounter_id INT,
    claim_amount DECIMAL(10,2),
    claim_status VARCHAR(20),  -- Submitted, Approved, Denied
    submission_date DATE,
    FOREIGN KEY (encounter_id) REFERENCES encounters(encounter_id)
);

-- 5️⃣ Payments Table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    claim_id INT,
    paid_amount DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (claim_id) REFERENCES claims(claim_id)
);

-- 6️⃣ Denials Table
CREATE TABLE denials (
    denial_id INT PRIMARY KEY,
    claim_id INT,
    denial_reason VARCHAR(255),
    denial_date DATE,
    FOREIGN KEY (claim_id) REFERENCES claims(claim_id)
);
