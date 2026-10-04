# Payroll & Attendance Test Cases

## Overview

This document contains detailed manual test cases for the Payroll & Attendance System QA case study.

The test cases cover core business flows including authentication, attendance, leave, overtime, and payroll processing.

All test data used in this portfolio is fictional and created for demonstration purposes.

---

## Test Case Summary

| Module | Total Test Cases |
|---|---:|
| Authentication | 5 |
| Attendance | 7 |
| Leave | 5 |
| Overtime | 5 |
| Payroll | 8 |
| **Total** | **30** |

---

# Authentication Test Cases

## TC-AUTH-001 — Login with Valid Credentials

**Module:** Authentication  
**Priority:** High  
**Type:** Positive Testing

**Precondition:**
- Employee account exists.
- Employee status is active.

**Test Data:**
- Email: employee1@test.com
- Password: ValidPass123

**Steps:**
1. Open the login page.
2. Enter a valid email address.
3. Enter the correct password.
4. Click the Login button.

**Expected Result:**
- Login is successful.
- Employee is redirected to the dashboard.
- Valid authenticated session is created.

**Actual Result:**  
Login is successful and employee is redirected to the dashboard.

**Status:** PASS

---

## TC-AUTH-002 — Login with Incorrect Password

**Module:** Authentication  
**Priority:** High  
**Type:** Negative Testing

**Precondition:**
- Employee account exists and is active.

**Test Data:**
- Email: employee1@test.com
- Password: WrongPass123

**Steps:**
1. Open the login page.
2. Enter a valid employee email.
3. Enter an incorrect password.
4. Click Login.

**Expected Result:**
- Login is rejected.
- Appropriate authentication error message is displayed.
- User remains on the login page.

**Actual Result:**  
Login is rejected and an authentication error message is displayed.

**Status:** PASS

---

## TC-AUTH-003 — Login with Empty Email

**Module:** Authentication  
**Priority:** Medium  
**Type:** Negative Testing

**Precondition:**  
User is on the login page.

**Test Data:**
- Email: Empty
- Password: ValidPass123

**Steps:**
1. Leave the email field empty.
2. Enter a valid password.
3. Click Login.

**Expected Result:**
- Login request is not processed.
- Required field validation is displayed for email.

**Actual Result:**  
Email validation is displayed.

**Status:** PASS

---

## TC-AUTH-004 — Login with Empty Password

**Module:** Authentication  
**Priority:** Medium  
**Type:** Negative Testing

**Test Data:**
- Email: employee1@test.com
- Password: Empty

**Steps:**
1. Enter a valid employee email.
2. Leave the password field empty.
3. Click Login.

**Expected Result:**
- Login request is not processed.
- Password required validation is displayed.

**Actual Result:**  
Password validation is displayed.

**Status:** PASS

---

## TC-AUTH-005 — Inactive Employee Login

**Module:** Authentication  
**Priority:** High  
**Type:** Negative Testing

**Precondition:**
- Employee account exists.
- Employee status is inactive.

**Test Data:**
- Employee ID: EMP009

**Steps:**
1. Open the login page.
2. Enter valid credentials for the inactive employee.
3. Click Login.

**Expected Result:**
- Login is rejected.
- User receives information that the account is inactive.

**Actual Result:**  
Login is rejected.

**Status:** PASS

---

# Attendance Test Cases

## TC-ATT-001 — Successful Employee Check-In

**Module:** Attendance  
**Priority:** High  
**Type:** Positive Testing

**Precondition:**
- Employee is authenticated.
- Employee has not checked in today.

**Test Data:**
- Employee ID: EMP001
- Check-In Time: 08:00

**Steps:**
1. Login as employee.
2. Open the Attendance menu.
3. Click Check In.
4. Open today's attendance record.

**Expected Result:**
- Check-in is successful.
- Check-in time is recorded correctly.
- Attendance record is created.

**Actual Result:**  
Check-in is successful and attendance data is created.

**Status:** PASS

---

## TC-ATT-002 — Duplicate Check-In

**Module:** Attendance  
**Priority:** High  
**Type:** Negative Testing

**Precondition:**
- Employee has already checked in today.

**Steps:**
1. Open Attendance.
2. Attempt to click Check In again.

