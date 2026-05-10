-- Populating PRE_REQUISITE table with course prerequisites
INSERT INTO Aura_Farmers_A2.PRE_REQUISITE (Pre_requisite_course_ID, Pre_requisite_course_name) VALUES
('CS111', 'Introduction to Programming'),
('MA111', 'Basic Mathematics'),
('UU114', 'English Composition'),
('ST130', 'Statistics 101'),
('EC101', 'Business Communication'),
('CS112', 'Data Structures'),
('CS211', 'Computer Fundamentals'),
('IS221', 'Web Development Basics'),
('IS222', 'Database Management System'),
('CS231', 'Networking Essentials');

-- Populating QUALIFICATION table with educational qualifications
INSERT INTO Aura_Farmers_A2.QUALIFICATION (Qualification_ID, Qualification_title) VALUES
('Q001', 'Bachelor of Science (CS & IS)'),
('Q002', 'Degree in Computer Science'),
('Q003', 'Bachelor of Science in IT'),
('Q004', 'Master of Business Administration'),
('Q005', 'Certified Data Analyst'),
('Q006', 'Web Development Certificate'),
('Q007', 'Network Engineer Certification'),
('Q008', 'Digital Marketing Diploma'),
('Q009', 'Project Management Professional'),
('Q010', 'Cybersecurity Specialist');

-- Populating CANDIDATE table with candidate information
INSERT INTO Aura_Farmers_A2.CANDIDATE (Candidate_ID, Candidate_fname, Candidate_lname, Candidate_email, Candidate_phone) VALUES
('S11221001', 'John', 'Smith', 'john.smith@email.com', '+6799457432'),
('S11221002', 'Emily', 'Johnson', 'emily.j@email.com', '+6798239265'),
('S11221003', 'Michael', 'Williams', 'michael.w@email.com', '+6793456135'),
('S11221004', 'Sarah', 'Brown', 'sarah.b@email.com', '+6799978040'),
('S11221005', 'David', 'Jones', 'david.j@email.com', '+6799142058'),
('S11221006', 'Jessica', 'Garcia', 'jessica.g@email.com', '+6798091417'),
('S11221007', 'Robert', 'Miller', 'robert.m@email.com', '+6798662030'),
('S11221008', 'Jennifer', 'Davis', 'jennifer.d@email.com', '+6792904640'),
('S11221009', 'Thomas', 'Rodriguez', 'thomas.r@email.com', '+6792815995'),
('S11221010', 'Lisa', 'Martinez', 'lisa.m@email.com', '+6799253210'),
('S11221011', 'Mark', 'Taylor', 'mark.taylor@email.com', '+6799766276'),
('S11221012', 'Olivia', 'White', 'olivia.white@email.com', '+6799663841');

-- Populating COURSE table with available courses
INSERT INTO Aura_Farmers_A2.COURSE (Course_ID, Course_name, Course_desc, Course_fee, Qualification_ID, Pre_requisite_course_ID) VALUES
('CS218', 'Advanced Python Programming', 'Comprehensive Python course for intermediate developers', 899.99, 'Q002', 'CS111'),
('CS311', 'Data Science Fundamentals', 'Introduction to data analysis and visualization', 1299.99, 'Q005', 'ST130'),
('IS333', 'Full Stack Web Development', 'Learn front-end and back-end web technologies', 1499.99, 'Q006', 'IS221'),
('CS321', 'Network Security', 'Cybersecurity principles and practices', 1599.99, 'Q010', 'CS231'),
('EC312', 'Digital Marketing Strategy', 'Comprehensive digital marketing course', 999.99, 'Q008', NULL),
('CS230', 'Requirements Engineering', 'Requirements Engineering Fundamentals', 1099.99, 'Q009', 'CS111'),
('IS444', 'Cloud Computing', 'Introduction to cloud services and architecture', 1199.99, 'Q003', 'CS112'),
('CS421', 'Mobile App Development', 'Build iOS and Android applications', 1399.99, 'Q002', 'CS211'),
('EC345', 'Business Analytics', 'Data-driven decision making for business', 999.99, 'Q004', 'MA111'),
('IS365', 'UI/UX Design', 'User interface and experience design principles', 899.99, 'Q006', NULL),
('MA111', 'Basic Mathematics', 'Foundational mathematics for all programs', 599.99, NULL, NULL);

-- Populating SESSION table with course sessions
INSERT INTO Aura_Farmers_A2.SESSION (Session_ID, Course_ID, Start_date, Session_fee) VALUES
('SESS001', 'CS218', '2023-06-01', 899.99),
('SESS002', 'CS311', '2023-06-15', 1299.99),
('SESS003', 'IS333', '2023-06-01', 1499.99),
('SESS004', 'CS321', '2023-06-15', 1599.99),
('SESS005', 'EC312', '2023-06-01', 999.99),
('SESS006', 'CS230', '2023-06-15', 1099.99),
('SESS007', 'IS444', '2024-06-01', 1199.99),
('SESS008', 'CS421', '2024-06-15', 1399.99),
('SESS009', 'EC345', '2024-06-01', 999.99),
('SESS010', 'IS365', '2024-06-15', 899.99),
('SESS011', 'MA111', '2024-06-15', 599.99);

