# 📦 PanaSony Inventory Intelligence Dashboard

A Power BI inventory analytics project covering six global manufacturing facilities (2020–2025), built end-to-end from a SQL data layer through DAX modeling and multi-page interactive reporting — turning six years of raw inventory records into clear, decision-ready insights.

> **Note:** PanaSony is a fictional company and all data in this project is synthetic. This is a personal portfolio project.

---

## 🎯 What this project demonstrates

- **Data modeling** — a star-schema SQL view (`FactInventory` joined to `DimDate`, `DimFactory`, `DimProduct`) feeding Power BI
- **DAX** — core measures, ratio/percentage measures, status classification, and trend calculations
- **Dashboard design** — 4 interactive report pages with synchronized slicers (Year / Region / Factory)
- **Business analysis** — translating inventory metrics into availability, concentration, and rebalancing insights with clear recommended actions

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

## 💡 Key insights & recommendations

The dashboard turns six years of raw inventory records into a few decisions a supply-chain team can act on. The most important findings:

| # | Insight | Recommended action |
|---|---|---|
| 1 | **Portfolio availability is 78.22%** — just below the 80% industry target, so the network carries slightly more committed stock than ideal. | Set 80% as a tracked KPI and prioritize the factories pulling the average down. |
| 2 | **Osaka leads availability at 78.81%; Munich lags at 77.71%.** A ~1.1-point spread separates best and worst. | Study Osaka's replenishment cadence and apply it at Munich to close the gap. |
| 3 | **Pune dominates the network** — highest on-hand (86,600), highest value ($14.5M), and highest in-transit (15,520). | Treat Pune as a single point of concentration risk; monitor its value and inflows daily. |
| 4 | **21.78% of stock is reserved** — committed to open orders and unavailable to sell. | Audit aging reservations; releasing even a few points frees thousands of sellable units. |
| 5 | **On-hand dipped to a 6-year low in 2023 (58,859), then rebounded to a peak in 2025 (72,891).** | Investigate the 2023 trough (demand spike vs. supply constraint) to protect future availability. |
| 6 | **APAC holds ~68.7% of total on-hand**, far above Europe and North America. | Re-examine regional balance against demand to avoid overstocking one region while others run lean. |
| 7 | **Tokyo carries the lowest on-hand (62,153) while Pune carries the most.** | Use Pune as a rebalancing source for lean plants like Tokyo before reordering externally. |

> Every figure above is read directly from the live report and reconciled against the SQL source, so the narrative and the numbers agree.

---

## 📁 Repository structure

```
.
├── README.md
├── LICENSE
├── screenshots/        4 dashboard page exports
├── sql/                the source SQL view definition
└── docs/               the project documentation (Word)
```

---

## 🛠️ Tools

Microsoft Power BI Desktop · SQL Server · DAX

---

## 👤 Parvaneh Basiri

Built as a personal portfolio project to practice the full BI workflow: data layer → model → report → business insight.
