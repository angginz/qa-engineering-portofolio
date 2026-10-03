# Payroll & Attendance System — QA Case Study

## Project Overview

This project is a Quality Assurance case study for an Employee Payroll & Attendance Management System.

The system is designed to manage employee attendance, leave requests, overtime submissions, reimbursements, employee data, and payroll processing.

This QA case study focuses on validating core business flows, API behavior, data consistency, and integration between attendance-related data and payroll calculation.

> **Confidentiality Notice**
>
> This portfolio project is inspired by professional software testing experience. All application names, employee information, credentials, API endpoints, business rules, salary amounts, screenshots, and other data used in this repository are fictional or anonymized.

---

## QA Responsibilities

The testing activities demonstrated in this project include:

- Manual Functional Testing
- Regression Testing
- End-to-End Testing
- Positive and Negative Testing
- Boundary Value Testing
- REST API Testing
- Database Validation
- Mobile Application Testing
- Bug Reporting
- Retesting
- Release Verification

---

## System Modules

The testing scope covers the following modules:

### 1. Authentication

- Employee login
- Invalid credentials
- Empty required fields
- Session handling

### 2. Attendance

- Employee check-in
- Employee check-out
- Late attendance
- Duplicate attendance
- Missing check-out
- Attendance history

### 3. Leave

- Leave request
- Leave balance validation
- Leave approval
- Leave rejection
- Backdated leave
- Leave exceeding available balance

### 4. Overtime

- Overtime submission
- Overtime approval
- Invalid overtime duration
- Duplicate submission
- Overtime calculation

### 5. Reimbursement

- Reimbursement request
- Required document validation
- Amount validation
- Approval and rejection

### 6. Payroll

- Payroll calculation
- Attendance integration
- Overtime calculation
- Employee deductions
- Payroll history
- Payroll data validation

---

## Test Environment

Example testing environment used in this portfolio:

| Component | Environment |
|---|---|
| Web Browser | Google Chrome |
| Mobile | Android / iOS Simulator |
| API Testing | Postman |
| Database | PostgreSQL |
| Bug Tracking | Issue Tracker |
| OS | macOS |

---

## Test Data

All test data used in this repository is fictional.

Example employee:

| Field | Value |
|---|---|
| Employee ID | EMP001 |
| Name | Budi Santoso |
| Department | Engineering |
| Employment Status | Active |
| Basic Salary | Rp5,000,000 |
| Leave Balance | 12 Days |
| Overtime Rate | Rp25,000 / Hour |

---

# Testing Scope

## Attendance Flow

Employee Login  
↓  
Check-In  
↓  
Attendance Record Created  
↓  
Check-Out  
↓  
Working Hours Calculated  
↓  
Attendance History Updated  
↓  
Payroll Data Updated

---

## Payroll Flow

Employee Attendance  
↓  
Approved Overtime  
↓  
Approved Leave  
↓  
Payroll Calculation  
↓  
Salary Component Calculation  
↓  
Deduction Calculation  
↓  
Final Salary Generated  
↓  
Payroll History

---

# Test Scenarios

## Authentication

### TS-AUTH-001
Verify employee can log in using valid credentials.

### TS-AUTH-002
Verify login fails when password is incorrect.

### TS-AUTH-003
Verify login fails when email is empty.

### TS-AUTH-004
Verify login fails when password is empty.

### TS-AUTH-005
Verify inactive employee cannot log in.

---

# Attendance

### TS-ATT-001
Verify employee can successfully check in.

### TS-ATT-002
Verify attendance record is created after successful check-in.

### TS-ATT-003
Verify employee cannot perform duplicate check-in on the same day.

### TS-ATT-004
Verify late attendance is correctly recorded.

### TS-ATT-005
Verify employee can successfully check out.

### TS-ATT-006
Verify check-out time is saved correctly.

### TS-ATT-007
Verify employee cannot check out before checking in.

### TS-ATT-008
Verify attendance history displays correct employee attendance data.

### TS-ATT-009
Verify working hours are calculated correctly.

### TS-ATT-010
Verify attendance data is correctly reflected in payroll processing.

---

# Leave

### TS-LEV-001
Verify employee can submit a leave request when leave balance is available.

### TS-LEV-002
Verify leave request cannot exceed available leave balance.

### TS-LEV-003
Verify leave balance decreases after approved leave.

### TS-LEV-004
Verify rejected leave does not reduce leave balance.

### TS-LEV-005
Verify mandatory fields are required when submitting leave.

### TS-LEV-006
Verify overlapping leave requests cannot be submitted.

### TS-LEV-007
Verify backdated leave follows configured business rules.

---

# Overtime

### TS-OT-001
Verify employee can submit an overtime request.

### TS-OT-002
Verify overtime duration is calculated correctly.

### TS-OT-003
Verify overtime cannot exceed the configured maximum duration.

### TS-OT-004
Verify duplicate overtime requests cannot be submitted.

### TS-OT-005
Verify approved overtime is included in payroll calculation.

### TS-OT-006
Verify rejected overtime is excluded from payroll calculation.

---

# Payroll

### TS-PAY-001
Verify payroll is generated for active employees.

### TS-PAY-002
Verify basic salary is calculated correctly.

### TS-PAY-003
Verify approved overtime is added to payroll.

### TS-PAY-004
Verify attendance deductions are calculated correctly.

### TS-PAY-005
Verify rejected overtime does not affect salary.

### TS-PAY-006
Verify payroll correctly uses employee attendance data.

### TS-PAY-007
Verify payroll calculation for employee with no absence or overtime.

### TS-PAY-008
Verify payroll calculation for employee with overtime.

### TS-PAY-009
Verify payroll calculation for employee with absence.

### TS-PAY-010
Verify payroll history contains the correct payroll period.

### TS-PAY-011
Verify API payroll result matches database records.

### TS-PAY-012
Verify payroll displayed on mobile matches backend data.

---

# Reimbursement

### TS-REI-001
Verify employee can submit reimbursement with valid data.

### TS-REI-002
Verify reimbursement amount cannot be zero.

### TS-REI-003
Verify supporting document is required.

### TS-REI-004
Verify approved reimbursement is included in payroll when applicable.

### TS-REI-005
Verify rejected reimbursement does not affect payroll.

---

# Integration Scenarios

### TS-INT-001
Verify attendance records are successfully integrated into payroll.

### TS-INT-002
Verify approved overtime data is correctly reflected in payroll.

### TS-INT-003
Verify approved leave updates attendance data.

### TS-INT-004
Verify payroll recalculation after attendance correction.

### TS-INT-005
Verify mobile payroll data matches API response.

### TS-INT-006
Verify API data matches PostgreSQL database records.

---

# Risk-Based Testing Priorities

## High Risk

Features that directly affect employee salary or financial calculations:

- Payroll calculation
- Attendance-to-payroll integration
- Overtime calculation
- Deduction calculation
- Reimbursement calculation

## Medium Risk

Features affecting employee records and workflow:

- Leave approval
- Attendance history
- Overtime approval
- Employee profile data

## Low Risk

Features that do not directly affect business calculations:

- Minor UI issues
- Text alignment
- Non-critical visual inconsistencies

---

# Portfolio Deliverables

This project will contain:

- Test Scenario Documentation
- Detailed Test Cases
- API Testing Collection
- SQL Validation Queries
- Bug Reports
- Regression Test Report
- Testing Evidence
- QA Test Summary