-- Populating EDUCATION_HISTORY table with candidate qualifications
INSERT INTO Aura_Farmers_A2.EDUCATION_HISTORY (Candidate_ID, Qualification_ID, Date_earned) VALUES
('S11221001', 'Q001', '2023-11-15'),
('S11221002', 'Q002', '2023-11-20'),
('S11221003', 'Q003', '2023-11-10'),
('S11221004', 'Q004', '2023-11-30'),
('S11221005', 'Q005', '2023-11-15'),
('S11221006', 'Q006', '2023-11-22'),
('S11221007', 'Q007', '2024-11-05'),
('S11221008', 'Q008', '2024-11-10'),
('S11221009', 'Q009', '2024-11-15'),
('S11221010', 'Q010', '2024-11-20');

-- Populating ENROLLMENT table with course enrollments
INSERT INTO Aura_Farmers_A2.ENROLLMENT (Candidate_ID, Session_ID, Enrollment_date, Paid_fee) VALUES
('S11221001', 'SESS001', '2023-07-15', TRUE),
('S11221002', 'SESS002', '2023-07-20', TRUE),
('S11221003', 'SESS003', '2023-07-10', TRUE),
('S11221004', 'SESS004', '2023-07-25', TRUE),
('S11221005', 'SESS005', '2023-07-05', TRUE),
('S11221006', 'SESS006', '2023-07-20', TRUE),
('S11221007', 'SESS007', '2024-07-10', TRUE),
('S11221008', 'SESS008', '2024-07-25', TRUE),
('S11221009', 'SESS009', '2024-07-05', TRUE),
('S11221010', 'SESS010', '2024-07-20', TRUE),
('S11221011', 'SESS011', '2024-07-10', TRUE),
('S11221012', 'SESS011', '2024-07-12', FALSE);

-- Populating COMPANY table with company information
INSERT INTO Aura_Farmers_A2.COMPANY (Company_ID, Company_name, Industry, Contact_email) VALUES
('COMP001', 'TechSolutions Inc.', 'Information Technology', 'hr@techsolutions.com'),
('COMP002', 'DataAnalytics Corp', 'Data Science', 'careers@dataanalytics.com'),
('COMP003', 'WebCrafters LLC', 'Web Development', 'jobs@webcrafters.com'),
('COMP004', 'SecureNet Systems', 'Cybersecurity', 'recruiting@securenetsys.com'),
('COMP005', 'DigitalMarket Pros', 'Marketing', 'hr@digitalmarketpros.com'),
('COMP006', 'CloudInnovate', 'Cloud Computing', 'careers@cloudinnovate.com'),
('COMP007', 'MobileMasters', 'Mobile Development', 'jobs@mobilemasters.com'),
('COMP008', 'BusinessIntel Group', 'Business Analytics', 'recruiting@businessintel.com'),
('COMP009', 'DesignHub Studios', 'UI/UX Design', 'hr@designhub.com'),
('COMP010', 'NetLink Technologies', 'Networking', 'careers@netlinktech.com');

-- Populating JOB_OPENING table with available job positions
INSERT INTO Aura_Farmers_A2.JOB_OPENING (Job_ID, Company_ID, Job_desc, Availability, Qualification_ID, Pay_rate) VALUES
('JOB001', 'COMP001', 'Python Developer - Mid Level', TRUE, 'Q001', 45.50),
('JOB002', 'COMP002', 'Junior Data Analyst', TRUE, 'Q005', 35.75),
('JOB003', 'COMP003', 'Full Stack Developer', FALSE, 'Q009', 50.00),
('JOB004', 'COMP004', 'Network Security Specialist', TRUE, 'Q010', 55.25),
('JOB005', 'COMP005', 'Digital Marketing Manager', TRUE, 'Q008', 42.00),
('JOB006', 'COMP006', 'Cloud Solutions Architect', FALSE, 'Q003', 65.00),
('JOB007', 'COMP007', 'Mobile App Developer', TRUE, 'Q002', 48.50),
('JOB008', 'COMP008', 'Business Intelligence Analyst', TRUE, 'Q004', 52.75),
('JOB009', 'COMP009', 'UI/UX Designer', TRUE, 'Q006', 46.00),
('JOB010', 'COMP010', 'Network Engineer', TRUE, 'Q007', 53.50);

-- Populating PLACEMENT table with job placements
INSERT INTO Aura_Farmers_A2.PLACEMENT (Candidate_ID, Job_ID, Placement_date, Hours_worked) VALUES
('S11221001', 'JOB001', '2024-07-10', 320),
('S11221002', 'JOB002', '2024-08-05', 280),
('S11221003', 'JOB003', '2024-09-15', 400),
('S11221004', 'JOB004', '2024-08-20', 350),
('S11221005', 'JOB005', '2024-09-01', 380),
('S11221006', 'JOB006', '2024-10-10', 420),
('S11221007', 'JOB007', '2024-10-15', 300),
('S11221008', 'JOB008', '2024-11-05', 360),
('S11221009', 'JOB009', '2024-11-20', 340),
('S11221010', 'JOB010', '2025-01-20', 390);