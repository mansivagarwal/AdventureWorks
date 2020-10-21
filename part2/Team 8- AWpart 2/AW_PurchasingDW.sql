/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      PurchasingDW_Model1.DM1
 *
 * Date Created : Thursday, October 08, 2020 01:28:13
 * Target DBMS : Microsoft SQL Server 2016
 */

USE master
go
CREATE DATABASE AW_PurchasingDW
go
USE AW_PurchasingDW
go
/* 
 * TABLE: DimDate 
 */

CREATE TABLE DimDate(
    DateKey              int             NOT NULL,
    DayNumberOfWeek      tinyint         NOT NULL,
    DayNameOfWeek        nvarchar(10)    NOT NULL,
    DayNumberOfMonth     tinyint         NOT NULL,
    DayNumberofYear      smallint        NOT NULL,
    WeekNumberOfYear     tinyint         NOT NULL,
    MonthName            nvarchar(10)    NOT NULL,
    MonthNumberOfYear    tinyint         NOT NULL,
    CalendarQuarter      tinyint         NOT NULL,
    CalendarYear         smallint        NOT NULL,
    CalendarSemester     tinyint         NOT NULL,
    FiscalQuarter        tinyint         NOT NULL,
    FiscalYear           smallint        NOT NULL,
    FiscalSemester       tinyint         NOT NULL,
    CONSTRAINT PK20 PRIMARY KEY CLUSTERED (DateKey)
)
go



IF OBJECT_ID('DimDate') IS NOT NULL
    PRINT '<<< CREATED TABLE DimDate >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimDate >>>'
go

/* 
 * TABLE: DimEmployee 
 */

CREATE TABLE DimEmployee(
    EmployeeKey          int              IDENTITY(1,1),
    SalesTerritoryKey    int              NOT NULL,
    rowguid              nvarchar(100)    NOT NULL,
    FirstName            nvarchar(50)     NOT NULL,
    MIddleNmae           nvarchar(50)     NULL,
    LastName             nvarchar(50)     NOT NULL,
    Title                nvarchar(8)      NULL,
    NationalIDNumber     nvarchar(15)     NOT NULL,
    LoginID              nvarchar(256)    NOT NULL,
    JobTitle             nvarchar(50)     NOT NULL,
    BirthDate            date             NOT NULL,
    MaritalStatus        nchar(1)         NOT NULL,
    Gender               nvarchar(1)      NOT NULL,
    HireDate             date             NOT NULL,
    SalariedFlag         bit              NOT NULL,
    SickLeaveHours       smallint         NOT NULL,
    CurrentFlag          bit              NOT NULL,
    ModifiedDate         datetime         NOT NULL,
    Phone                nvarchar(25)     NOT NULL,
    EmailAddress         nvarchar(50)     NULL,
    Address              nvarchar(50)     NOT NULL,
    DepartmentName       nvarchar(50)     NOT NULL,
    StartDate            date             NOT NULL,
    EndDate              date             NOT NULL,
    DateKey              int              NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY CLUSTERED (EmployeeKey)
)
go



IF OBJECT_ID('DimEmployee') IS NOT NULL
    PRINT '<<< CREATED TABLE DimEmployee >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimEmployee >>>'
go

/* 
 * TABLE: DimGeography 
 */

CREATE TABLE DimGeography(
    GeographyKey          int             IDENTITY(1,1),
    City                  nvarchar(30)    NOT NULL,
    StateProvienceCode    nchar(3)        NOT NULL,
    StateProvienceNmae    nvarchar(50)    NOT NULL,
    CountryRegionCode     nvarchar(3)     NOT NULL,
    CountryRegionName     nvarchar(50)    NOT NULL,
    PostalCode            nvarchar(15)    NOT NULL,
    SalesTerritoryKey     int             NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY CLUSTERED (GeographyKey)
)
go



IF OBJECT_ID('DimGeography') IS NOT NULL
    PRINT '<<< CREATED TABLE DimGeography >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimGeography >>>'