**Expected Result:**
- System rejects the second check-in.
- Duplicate attendance record is not created.

**Actual Result:**  
Second check-in is rejected.

**Status:** PASS

---

## TC-ATT-003 — Successful Check-Out

**Module:** Attendance  
**Priority:** High  
**Type:** Positive Testing

**Precondition:**
- Employee has successfully checked in.

**Test Data:**
- Check-In: 08:00
- Check-Out: 17:00

**Steps:**
1. Open Attendance.
2. Click Check Out.
3. Open attendance detail.

**Expected Result:**
- Check-out is successful.
- Check-out time is stored correctly.

**Actual Result:**  
Check-out is successful.

**Status:** PASS

---

## TC-ATT-004 — Check-Out Without Check-In

**Module:** Attendance  
**Priority:** High  
**Type:** Negative Testing

**Precondition:**
- Employee has not checked in today.

**Steps:**
1. Open Attendance.
2. Attempt to perform Check Out.

**Expected Result:**
- Check-out is rejected.
- Appropriate validation message is displayed.

**Actual Result:**  
Check-out is rejected.

**Status:** PASS

---

## TC-ATT-005 — Late Attendance

**Module:** Attendance  
**Priority:** Medium  
**Type:** Functional Testing

**Precondition:**
- Work start time is configured as 08:00.

**Test Data:**
- Check-In Time: 09:15

**Steps:**
1. Login as employee.
2. Perform check-in at 09:15.
3. Open attendance detail.

**Expected Result:**
- Attendance is successfully recorded.
- Attendance status is marked as Late.

**Actual Result:**  
Attendance is recorded as Late.

**Status:** PASS

---

## TC-ATT-006 — Working Hours Calculation

**Module:** Attendance  
**Priority:** High  
**Type:** Calculation Testing

**Test Data:**
- Check-In: 08:00
- Check-Out: 17:00

**Steps:**
1. Complete check-in and check-out.
2. Open attendance detail.
3. Review calculated working hours.

**Expected Result:**
- Working hours are calculated according to configured business rules.

**Actual Result:**  
Working hours match the expected calculation.

**Status:** PASS

---

## TC-ATT-007 — Attendance History

**Module:** Attendance  
**Priority:** Medium  
**Type:** Functional Testing

**Precondition:**
- Employee has several attendance records.

**Steps:**
1. Login as employee.
2. Open Attendance History.
3. Filter by September 2026.
4. Review displayed data.

**Expected Result:**
- Only attendance records belonging to the logged-in employee are shown.
- Attendance date, check-in, check-out, and status are correct.

**Actual Result:**  
Attendance history displays correct employee data.

**Status:** PASS

---

# Leave Test Cases

## TC-LEV-001 — Submit Leave with Available Balance

**Module:** Leave  
**Priority:** Medium  
**Type:** Positive Testing

**Precondition:**
- Employee leave balance: 12 days.

**Test Data:**
- Leave Duration: 2 days

**Steps:**
1. Open Leave menu.
2. Create a new leave request.
3. Select valid leave dates.
4. Enter leave reason.
5. Submit request.

**Expected Result:**
- Leave request is created successfully.
- Request status is Pending.

**Actual Result:**  
Leave request is successfully created.

**Status:** PASS

---

## TC-LEV-002 — Leave Request Exceeds Balance

**Module:** Leave  
**Priority:** High  
**Type:** Boundary / Negative Testing

**Precondition:**
- Available leave balance: 12 days.

**Test Data:**
- Requested Leave: 13 days

**Steps:**
1. Open Leave Request.
2. Select a 13-day leave period.
3. Submit request.

**Expected Result:**
- Request is rejected.
- User is informed that requested leave exceeds available balance.

**Actual Result:**  
System rejects the request.

**Status:** PASS

---

## TC-LEV-003 — Approved Leave Reduces Balance

**Module:** Leave  
**Priority:** High  
**Type:** Integration Testing

**Precondition:**
- Initial leave balance: 12 days.
- Two-day leave request has been approved.

**Steps:**
1. Open leave request.
2. Confirm status is Approved.
3. Open leave balance.

**Expected Result:**
- Remaining leave balance becomes 10 days.

**Actual Result:**  
Leave balance changes from 12 to 10 days.

