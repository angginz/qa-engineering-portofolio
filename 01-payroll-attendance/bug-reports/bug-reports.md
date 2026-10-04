# Payroll & Attendance Bug Reports

## Overview

This document contains sample defects identified during the execution of Payroll & Attendance System test cases.

All data, employee information, screenshots, and business rules used in this portfolio are fictional or anonymized.

---

# BUG-PAY-001 — Approved Overtime Is Not Included in Payroll Calculation

**Module:** Payroll / Overtime  
**Severity:** High  
**Priority:** High  
**Status:** Open

**Linked Test Cases:**
- TC-OT-004
- TC-PAY-003

## Environment

- Application: Payroll & Attendance System
- Platform: Web
- Browser: Google Chrome
- Database: PostgreSQL
- Environment: QA / Testing

## Precondition

- Employee EMP001 is active.
- Employee has 4 hours of approved overtime.
- Overtime rate is Rp25,000 per hour.
- Payroll for the selected period has not been finalized.

## Test Data

- Employee ID: EMP001
- Approved Overtime: 4 Hours
- Overtime Rate: Rp25,000 / Hour
- Expected Overtime Amount: Rp100,000

## Steps to Reproduce

1. Login as Payroll Administrator.
2. Open the Overtime module.
3. Verify EMP001 has 4 hours of approved overtime.
4. Open the Payroll module.
5. Generate payroll for EMP001.
6. Open payroll details.
7. Review the overtime component.

## Expected Result

Approved overtime should be included in payroll calculation.

Expected overtime amount:

`4 × Rp25,000 = Rp100,000`

## Actual Result

Overtime amount is displayed as Rp0.

## Impact

Employee salary is calculated incorrectly because approved overtime is not included in payroll.

This issue directly affects payroll accuracy and employee compensation.

---

# BUG-PAY-002 — Mobile Payroll Data Does Not Match Backend Data

**Module:** Payroll / Mobile  
**Severity:** High  
**Priority:** High  
**Status:** Open

**Linked Test Case:**
- TC-PAY-008

## Environment

- Mobile Platform: Android / iOS Simulator
- Backend API: QA Environment
- Database: PostgreSQL

## Precondition

- Payroll has been generated for EMP001.
- Payroll backend data is available.

## Steps to Reproduce

1. Retrieve payroll details from the backend API.
2. Verify payroll data from the database.
3. Login to the employee mobile application.
4. Open Payroll History.
5. Select the same payroll period.
6. Compare salary components between mobile and backend.

## Expected Result

Mobile payroll data should display the same salary components and total amount as backend payroll data.

## Actual Result

Mobile application displays an incorrect overtime amount while the backend contains the correct value.

## Impact

Employees may see incorrect salary information in the mobile application.

This can reduce user trust and cause payroll-related complaints.

---

# BUG-ATT-001 — Attendance History Shows Duplicate Record

**Module:** Attendance  
**Severity:** Medium  
**Priority:** Medium  
**Status:** Open

## Environment

- Platform: Web
- Browser: Google Chrome
- Environment: QA

## Precondition

- Employee has successfully completed one check-in and one check-out for the day.

## Steps to Reproduce

1. Login as employee EMP001.
2. Complete check-in.
3. Complete check-out.
4. Open Attendance History.
5. Refresh the page.

## Expected Result

Only one attendance record should be displayed for the same employee and date.

## Actual Result

Two identical attendance records are displayed.

## Impact

Attendance history becomes inaccurate and may affect downstream payroll validation.

---

# BUG-LEV-001 — Rejected Leave Incorrectly Reduces Leave Balance

**Module:** Leave  
**Severity:** High  
**Priority:** High  
**Status:** Open

## Precondition

- Employee leave balance is 12 days.
- Employee submits a 2-day leave request.

## Steps to Reproduce

1. Login as employee.
2. Submit a 2-day leave request.
3. Login as approver.
4. Reject the leave request.
5. Login again as employee.
6. Open Leave Balance.

## Expected Result

Rejected leave should not reduce the employee's available leave balance.

Expected balance: 12 days.

## Actual Result

Leave balance is reduced to 10 days.

## Impact

Employee leave entitlement becomes inaccurate.

This can prevent valid future leave requests.

---

# BUG-OT-001 — Duplicate Overtime Request Can Be Submitted

**Module:** Overtime  
**Severity:** Medium  
**Priority:** Medium  
**Status:** Open

## Precondition

- Employee already has an overtime request for October 2, 2026 from 18:00 to 20:00.

## Steps to Reproduce

1. Login as employee.
2. Open Overtime.
3. Create a new overtime request.
4. Select October 2, 2026.
5. Enter overtime period 18:00–20:00.
6. Submit request again.

## Expected Result

System should reject the duplicate overtime request.

## Actual Result

A second overtime request is successfully created for the same employee and period.

## Impact

Duplicate overtime records may cause incorrect overtime calculation during payroll processing.

---

# BUG-AUTH-001 — Inactive Employee Can Still Access Dashboard

**Module:** Authentication  
**Severity:** High  
**Priority:** High  
**Status:** Open

## Precondition

- Employee account EMP009 has status Inactive.

## Steps to Reproduce

1. Open the login page.
2. Enter valid credentials for EMP009.
3. Click Login.

## Expected Result

Inactive employee should not be allowed to access the application.

## Actual Result

Login succeeds and employee is redirected to the dashboard.

## Impact

Inactive employees can access internal application data and functionality.

This may create security and access control risks.

---

# BUG-PAY-003 — Payroll Deduction Is Not Recalculated After Attendance Correction

**Module:** Payroll / Attendance Integration  
**Severity:** High  
**Priority:** High  
**Status:** Open

## Precondition

- Employee is initially recorded as absent.
- Payroll has already been generated.
- Attendance record is later corrected to Present.

## Steps to Reproduce

1. Generate payroll while EMP001 is recorded as absent.
2. Verify attendance deduction is applied.
3. Correct attendance status from Absent to Present.
4. Recalculate payroll.
5. Open payroll details.

## Expected Result

Attendance deduction should be removed after payroll recalculation.

## Actual Result

Previous attendance deduction remains in the recalculated payroll.

## Impact

Employee salary remains incorrect even after attendance data has been corrected.

---

# Defect Summary

| Bug ID | Module | Severity | Priority | Status |
|---|---|---|---|---|
| BUG-PAY-001 | Payroll / Overtime | High | High | Open |
| BUG-PAY-002 | Payroll / Mobile | High | High | Open |
| BUG-ATT-001 | Attendance | Medium | Medium | Open |
| BUG-LEV-001 | Leave | High | High | Open |
| BUG-OT-001 | Overtime | Medium | Medium | Open |
| BUG-AUTH-001 | Authentication | High | High | Open |
| BUG-PAY-003 | Payroll / Integration | High | High | Open |

---

## Notes

These defects are portfolio examples designed to demonstrate:

- Clear defect documentation
- Severity and priority classification
- Reproduction steps
- Expected vs actual result comparison
- Business impact analysis
- Traceability between test cases and defects