# Customer Churn Analysis - Power BI Dashboard

## 📌 Project Overview
This project focuses on **Customer Churn Analysis**, aiming to identify key factors that influence customer retention and churn. The goal is to provide data-driven insights that help businesses minimize customer loss and improve engagement strategies. 

The **Power BI Dashboard** visualizes trends, risk factors, and actionable insights, making it easier for stakeholders to make informed decisions.

## 📊 Dataset Details
The dataset consists of customer-related attributes, usage metrics, and churn status. Key columns include:
- **Customer ID** – Unique identifier for each customer
- **Subscription Type** – Type of plan (e.g., Monthly, Yearly, Premium)
- **Tenure (Months)** – Duration of the customer's subscription
- **Monthly Charges** – Amount billed per month
- **Total Charges** – Cumulative billing amount
- **Contract Type** – Month-to-Month, One-Year, Two-Year
- **Payment Method** – Credit Card, Bank Transfer, PayPal, etc.
- **Customer Support Calls** – Number of times a customer contacted support
- **Churn Status** – Whether the customer churned (Yes/No)

## 📈 KPIs & Business Insights
Key performance indicators (KPIs) measured in the dashboard:
- **Total Customers:** 6,418
- **New Joiners:** 411
- **Total Churn:** 1,732
- **Overall Churn Rate:** 27.0%

### 🔍 Churn Breakdown:
- **By Gender:**
  - Male: 64% of total churn
  - Female: 35.85% of total churn
- **By Age Group:**
  - Customers aged **>50 years** have the highest churn rate (31.6%)
- **By State:**
  - Jammu: **57.2%** (highest churn)
  - Assam: **38.1%**, Jharkhand: **34.5%**, Chhattisgarh: **30.5%**, Delhi: **29.9%**
- **By Payment Method:**
  - Mailed Check: **37.8% churn** (highest risk)
  - Bank Withdrawal: **34.4% churn**
  - Credit Card: **14.8% churn** (lowest risk)
- **By Contract Type:**
  - Month-to-Month: **46.5% churn**
  - One-Year: **11.0% churn**
  - Two-Year: **2.7% churn** (lowest risk)
- **By Tenure Group:**
  - Customers with tenure **less than 6 months** have a **26.4% churn rate**
  - Long-term customers (>24 months) still face **27.2% churn**

### 🔍 Services Impact on Churn:
- **Churn by Internet Type:**
  - Fiber Optic: **41.1% churn** (highest risk)
  - Cable: **25.7% churn**
  - DSL: **19.4% churn**
  - No Internet Service: **7.8% churn** (lowest risk)
- **Churn by Subscribed Services:**
  - **Internet Service Users:** **93.7% churn** (critical factor)
  - **Streaming Movies Users:** **44.0% churn**
  - **Online Security Users:** **15.4% churn**
  - **Paperless Billing Users:** **74.6% churn**

## 📊 Power BI Dashboard Components
The dashboard is structured into multiple sections:
1. **Summary Page** – Displays the overall churn rate and high-level KPIs
2. **Demographics** – Breakdown of churn by gender, age group, and state
3. **Account Information** – Impact of contract type, payment method, and tenure on churn
4. **Service Usage Analysis** – Effect of different services on customer churn
5. **Churn Distribution** – Identifies primary reasons for customer churn

## 🔍 Analytical Approach
- **DAX Measures**: Custom calculations for churn percentage, average tenure, and revenue impact
- **Filters & Slicers**: Interactive elements for dynamic analysis
- **Drill-through Analysis**: Enables deeper exploration of specific customer segments
- **Machine Learning Insights (if applied)**: Predictive modeling to identify at-risk customers

## 📌 Conclusion & Business Recommendations
**Findings:**
- Customers with **Month-to-Month contracts** have the highest churn rate
- **High monthly charges** correlate with increased churn risk
- Customers who contact **customer support frequently** are more likely to churn
- **Retention strategies** should focus on better engagement for short-tenure customers

**Next Steps:**
- Offer **discounts or incentives** for long-term contracts
- Improve **customer service response times**
- Analyze **customer feedback** for service improvement
- Implement **personalized offers** based on usage patterns

## 🛠️ Technologies Used
- **Power BI** – Data visualization & dashboard development
- **DAX** – Calculations & measures for dynamic insights
- **SQL / Excel (Optional)** – Data preprocessing

---
This **Churn Analysis Power BI Dashboard** is designed to help businesses **reduce churn, improve retention, and drive revenue growth** through data-driven strategies. 🚀