go

/* 
 * TABLE: DimProduct 
 */

CREATE TABLE DimProduct(
    ProductKey                int                IDENTITY(1,1),
    ProductName               varchar(50)        NOT NULL,
    ProductCategoryName       varchar(50)        NOT NULL,
    ProductSubCategoryName    varchar(50)        NOT NULL,
    rowguid                   nvarchar(100)      NOT NULL,
    Description               nvarchar(400)      NOT NULL,
    ProductPhoto              varbinary(5000)    NULL,
    SizeUnitMeasureCode       nchar(3)           NULL,
    WeightUnitMeasureCode     nchar(3)           NULL,
    Weight                    decimal(8, 2)      NULL,
    StandardCost              money              NOT NULL,
    Color                     nvarchar(50)       NULL,
    ProductLine               nchar(2)           NULL,
    FinishedGoodsFlag         bit                NOT NULL,
    SafetyStockLevel          smallint           NOT NULL,
    ReorderPoint              smallint           NOT NULL,
    ListPrice                 money              NOT NULL,
    Size                      nvarchar(5)        NULL,
    DaysToManufacture         int                NOT NULL,
    Class                     nchar(2)           NULL,
    Style                     nchar(2)           NULL,
    ModelName                 nvarchar(50)       NOT NULL,
    StartDate                 datetime           NOT NULL,
    EndDate                   datetime           NOT NULL,
    Status                    tinyint            NOT NULL,
    DateKey                   int                NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY CLUSTERED (ProductKey)
)
go



IF OBJECT_ID('DimProduct') IS NOT NULL
    PRINT '<<< CREATED TABLE DimProduct >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimProduct >>>'
go

/* 
 * TABLE: DimProductInventory 
 */

CREATE TABLE DimProductInventory(
    ProductID     int             IDENTITY(1,1),
    ProductKey    int             NOT NULL,
    Name          nvarchar(50)    NOT NULL,
    Shelf         nvarchar(10)    NOT NULL,
    Bin           tinyint         NOT NULL,
    Quantity      smallint        NOT NULL,
    Location      nvarchar(50)    NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY CLUSTERED (ProductID, ProductKey)
)
go



IF OBJECT_ID('DimProductInventory') IS NOT NULL
    PRINT '<<< CREATED TABLE DimProductInventory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimProductInventory >>>'
go

/* 
 * TABLE: DimSalesTerritory 
 */

CREATE TABLE DimSalesTerritory(
    SalesTerritoryKey        int             IDENTITY(1,1),
    SalesTerriortyRegion     nvarchar(50)    NOT NULL,
    SalesTerritoryCountry    nvarchar(50)    NOT NULL,
    SalesTerritoryGroup      nvarchar(50)    NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY CLUSTERED (SalesTerritoryKey)
)
go



IF OBJECT_ID('DimSalesTerritory') IS NOT NULL
    PRINT '<<< CREATED TABLE DimSalesTerritory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimSalesTerritory >>>'
go

/* 
 * TABLE: DimShipMethod 
 */

CREATE TABLE DimShipMethod(
    ShipMethodID    int              IDENTITY(1,1),
    Name            nvarchar(50)     NOT NULL,
    ShipBase        money            NOT NULL,
    ShipRate        money            NOT NULL,
    rowguid         nvarchar(100)    NOT NULL,
    ModifiedDate    datetime         NOT NULL,
    CONSTRAINT PK16 PRIMARY KEY CLUSTERED (ShipMethodID)
)
go



IF OBJECT_ID('DimShipMethod') IS NOT NULL
    PRINT '<<< CREATED TABLE DimShipMethod >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimShipMethod >>>'
go

/* 
 * TABLE: DimVendor 
 */

