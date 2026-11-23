# SQL Solutions & Analytics Patterns

![SQL Server](https://img.shields.io/badge/SQL%20Server-T--SQL-CC2927?logo=microsoftsqlserver&logoColor=white)
![Queries](https://img.shields.io/badge/queries-39-blue)

Solutions to the [sql-ex.ru](https://www.sql-ex.ru/) training exercises, plus a set of **analytics-style queries** on the same databases that show the patterns I use day to day as a data scientist: window functions, period-over-period comparisons, gaps-and-islands, recursive date spines, distribution statistics, and concentration analysis.

Every query is in its own file and starts with a short comment describing the problem it solves.

## Repository layout

```
.
├── schema/
│   ├── 01_create_tables.sql     # DDL for all three databases
│   └── 02_sample_data.sql       # small illustrative dataset
├── exercises/                   # sql-ex.ru exercises 1–29
│   ├── computer-firm/
│   ├── ships/
│   └── recycling-firm/
└── advanced/                    # analytics patterns (window functions, CTEs, …)
```

## Advanced analytics patterns

| # | Query | Business question | Techniques |
|---|---|---|---|
| 01 | [Price rank & share within maker](advanced/01_price_rank_and_share_within_maker.sql) | Where does each product sit in its maker's line-up? | `DENSE_RANK`, windowed `SUM` share-of-total |
| 02 | [Top-N per group](advanced/02_top_n_per_group.sql) | Each maker's two cheapest PCs | `ROW_NUMBER` with deterministic tie-break |
| 03 | [Running cash balance](advanced/03_running_cash_balance.sql) | Daily net flow and balance per collection point | Signed `UNION ALL`, cumulative `SUM` with `ROWS` frame |
| 04 | [Month-over-month change](advanced/04_month_over_month_change.sql) | How is income trending per point? | `LAG`, calendar-aware comparison, `NULLIF`-safe % change |
| 05 | [Gaps & islands](advanced/05_gaps_and_islands_streaks.sql) | Streaks of consecutive days with income | `date − ROW_NUMBER` island key |
| 06 | [Recursive calendar spine](advanced/06_calendar_spine_recursive_cte.sql) | Gap-free daily balance series for modelling | Recursive CTE, dense panel via `CROSS JOIN`, `COALESCE` |
| 07 | [Median & quartiles](advanced/07_median_and_quartiles.sql) | Is each maker's pricing skewed? | `PERCENTILE_CONT`, `NTILE` |
| 08 | [Pareto concentration](advanced/08_pareto_maker_concentration.sql) | Which makers make up 80% of catalogue value? | Cumulative share, segmentation with `CASE` |
| 09 | [Fleet composition pivot](advanced/09_fleet_composition_pivot.sql) | Fleet mix by country | Conditional aggregation (portable `PIVOT`) |
| 10 | [Event sequences](advanced/10_damaged_then_fought_again.sql) | Which damaged ships returned to battle, and where? | `LEAD` over an event history |

## sql-ex.ru exercises

| Database | Exercises | Topics covered |
|---|---|---|
| [Computer firm](exercises/computer-firm/) | 1–13, 15–28 | Filtering, joins, `UNION` / `EXCEPT` / `INTERSECT`, aggregation & `HAVING`, correlated and scalar subqueries, self-joins, CTEs |
| [Ships](exercises/ships/) | 14 | Joins across ship classes |
| [Recycling firm](exercises/recycling-firm/) | 29 | `FULL OUTER JOIN` with `COALESCE` |

## Databases

**Computer firm**: `Product(maker, model, type)` describes every model. `PC`, `Laptop`, and `Printer` hold individual items with their specs and price.

**Ships**: `Classes` (type, country, guns, bore, displacement), `Ships` (name, class, launch year), `Battles` (name, date), and `Outcomes` (ship, battle, result).

**Recycling firm**: income and outcome records per collection point. The `_o` tables have at most one record per point per day; `Income` and `Outcome` allow several.

Full definitions are in [`schema/01_create_tables.sql`](schema/01_create_tables.sql).

## Running the queries

The queries are written in **T-SQL** (Microsoft SQL Server), the dialect used by sql-ex.ru.

1. Create an empty database in SQL Server (local install, Azure SQL, or the `mcr.microsoft.com/mssql/server` Docker image).
2. Run `schema/01_create_tables.sql`, then `schema/02_sample_data.sql`.
3. Run any file in `exercises/` or `advanced/`.

The sample data is a small illustrative dataset, not the official sql-ex.ru data, so results will differ from the site's checker.

## Author

**Ahmad Tanehkar**, Senior Data Scientist · [LinkedIn](https://www.linkedin.com/in/atanehkar/) · [GitHub](https://github.com/Meysam-t)
