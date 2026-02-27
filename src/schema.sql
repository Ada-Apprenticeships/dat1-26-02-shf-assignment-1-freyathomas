.open fittrackpro.db
.mode column

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS locations;

CREATE TABLE locations (
    location_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    phone_number INTEGER NOT NULL ,
    email UNIQUE CHECK (email IS NULL OR instr(email, '@') > 1),
    opening_hours TEXT NOT NULL
    );

DROP TABLE IF EXISTS members;

CREATE TABLE members (
    member_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email UNIQUE CHECK (email IS NULL OR instr(email, '@') > 1),
    phone_number TEXT NOT NULL,
    date_of_birth TEXT NOT NULL,
    join_date TEXT NOT NULL,
    emergency_contact_name TEXT NOT NULL,
    emergency_contact_phone TEXT NOT NULL
    );

DROP TABLE IF EXISTS staff;

CREATE TABLE staff (
    staff_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email UNIQUE CHECK (email IS NULL OR instr(email, '@') > 1),
    phone_number TEXT NOT NULL,
    position TEXT NOT NULL CHECK(position IN ('Trainer', 'Manager', 'Receptionist', 'Maintenance')),
    hire_date TEXT NOT NULL,
    location_id INTEGER NOT NULL,
    FOREIGN KEY (location_id) 
        REFERENCES locations(location_id)
        ON DELETE NO ACTION

    );

DROP TABLE IF EXISTS equipment;

CREATE TABLE equipment (
    equipment_id TEXT NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    type TEXT NOT NULL CHECK(type IN ('Cardio', 'Strength')),
    purchase_date TEXT NOT NULL,
    last_maintenance_date TEXT NOT NULL,
    next_maintenance_date TEXT NOT NULL,
    location_id INTEGER NOT NULL,
    FOREIGN KEY (location_id) 
        REFERENCES locations(location_id)
        ON DELETE NO ACTION
    );

DROP TABLE IF EXISTS classes;

CREATE TABLE classes (
    class_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    capacity INTEGER NOT NULL,
    duration INTEGER NOT NULL,
    location_id INTEGER NOT NULL,
    FOREIGN KEY (location_id) 
        REFERENCES locations(location_id)
        ON DELETE NO ACTION
    );

DROP TABLE IF EXISTS class_schedule;

CREATE TABLE class_schedule (
    schedule_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    staff_id INTEGER NOT NULL,
    start_time TEXT NOT NULL,
    end_time TEXT NOT NULL,
    FOREIGN KEY (class_id) 
        REFERENCES classes(class_id)
        ON DELETE NO ACTION,
    FOREIGN KEY (staff_id) 
        REFERENCES staff(staff_id)
        ON DELETE NO ACTION
    );

DROP TABLE IF EXISTS memberships;

CREATE TABLE memberships (
    membership_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    member_id INTEGER NOT NULL,
    type TEXT NOT NULL CHECK (type IN ('Premium', 'Standard')),
    start_date TEXT NOT NULL,
    end_date TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('Active', 'Inactive')),
    FOREIGN KEY (member_id) 
        REFERENCES members(member_id)
        ON DELETE NO ACTION
    );

DROP TABLE IF EXISTS attendance;

CREATE TABLE attendance (
    attendance_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    member_id INTEGER NOT NULL,
    location_id INTEGER NOT NULL,
    check_in_time TEXT NOT NULL,
    check_out_time TEXT NOT NULL,
    FOREIGN KEY (location_id) 
        REFERENCES locations(location_id)
        ON DELETE NO ACTION,
    FOREIGN KEY (member_id) 
        REFERENCES members(member_id)
        ON DELETE NO ACTION
    );

DROP TABLE IF EXISTS class_attendance;

CREATE TABLE class_attendance (
    class_attendance_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    schedule_id INTEGER NOT NULL,
    member_id INTEGER NOT NULL,
    attendance_status TEXT NOT NULL CHECK(attendance_status IN ('Registered', 'Attended', 'Unattended')),
    FOREIGN KEY (member_id) 
        REFERENCES members(member_id)
        ON DELETE NO ACTION,
    FOREIGN KEY (schedule_id) 
        REFERENCES class_schedule(schedule_id)
        ON DELETE NO ACTION
    );

DROP TABLE IF EXISTS payments;

CREATE TABLE payments (
    payment_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    member_id INTEGER NOT NULL,
    amount REAL NOT NULL,
    payment_date TEXT NOT NULL,
    payment_method TEXT NOT NULL CHECK(payment_method IN ('Credit Card', 'Bank Transfer', 'PayPal', 'Cash')),
    payment_type TEXT NOT NULL CHECK(payment_type IN ('Monthly membership fee', 'Day pass')),
    FOREIGN KEY (member_id) 
        REFERENCES members(member_id)
        ON DELETE NO ACTION
    );

DROP TABLE IF EXISTS personal_training_sessions;

CREATE TABLE personal_training_sessions (
    session_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    member_id INTEGER NOT NULL,
    staff_id INTEGER NOT NULL,
    session_date TEXT NOT NULL,
    start_time TEXT NOT NULL,
    end_time TEXT NOT NULL,
    notes TEXT NOT NULL CHECK(length(notes) < 200),
    FOREIGN KEY (member_id) 
        REFERENCES members(member_id)
        ON DELETE NO ACTION,
    FOREIGN KEY (staff_id) 
        REFERENCES staff(staff_id)
        ON DELETE NO ACTION
    );

DROP TABLE IF EXISTS member_health_metrics;

CREATE TABLE member_health_metrics (
    metric_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    member_id INTEGER NOT NULL,
    measurement_date TEXT NOT NULL,
    weight REAL NOT NULL,
    body_fat_percentage REAL NOT NULL,
    muscle_mass REAL NOT NULL,
    bmi REAL NOT NULL,
    FOREIGN KEY (member_id) 
        REFERENCES members(member_id)
        ON DELETE NO ACTION
    );

DROP TABLE IF EXISTS equipment_maintenance_log;

CREATE TABLE equipment_maintenance_log (
    log_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    equipment_id INTEGER NOT NULL,
    maintenance_date TEXT NOT NULL,
    description TEXT NOT NULL CHECK(length(description) < 200),
    staff_id INTEGER NOT NULL,
    FOREIGN KEY (equipment_id) 
        REFERENCES equipment(equipment_id)
        ON DELETE NO ACTION,
    FOREIGN KEY (staff_id) 
        REFERENCES staff(staff_id)
        ON DELETE NO ACTION
    );

