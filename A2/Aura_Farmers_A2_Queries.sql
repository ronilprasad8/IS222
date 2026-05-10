-- Query 1: List all candidates and their qualifications, sorted by qualification title
SELECT 
    C.Candidate_ID,
    C.Candidate_fname,
    C.Candidate_lname,
    Q.Qualification_title
FROM 
    Aura_Farmers_A2.CANDIDATE C
JOIN 
    Aura_Farmers_A2.EDUCATION_HISTORY EH ON C.Candidate_ID = EH.Candidate_ID
JOIN 
    Aura_Farmers_A2.QUALIFICATION Q ON EH.Qualification_ID = Q.Qualification_ID
ORDER BY 
    Q.Qualification_title ASC;
-- ==============================================================================

-- Query 2: Show companies with currently available jobs and the candidates they hired
SELECT 
    CO.Company_ID,
    CO.Company_name,
    C.Candidate_ID,
    CONCAT(C.Candidate_fname, ' ', C.Candidate_lname) AS Candidate_Full_Name,
    JO.Job_desc
FROM 
    Aura_Farmers_A2.COMPANY CO
JOIN 
    Aura_Farmers_A2.JOB_OPENING JO ON CO.Company_ID = JO.Company_ID
JOIN 
    Aura_Farmers_A2.PLACEMENT P ON JO.Job_ID = P.Job_ID
JOIN 
    Aura_Farmers_A2.CANDIDATE C ON P.Candidate_ID = C.Candidate_ID
WHERE 
    JO.Availability = TRUE -- Include if job is available
ORDER BY 
    CO.Company_name ASC, Candidate_Full_Name ASC;
-- ==============================================================================
	
-- Query 3: Show candidate info, their qualification, the company they work for, and required skill/qualification
SELECT 
    C.Candidate_ID,
    C.Candidate_fname AS First_Name,
    C.Candidate_lname AS Last_Name,
    Q1.Qualification_title AS Candidate_Qualification,
    CO.Company_name,
    JO.Job_desc AS Required_Skill
FROM 
    Aura_Farmers_A2.CANDIDATE C
JOIN 
    Aura_Farmers_A2.EDUCATION_HISTORY EH ON C.Candidate_ID = EH.Candidate_ID
JOIN 
    Aura_Farmers_A2.QUALIFICATION Q1 ON EH.Qualification_ID = Q1.Qualification_ID
JOIN 
    Aura_Farmers_A2.PLACEMENT P ON C.Candidate_ID = P.Candidate_ID
JOIN 
    Aura_Farmers_A2.JOB_OPENING JO ON P.Job_ID = JO.Job_ID
JOIN 
    Aura_Farmers_A2.COMPANY CO ON JO.Company_ID = CO.Company_ID;
-- ==============================================================================

-- Query 4: Find candidates without qualifications and show the courses they are taking and total cost
SELECT 
    C.Candidate_ID,
    C.Candidate_fname,
    C.Candidate_lname,
    CRS.Course_name,
    S.Start_date,
    CRS.Course_fee,
    SUM(CRS.Course_fee) OVER (PARTITION BY C.Candidate_ID) AS Total_Cost
FROM 
    Aura_Farmers_A2.CANDIDATE C
LEFT JOIN 
    Aura_Farmers_A2.EDUCATION_HISTORY EH ON C.Candidate_ID = EH.Candidate_ID
JOIN 
    Aura_Farmers_A2.ENROLLMENT E ON C.Candidate_ID = E.Candidate_ID
JOIN 
    Aura_Farmers_A2.SESSION S ON E.Session_ID = S.Session_ID
JOIN 
    Aura_Farmers_A2.COURSE CRS ON S.Course_ID = CRS.Course_ID
WHERE 
    EH.Candidate_ID IS NULL -- Show candidates without qualifications
ORDER BY 
    C.Candidate_lname ASC;
-- ==============================================================================

-- Query 5: List candidates who haven't paid their fees, including contact info and amount due
SELECT 
    C.Candidate_ID,
    C.Candidate_fname,
    C.Candidate_lname,
    C.Candidate_email,
    C.Candidate_phone,
    CRS.Course_name,
    CRS.Course_fee AS Pending_Fee,
    E.Enrollment_date
FROM 
    Aura_Farmers_A2.CANDIDATE C
JOIN 
    Aura_Farmers_A2.ENROLLMENT E ON C.Candidate_ID = E.Candidate_ID
JOIN 
    Aura_Farmers_A2.SESSION S ON E.Session_ID = S.Session_ID
JOIN 
    Aura_Farmers_A2.COURSE CRS ON S.Course_ID = CRS.Course_ID
WHERE 
    E.Paid_fee = FALSE;
-- ==============================================================================

-- Query 6: Show available jobs, matching candidates, and their number of successful placements
SELECT 
    CO.Company_name,
    JO.Job_ID,
    JO.Job_desc,
	Q.Qualification_title AS Qualification,
    Q.Qualification_title AS Required_Qualification,
    C.Candidate_ID,
    C.Candidate_fname AS First_Name,
    C.Candidate_lname AS Last_Name,
    COUNT(DISTINCT P.Placement_date) AS Successful_Placements
FROM 
    Aura_Farmers_A2.JOB_OPENING JO
JOIN
	Aura_Farmers_A2.COMPANY CO ON JO.Company_ID = CO.Company_ID
JOIN
	Aura_Farmers_A2.QUALIFICATION Q ON JO.Qualification_ID = Q.Qualification_ID
JOIN
	Aura_Farmers_A2.EDUCATION_HISTORY EH ON Q.Qualification_ID = EH.Qualification_ID
JOIN
	Aura_Farmers_A2.CANDIDATE C ON EH.Candidate_ID = C.Candidate_ID
LEFT JOIN
	Aura_Farmers_A2.PLACEMENT P ON C.Candidate_ID = P.Candidate_ID AND P.Job_ID = JO.Job_ID
WHERE 
    JO.Availability = TRUE
GROUP BY 
    CO.Company_name, JO.Job_ID, JO.Job_desc, Q.Qualification_title,
    C.Candidate_ID, C.Candidate_fname, C.Candidate_lname
ORDER BY 
    CO.Company_name, Successful_Placements DESC;
-- ==============================================================================

-- Query 7: Calculate the average pay rate for each company and qualification
SELECT 
    CO.Company_name,
    Q.Qualification_title,
    ROUND(AVG(JO.Pay_rate), 2) AS Avg_Pay_Rate
FROM 
    Aura_Farmers_A2.JOB_OPENING JO
JOIN 
    Aura_Farmers_A2.COMPANY CO ON JO.Company_ID = CO.Company_ID
JOIN 
    Aura_Farmers_A2.QUALIFICATION Q ON JO.Qualification_ID = Q.Qualification_ID
GROUP BY 
    CO.Company_name, Q.Qualification_title;
