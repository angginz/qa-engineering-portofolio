# Payroll & Attendance API Testing

## Overview

This section demonstrates REST API testing for the Payroll & Attendance System.

The API testing focuses on authentication, attendance, leave, overtime, and payroll endpoints.

All endpoints, credentials, IDs, tokens, and response data used in this portfolio are fictional.

---

## Tools

- Postman
- REST API
- JSON
- Bearer Token Authentication

---

## Base URL

```text
https://api.qa-payroll-demo.test/v1
```

This URL is fictional and used only for portfolio documentation.

---

# API Test Scenarios

## API-AUTH-001 — Login with Valid Credentials

**Endpoint**

```http
POST /auth/login
```

**Request Body**

```json
{
  "email": "employee1@test.com",
  "password": "ValidPass123"
}
```

**Expected Status Code**

```text
200 OK
```

**Expected Response**

```json
{
  "success": true,
  "data": {
    "employee_id": "EMP001",
    "name": "Budi Santoso",
    "access_token": "dummy_access_token"
  }
}
```

**Validation**

- Status code is 200.
- `success` is true.
- `employee_id` is correct.
- `access_token` is not null.

**Result:** PASS

---

## API-AUTH-002 — Login with Invalid Password

**Endpoint**

```http
POST /auth/login
```

**Request Body**

```json
{
  "email": "employee1@test.com",
  "password": "WrongPassword"
}
```

**Expected Status Code**

```text
401 Unauthorized
```

**Expected Response**

```json
{
  "success": false,
  "message": "Invalid email or password"
}
```

**Validation**

- Status code is 401.
- Access token is not returned.
- Appropriate error message is displayed.

**Result:** PASS

---

## API-ATT-001 — Employee Check-In

**Endpoint**

```http
POST /attendance/check-in
```

**Authorization**

```text
Bearer Token
```

**Request Body**

```json
{
  "employee_id": "EMP001",
  "check_in_time": "2026-10-01T08:00:00+07:00"
}
```

**Expected Status Code**

```text
201 Created
```

**Expected Response**

```json
{
  "success": true,
  "data": {
    "attendance_id": "ATT001",
    "employee_id": "EMP001",
    "check_in_time": "2026-10-01T08:00:00+07:00",
    "status": "Present"
  }
}
```

**Validation**

- Attendance record is successfully created.
- Employee ID matches request data.
- Check-in time is correct.
- Attendance ID is generated.

**Result:** PASS

---

## API-ATT-002 — Duplicate Check-In

**Endpoint**

```http
POST /attendance/check-in
```

**Precondition**

Employee EMP001 has already checked in for the same date.

**Expected Status Code**

```text
409 Conflict
```

**Expected Response**

```json
{
  "success": false,
  "message": "Employee has already checked in today"
}
```

**Validation**

- Duplicate attendance is rejected.
- No additional attendance record is created.

**Result:** PASS

---

## API-ATT-003 — Get Attendance History

**Endpoint**

```http
GET /attendance?employee_id=EMP001&period=2026-09
```

**Expected Status Code**

```text
200 OK
```

**Expected Response**

```json
{
  "success": true,
  "data": [
    {
      "attendance_id": "ATT001",
      "date": "2026-09-01",
      "check_in": "08:02",
      "check_out": "17:03",
      "status": "Present"
    }
  ]
}
```

**Validation**

- Response belongs to EMP001.
- Attendance period matches requested period.
- Attendance records are not duplicated.

**Result:** PASS

---

# Leave API Testing

## API-LEV-001 — Submit Valid Leave Request

**Endpoint**

```http
POST /leave
```

**Request Body**

```json
{
  "employee_id": "EMP001",
  "start_date": "2026-10-12",
  "end_date": "2026-10-13",
  "leave_type": "Annual Leave",
  "reason": "Personal matter"
}
```

**Expected Status Code**

```text
201 Created
```

**Expected Response**

```json
{
  "success": true,
  "data": {
    "leave_id": "LEV001",
    "status": "Pending"
  }
}
```

**Validation**

- Leave request is successfully created.
- Default leave status is Pending.

**Result:** PASS

---

## API-LEV-002 — Leave Request Exceeds Balance

**Request Body**

```json
{
  "employee_id": "EMP001",
  "start_date": "2026-10-01",
  "end_date": "2026-10-20",
  "leave_type": "Annual Leave"
}
```

**Precondition**

Available leave balance is 12 days.

**Expected Status Code**

```text
400 Bad Request
```

**Expected Response**

```json
{
  "success": false,
  "message": "Requested leave exceeds available balance"
}
```

**Result:** PASS

---

# Overtime API Testing

## API-OT-001 — Submit Valid Overtime

**Endpoint**

```http
POST /overtime
```

