CREATE VIEW dbo.vw_PowerBI_FactInventorySummary AS
SELECT
  d.YearNumber, d.QuarterNumber, d.MonthNumber, d.MonthName,
  CAST(CONCAT(d.YearNumber, RIGHT('00' + CAST(d.MonthNumber AS VARCHAR(2)), 2)) AS INT) AS 
YearMonthKey,
  f.FactoryKey, f.FactoryCode, f.FactoryName, f.City, f.Country, f.Region, f.PlantType,
  p.DivisionUnitCode, p.DivisionUnitName, p.CategoryCode, p.CategoryName,
  p.SubCategoryCode, p.SubCategoryName, p.ProductCategoryCode, p.ProductCategoryName, 
p.TechnologyType,
  SUM(fi.OnHandQty)       AS OnHandQty,
  SUM(fi.AvailableQty)    AS AvailableQty,
  SUM(fi.ReservedQty)     AS ReservedQty,
  SUM(fi.InTransitQty)    AS InTransitQty,
  SUM(fi.InventoryValue)  AS InventoryValue,
  CAST(SUM(fi.AvailableQty) * 100.0 / NULLIF(SUM(fi.OnHandQty), 0) AS DECIMAL(18,2))  AS 
AvailablePct,
  CAST(SUM(fi.ReservedQty)  * 100.0 / NULLIF(SUM(fi.OnHandQty), 0) AS DECIMAL(18,2))  AS 
ReservedPct
FROM dbo.FactInventory fi
  JOIN dbo.DimDate    d ON fi.DateKey    = d.DateKey
  JOIN dbo.DimFactory f ON fi.FactoryKey = f.FactoryKey
  JOIN dbo.DimProduct p ON fi.ProductKey = p.ProductKey
GROUP BY d.YearNumber, d.QuarterNumber, d.MonthNumber, d.MonthName,
   f.FactoryKey, f.FactoryCode, f.FactoryName, f.City, f.Country, f.Region, f.PlantType,
  p.DivisionUnitCode, p.DivisionUnitName, p.CategoryCode, p.CategoryName,
  p.SubCategoryCode, p.SubCategoryName, p.ProductCategoryCode, p.ProductCategoryName, 
p.TechnologyType


--SELECT * FROM dbo.vw_PowerBI_FactInventorySummary