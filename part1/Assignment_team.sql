--Question 1

SELECT P.VENDORID, v.name as VendorName, SUM(SUBTOTAL) AS TOTAL_AMOUNT
FROM Purchasing.PurchaseOrderHeader P, Purchasing.Vendor V
WHERE P.VendorID = V.BusinessEntityID 
GROUP BY P.VendorID, v.name
order by TOTAL_AMOUNT desc;

--Question2 By Category

SELECT PC.NAME, SUM(LINETOTAL) AS TOTAL_PURCHASE 
FROM Purchasing.PurchaseOrderDetail O , Production.Product PP , Production.ProductSubcategory PS
LEFT OUTER JOIN   
Production.ProductCategory AS PC ON PS.ProductCategoryID=PC.ProductCategoryID
WHERE O.ProductID=PP.ProductID AND PP.ProductSubcategoryID=PS.ProductSubcategoryID 
GROUP BY PC.NAME
ORDER BY TOTAL_PURCHASE DESC;

--Question2 b Bysubcategory

SELECT PS.NAME, SUM(LINETOTAL) AS TOTAL_PURCHASE 
FROM Purchasing.PurchaseOrderDetail O , Production.Product PP , Production.ProductSubcategory PS
WHERE O.ProductID=PP.ProductID AND PP.ProductSubcategoryID=PS.ProductSubcategoryID  
GROUP BY PS.NAME
ORDER BY TOTAL_PURCHASE DESC;

--Question2 c By product model

SELECT top 20 PS.NAME, SUM(LINETOTAL) AS TOTAL_PURCHASE
FROM Purchasing.PurchaseOrderDetail O , Production.Product PP , Production.ProductModel PS
WHERE O.ProductID=PP.ProductID AND PP.ProductModelID=PS.ProductModelID  
GROUP BY PS.NAME
ORDER BY TOTAL_PURCHASE DESC;

--Question2 d product
SELECT top 20 Pp.NAME, SUM(LINETOTAL) AS TOTAL_PURCHASE
FROM Purchasing.PurchaseOrderDetail O , Production.Product PP 
WHERE O.ProductID=PP.ProductID  
GROUP BY PP.NAME
ORDER BY TOTAL_PURCHASE DESC;

--Question 3

SELECT HumanResources.Employee.BusinessEntityID ,Purchasing.PurchaseOrderHeader.EmployeeID,
Person.Person.BusinessEntityID, Person.EmailAddress.EmailAddress, Person.PersonPhone.PhoneNumber, Person.Address.AddressLine1, Person.Address.AddressLine2
, Person.Address.City, Person.Address.PostalCode,FIRSTNAME, LASTNAME 
FROM Purchasing.PurchaseOrderHeader, 
HumanResources.Employee,Person.Person, Person.EmailAddress, Person.PersonPhone,
Person.BusinessEntityAddress, Person.BusinessEntity, Person.Address 
WHERE 
Purchasing.PurchaseOrderHeader.EmployeeID = HumanResources.Employee.BusinessEntityID AND
HumanResources.Employee.BusinessEntityID = Person.Person.BusinessEntityID AND
Person.EmailAddress.BusinessEntityID = Person.Person.BusinessEntityID AND
Person.PersonPhone.BusinessEntityID = Person.Person.BusinessEntityID AND 
Person.BusinessEntityAddress.BusinessEntityID = Person.Person.BusinessEntityID AND
Person.BusinessEntityAddress.AddressID = Person.Address.AddressID 
group by  
HumanResources.Employee.BusinessEntityID ,Purchasing.PurchaseOrderHeader.EmployeeID,
Person.Person.BusinessEntityID, Person.EmailAddress.EmailAddress, Person.PersonPhone.PhoneNumber, Person.Address.AddressLine1, Person.Address.AddressLine2
, Person.Address.City, Person.Address.PostalCode, FIRSTNAME, LASTNAME
order by HumanResources.Employee.BusinessEntityID ;


--Question 4
select FirstName,LastName, RateChangeDate, Rate,pp.BusinessEntityID 
from Person.Person pp, HumanResources.Employee he, HumanResources.EmployeePayHistory p , 
Purchasing.PurchaseOrderHeader po
where 
he.BusinessEntityID = pp.BusinessEntityID and he.BusinessEntityID = p.BusinessEntityID and 
po.EmployeeID = he.BusinessEntityID 
group by  pp.BusinessEntityID,FirstName,LastName, RateChangeDate, Rate 
order by FirstName asc, rate asc;

--Question 5

Select ven.BusinessEntityID, ven.Name, ad.AddressLine1, e.EmailAddress, pn.PhoneNumber from Purchasing.Vendor ven
join Person.BusinessEntityAddress be on be.BusinessEntityID = ven.BusinessEntityID
join Person.Address ad on ad.AddressID = be.AddressID
join Person.BusinessEntityContact bc on bc.BusinessEntityID = ven.BusinessEntityID
join Person.Person per on per.BusinessEntityID = bc.PersonID
join Person.EmailAddress e on e.BusinessEntityID = per.BusinessEntityID
join Person.PersonPhone pn on pn.BusinessEntityID = per.BusinessEntityID

--Question 6
select pp.name,ph.ProductID, ph.ListPrice
from Production.Product pp, Production.ProductListPriceHistory ph
where ph.ProductID = pp.ProductID
order by ph.ProductID, ph.ListPrice asc;
--Question 7
select pp.name,ph.ProductID, PP.StandardCost, PH.ListPrice
from Production.Product pp, Production.ProductListPriceHistory ph
where ph.ProductID = pp.ProductID 
order by ph.ProductID, ph.ListPrice asc;