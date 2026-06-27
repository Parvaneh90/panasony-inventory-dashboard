# 📦 PanaSony Inventory Intelligence Dashboard

A Power BI inventory analytics project covering six global manufacturing facilities (2020–2025), built end-to-end from a SQL data layer through DAX modeling and multi-page interactive reporting — and then **self-reviewed** to catch data, logic, and documentation defects before release.

> **Note:** PanaSony is a fictional company and all data in this project is synthetic. This is a personal portfolio project.

---

## 🎯 What this project demonstrates

- **Data modeling** — a star-schema SQL view (`FactInventory` joined to `DimDate`, `DimFactory`, `DimProduct`) feeding Power BI
- **DAX** — core measures, ratio/percentage measures, status classification, and trend calculations
- **Dashboard design** — 4 interactive report pages with synchronized slicers (Year / Region / Factory)
- **Analytical QA** — a full defect review that reconciles every reported figure against the live dashboard and the SQL source

---

## 📊 Dashboard pages

### 1. Inventory Management
KPI cards (On-Hand, In-Transit, Reserve, Inventory Value, Avg Monthly Value), monthly trend lines, region donut, availability progress bars, and top categories.

![Inventory Management](screenshots/01_inventory_management.png)

### 2. Stock Analysis
Factory × Year stock, Available vs Reserved vs In-Transit breakdown, annual on-hand trend, and a stock scorecard by city.

![Stock Analysis](screenshots/02_stock_analysis.png)

### 3. Inventory Value
Value by city, annual value vs available-quantity combo chart, value share by business unit, and value by product.

![Inventory Value](screenshots/03_inventory_value.png)

### 4. Factory View
Availability vs on-hand scatter (bubble = inventory value), factory share donut, and a full factory scorecard with utilization and stock-health flags.

![Factory View](screenshots/04_factory_view.png)

---

## 🔢 Key figures (ground truth)

| Metric | Value |
|---|---|
| Total On-Hand | 403,516 units |
| Total Available | 315,632 units |
| Total Reserved | 87,884 units |
| Total In-Transit | 77,196 units |
| Total Inventory Value | $63,956,256.04 |
| Portfolio Availability | 78.22% |

| Factory | On-Hand | Availability | Inventory Value |
|---|---|---|---|
| Bengaluru Electronics Plant | 63,103 | 78.53% | $10,525,007.31 |
| Munich Industrial Devices Plant | 63,392 | 77.71% | $9,127,712.80 |
| Nevada Battery Plant (Reno) | 62,850 | 77.86% | $9,547,773.56 |
| Osaka Assembly Plant | 65,418 | 78.81% | $10,750,372.62 |
| Pune Appliances Plant | 86,600 | 78.50% | $14,465,221.56 |
| Tokyo ProAV Plant | 62,153 | 77.79% | $9,540,168.19 |

---

## 🔍 Analytical QA — the part I'm most proud of

After building the dashboard, I reviewed my own documentation against the live report and the SQL source as if I were a reviewer handed the project cold. The review surfaced **20 defects (2 critical, 4 high, 6 medium, 8 low)**, including:

- A systematic **~5× inflation** of every headline figure in the written documentation vs. the actual dashboard
- Several **incorrect factory rankings** (wrong "best" / "worst" availability, wrong highest-value factory, wrong peak year)
- A **DAX bug** in a calculated column (a city mapping pointed at the wrong city and omitted a real one)
- **Conflicting KPI threshold systems** that flagged every factory as "Critical," making the signal useless

Both review deliverables are included:
- [`review/Defect_Log_and_Reconciliation.docx`](review/Defect_Log_and_Reconciliation.docx) — a 20-item defect register plus the corrected ground-truth tables
- [`review/Documentation_Redline_TrackedChanges.docx`](review/Documentation_Redline_TrackedChanges.docx) — the original documentation with 53 tracked corrections and reviewer comments

> Takeaway: building a dashboard is only half the job — **validating that the narrative matches the numbers** is what makes it trustworthy.

---

## 📁 Repository structure

```
.
├── README.md
├── LICENSE
├── screenshots/        4 dashboard page exports
├── sql/                the source SQL view definition
├── docs/               the original project documentation (Word)
└── review/             the QA defect log and redlined documentation
```

---

## 🛠️ Tools

Microsoft Power BI Desktop · SQL Server (T-SQL view) · DAX

---

## 👤 Author

Built as a personal portfolio project to practice the full BI workflow: data layer → model → report → quality review.