CREATE TABLE DimVendor(
    BusinessEntityID           int               IDENTITY(1,1),
    AccountNumber              nvarchar(15)      NOT NULL,
    Name                       varchar(50)       NOT NULL,
    CreditRatings              tinyint           NOT NULL,
    PreferredVendorStatus      bit               NOT NULL,
    ActiveFlag                 bit               NOT NULL,
    PurchasingWebServiceURL    nvarchar(1024)    NULL,
    ModifiedDate               datetime          NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY CLUSTERED (BusinessEntityID)
)
go



IF OBJECT_ID('DimVendor') IS NOT NULL
    PRINT '<<< CREATED TABLE DimVendor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimVendor >>>'
go

/* 
 * TABLE: DimVendorEmployees 
 */

CREATE TABLE DimVendorEmployees(
    BusinessEntityID    int             NOT NULL,
    VendorID            int             IDENTITY(1,1),
    VendorName          nvarchar(50)    NOT NULL,
    EmployeeName        nvarchar(50)    NOT NULL,
    PhoneNumber         nvarchar(15)    NOT NULL,
    EmailAddress        nvarchar(50)    NOT NULL,
    CONSTRAINT PK13 PRIMARY KEY CLUSTERED (BusinessEntityID)
)
go



IF OBJECT_ID('DimVendorEmployees') IS NOT NULL
    PRINT '<<< CREATED TABLE DimVendorEmployees >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimVendorEmployees >>>'
go

/* 
 * TABLE: DimVendorProduct 
 */

CREATE TABLE DimVendorProduct(
    ProductID                 int             NOT NULL,
    VendorID                  int             NOT NULL,
    StandardCost              money           NOT NULL,
    ListPrice                 money           NOT NULL,
    ModelName                 nvarchar(50)    NOT NULL,
    ProductCategoryName       nvarchar(50)    NOT NULL,
    ProductSubCategoryName    nvarchar(50)    NOT NULL,
    BusinessEntityID          int             NOT NULL
)
go



IF OBJECT_ID('DimVendorProduct') IS NOT NULL
    PRINT '<<< CREATED TABLE DimVendorProduct >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimVendorProduct >>>'
go

/* 
 * TABLE: FactPurchaseOrderDetail 
 */

CREATE TABLE FactPurchaseOrderDetail(
    PurchaseOrderDetailID    int              IDENTITY(1,1),
    PurchaseOrderID          int              NOT NULL,
    DueDate                  datetime         NOT NULL,
    OrderQty                 smallint         NOT NULL,
    ProductID                int              NOT NULL,
    UnitPrice                money            NOT NULL,
    LineTotal                money            NOT NULL,
    ReceivedQty              decimal(8, 2)    NOT NULL,
    RejectedQty              decimal(8, 2)    NOT NULL,
    StockedQty               decimal(9, 2)    NOT NULL,
    ModifiedDate             datetime         NOT NULL,
    DateKey                  int              NOT NULL,
    CONSTRAINT PK18 PRIMARY KEY CLUSTERED (PurchaseOrderDetailID)
)
go



IF OBJECT_ID('FactPurchaseOrderDetail') IS NOT NULL
    PRINT '<<< CREATED TABLE FactPurchaseOrderDetail >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactPurchaseOrderDetail >>>'
go

/* 
 * TABLE: FactPurchaseOrderHeader 
 */

CREATE TABLE FactPurchaseOrderHeader(
    PurchaseOrderID          int         IDENTITY(1,1),
    PurchaseOrderDetailID    int         NOT NULL,
    SalesTerritoryKey        int         NOT NULL,
    RevisionNumber           tinyint     NOT NULL,
    Status                   tinyint     NOT NULL,
    EnployeeID               int         NOT NULL,
    VendorID                 int         NOT NULL,
    ShipMethodID             int         NOT NULL,
    OrderDate                datetime    NOT NULL,
    ShipDate                 datetime    NULL,
    SubTotal                 money       NOT NULL,
    TaxAmount                money       NOT NULL,
    Freight                  money       NOT NULL,
    TotalDue                 money       NOT NULL,
    ModifiedDate             datetime    NOT NULL,
    BusinessEntityID         int         NOT NULL,
    EmployeeKey              int         NOT NULL,
    DateKey                  int         NOT NULL,
    CONSTRAINT PK19 PRIMARY KEY CLUSTERED (PurchaseOrderID, PurchaseOrderDetailID)
)
go