**Status:** PASS

---

## TC-LEV-004 — Rejected Leave Does Not Reduce Balance

**Module:** Leave  
**Priority:** High  
**Type:** Integration Testing

**Precondition:**
- Leave balance: 12 days.
- Leave request has been rejected.

**Steps:**
1. Open rejected leave request.
2. Open current leave balance.

**Expected Result:**
- Leave balance remains 12 days.

**Actual Result:**  
Leave balance remains unchanged.

**Status:** PASS

---

## TC-LEV-005 — Overlapping Leave Request

**Module:** Leave  
**Priority:** Medium  
**Type:** Negative Testing

**Precondition:**
- Existing leave: October 10–12, 2026.

**Test Data:**
- New request: October 11–13, 2026.

**Steps:**
1. Create new leave request.
2. Select overlapping dates.
3. Submit request.

**Expected Result:**
- Request is rejected.
- System displays information that the requested date overlaps an existing leave request.

**Actual Result:**  
Request is rejected.

**Status:** PASS

---

# Overtime Test Cases

## TC-OT-001 — Submit Valid Overtime

**Module:** Overtime  
**Priority:** High  
**Type:** Positive Testing

**Precondition:**
- Employee is active.

**Test Data:**
- Overtime Duration: 2 hours

**Steps:**
1. Open Overtime menu.
2. Create overtime request.
3. Enter overtime date and duration.
4. Submit request.

**Expected Result:**
- Overtime request is created.
- Status is Pending.

**Actual Result:**  
Overtime request is successfully created.

**Status:** PASS

---

## TC-OT-002 — Overtime Exceeds Maximum Duration

**Module:** Overtime  
**Priority:** High  
**Type:** Boundary Testing

**Precondition:**
- Maximum overtime per day: 4 hours.

**Test Data:**
- Overtime Duration: 6 hours

**Steps:**
1. Create overtime request.
2. Enter 6 hours.
3. Submit request.

**Expected Result:**
- Request is rejected.
- Maximum overtime validation is displayed.

**Actual Result:**  
Request is rejected.

**Status:** PASS

---

## TC-OT-003 — Duplicate Overtime Request

**Module:** Overtime  
**Priority:** Medium  
**Type:** Negative Testing

**Precondition:**
- Existing overtime request exists for the same date and period.

**Steps:**
1. Create another overtime request for the same period.
2. Submit.

**Expected Result:**
- Duplicate request is rejected.

**Actual Result:**  
Duplicate request is rejected.

**Status:** PASS

---

## TC-OT-004 — Approved Overtime Included in Payroll

**Module:** Overtime / Payroll  
**Priority:** High  
**Type:** Integration Testing

**Precondition:**
- Employee has 4 hours of approved overtime.
- Overtime rate: Rp25,000/hour.

**Steps:**
1. Approve overtime request.
2. Generate employee payroll.
3. Open payroll details.
4. Review overtime component.

**Expected Result:**
- Overtime component is Rp100,000.

**Actual Result:**  
Overtime component is Rp0.

**Status:** FAIL

**Linked Defect:** BUG-PAY-001

---

## TC-OT-005 — Rejected Overtime Excluded from Payroll

**Module:** Overtime / Payroll  
**Priority:** High  
**Type:** Integration Testing

**Precondition:**
- Employee overtime request is rejected.

**Steps:**
1. Generate payroll.
2. Review overtime component.

**Expected Result:**
- Rejected overtime does not affect payroll calculation.

**Actual Result:**  
Rejected overtime is not included in payroll.

**Status:** PASS

---

# Payroll Test Cases

## TC-PAY-001 — Generate Payroll for Active Employee

**Module:** Payroll  
**Priority:** Critical  
**Type:** Positive Testing

**Precondition:**
- Employee status is active.
- Required attendance data is available.

**Steps:**
1. Login as payroll administrator.
2. Select payroll period.
3. Select employee EMP001.
4. Generate payroll.

**Expected Result:**
- Payroll is successfully generated.
- Payroll record is saved.

**Actual Result:**  
Payroll is successfully generated.

**Status:** PASS

---

## TC-PAY-002 — Validate Basic Salary

**Module:** Payroll  
**Priority:** Critical  
**Type:** Data Validation

