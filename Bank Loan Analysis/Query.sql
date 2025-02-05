CREATE TABLE financial_loans (
    id INT PRIMARY KEY,
    address_state VARCHAR(2),
    application_type VARCHAR(20),
    emp_length VARCHAR(20),
    emp_title VARCHAR(50),
    grade CHAR(1),
    home_ownership VARCHAR(10),
    issue_date DATE,
    last_credit_pull_date DATE,
    last_payment_date DATE,
    loan_status VARCHAR(20),
    next_payment_date DATE,
    member_id INTEGER,
    purpose VARCHAR(20),
    sub_grade VARCHAR(2),
    term VARCHAR(20),
    verification_status VARCHAR(20),
    annual_income NUMERIC,
    dti NUMERIC,
    installment NUMERIC,
    int_rate NUMERIC,
    loan_amount NUMERIC,
    total_acc INTEGER,
    total_payment NUMERIC
);

ALTER TABLE financial_loans
ALTER COLUMN emp_title TYPE VARCHAR(100);

SELECT * FROM financial_loans;

-- Total Loan Applications
SELECT COUNT(id) AS Total_Applications FROM financial_loans;

-- MTD Loan Applications

SELECT COUNT(id) AS Total_Applications
FROM financial_loans
WHERE EXTRACT(MONTH FROM issue_date) = 12;

-- PMTD Loan Applications
SELECT COUNT(id) AS Total_Applications
FROM financial_loans
WHERE EXTRACT(MONTH FROM issue_date) = 11;

-- Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial_loans;

-- MTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Applications
FROM financial_loans
WHERE EXTRACT(MONTH FROM issue_date) = 12;

-- PMTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Applications
FROM financial_loans
WHERE EXTRACT(MONTH FROM issue_date) = 11;

-- Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial_loans;

-- MTD Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected
FROM financial_loans
WHERE EXTRACT(MONTH FROM issue_date) = 12;

-- PMTD Total Amount Received

SELECT SUM(total_payment) AS Total_Amount_Collected
FROM financial_loans
WHERE EXTRACT(MONTH FROM issue_date) = 11;

-- Average Interest Rate
SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM financial_loans;

-- MTD Average Interest
SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate
FROM financial_loans
WHERE EXTRACT(MONTH FROM issue_date) = 12;

-- PMTD Average Interest
SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate
FROM financial_loans
WHERE EXTRACT(MONTH FROM issue_date) = 11;

-- Avg DTI
SELECT AVG(dti)*100 AS Avg_DTI FROM financial_loans;

-- MTD Avg DTI
SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM financial_loans
WHERE EXTRACT(MONTH FROM issue_date) = 12;

-- PMTD Avg DTI
SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM financial_loans
WHERE EXTRACT(MONTH FROM issue_date) = 11;

-- GOOD LOAN ISSUED -- 

-- Good Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM financial_loans;

-- Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM financial_loans
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM financial_loans
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM financial_loans
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- BAD LOAN ISSUED --

-- Bad Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM financial_loans;

-- Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM financial_loans
WHERE loan_status = 'Charged Off';

-- Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM financial_loans
WHERE loan_status = 'Charged Off';

-- Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM financial_loans
WHERE loan_status = 'Charged Off';

-- LOAN STATUS
	SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        financial_loans
    GROUP BY
        loan_status;

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM financial_loans
WHERE EXTRACT(MONTH FROM issue_date) = 12 
GROUP BY loan_status;


-- BANK LOAN --

-- MONTH

SELECT 
    EXTRACT(MONTH FROM issue_date::date) AS Month_Number,
    TO_CHAR(issue_date::date, 'FMMonth') AS Month_Name,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM financial_loans
GROUP BY Month_Number, Month_Name
ORDER BY Month_Number;

-- STATE

SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loans
GROUP BY address_state
ORDER BY address_state;

-- TERM

SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loans
GROUP BY term
ORDER BY term;

-- EMPLOYEE LENGTH

SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loans
GROUP BY emp_length
ORDER BY emp_length;

-- PURPOSE

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loans
GROUP BY purpose
ORDER BY purpose;

-- HOME OWNERSHIP

SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loans
GROUP BY home_ownership
ORDER BY home_ownership;


SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loans
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose;




