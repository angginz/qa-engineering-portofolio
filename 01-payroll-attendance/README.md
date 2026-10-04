# Payroll & Attendance System — QA Case Study

## Project Overview

This project is a Quality Assurance case study for an Employee Payroll & Attendance Management System.

The system is designed to manage employee attendance, leave requests, overtime, reimbursements, employee data, and payroll processing.

This QA case study focuses on validating core business flows, API behavior, database consistency, and integration between attendance-related data and payroll calculation.

> **Confidentiality Notice**
>
> This portfolio project is inspired by professional software testing experience. All company names, application names, employee information, credentials, API endpoints, salary values, screenshots, and business data used in this repository are fictional or anonymized.

---

## QA Responsibilities Demonstrated

The testing activities demonstrated in this project include:

- Manual Functional Testing
- Regression Testing
- End-to-End Testing
- Positive and Negative Testing
- Boundary Value Testing
- REST API Testing
- Basic Postman Test Scripting
- SQL Data Validation
- Mobile Application Testing
- Bug Reporting
- Retesting
- Release Verification

---

## Tools

- Postman
- PostgreSQL
- Google Chrome
- Android / iOS Simulator
- Git & GitHub
- Issue Tracking Tools

---

# System Modules

The testing scope covers:

- Authentication
- Attendance
- Leave
- Overtime
- Reimbursement
- Payroll
- Mobile Payroll
- API Integration
- Database Validation

---

# Business Flow

## Attendance Flow

```text
Employee Login
      ↓
Check-In
      ↓
Attendance Record
      ↓
Check-Out
      ↓
Working Hours Calculation
      ↓
Attendance History
      ↓
Payroll Processing
```

## Payroll Flow

```text
Attendance
      ↓
Approved Overtime
      ↓
Approved Leave
      ↓
Payroll Calculation
      ↓
Salary Components
      ↓
Deductions
      ↓
Net Salary
      ↓
Payroll History
```

---

# Testing Documentation

## Test Cases

Detailed manual test cases covering authentication, attendance, leave, overtime, and payroll.

**Total Test Cases:** 30

[View Test Cases](./test-cases/test-cases.md)

---

## Bug Reports

Defects documented with:

- Steps to reproduce
- Expected result
- Actual result
- Severity
- Priority
- Business impact
- Linked test cases

[View Bug Reports](./bug-reports/bug-reports.md)

---

## API Testing

REST API testing includes:

- Login API
- Attendance API
- Leave API
- Overtime API
- Payroll API
- HTTP status code validation
- JSON response validation
- Bearer token usage
- Basic Postman test scripts

[View API Testing](./api-testing/README.md)

---

## Database Validation

SQL is used to validate:

- Employee data
- Attendance records
- Duplicate attendance
- Leave balance
- Approved overtime
- Payroll calculations
- API and database consistency

[View Database Testing](./database-testing/README.md)

[View SQL Queries](./database-testing/validation-queries.sql)

---

## Regression Testing

Regression testing was performed after defect fixes to verify that:

- defects no longer occur,
- related functionality remains stable,
- payroll integration still works correctly,
- API and database values remain consistent.

[View Regression Test Report](./test-reports/regression-report.md)

---

# Test Execution Summary

Initial test execution:

| Status | Total |
|---|---:|
| PASS | 27 |
| FAIL | 3 |
| BLOCKED | 0 |
| **Total** | **30** |

The failed scenarios were documented as defects and included in the regression testing cycle.

---

# Defect Summary

Example defects identified during testing include:

| Bug ID | Description | Severity |
|---|---|---|
| BUG-PAY-001 | Approved overtime is not included in payroll calculation | High |
| BUG-PAY-002 | Mobile payroll data does not match backend data | High |
| BUG-ATT-001 | Attendance history shows duplicate record | Medium |
| BUG-LEV-001 | Rejected leave incorrectly reduces leave balance | High |
| BUG-OT-001 | Duplicate overtime request can be submitted | Medium |
| BUG-AUTH-001 | Inactive employee can still access dashboard | High |
| BUG-PAY-003 | Payroll deduction is not recalculated after attendance correction | High |

---

# Regression Result

After defect fixes and regression testing:

| Result | Total |
|---|---:|
| PASS | 19 |
| FAIL | 0 |
| BLOCKED | 0 |
| **Total** | **19** |

Final regression status:

```text
Regression Status: PASS
Critical Open Defects: 0
High Open Defects: 0
Blocked Test Cases: 0
```

---

# QA Workflow Demonstrated

```text
Requirement Understanding
        ↓
Test Scenario Design
        ↓
Test Case Creation
        ↓
Test Execution
        ↓
Defect Identification
        ↓
Bug Reporting
        ↓
Developer Fix
        ↓
Retesting
        ↓
Regression Testing
        ↓
Test Summary
```

---

# Skills Demonstrated

This project demonstrates practical QA skills in:

- Manual software testing
- Test case design
- Positive and negative testing
- Boundary testing
- Payroll business rule validation
- REST API testing
- Postman response validation
- SQL data validation
- Integration testing
- Mobile testing
- Bug investigation
- Defect documentation
- Retesting
- Regression testing

---

## Project Status

**Project Version:** 1.0  
**Status:** Completed

Future improvements may include:

- Postman Collection JSON
- Additional test evidence
- More API assertions
- Additional SQL validation scenarios