**Precondition:**
- Employee basic salary in employee master data: Rp5,000,000.

**Steps:**
1. Generate payroll.
2. Open payroll details.
3. Check Basic Salary.

**Expected Result:**
- Basic salary is Rp5,000,000.

**Actual Result:**  
Basic salary is Rp5,000,000.

**Status:** PASS

---

## TC-PAY-003 — Validate Overtime Calculation

**Module:** Payroll  
**Priority:** Critical  
**Type:** Calculation Testing

**Test Data:**
- Approved Overtime: 4 hours
- Overtime Rate: Rp25,000/hour

**Expected Calculation:**

4 × Rp25,000 = Rp100,000

**Steps:**
1. Generate payroll for EMP001.
2. Open payroll details.
3. Review overtime amount.

**Expected Result:**
- Overtime amount is Rp100,000.

**Actual Result:**  
Overtime amount is Rp0.

**Status:** FAIL

**Linked Defect:** BUG-PAY-001

---

## TC-PAY-004 — Attendance Deduction

**Module:** Payroll  
**Priority:** Critical  
**Type:** Calculation Testing

**Precondition:**
- Employee has one unexcused absence.

**Steps:**
1. Generate payroll.
2. Review deduction component.
3. Compare with configured payroll rule.

**Expected Result:**
- Attendance deduction is calculated according to business rules.

**Actual Result:**  
Deduction is calculated correctly.

**Status:** PASS

---

## TC-PAY-005 — Payroll Without Absence or Overtime

**Module:** Payroll  
**Priority:** High  
**Type:** Positive Testing

**Precondition:**
- Employee has full attendance.
- No overtime.
- No additional deductions.

**Steps:**
1. Generate payroll.
2. Review payroll components.

**Expected Result:**
- Payroll contains correct basic salary and applicable standard components.

**Actual Result:**  
Payroll is calculated correctly.

**Status:** PASS

---

## TC-PAY-006 — Validate Payroll API Response

**Module:** Payroll / API  
**Priority:** Critical  
**Type:** API Validation

**Precondition:**
- Payroll has been generated for EMP001.

**Steps:**
1. Send payroll detail API request.
2. Verify HTTP response.
3. Compare salary components with application data.

**Expected Result:**
- API returns HTTP 200.
- Employee and payroll information are correct.
- API values match payroll data.

**Actual Result:**  
API values match the generated payroll record.

**Status:** PASS

---

## TC-PAY-007 — Validate Payroll Against Database

**Module:** Payroll / Database  
**Priority:** Critical  
**Type:** Database Validation

**Precondition:**
- Payroll record exists.

**Steps:**
1. Retrieve payroll through the application/API.
2. Query corresponding payroll record from the database.
3. Compare payroll values.

**Expected Result:**
- Payroll amount and salary components match database records.

**Actual Result:**  
API and database values are consistent.

**Status:** PASS

---

## TC-PAY-008 — Validate Mobile Payroll Against Backend

**Module:** Payroll / Mobile  
**Priority:** Critical  
**Type:** End-to-End Testing

**Precondition:**
- Payroll record exists for EMP001.

**Steps:**
1. Retrieve payroll through backend/API.
2. Login to the employee mobile application.
3. Open Payroll History.
4. Compare displayed values.

**Expected Result:**
- Mobile application displays the same salary components and total salary as backend data.

**Actual Result:**  
Mobile application displays an incorrect overtime amount.

**Status:** FAIL

**Linked Defect:** BUG-PAY-002

---

# Execution Summary

| Status | Count |
|---|---:|
| PASS | 27 |
| FAIL | 3 |
| BLOCKED | 0 |
| **Total** | **30** |

---

## Defects Identified

During test execution, the following defects were identified:

- **BUG-PAY-001** — Approved overtime is not included in payroll calculation.
- **BUG-PAY-002** — Mobile payroll data does not match backend payroll data.

Detailed defect documentation is available in the Bug Reports section of this portfolio.

---

## Notes

This test suite is designed as a portfolio case study to demonstrate manual QA practices including:

- Positive and negative testing
- Boundary testing
- Business rule validation
- Integration testing
- Data consistency validation
- End-to-end testing
- Defect traceability