# Database Validation

## Overview

This section demonstrates SQL-based data validation for the Payroll & Attendance System.

Database testing is used to verify that data displayed through the application and returned by REST APIs is consistent with data stored in the database.

The database structure, table names, employee information, IDs, salary values, and other data used in this portfolio are fictional.

---

## Database

**Database Management System:** PostgreSQL

---

## Validation Scope

SQL validation in this project covers:

- Employee data
- Attendance records
- Attendance history
- Duplicate attendance records
- Leave balance
- Leave requests
- Overtime requests
- Approved overtime calculation
- Payroll records
- Payroll calculation
- Employee and payroll data consistency
- Attendance and employee data relationships

---

# Example Validation Flow

A common QA validation flow used in this project is:

```text
Mobile / Web Application
        ↓
REST API Response
        ↓
Database Record
        ↓
Compare Expected and Actual Data
```

For example:

```text
Employee: EMP001
Payroll Period: September 2026
```

API response:

```text
basic_salary = 5000000
overtime_amount = 100000
deduction_amount = 0
net_salary = 5100000
```

Database result:

```text
basic_salary = 5000000
overtime_amount = 100000
deduction_amount = 0
net_salary = 5100000
```

Result:

```text
PASS
```

The API response and database record contain the same payroll values.

---

# Employee Validation

Employee data can be verified using the employee code.

Example:

```sql
SELECT
    id,
    employee_code,
    name,
    employment_status,
    basic_salary
FROM employees
WHERE employee_code = 'EMP001';
```

This query can be used to verify:

- employee identity,
- employment status,
- and basic salary.

---

# Attendance Validation

Attendance records can be validated by employee and attendance date.

Example:

```sql
SELECT
    attendance_date,
    check_in,
    check_out,
    status
FROM attendance
WHERE employee_id = 1
  AND attendance_date BETWEEN '2026-09-01' AND '2026-09-30'
ORDER BY attendance_date ASC;
```

This query can help verify whether attendance information displayed in the application matches the database record.

---

# Duplicate Attendance Validation

Duplicate attendance can be identified using `COUNT`, `GROUP BY`, and `HAVING`.

Example:

```sql
SELECT
    employee_id,
    attendance_date,
    COUNT(*) AS total_records
FROM attendance
GROUP BY
    employee_id,
    attendance_date
HAVING COUNT(*) > 1;
```

Expected result:

```text
No record should have total_records greater than 1.
```

If a result is returned, the employee may have duplicate attendance records for the same date.

---

# Leave Validation

Leave balance can be verified using:

```sql
SELECT
    employee_id,
    annual_leave_balance
FROM employee_leave_balances
WHERE employee_id = 1;
```

For example:

```text
Initial Leave Balance: 12 Days
Approved Leave: 2 Days

Expected Remaining Balance:
10 Days
```

The QA can compare the leave balance displayed in the application with the value stored in the database.

---

# Overtime Validation

Approved overtime can be calculated using `SUM`.

Example:

```sql
SELECT
    employee_id,
    SUM(duration_hours) AS total_overtime_hours
FROM overtime_requests
WHERE employee_id = 1
  AND status = 'Approved'
  AND overtime_date BETWEEN '2026-09-01' AND '2026-09-30'
GROUP BY employee_id;
```

Example result:

```text
total_overtime_hours = 4
```

If the overtime rate is:

```text
Rp25,000 / Hour
```

then the expected overtime amount is:

```text
4 × Rp25,000 = Rp100,000
```

The result can then be compared with the payroll data.

---

# Payroll Validation

Payroll data can be verified using:

```sql
SELECT
    basic_salary,
    overtime_amount,
    deduction_amount,
    net_salary
FROM payrolls
WHERE employee_id = 1
  AND payroll_period = '2026-09';
```

Expected calculation:

```text
Net Salary =
Basic Salary
+ Overtime Amount
- Deduction Amount
```

Example:

```text
Basic Salary       = Rp5,000,000
Overtime Amount    = Rp100,000
Deduction Amount   = Rp0
--------------------------------
Expected Net Salary = Rp5,100,000
```

---

# Payroll Calculation Validation

SQL can also calculate the expected salary directly:

```sql
SELECT
    basic_salary,
    overtime_amount,
    deduction_amount,
    net_salary,
    (
        basic_salary
        + overtime_amount
        - deduction_amount
    ) AS expected_net_salary
FROM payrolls
WHERE employee_id = 1
  AND payroll_period = '2026-09';
```

QA can compare:

```text
net_salary
```

with:

```text
expected_net_salary
```

If the two values are different, further investigation is required.

---

# Using JOIN for Data Validation

A `JOIN` can be used to compare data stored in related tables.

For example, employee information can be combined with payroll data:

```sql
SELECT
    e.employee_code,
    e.name,
    e.basic_salary AS employee_basic_salary,
    p.basic_salary AS payroll_basic_salary,
    p.net_salary
FROM employees e
JOIN payrolls p
    ON e.id = p.employee_id
WHERE e.employee_code = 'EMP001'
  AND p.payroll_period = '2026-09';
```

This can help verify that payroll belongs to the correct employee and that the payroll data is consistent with employee master data.

---

# Example Defect Investigation

Assume the application shows:

```text
Overtime Amount: Rp0
```

but the employee has:

```text
Approved Overtime: 4 Hours
```

QA can first validate the overtime data:

```sql
SELECT
    overtime_date,
    duration_hours,
    status
FROM overtime_requests
WHERE employee_id = 1
  AND status = 'Approved';
```

If the database contains:

```text
duration_hours = 4
status = Approved
```

then QA can check payroll:

```sql
SELECT
    overtime_amount
FROM payrolls
WHERE employee_id = 1
  AND payroll_period = '2026-09';
```

If the result is:

```text
overtime_amount = 0
```

this indicates that the issue may be related to payroll calculation or integration between overtime and payroll.

This investigation can then be linked to:

```text
BUG-PAY-001
```

---

# Key SQL Skills Demonstrated

The SQL queries in this project demonstrate:

- SELECT
- WHERE
- BETWEEN
- ORDER BY
- COUNT
- SUM
- GROUP BY
- HAVING
- JOIN
- Data comparison
- Calculation validation

---

## Files

- [SQL Validation Queries](./validation-queries.sql)

---

## Notes

The objective of database testing in this portfolio is not to demonstrate advanced database administration.

The purpose is to show how SQL can be used by QA to:

- verify application data,
- compare API and database values,
- investigate defects,
- validate calculations,
- identify duplicate records,
- and confirm relationships between application data.

The SQL examples in this portfolio are intentionally focused on practical QA validation scenarios.