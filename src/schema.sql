.open fittrackpro.db
.mode column

CREATE TABLE locations (
    location_id TEXT NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    phone_number INTEGER NOT NULL ,
    email UNIQUE CHECK (email IS NULL OR instr(email, '@') > 1),
    opening_hours TIME TEXT
    );

CREATE TABLE members (
    member_id TEXT NOT NULL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email UNIQUE CHECK (email IS NULL OR instr(email, '@') > 1),
    phone_number INTEGER NOT NULL,
    date_of_birth DATE TEXT NOT NULL,
    join_date DATE TEXT NOT NULL,
    emergency_contact_name TEXT NOT NULL,
    emergency_contact_phone INTEGER NOT NULL
    );

CREATE TABLE staff (
    staff_id TEXT NOT NULL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email UNIQUE CHECK (email IS NULL OR instr(email, '@') > 1),
    phone_number INTEGER NOT NULL,
    position TEXT NOT NULL CHECK(position IN ('Trainer', 'Manager', 'Receptionist', 'Maintenance'))
    hire_date DATE TEXT NOT NULL,
    location_id TEXT NOT NULL 
    );
    
CREATE TABLE equipment (
    equipment_id TEXT NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    type TEXT NOT NULL CHECK(type IN ('Cardio', 'Strength'))
    purchase_date DATE TEXT NOT NULL,
    last_maintenance_date DATE TEXT NOT NULL,
    next_maintenance_date DATE TEXT NOT NULL,
    location_id TEXT NOT NULL
    );

CREATE TABLE classes (
    class_id TEXT NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    capacity INTEGER NOT NULL,
    duration INTEGER NOT NULL,
    location_id TEXT NOT NULL
    );

CREATE TABLE class_schedule (
    schedule_id TEXT NOT NULL,
    class_id TEXT NOT NULL,
    staff_id TEXT NOT NULL,
    start_time DATE TIME TEXT NOT NULL,
    end_time DATE TIME TEXT NOT NULL
    );

CREATE TABLE memberships (
    membership_id TEXT NOT NULL PRIMARY KEY,
    member_id TEXT NOT NULL,
    type TEXT NOT NULL CHECK (type IN ('Premium', 'Standard')
    start_date DATE TEXT NOT NULL,
    end_date DATE TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('Active', 'Inactive'))
    );

CREATE TABLE attendance (
    attendance_id TEXT NOT NULL PRIMARY KEY,
    member_id TEXT NOT NULL,
    location_id TEXT NOT NULL,
    check_in_time DATE TIME TEXT NOT NULL,
    check_out_time DATE TIME TEXT NOT NULL
    );

CREATE TABLE class_attendance (
    class_attendance_id TEXT NOT NULL PRIMARY KEY,
    schedule_id TEXT NOT NULL,
    member_id TEXT NOT NULL,
    attendance_status TEXT NOT NULL CHECK(attendance_status IN 'Registered', 'Attended', 'Unattended'))
    );

CREATE TABLE payments (
    payment_id,
    member_id,
    amount,
    payment_date,
    payment_method,
    payment_type
    );

CREATE TABLE personal_training_sessions (
    session_id,
    member_id,
    staff_id,
    session_date,
    start_time,
    end_time,
    notes
    );

CREATE TABLE member_health_metrics (
    metric_id,
    member_id,
    measurement_date,
    weight,
    body_fat_percentage,
    muscle_mass,
    bmi
    );

CREATE TABLE equipment_maintenance_log (
    log_id,
    equipment_id,
    maintenance_date,
    description,
    staff_id
    );