**Request Body**

```json
{
  "employee_id": "EMP001",
  "date": "2026-10-02",
  "start_time": "18:00",
  "end_time": "20:00"
}
```

**Expected Status Code**

```text
201 Created
```

**Expected Response**

```json
{
  "success": true,
  "data": {
    "overtime_id": "OT001",
    "duration": 2,
    "status": "Pending"
  }
}
```

**Validation**

- Overtime duration is calculated as 2 hours.
- Status is Pending.

**Result:** PASS

---

## API-OT-002 — Overtime Exceeds Maximum Duration

**Request Body**

```json
{
  "employee_id": "EMP001",
  "date": "2026-10-02",
  "start_time": "18:00",
  "end_time": "23:30"
}
```

**Expected Status Code**

```text
400 Bad Request
```

**Expected Response**

```json
{
  "success": false,
  "message": "Overtime duration exceeds daily maximum"
}
```

**Result:** PASS

---

# Payroll API Testing

## API-PAY-001 — Get Employee Payroll

**Endpoint**

```http
GET /payroll/EMP001?period=2026-09
```

**Expected Status Code**

```text
200 OK
```

**Expected Response**

```json
{
  "success": true,
  "data": {
    "employee_id": "EMP001",
    "period": "2026-09",
    "basic_salary": 5000000,
    "overtime_amount": 100000,
    "deduction": 0,
    "net_salary": 5100000
  }
}
```

**Validation**

- Employee ID is correct.
- Payroll period is correct.
- Basic salary is Rp5,000,000.
- Overtime amount matches approved overtime.
- Net salary calculation is correct.

**Result:** PASS

---

## API-PAY-002 — Payroll Overtime Validation

**Precondition**

Employee has:

```text
Approved Overtime: 4 Hours
Overtime Rate: Rp25,000 / Hour
```

Expected calculation:

```text
4 × Rp25,000 = Rp100,000
```

**Expected Response**

```json
{
  "overtime_amount": 100000
}
```

**Actual Response**

```json
{
  "overtime_amount": 0
}
```

**Result:** FAIL

**Linked Defect:** BUG-PAY-001

---

## API-PAY-003 — Payroll Employee Not Found

**Endpoint**

```http
GET /payroll/EMP999?period=2026-09
```

**Expected Status Code**

```text
404 Not Found
```

**Expected Response**

```json
{
  "success": false,
  "message": "Employee not found"
}
```

**Result:** PASS

---

# Example Postman Tests

The following Postman tests can be used to automatically validate API responses.

## Validate Status Code

```javascript
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});
```

## Validate Successful Response

```javascript
pm.test("Response success is true", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData.success).to.eql(true);
});
```

## Validate Employee ID

```javascript
pm.test("Employee ID is correct", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData.data.employee_id).to.eql("EMP001");
});
```

## Validate Access Token

```javascript
pm.test("Access token exists", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData.data.access_token).to.exist;
});
```

## Validate Payroll Calculation

```javascript
pm.test("Net salary calculation is correct", function () {
    const jsonData = pm.response.json();

    const basicSalary = jsonData.data.basic_salary;
    const overtime = jsonData.data.overtime_amount;
    const deduction = jsonData.data.deduction;

    const expectedNetSalary =
        basicSalary + overtime - deduction;

    pm.expect(jsonData.data.net_salary)
        .to.eql(expectedNetSalary);
});
```

---

# API Test Summary

| Test ID | Scenario | Expected Status | Result |
|---|---|---:|---|
| API-AUTH-001 | Valid Login | 200 | PASS |
| API-AUTH-002 | Invalid Password | 401 | PASS |
| API-ATT-001 | Check-In | 201 | PASS |
| API-ATT-002 | Duplicate Check-In | 409 | PASS |
| API-ATT-003 | Attendance History | 200 | PASS |
| API-LEV-001 | Valid Leave Request | 201 | PASS |
| API-LEV-002 | Leave Exceeds Balance | 400 | PASS |
| API-OT-001 | Valid Overtime | 201 | PASS |
| API-OT-002 | Overtime Exceeds Maximum | 400 | PASS |
| API-PAY-001 | Get Payroll | 200 | PASS |
| API-PAY-002 | Overtime Calculation | 200 | FAIL |
| API-PAY-003 | Employee Not Found | 404 | PASS |

---

## Execution Summary

| Status | Count |
|---|---:|
| PASS | 11 |
| FAIL | 1 |
| **Total** | **12** |

---

## Notes

This API testing documentation demonstrates:

- HTTP status code validation
- Request and response validation
- Authentication testing
- Positive and negative API testing
- Business rule validation
- Payroll calculation validation
- Error response validation
- Defect traceability
- Basic Postman automation using test scripts