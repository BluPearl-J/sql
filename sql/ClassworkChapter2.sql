--  https://media.pearsoncmg.com/ph/bp/bridgepages/teamsite/kroenke/


use cape_codd;

-- select *
-- from BUYER;
-- from WAREHOUSE;
-- from SKU_DATA;
-- from ORDER_ITEM;
-- 2.22-2.39 query only no describe 
-- 2.17 use INVENTORY table
-- select *
-- from INVENTORY;

select SKU, SKU_Description
from INVENTORY;
-- 2.18
-- select SKU_Description,sku
-- from inventory;


-- 2.19
select warehouseID as ID
from inventory;

-- 2.20
select distinct warehouseID as ID  -- new word distinct removes duplicates
from inventory;

select WarehouseID,SKU,SKU_Description,QuantityOnHand,QuantityOnHand
from inventory;

