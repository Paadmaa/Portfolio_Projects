# SupplyChain Analytics Fashion (Beauty)

## Project Overview
This project utilizes Power BI to analyze supply chain data for a Fashion & Beauty startup, aiming to enhance operations, minimize costs, and boost customer satisfaction. It features interactive dashboards and data-driven insights, with a focus on inventory management, logistics efficiency, and supplier performance.

## Objectives
- Identify bottlenecks in supply chain operations.
- Improve product availability and inventory management.
- Reduce lead times and shipping costs.

## Dataset
The dataset is based on the supply chain of Makeup products. Below are all the features in the dataset:

- **Product Type –** The category or classification of the makeup product (e.g., lipstick, foundation, mascara).
- **SKU (Stock Keeping Unit) –** A unique identifier assigned to each product for inventory tracking.
- **Price –** The selling price of the product.
- **Availability –** The stock status of the product (e.g., In Stock, Out of Stock).
- **Number of Products Sold –** The total quantity of a product sold within a specific period.
- **Revenue Generated –** The total earnings from the sales of a specific product.
- **Customer Demographics –** Information about customers, such as age, gender, location, and purchasing behavior.
- **Stock Levels –** The number of units of a product available in inventory at a given time.
- **Lead Times –** The time taken from placing an order to receiving the product.
- **Order Quantities –** The number of units ordered from suppliers or warehouses.
- **Shipping Times –** The duration it takes for a product to be delivered to customers.
- **Shipping Carriers –** The logistics companies responsible for transporting the products (e.g., FedEx, UPS).
- **Shipping Costs –** The expenses incurred for shipping products to customers or warehouses.
- **Supplier Name –** The name of the supplier or manufacturer providing the product.
- **Location –** The geographical location of suppliers, warehouses, or customers.
- **Lead Time –** The time required for a supplier to fulfill an order.
- **Production Volumes –** The total quantity of products manufactured within a given timeframe.
- **Manufacturing Lead Time –** The duration required to produce a product from raw materials.
- **Manufacturing Costs –** The total expenses involved in producing a product, including labor and materials.
- **Inspection Results –** The outcome of quality checks performed on products before distribution.
- **Defect Rates –** The percentage of defective or non-compliant products in a batch.
- **Transportation Modes –** The means of transport used for product delivery (e.g., air, sea, road).
- **Routes –** The logistics paths taken for product transportation from suppliers to warehouses or customers.
- **Costs –** The overall expenses associated with supply chain operations, including production, logistics, and distribution.

