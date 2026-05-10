-- Group Name: Aura_Farmers 
-- Members: Ronil Prasad;  S11231541
--			Shivan Prasad; S11231502
--			Praheel Kumar; S11229535
--			Kunal Prasad;  S11230922
-- ----------------------------------------------------------------
DROP SCHEMA IF EXISTS `Aura_Farmers_A2`;
CREATE SCHEMA IF NOT EXISTS `Aura_Farmers_A2`;

-- Drop and Create: PRE_REQUISITE TABLE
DROP TABLE IF EXISTS Aura_Farmers_A2.PRE_REQUISITE;
CREATE TABLE IF NOT EXISTS Aura_Farmers_A2.PRE_REQUISITE (
    Pre_requisite_course_ID VARCHAR(10) NOT NULL,
    Pre_requisite_course_name TEXT DEFAULT NULL,
    CONSTRAINT prerequisite_pk PRIMARY KEY (Pre_requisite_course_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Drop and Create: QUALIFICATION TABLE
DROP TABLE IF EXISTS Aura_Farmers_A2.QUALIFICATION;
CREATE TABLE IF NOT EXISTS Aura_Farmers_A2.QUALIFICATION (
    Qualification_ID VARCHAR(10) NOT NULL,
    Qualification_title VARCHAR(100) NOT NULL,
    CONSTRAINT qualification_pk PRIMARY KEY (Qualification_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Drop and Create: CANDIDATE TABLE
DROP TABLE IF EXISTS Aura_Farmers_A2.CANDIDATE;
CREATE TABLE IF NOT EXISTS Aura_Farmers_A2.CANDIDATE (
    Candidate_ID VARCHAR(10) NOT NULL,
    Candidate_fname VARCHAR(15) NOT NULL,
    Candidate_lname VARCHAR(15) NOT NULL,
    Candidate_email VARCHAR(100) DEFAULT NULL,
    Candidate_phone VARCHAR(15) DEFAULT NULL,
    CONSTRAINT candidate_pk PRIMARY KEY (Candidate_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Drop and Create: COURSE TABLE
DROP TABLE IF EXISTS Aura_Farmers_A2.COURSE;
CREATE TABLE IF NOT EXISTS Aura_Farmers_A2.COURSE (
    Course_ID VARCHAR(10) NOT NULL,
    Course_name VARCHAR(100) NOT NULL,
    Course_desc TEXT DEFAULT NULL,
    Course_fee DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    Qualification_ID VARCHAR(10) DEFAULT NULL,
    Pre_requisite_course_ID VARCHAR(10) DEFAULT NULL,
    CONSTRAINT course_pk PRIMARY KEY (Course_ID),
    CONSTRAINT course_fk_qualification FOREIGN KEY (Qualification_ID) REFERENCES QUALIFICATION(Qualification_ID),
    CONSTRAINT course_fk_prerequisite FOREIGN KEY (Pre_requisite_course_ID) REFERENCES PRE_REQUISITE(Pre_requisite_course_ID),
	CONSTRAINT chk_course_fee_positive CHECK (Course_fee >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Drop and Create: SESSION TABLE
DROP TABLE IF EXISTS Aura_Farmers_A2.SESSION;
CREATE TABLE IF NOT EXISTS Aura_Farmers_A2.SESSION (
    Session_ID VARCHAR(10) NOT NULL,
    Course_ID VARCHAR(10) NOT NULL,
    Start_date DATE NOT NULL,
    Session_fee DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT session_pk PRIMARY KEY (Session_ID),
    CONSTRAINT session_fk_course FOREIGN KEY (Course_ID) REFERENCES COURSE(Course_ID),
	CONSTRAINT chk_session_fee_positive CHECK (Session_fee >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Drop and Create: EDUCATION_HISTORY TABLE
DROP TABLE IF EXISTS Aura_Farmers_A2.EDUCATION_HISTORY;
CREATE TABLE IF NOT EXISTS Aura_Farmers_A2.EDUCATION_HISTORY (
    Candidate_ID VARCHAR(10) NOT NULL,
    Qualification_ID VARCHAR(10) NOT NULL,
    Date_earned DATE NOT NULL,
    CONSTRAINT education_history_pk PRIMARY KEY (Candidate_ID, Qualification_ID),
    CONSTRAINT education_history_fk_candidate FOREIGN KEY (Candidate_ID) REFERENCES CANDIDATE(Candidate_ID),
    CONSTRAINT education_history_fk_qualification FOREIGN KEY (Qualification_ID) REFERENCES QUALIFICATION(Qualification_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Drop and Create: ENROLLMENT TABLE
DROP TABLE IF EXISTS Aura_Farmers_A2.ENROLLMENT;
CREATE TABLE IF NOT EXISTS Aura_Farmers_A2.ENROLLMENT (
    Candidate_ID VARCHAR(10) NOT NULL,
    Session_ID VARCHAR(10) NOT NULL,
    Enrollment_date DATE NOT NULL,
    Paid_fee BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT enrollment_pk PRIMARY KEY (Candidate_ID, Session_ID),
    CONSTRAINT enrollment_fk_candidate FOREIGN KEY (Candidate_ID) REFERENCES CANDIDATE(Candidate_ID),
    CONSTRAINT enrollment_fk_session FOREIGN KEY (Session_ID) REFERENCES SESSION(Session_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Drop and Create: COMPANY TABLE
DROP TABLE IF EXISTS Aura_Farmers_A2.COMPANY;
CREATE TABLE IF NOT EXISTS Aura_Farmers_A2.COMPANY (
    Company_ID VARCHAR(10) NOT NULL,
    Company_name VARCHAR(50) NOT NULL,
    Industry VARCHAR(50) DEFAULT NULL,
    Contact_email VARCHAR(100) DEFAULT NULL,
    CONSTRAINT company_pk PRIMARY KEY (Company_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Drop and Create: JOB_OPENING TABLE
DROP TABLE IF EXISTS Aura_Farmers_A2.JOB_OPENING;
CREATE TABLE IF NOT EXISTS Aura_Farmers_A2.JOB_OPENING (
    Job_ID VARCHAR(10) NOT NULL,
    Company_ID VARCHAR(10) NOT NULL,
    Job_desc TEXT DEFAULT NULL,
    Availability BOOLEAN NOT NULL DEFAULT TRUE,
    Qualification_ID VARCHAR(10) DEFAULT NULL,
    Pay_rate DECIMAL(10,2) DEFAULT NULL,
    CONSTRAINT job_opening_pk PRIMARY KEY (Job_ID),
    CONSTRAINT job_opening_fk_company FOREIGN KEY (Company_ID) REFERENCES COMPANY(Company_ID),
    CONSTRAINT job_opening_fk_qualification FOREIGN KEY (Qualification_ID) REFERENCES QUALIFICATION(Qualification_ID),
	CONSTRAINT chk_pay_rate_positive CHECK (Pay_rate >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Drop and Create: PLACEMENT TABLE
DROP TABLE IF EXISTS Aura_Farmers_A2.PLACEMENT;
CREATE TABLE IF NOT EXISTS Aura_Farmers_A2.PLACEMENT (
    Candidate_ID VARCHAR(10) NOT NULL,
    Job_ID VARCHAR(10) NOT NULL,
    Placement_date DATE NOT NULL,
    Hours_worked INT NOT NULL DEFAULT 0,
    CONSTRAINT placement_pk PRIMARY KEY (Candidate_ID, Job_ID),
    CONSTRAINT placement_fk_candidate FOREIGN KEY (Candidate_ID) REFERENCES CANDIDATE(Candidate_ID),
    CONSTRAINT placement_fk_job FOREIGN KEY (Job_ID) REFERENCES JOB_OPENING(Job_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;