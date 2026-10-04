# Payroll & Attendance Regression Test Report

## Overview

This document summarizes the regression testing activities performed on the Payroll & Attendance System.

Regression testing was conducted to verify that previously working functionality remains stable after defect fixes and changes to related modules.

All employee information, payroll values, test data, and application details used in this portfolio are fictional.

---

## Test Objective

The objectives of regression testing are to:

- verify that fixed defects no longer occur,
- ensure related features continue to work correctly,
- validate integration between attendance, leave, overtime, and payroll,
- verify payroll calculations after data changes,
- and identify unintended impacts caused by system changes.

---

## Regression Scope

The regression test covers the following modules:

- Authentication
- Attendance
- Leave
- Overtime
- Payroll
- Attendance-to-Payroll Integration
- Overtime-to-Payroll Integration
- Mobile Payroll Display
- API Validation
- Database Validation

---

# Test Environment

| Component | Environment |
|---|---|
| Application | Payroll & Attendance System |
| Environment | QA / Testing |
| Web Browser | Google Chrome |
| Mobile | Android / iOS Simulator |
| API Testing | Postman |
| Database | PostgreSQL |
| Operating System | macOS |

---

# Defects Included in Regression Testing

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

# Regression Test Execution

## RT-001 — Verify Approved Overtime Calculation

**Related Defect:** BUG-PAY-001  
**Priority:** High

**Precondition:**
- Employee EMP001 has 4 hours of approved overtime.
- Overtime rate is Rp25,000 per hour.

**Steps:**
1. Verify approved overtime data.
2. Generate payroll for EMP001.
3. Open payroll details.
4. Verify overtime component.
5. Validate payroll data through API.
6. Compare payroll record with database.

**Expected Result:**

```text
4 × Rp25,000 = Rp100,000
```

Payroll should display:

```text
Overtime Amount = Rp100,000
```

**Actual Result:**

Overtime amount is correctly calculated as Rp100,000.

**Status:** PASS

---

## RT-002 — Verify Payroll Data on Mobile

**Related Defect:** BUG-PAY-002  
**Priority:** High

**Precondition:**
- Payroll has been successfully generated.
- Backend payroll data is correct.

**Steps:**
1. Retrieve payroll through API.
2. Verify payroll record from database.
3. Login to employee mobile application.
4. Open Payroll History.
5. Compare displayed payroll values.

**Expected Result:**

Mobile payroll data matches backend and database data.

**Actual Result:**

Mobile payroll information matches backend data.

**Status:** PASS

---

## RT-003 — Verify Duplicate Attendance Fix

**Related Defect:** BUG-ATT-001  
**Priority:** Medium

**Steps:**
1. Login as employee.
2. Perform check-in.
3. Perform check-out.
4. Open Attendance History.
5. Refresh the page several times.

**Expected Result:**

Only one attendance record is displayed for the same employee and date.

**Actual Result:**

Only one attendance record is displayed.

**Status:** PASS

---

## RT-004 — Verify Rejected Leave Balance

**Related Defect:** BUG-LEV-001  
**Priority:** High

**Precondition:**
- Employee has 12 days leave balance.

**Steps:**
1. Submit 2-day leave request.
2. Reject leave request.
3. Open employee leave balance.
4. Validate database leave balance.

**Expected Result:**

Leave balance remains 12 days.

**Actual Result:**

Leave balance remains 12 days.

**Status:** PASS

---

## RT-005 — Verify Duplicate Overtime Validation

**Related Defect:** BUG-OT-001  
**Priority:** Medium

**Precondition:**
- Existing overtime request:
  - Date: October 2, 2026
  - Time: 18:00–20:00

**Steps:**
1. Create another overtime request.
2. Use the same date and time.
3. Submit request.

**Expected Result:**

System rejects duplicate overtime request.

**Actual Result:**

Duplicate request is rejected.

**Status:** PASS

---

## RT-006 — Verify Inactive Employee Access

**Related Defect:** BUG-AUTH-001  
**Priority:** High

**Precondition:**
- EMP009 status is Inactive.

**Steps:**
1. Open login page.
2. Enter valid credentials for EMP009.
3. Click Login.

**Expected Result:**

Inactive employee cannot access the application.

**Actual Result:**

Login is rejected and user remains on the login page.

**Status:** PASS

---

## RT-007 — Verify Payroll Recalculation After Attendance Correction

**Related Defect:** BUG-PAY-003  
**Priority:** High

**Precondition:**
- Employee was previously recorded as Absent.
- Payroll has already been generated.

**Steps:**
1. Verify payroll contains attendance deduction.
2. Correct employee attendance from Absent to Present.
3. Recalculate payroll.
4. Open payroll details.
5. Verify deduction amount.
6. Compare database payroll data.

**Expected Result:**

Attendance deduction is removed after payroll recalculation.

**Actual Result:**

Payroll deduction is recalculated correctly.

**Status:** PASS

---

# Core Regression Testing

In addition to defect verification, several critical existing flows were retested.

| Test ID | Scenario | Result |
|---|---|---|
| TC-AUTH-001 | Login with valid credentials | PASS |
| TC-ATT-001 | Successful employee check-in | PASS |
| TC-ATT-003 | Successful employee check-out | PASS |
| TC-LEV-001 | Submit valid leave request | PASS |
| TC-OT-001 | Submit valid overtime | PASS |
| TC-OT-004 | Approved overtime included in payroll | PASS |
| TC-PAY-001 | Generate payroll for active employee | PASS |
| TC-PAY-002 | Validate basic salary | PASS |
| TC-PAY-003 | Validate overtime calculation | PASS |
| TC-PAY-006 | Validate payroll API response | PASS |
| TC-PAY-007 | Validate payroll against database | PASS |
| TC-PAY-008 | Validate mobile payroll against backend | PASS |

---

# Regression Execution Summary

| Result | Count |
|---|---:|
| PASS | 19 |
| FAIL | 0 |
| BLOCKED | 0 |
| **Total** | **19** |

---

# Defect Retest Summary

| Bug ID | Previous Status | Retest Result | Final Status |
|---|---|---|---|
| BUG-PAY-001 | Open | PASS | Closed |
| BUG-PAY-002 | Open | PASS | Closed |
| BUG-ATT-001 | Open | PASS | Closed |
| BUG-LEV-001 | Open | PASS | Closed |
| BUG-OT-001 | Open | PASS | Closed |
| BUG-AUTH-001 | Open | PASS | Closed |
| BUG-PAY-003 | Open | PASS | Closed |

---

# Final Assessment

Regression testing was completed successfully.

All identified defects included in this regression cycle passed retesting, and no new critical issues were identified in the tested core workflows.

Based on the executed regression scope:

```text
Regression Status: PASS
Critical Open Defects: 0
High Open Defects: 0
Blocked Test Cases: 0
```

The tested build is considered stable within the defined QA scope.

---

## Notes

This regression report demonstrates:

- defect retesting,
- regression test execution,
- critical flow verification,
- integration validation,
- API and database cross-checking,
- test result documentation,
- and release readiness assessment.