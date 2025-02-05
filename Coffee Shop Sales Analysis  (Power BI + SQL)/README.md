# Coffee Shop Sales Data Analytics Project

## Project Overview
This project is a comprehensive data analytics solution that leverages SQL and Power BI to analyze and visualize coffee shop sales data. The goal is to extract actionable insights from transaction data, including sales trends, order patterns, and customer behavior.

## Tools & Technologies Used
- **SQL (MySQL)**: For data cleaning, transformation, and analysis.
- **Power BI**: For data visualization and dashboard creation.

## Key Features & Analysis
### **1. Data Cleaning & Transformation (SQL)**
- Converted `transaction_date` and `transaction_time` to proper formats.
- Renamed misformatted column names.
- Modified data types for improved query efficiency.

### **2. Sales Performance Metrics**
- **Total Sales**: Computed by summing `unit_price * transaction_qty`.
- **Month-over-Month (MoM) Growth**: Analyzed sales increase or decrease compared to the previous month.
- **Daily, Weekly, and Monthly Sales Trends**.

### **3. Order Analysis**
- **Total Orders**: Counted unique transactions.
- **Orders Trend Analysis**: Identified MoM percentage change in order volume.

### **4. Product Performance**
- **Sales by Product Category**: Determined top-selling categories.
- **Top 10 Products**: Ranked products by total revenue.

### **5. Store Location Analysis**
- **Sales by Store Location**: Compared performance across different branches.
- **Sales by Day & Hour**: Identified peak business hours and best-performing days.

### **6. Advanced Business Insights**
- **Sales Trend Over Time**: Used moving averages to assess seasonal fluctuations.
- **Daily Sales vs. Average Sales**: Categorized days as "Above Average" or "Below Average".
- **Weekday vs. Weekend Performance**: Evaluated consumer behavior variations.

## Power BI Dashboard
- **Interactive Visuals**: Sales trends, key performance indicators (KPIs), and store-wise comparisons.
- **Drill-down Features**: Allows detailed analysis at different granularity levels.
- **Filters**: Users can filter data by date, product category, location, and sales trends.

## How to Use the Project
1. **SQL Analysis**: Run the provided SQL queries in MySQL Workbench or any compatible SQL environment.
2. **Power BI Dashboard**:
   - Load the cleaned data into Power BI.
   - Use the interactive dashboard to explore insights.
   
## Business Impact
This project helps coffee shop owners and managers:
- Identify sales trends and optimize inventory management.
- Improve pricing strategies based on demand fluctuations.
- Increase revenue by focusing on high-performing products and stores.

## Future Enhancements
- **Predictive Analytics**: Implement machine learning models to forecast future sales.
- **Customer Segmentation**: Use clustering techniques to categorize customer preferences.
- **Automated Data Pipelines**: Improve efficiency with scheduled SQL procedures and Power BI data refresh automation.

