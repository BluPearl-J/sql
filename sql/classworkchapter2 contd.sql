-- 2.23 Display all data on products having QuantityOnHand > 0:


SELECT *
FROM INVENTORY;
WHERE QuantityOnHand > 0;

-- 2.24
SELECT SKU, SKU_Description
FROM INVENTORY
WHERE QuantityOnHand = 0;


-- 2.25 sorted ascending by WarehouseID:


SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0
ORDER BY WarehouseID ASC;


-- 2.26 
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand > 0
ORDER BY WarehouseID DESC, SKU ASC;


-- 2.27 
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0 AND QuantityOnOrder > 0
ORDER BY WarehouseID DESC, SKU ASC;


-- 2.28 
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0 OR QuantityOnOrder = 0
ORDER BY WarehouseID DESC, SKU ASC;


-- 2.29 Products with QuantityOnHand > 1 AND QuantityOnHand < 10 (without BETWEEN):


SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM INVENTORY
WHERE QuantityOnHand > 1 AND QuantityOnHand < 10;


-- 2.30 
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM INVENTORY
WHERE QuantityOnHand BETWEEN 2 AND 9;


-- 2.31  description beginning 'Half-Dome':
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE 'Half-Dome%';


-- 2.32 Products with description containing 'Climb':


SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '%Climb%';


-- 2.33 Products with 'd' in the third position of SKU_Description:



--2.34 Use all SQL built-in functions on QuantityOnHand:
SELECT 
    COUNT(QuantityOnHand) AS CountItems,
    SUM(QuantityOnHand) AS TotalItems,
    AVG(QuantityOnHand) AS AverageItems,
    MIN(QuantityOnHand) AS MinItems,
    MAX(QuantityOnHand) AS MaxItems
FROM INVENTORY;



-- 2.35 Difference between COUNT and SUM:

COUNT → returns total number of rows ( not having null values).

SUM → adds together all the numeric values in a column.

-- 2.36 Sum of QuantityOnHand grouped by WarehouseID:


SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsAtHand
FROM INVENTORY
GROUP BY WarehouseID
ORDER BY TotalItemsOnHand DESC;

-- 2.37 Sum of QuantityOnHand grouped by WarehouseID, omitting SKUs with ≥ 3 items:

SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
ORDER BY TotalItemsOnHandLT3 DESC;


-- 2.38 Same as above,  warehouses with fewer than 2 SKUs in the sum:
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
HAVING COUNT(SKU) < 2
ORDER BY TotalItemsOnHandLT3 DESC;

-- 2.39 Which clause is applied first — WHERE or HAVING?

The WHERE clause is applied first, it filters rows before grouping.

The HAVING clause is after grouping, filtering groups
