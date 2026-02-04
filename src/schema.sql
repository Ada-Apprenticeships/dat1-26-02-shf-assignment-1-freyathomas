.open fittrackpro.db
.mode column

CREATE TABLE locations (
    location_id NOT NULL ,
    name,
    address,
    phone_number,
    email,
    opening_hours
    );

CREATE TABLE members (
    member_id,
    first_name,
    last_name,
    email,
    phone_number,
    date_of_birth,
    join_date,
    emergency_contact_name,
    emergency_contact_phone
    );

CREATE TABLE staff (
    staff_id,
    first_name,
    last_name,
    email,
    phone_number,
    position,
    hire_date,
    location_id
    );
    
CREATE TABLE equipment (
    equipment_id,
    name,
    type,
    purchase_date,
    last_maintenance_date,
    next_maintenance_date,
    location_id
    );

CREATE TABLE classes (
    class_id,
    name,
    description,
    capacity,
    duration,
    location_id
    );

CREATE TABLE class_schedule (
    schedule_id,
    class_id,
    staff_id,
    start_time,
    end_time
    );

CREATE TABLE memberships (
    membership_id,
    member_id,
    type,
    start_date,
    end_date,
    status
    );

CREATE TABLE attendance (
    attendance_id,
    member_id,
    location_id,
    check_in_time,
    check_out_time
    );

CREATE TABLE class_attendance (
    class_attendance_id,
    schedule_id,
    member_id,
    attendance_status
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