IF OBJECT_ID('FactPurchaseOrderHeader') IS NOT NULL
    PRINT '<<< CREATED TABLE FactPurchaseOrderHeader >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactPurchaseOrderHeader >>>'
go

/* 
 * INDEX: Ref205 
 */

CREATE INDEX Ref205 ON DimEmployee(DateKey)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DimEmployee') AND name='Ref205')
    PRINT '<<< CREATED INDEX DimEmployee.Ref205 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX DimEmployee.Ref205 >>>'
go

/* 
 * INDEX: Ref525 
 */

CREATE INDEX Ref525 ON DimEmployee(SalesTerritoryKey)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DimEmployee') AND name='Ref525')
    PRINT '<<< CREATED INDEX DimEmployee.Ref525 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX DimEmployee.Ref525 >>>'
go

/* 
 * INDEX: Ref59 
 */

CREATE INDEX Ref59 ON DimGeography(SalesTerritoryKey)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DimGeography') AND name='Ref59')
    PRINT '<<< CREATED INDEX DimGeography.Ref59 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX DimGeography.Ref59 >>>'
go

/* 
 * INDEX: Ref206 
 */

CREATE INDEX Ref206 ON DimProduct(DateKey)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DimProduct') AND name='Ref206')
    PRINT '<<< CREATED INDEX DimProduct.Ref206 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX DimProduct.Ref206 >>>'
go

/* 
 * INDEX: Ref615 
 */

CREATE INDEX Ref615 ON DimProductInventory(ProductKey)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DimProductInventory') AND name='Ref615')
    PRINT '<<< CREATED INDEX DimProductInventory.Ref615 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX DimProductInventory.Ref615 >>>'
go

/* 
 * INDEX: Ref1112 
 */

