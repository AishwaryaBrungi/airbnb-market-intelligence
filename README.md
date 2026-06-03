# 🏠 Airbnb Market Intelligence Platform

<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Scikit-learn](https://img.shields.io/badge/Scikit--learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![AWS S3](https://img.shields.io/badge/AWS_S3-FF9900?style=for-the-badge&logo=amazons3&logoColor=white)

**Cities:** Chicago, IL & New Orleans, LA &nbsp;|&nbsp; **Listings Analyzed:** 13,593 &nbsp;|&nbsp; **Raw Records:** 16,048

</div>

---

## 📌 Project Overview

End-to-end data analytics pipeline that ingests, cleans, and analyzes real Airbnb listing data across two major U.S. markets. Delivers actionable pricing and investment insights through SQL analysis, machine learning forecasting, and an interactive Power BI dashboard.

- 🐍 Built Python ETL pipeline ingesting and cleaning **16,048 raw listings** with **80% less manual effort**
- 🗄️ Designed **star-schema in PostgreSQL** and wrote **6 business SQL queries** for pricing and investment insights
- 📊 Built interactive **Power BI dashboard** with KPI cards, slicers, Top 10 neighborhoods by revenue
- 🤖 Applied **Scikit-learn Linear Regression** model achieving **R² of 0.887** forecasting annual revenue
- 💡 Identified **593.8% revenue uplift opportunity** and optimal pricing range of **$161–$250/night**

---

## 📊 Key Business Insights

| Metric | Chicago | New Orleans |
|---|---|---|
| Total Listings | 7,488 | 6,105 |
| Avg Nightly Price | $211 | $176 |
| Avg Occupancy Rate | 36.7% | 32.6% |
| Avg Annual Revenue | $35,209 | $31,391 |

- 🏨 Chicago hotel rooms average **$386/night** vs **$234** in New Orleans
- 💰 Optimal pricing range **$161–$250/night** yields best revenue performance
- 🏆 Top neighborhood: **Read Blvd East, New Orleans** at **$73,699** avg annual revenue
- 📈 Revenue uplift from pricing optimization: **593.8%**

---

## 🤖 Machine Learning Model

| Metric | Result |
|---|---|
| R² Score | **0.887** |
| Mean Absolute Error | $6,866 |
| Features Used | Price, minimum nights, reviews, availability, occupancy rate |

Model: **Scikit-learn Linear Regression** — trained on cleaned listing data to forecast annual revenue per listing.

---

## 🛠️ Tech Stack

| Category | Tools |
|---|---|
| Data Processing | Python, Pandas, NumPy |
| Machine Learning | Scikit-learn |
| Database | PostgreSQL, SQLite, SQL |
| Visualization | Power BI |
| Cloud Storage | AWS S3 |
| Environment | Jupyter Notebook, GitHub |

---

## 📁 Project Structure

```
airbnb-market-intelligence/
├── airbnb_analysis.ipynb     # Full Python ETL + ML pipeline
├── airbnb_analysis.sql       # 6 business SQL queries
├── airbnb_dashboard.png      # Power BI dashboard screenshot
├── airbnb_final.csv          # Cleaned dataset
└── README.md
```

---

## 🔍 SQL Analysis

6 business queries covering:
1. **KPI Summary** — total listings, avg price, avg occupancy, avg annual revenue by city
2. **Pricing by Room Type** — avg nightly price breakdown per room category
3. **Top 10 Neighborhoods by Revenue** — ranked by average annual revenue
4. **Pricing Tier Analysis** — revenue performance by price range bucket
5. **Host Performance** — superhosts vs regular hosts comparison
6. **Occupancy vs Revenue Correlation** — relationship between occupancy rate and revenue

---

## 📦 Data Source

**Inside Airbnb** — [insideairbnb.com/get-the-data](http://insideairbnb.com/get-the-data)

Free, publicly available real Airbnb listing data. Data used for educational and analytical purposes only.

---

## 👩‍💻 Author

**Aishwarya Brungi** — Data & BI Analyst

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Aishwarya_Brungi-0077B5?style=flat-square&logo=linkedin&logoColor=white)](https://linkedin.com/in/aishwarya-brungi)
[![GitHub](https://img.shields.io/badge/GitHub-AishwaryaBrungi-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/AishwaryaBrungi)
