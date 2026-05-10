# IS222: Database Management Systems — Assignment 2

This repository contains the database design and SQL implementation for the **University of the South Pacific (USP) Course & Placement System**. This project focuses on utilizing SQL for data definition, manipulation, and advanced querying within a relational database environment.

---

## 👥 Group Information: Aura_Farmers
* **Group Name:** Aura_Farmers
* **Members:**
    * Ronil Prasad (S11231541)
    * Shivan Prasad (S11231502)
    * Praheel Kumar (S11229535)
    * Kunal Prasad (S11230922)

---

## 📖 Case Study Overview
The system is designed for the **USP Continuing & Community Education (CCE)** division to manage professional short courses and student job placements. Key operational requirements include:
* **Courses & Prerequisites:** Managing course fees, descriptions, and mandatory prerequisite tracks.
* **Sessions & Enrollments:** Tracking student enrollments, start dates, and fee payment statuses.
* **Qualifications:** Recording achievements and education history for candidates.
* **Placements & Job History:** Managing partnerships with companies to track job openings and successful candidate placements.

---

## 📂 Repository Structure

### 🛠️ Database Implementation (SQL Scripts)
* **`Aura_Farmers_A2_CreateStructures.sql`**: DDL script containing SQL queries to generate all table structures and constraints (PK, FK, and participation constraints).
* **`Aura_Farmers_A2_InsertData.sql`**: DML script to populate the database with realistic sample data for candidates, sessions, and companies.
* **`Aura_Farmers_A2_Queries.sql`**: A collection of 7 advanced queries designed for management reporting, including candidate qualification sorting, company employment tracking, and financial record auditing.

### 📊 Design Assets
* **`Aura_Farmers_A2_ERD.vsdx`**: The Entity-Relationship Diagram (ERD) mapping the full cycle from enrollment to job placement.
* **`Aura_Farmers_A2_S1_Procedures.sql`**: Supplementary script containing stored procedures for automated database operations.

---

## 🚀 Execution Guide
To set up and test the database system:
1. **Create Structures:** Run `Aura_Farmers_A2_CreateStructures.sql` in the MySQL shell to build the schema.
2. **Populate Data:** Run `Aura_Farmers_A2_InsertData.sql` to insert the required sample records.
3. **Execute Queries:** Run `Aura_Farmers_A2_Queries.sql` to generate reports and verify data extraction logic.

---

## ⚖️ License & Academic Integrity
This project is a group submission for academic grading. All rights reserved.

**Academic Integrity Notice:** This repository is intended to demonstrate our group's technical proficiency in SQL and database design. In accordance with USP policy, these materials must not be copied or distributed for plagiarism purposes.