CREATE INDEX Ref1112 ON DimVendorEmployees(BusinessEntityID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DimVendorEmployees') AND name='Ref1112')
    PRINT '<<< CREATED INDEX DimVendorEmployees.Ref1112 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX DimVendorEmployees.Ref1112 >>>'
go

/* 
 * INDEX: Ref1113 
 */

CREATE INDEX Ref1113 ON DimVendorProduct(BusinessEntityID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('DimVendorProduct') AND name='Ref1113')
    PRINT '<<< CREATED INDEX DimVendorProduct.Ref1113 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX DimVendorProduct.Ref1113 >>>'
go

/* 
 * INDEX: Ref208 
 */

CREATE INDEX Ref208 ON FactPurchaseOrderDetail(DateKey)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FactPurchaseOrderDetail') AND name='Ref208')
    PRINT '<<< CREATED INDEX FactPurchaseOrderDetail.Ref208 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FactPurchaseOrderDetail.Ref208 >>>'
go

/* 
 * INDEX: Ref207 
 */

CREATE INDEX Ref207 ON FactPurchaseOrderHeader(DateKey)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FactPurchaseOrderHeader') AND name='Ref207')
    PRINT '<<< CREATED INDEX FactPurchaseOrderHeader.Ref207 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FactPurchaseOrderHeader.Ref207 >>>'
go

/* 
 * INDEX: Ref1816 
 */

CREATE INDEX Ref1816 ON FactPurchaseOrderHeader(PurchaseOrderDetailID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FactPurchaseOrderHeader') AND name='Ref1816')
    PRINT '<<< CREATED INDEX FactPurchaseOrderHeader.Ref1816 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FactPurchaseOrderHeader.Ref1816 >>>'
go

/* 
 * INDEX: Ref1618 
 */

CREATE INDEX Ref1618 ON FactPurchaseOrderHeader(ShipMethodID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FactPurchaseOrderHeader') AND name='Ref1618')
    PRINT '<<< CREATED INDEX FactPurchaseOrderHeader.Ref1618 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FactPurchaseOrderHeader.Ref1618 >>>'
go

/* 
 * INDEX: Ref119 
 */

CREATE INDEX Ref119 ON FactPurchaseOrderHeader(EmployeeKey)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FactPurchaseOrderHeader') AND name='Ref119')
    PRINT '<<< CREATED INDEX FactPurchaseOrderHeader.Ref119 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FactPurchaseOrderHeader.Ref119 >>>'
go

/* 
 * INDEX: Ref1120 
 */

CREATE INDEX Ref1120 ON FactPurchaseOrderHeader(BusinessEntityID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FactPurchaseOrderHeader') AND name='Ref1120')
    PRINT '<<< CREATED INDEX FactPurchaseOrderHeader.Ref1120 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FactPurchaseOrderHeader.Ref1120 >>>'
go

/* 
 * INDEX: Ref521 
 */

CREATE INDEX Ref521 ON FactPurchaseOrderHeader(SalesTerritoryKey)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FactPurchaseOrderHeader') AND name='Ref521')
    PRINT '<<< CREATED INDEX FactPurchaseOrderHeader.Ref521 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FactPurchaseOrderHeader.Ref521 >>>'
go

/* 
 * TABLE: DimEmployee 
 */

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimDate5 
    FOREIGN KEY (DateKey)
    REFERENCES DimDate(DateKey)
go

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimSalesTerritory25 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
go


/* 
 * TABLE: DimGeography 
 */

ALTER TABLE DimGeography ADD CONSTRAINT RefDimSalesTerritory9 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
go


/* 
 * TABLE: DimProduct 
 */

ALTER TABLE DimProduct ADD CONSTRAINT RefDimDate6 
    FOREIGN KEY (DateKey)
    REFERENCES DimDate(DateKey)
go

/* 
 * TABLE: DimProductInventory 
 */

ALTER TABLE DimProductInventory ADD CONSTRAINT RefDimProduct15 
    FOREIGN KEY (ProductKey)
    REFERENCES DimProduct(ProductKey)
go


/* 
 * TABLE: DimVendorEmployees 
 */

ALTER TABLE DimVendorEmployees ADD CONSTRAINT RefDimVendor12 
    FOREIGN KEY (BusinessEntityID)
    REFERENCES DimVendor(BusinessEntityID)
go


/* 
 * TABLE: DimVendorProduct 
 */

ALTER TABLE DimVendorProduct ADD CONSTRAINT RefDimVendor13 
    FOREIGN KEY (BusinessEntityID)
    REFERENCES DimVendor(BusinessEntityID)
go


/* 
 * TABLE: FactPurchaseOrderDetail 
 */

ALTER TABLE FactPurchaseOrderDetail ADD CONSTRAINT RefDimDate8 
    FOREIGN KEY (DateKey)
    REFERENCES DimDate(DateKey)
go


/* 
 * TABLE: FactPurchaseOrderHeader 
 */

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimDate7 
    FOREIGN KEY (DateKey)
    REFERENCES DimDate(DateKey)
go

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefFactPurchaseOrderDetail16 
    FOREIGN KEY (PurchaseOrderDetailID)
    REFERENCES FactPurchaseOrderDetail(PurchaseOrderDetailID)
go

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimShipMethod18 
    FOREIGN KEY (ShipMethodID)
    REFERENCES DimShipMethod(ShipMethodID)
go

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimEmployee19 
    FOREIGN KEY (EmployeeKey)
    REFERENCES DimEmployee(EmployeeKey)
go

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimVendor20 
    FOREIGN KEY (BusinessEntityID)
    REFERENCES DimVendor(BusinessEntityID)
go

ALTER TABLE FactPurchaseOrderHeader ADD CONSTRAINT RefDimSalesTerritory21 
    FOREIGN KEY (SalesTerritoryKey)
    REFERENCES DimSalesTerritory(SalesTerritoryKey)
go