## Dashboard Preview
#### Inventory Management
![image](https://github.com/user-attachments/assets/fbf96514-3b24-4acf-915b-f77d4614f6d5)

#### Revenue Insights
![image](https://github.com/user-attachments/assets/5f4afd9e-cc4b-4a3d-a99e-9f6d12283182)

#### Shipping Analysis
![image](https://github.com/user-attachments/assets/f5e4f66a-7ffd-45ed-a7b1-2e57ce9a2eb3)

#### Manufacturing Analysis
![image](https://github.com/user-attachments/assets/290a2bc0-2b66-4253-b92a-66b471640ea2)

#### Defect Rating Analysis
![image](https://github.com/user-attachments/assets/9941b2c9-fe2d-45b3-a4b9-fb0e99a1d87f)

## Summary of Insights 

### 📊Dashboard-1: Inventory Management
#### Overall SKU Performance
- The business offers 100 SKUs, contributing to total revenue of $577,605 with 46,099 products sold.
- The total shipping cost is $554.81, while manufacturing costs amount to $4,727, indicating cost efficiency in production but potentially high logistics expenses

#### Stock Levels & Product Performance
- Skincare products are the top-selling category with 21K units sold, followed by Haircare (14K) and Cosmetics (12K).
- Some SKUs have lower stock availability, which might indicate either high demand or supply chain inefficiencies

#### Shipping & Lead Time Analysis
- There is variability in shipping times by product type, with some products experiencing longer delivery durations.
- Some SKUs with higher stock levels still experience longer shipping times, possibly due to logistical inefficiencies.
- Lead times fluctuate, which may impact the timely stock replenishment.

#### Order & Demand Patterns
- Order quantities by SKU are evenly distributed, but some high-selling products may require better forecasting to prevent stockouts.
- Ensuring top-performing SKUs have optimized inventory levels across all locations can prevent lost sales opportunities.

#### Key Recommendations
- Improve demand forecasting for skincare products to prevent potential stock shortages.
- Optimize logistics & shipping efficiency to reduce lead times and enhance customer satisfaction.
- Analyze supplier performance to minimize fluctuations in stock availability.
- Monitor high shipping cost SKUs and explore alternative carriers or bulk shipping options.

### 📊Dashboard-2: Revenue Insights
#### Revenue Breakdown by Product Type
- Skincare generates the highest revenue at $241.63K (41.83%).
- Haircare follows with $174.46K (30.2%), while cosmetics contribute $161.52K (27.96%).
- Skincare products have the highest sales, which indicates strong customer demand in this category.

#### Revenue by Location & Customer Demographics
- Kolkata shows the highest revenue, with a significant proportion from customers in the Unknown category.
- Bangalore and Mumbai have nearly similar revenue distributions, with female and male customers contributing almost equally.
- Chennai and Delhi show lower revenue, with Delhi having the least revenue from male and non-binary customers.
- Actionable Insight: Conduct targeted marketing efforts in Chennai and Delhi to boost revenue.

#### Transportation Mode Analysis
- Air transport leads in revenue generation with $164.99K (28.56%), closely followed by Road ($159.32K, 27.58%).
- Sea and Rail transport contribute a combined 43.85% of revenue.
- Air transport's high revenue suggests its efficiency, but cost implications should be analyzed further.

#### Shipping Costs & Revenue by Carriers
- Carrier B generates the highest revenue ($250K) but has the highest shipping costs ($0.24M).
- Carrier A and Carrier C have similar revenue ($185K & $143K), but their shipping costs are relatively lower.
- Carrier B may be more expensive; exploring cost-effective alternatives could increase profit margins.

#### Revenue by Supplier
- Supplier 1 leads with $158K, followed by Supplier 2 ($125K) and Supplier 5 ($110K).
- Suppliers 3 and 4 generate lower revenues ($98K & $86K), indicating possible supply chain inefficiencies or lower demand for their products.

#### Key Recommendations
- Optimize supply chain costs by negotiating better deals with Carrier B or shifting volumes to cost-efficient carriers.
- Expand product variety in cosmetics to boost its market share.
- Implement location-specific marketing strategies, especially in Delhi & Chennai, to increase sales.
- Assess supplier performance and consider forming new supplier partnerships for underperforming categories.

### 📊Dashboard-3 Shipping Analysis
#### Average Shipping Metrics
- Avg. Shipping Rate: 5.55
- Avg. Shipping Time: 5.75 days
  
#### Shipping Costs by Routes
- Route A has the highest shipping costs (41.69%), followed by Route C (37.03%) and Route B (21.28%).
  
**Recommendation:** Investigate cost drivers for Route A and consider alternative logistics solutions.

#### Shipping Costs by Transportation Mode
- Air (28.97%) and Road (28.2%) are the primary shipping modes, followed by Sea (27.6%) and Rail (15.23%).
- Air transport is the most expensive, while rail transport is the least used despite its cost-effectiveness.
  
**Recommendation:** Shift more shipments to rail where feasible to reduce costs.

#### Shipping Costs by Supplier
- Supplier 1 incurs the highest shipping costs ($149K), followed by Supplier 2 ($126K).
- Supplier 3 has the lowest shipping cost ($72K).

**Recommendation:** Assess supplier efficiency and negotiate better shipping rates with high-cost suppliers.

#### Shipping Costs by Stock Levels
- Shipping costs fluctuate across different stock levels, with peaks at 31, 26, and 13 units.

#### Shipping Costs by Product Type & Time
- Skincare and haircare products show fluctuating shipping costs over time, while cosmetics have more consistent costs.
**Recommendations**: Identify potential inefficiencies in skincare and haircare shipping logistics.

#### Product Level Analysis
- Cosmetics seem to have fluctuating shipping costs, peaking around the 8th time unit.
- Haircare shows a more stable trend but with a few peaks.
- Skincare has a steep rise in shipping costs between time units 6-8.

**Possibilities:**
- Some product types might require special handling (e.g., fragile packaging or temperature control), leading to higher costs.
- A particular supplier might be increasing costs for a specific product type.
- A longer shipping time could indicate inefficiencies in fulfillment or logistics for a particular category.


## 📊Dashboard-4: Manufacturing Analysis
#### Average Manufacturing Metrics
- **Avg. Manufacturing Lead Time:** 14.77 days.
- **Avg. Manufacturing Cost:** 47.27 units.

#### Manufacturing Costs by Product Type
- **Haircare:** 41.46% (highest manufacturing cost share).
- **Skincare:** 34.86%.
- **Cosmetics:** 23.68%.
- Haircare products are the most expensive to manufacture, suggesting a potential area for cost optimization.

#### Manufacturing Lead Time by Product Type
- **Haircare:** 580 units (highest lead time).
- **Skincare:** 551 units.
- **Cosmetics:** 346 units (lowest lead time).
- Haircare and skincare products take significantly longer to manufacture than cosmetics.

#### Manufacturing Lead Time vs. Costs
- The fluctuating trend of manufacturing lead time against cost for different product types suggests inconsistencies in production efficiency.

####  Manufacturing Costs by Order Quantities
- Costs vary widely across different order quantities, with some order quantities having spikes in manufacturing costs.
- Identifying the reasons behind these spikes (e.g., bulk orders, inefficiencies) can help optimize production planning.

### 📊Dashboard-5: Defect rate Analysis
#### Average Defect Rate
- 2.28% avg. defect rate, which indicates an overall low defect percentage but can be further improved.

#### Defect Rate by Product Type
- **Skincare:** 93 defects (highest).
- **Haircare:** 84 defects.
- **Cosmetics:** 50 defects (lowest).
- Skincare products have the highest defect rates, requiring quality improvement efforts.

#### Defect Rate by Product Price
- Defect rates vary across different price ranges without a clear trend, suggesting that product quality issues might not be directly linked to pricing.

#### Defect Rate by Production Volume
- Defect rates are scattered across different production volumes, implying that defects are not necessarily linked to high or low production quantities.

#### Defect Rate by Transportation Mode
- **Road:** 33.38% (highest defects).
- **Rail:** 28.51%.
- **Air:** 20.83%.
- **Sea:** 17.28% (lowest defects).
Road transportation has the highest defect rate, which might indicate packaging or handling issues.

####  Defect Rate by Route
- **Route A:** 101 defects (highest).
- **Route B:** 86 defects.
- **Route C:** 41 defects (lowest).
Route A has significantly more defects, suggesting possible logistic or handling issues.

#### Defect Rate by Supplier
- **Supplier 2:** 52 defects (highest).
- **Supplier 1 & Supplier 5:** 49 & 48 defects.
- **Supplier 3:** 37 defects (lowest).
Supplier 2 has the highest defect rate, suggesting quality control issues in their products.
