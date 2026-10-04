-- =========================================================
-- Payroll & Attendance System
-- Database Validation Queries
-- Database: PostgreSQL
-- Note: All table names and data are fictional.
-- =========================================================


-- 1. Validate employee data
SELECT
    id,
    employee_code,
    name,
    employment_status,
    basic_salary
FROM employees
WHERE employee_code = 'EMP001';


-- 2. Validate employee attendance for a specific date
SELECT
    id,
    employee_id,
    attendance_date,
    check_in,
    check_out,
    status
FROM attendance
WHERE employee_id = 1
  AND attendance_date = '2026-10-01';


-- 3. Validate employee attendance history
SELECT
    employee_id,
    attendance_date,
    check_in,
    check_out,
    status
FROM attendance
WHERE employee_id = 1
  AND attendance_date BETWEEN '2026-09-01' AND '2026-09-30'
ORDER BY attendance_date ASC;


-- 4. Check duplicate attendance records
SELECT
    employee_id,
    attendance_date,
    COUNT(*) AS total_records
FROM attendance
GROUP BY
    employee_id,
    attendance_date
HAVING COUNT(*) > 1;


-- 5. Count attendance records for one employee
SELECT
    employee_id,
    COUNT(*) AS total_attendance
FROM attendance
WHERE employee_id = 1
  AND attendance_date BETWEEN '2026-09-01' AND '2026-09-30'
GROUP BY employee_id;


-- 6. Validate employee leave balance
SELECT
    employee_id,
    annual_leave_balance
FROM employee_leave_balances
WHERE employee_id = 1;


-- 7. Validate leave requests
SELECT
    id,
    employee_id,
    start_date,
    end_date,
    total_days,
    status
FROM leave_requests
WHERE employee_id = 1
ORDER BY start_date DESC;


-- 8. Validate approved leave requests
SELECT
    id,
    employee_id,
    start_date,
    end_date,
    total_days,
    status
FROM leave_requests
WHERE employee_id = 1
  AND status = 'Approved';


-- 9. Validate overtime requests
SELECT
    id,
    employee_id,
    overtime_date,
    duration_hours,
    status
FROM overtime_requests
WHERE employee_id = 1
ORDER BY overtime_date DESC;


-- 10. Calculate total approved overtime
SELECT
    employee_id,
    SUM(duration_hours) AS total_overtime_hours
FROM overtime_requests
WHERE employee_id = 1
  AND status = 'Approved'
  AND overtime_date BETWEEN '2026-09-01' AND '2026-09-30'
GROUP BY employee_id;


-- 11. Validate payroll record
SELECT
    id,
    employee_id,
    payroll_period,
    basic_salary,
    overtime_amount,
    deduction_amount,
    net_salary
FROM payrolls
WHERE employee_id = 1
  AND payroll_period = '2026-09';


-- 12. Validate payroll calculation
SELECT
    employee_id,
    payroll_period,
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


-- 13. Find payroll calculation mismatch
SELECT
    employee_id,
    payroll_period,
    net_salary,
    (
        basic_salary
        + overtime_amount
        - deduction_amount
    ) AS expected_net_salary
FROM payrolls
WHERE net_salary != (
    basic_salary
    + overtime_amount
    - deduction_amount
);


-- 14. Validate payroll with employee data using JOIN
SELECT
    e.employee_code,
    e.name,
    e.basic_salary AS employee_basic_salary,
    p.payroll_period,
    p.basic_salary AS payroll_basic_salary,
    p.overtime_amount,
    p.deduction_amount,
    p.net_salary
FROM employees e
JOIN payrolls p
    ON e.id = p.employee_id
WHERE e.employee_code = 'EMP001'
  AND p.payroll_period = '2026-09';


-- 15. Validate approved overtime and payroll data using JOIN
SELECT
    e.employee_code,
    o.overtime_date,
    o.duration_hours,
    o.status,
    p.payroll_period,
    p.overtime_amount
FROM employees e
JOIN overtime_requests o
    ON e.id = o.employee_id
JOIN payrolls p
    ON e.id = p.employee_id
WHERE e.employee_code = 'EMP001'
  AND o.status = 'Approved'
  AND p.payroll_period = '2026-09';


-- 16. Calculate approved overtime hours per employee
SELECT
    e.employee_code,
    e.name,
    SUM(o.duration_hours) AS total_approved_overtime
FROM employees e
JOIN overtime_requests o
    ON e.id = o.employee_id
WHERE o.status = 'Approved'
  AND o.overtime_date BETWEEN '2026-09-01' AND '2026-09-30'
GROUP BY
    e.employee_code,
    e.name;


-- 17. Validate attendance data with employee information
SELECT
    e.employee_code,
    e.name,
    a.attendance_date,
    a.check_in,
    a.check_out,
    a.status
FROM employees e
JOIN attendance a
    ON e.id = a.employee_id
WHERE e.employee_code = 'EMP001'
  AND a.attendance_date BETWEEN '2026-09-01' AND '2026-09-30'
ORDER BY a.attendance_date ASC;


-- 18. Count attendance by attendance status
SELECT
    status,
    COUNT(*) AS total
FROM attendance
WHERE employee_id = 1
  AND attendance_date BETWEEN '2026-09-01' AND '2026-09-30'
GROUP BY status
ORDER BY total DESC;