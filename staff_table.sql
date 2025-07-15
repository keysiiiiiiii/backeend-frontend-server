-- STAFF TABLE
CREATE TABLE IF NOT EXISTS staff (
  staff_id VARCHAR(50) PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  employee_type VARCHAR(50),
  allow_sick_leave BOOLEAN DEFAULT FALSE,
  allow_other_leaves BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- LEAVES TABLE
CREATE TABLE IF NOT EXISTS leaves (
  leave_id VARCHAR(50) PRIMARY KEY,
  staff_id VARCHAR(50),
  leave_type VARCHAR(50),
  start_date DATE,
  end_date DATE,
  reason TEXT,
  status VARCHAR(20) DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE users (
  user_id VARCHAR(50) PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  role ENUM('HR', 'VPAA', 'Faculty', 'Staff') NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);