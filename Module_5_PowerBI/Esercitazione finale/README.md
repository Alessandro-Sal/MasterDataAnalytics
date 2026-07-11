# Olist E-Commerce Analytics - Power BI Dashboard

## 📊 Project Overview
This project involves the end-to-end development of a Business Intelligence solution using **Power BI** to analyze the performance of **Olist**, a Brazilian e-commerce platform. The dashboard provides actionable insights into sales trends, geographic revenue distribution, and customer satisfaction (ratings), empowering stakeholders to make data-driven decisions.

## 🛠️ Tech Stack & Skills Demonstrated
- **Tool**: Microsoft Power BI Desktop
- **Data Engineering**: Power Query (M), Data Cleansing, Data Type Normalization
- **Data Modeling**: Dimensional Modeling, Star Schema, Bridge Tables (Many-to-Many resolution)
- **Calculations**: Advanced DAX (Data Analysis Expressions), Time Intelligence
- **Data Visualization**: UI/UX Design, Drill-through, Dynamic Filtering, Custom Layouts

## 🗄️ Data Architecture (Star Schema)
To ensure optimal performance and accurate cross-filtering, the raw dataset was restructured into a robust **Star Schema**:
- **Fact Tables**: 
  - `Fact_Sales`: Stores granular order item details, pricing, and shipping costs.
  - `Fact_Reviews`: Stores customer review scores.
- **Dimension Tables**: `Dim_Customer`, `Dim_Product`, and a dynamically generated `Dim_Calendar` (using DAX).
- **Bridge Table (`Dim_Order`)**: Implemented to resolve the Many-to-Many relationship between Order Items and Reviews. By enabling Bi-directional cross-filtering on the bridge, the model allows seamless filter propagation across all tables.

## 📈 Key Features & Metrics (DAX)
A dedicated `Measures` table was built to organize business logic:
- **Core KPIs**: `Total Orders`, `Total Revenue` (Price + Freight), `Total Reviews`, and `Average Rating`.
- **Time Intelligence**: Implemented dynamic Year-over-Year (YoY) comparisons using `SAMEPERIODLASTYEAR`.
- **Growth Tracking**: Calculated dynamic percentage variances (`YoY%`) with `DIVIDE` to handle zero-division safely.

## 🎨 UI/UX & Visualization
The report was designed with a focus on modern aesthetics and user experience:
- **Executive Overview**: Month-over-Month line and clustered column charts comparing current performance against the previous year.
- **Geospatial Analysis**: Map visualizations highlighting revenue concentration across Brazilian states.
- **Sentiment Analysis**: Donut charts exposing customer rating distribution (1 to 5 stars).
- **Top N Analysis**: Treemaps and bar charts isolating the Top 10 product categories by order volume and revenue.
- **Interactive Navigation**: Implemented custom buttons for page navigation and cross-report **Drill-through** to allow users to dive from a geographic state down to specific product sales within that state.

## 🚀 Business Value
This dashboard transforms raw transactional data into a clear strategic asset. It allows managers to instantly spot seasonal trends, identify the most lucrative product categories, and monitor the health of customer satisfaction, all within a highly interactive and aesthetically pleasing interface.
