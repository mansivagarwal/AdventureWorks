/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      PurchasingAW_FinalModel3.DM1
 *

 * Date Created : Wednesday, October 14, 2020 19:25:52
 * Target DBMS : Microsoft SQL Server 2012
 */

/* 
 * TABLE: DimDate 
 */

CREATE TABLE DimDate(
    DateKey                 int             NOT NULL,
    FullDateAlternateKey    date            NOT NULL,
    DayNumberOfWeek         int             NOT NULL,
    EnglishDayNameOfWeek    nvarchar(10)    NOT NULL,
    DayNumberOfMonth        int             NOT NULL,
    DayNumberofYear         int             NOT NULL,
    WeekNumberOfYear        int             NOT NULL,
    EnglishMonthName        nvarchar(10)    NOT NULL,
    MonthNumberOfYear       int             NOT NULL,
    CalendarQuarter         int             NOT NULL,
    CalendarYear            int             NOT NULL,
    CalendarSemester        int             NOT NULL,
    FiscalQuarter           int             NOT NULL,
    FiscalYear              int             NOT NULL,
    FiscalSemester          int             NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (DateKey)
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
    EmployeeKey         int             IDENTITY(1,1),
    NationalIDNumber    nvarchar(15)    NOT NULL,
    BusinessEntityID    int             NOT NULL,
    FirstName           nvarchar(50)    NOT NULL,
    LastName            nvarchar(50)    NOT NULL,
    JobTitle            nvarchar(50)    NOT NULL,
    DepartmentID        int             NOT NULL,
    DepartmentName      nvarchar(50)    NOT NULL,
    BirthDate           date            NOT NULL,
    Gender              nchar(1)        NOT NULL,
    MaritalStatus       nchar(1)        NOT NULL,
    HireDate            date            NOT NULL,
    PhoneNumber         nvarchar(25)    NULL,
    EmailAddress        nvarchar(50)    NULL,
    AddressLine1        nvarchar(60)    NOT NULL,
    AddressLine2        nvarchar(60)    NULL,
    City                nvarchar(30)    NOT NULL,
    PostalCode          nvarchar(15)    NOT NULL,
    GeographyKey        int             NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (EmployeeKey)
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
    GeographyKey         int             IDENTITY(1,1),
    City                 nvarchar(30)    NOT NULL,
    StateProvinceCode    nchar(3)        NOT NULL,
    StateProvinceName    nvarchar(50)    NOT NULL,
    CountryRegionCode    nchar(3)        NOT NULL,
    CountryRegionName    nvarchar(50)    NOT NULL,
    PostalCode           nvarchar(15)    NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (GeographyKey)
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
    ProductKey               int               IDENTITY(1,1),
    ProductID                int               NOT NULL,
    ProductName              nvarchar(50)      NOT NULL,
    ProductCategory          nvarchar(50)      NOT NULL,
    ProductSubcategory       nvarchar(50)      NOT NULL,
    ProductModel             nvarchar(50)      NOT NULL,
    SizeUnitMeasureCode      nchar(3)          NULL,
    WeightUnitMeasureCode    nchar(3)          NULL,
    Weight                   decimal(8, 2)     NULL,
    StandardCost             decimal(19, 4)    NOT NULL,
    ListPrice                decimal(19, 4)    NOT NULL,
    FinishedGoodsFlag        bit               NOT NULL,
    SafetyStockLevel         int               NOT NULL,
    ReorderPoint             int               NOT NULL,
    Size                     nvarchar(5)       NULL,
    DaysToManufacture        int               NOT NULL,
    Quantity                 int               NOT NULL,
    SellStartDate            date              NOT NULL,
    SellEndDate              date              NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (ProductKey)
)
go



IF OBJECT_ID('DimProduct') IS NOT NULL
    PRINT '<<< CREATED TABLE DimProduct >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimProduct >>>'
go

/* 
 * TABLE: DimProductVendor 
 */

CREATE TABLE DimProductVendor(
    BusinessEntityID    int               NOT NULL,
    ProductVendorKey    int               IDENTITY(1,1),
    AverageLeadTime     int               NOT NULL,
    StandardPrice       decimal(19, 4)    NULL,
    LastReceiptCost     decimal(19, 4)    NULL,
    LastReceiptDate     date              NULL,
    MinOrderQty         int               NOT NULL,
    MaxOrderQty         int               NOT NULL,
    ProductKey          int               NOT NULL,
    VendorKey           int               NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (ProductVendorKey)
)
go



IF OBJECT_ID('DimProductVendor') IS NOT NULL
    PRINT '<<< CREATED TABLE DimProductVendor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimProductVendor >>>'
go

/* 
 * TABLE: DimShipMethod 
 */

CREATE TABLE DimShipMethod(
    ShipMethodKey    int               IDENTITY(1,1),
    ShipMethodID     int               NOT NULL,
    Name             nvarchar(50)      NOT NULL,
    ShipBase         decimal(19, 4)    NOT NULL,
    ShipRate         decimal(19, 4)    NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (ShipMethodKey)
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
    VendorKey                int             IDENTITY(1,1),
    BusinessEntityID         int             NOT NULL,
    AccountNumber            nvarchar(15)    NOT NULL,
    VendorName               nvarchar(50)    NOT NULL,
    CreditRatings            int             NOT NULL,
    PrefferedVendorStatus    bit             NOT NULL,
    ActiveFlag               bit             NULL,
    VendorCity               nvarchar(30)    NOT NULL,
    VendorPostalCode         nvarchar(15)    NOT NULL,
    ContactTypeID            int             NOT NULL,
    ContactTypeName          nvarchar(50)    NOT NULL,
    GeographyKey             int             NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (VendorKey)
)
go



IF OBJECT_ID('DimVendor') IS NOT NULL
    PRINT '<<< CREATED TABLE DimVendor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimVendor >>>'
go

/* 
 * TABLE: FactPurchaseOrder 
 */

CREATE TABLE FactPurchaseOrder(
    PurchaseOrderKey         int               IDENTITY(1,1),
    PurchaseOrderID          int               NOT NULL,
    PurchaseOrderDetailID    int               NOT NULL,
    OrderQty                 int               NOT NULL,
    ProductID                int               NOT NULL,
    UnitPrice                decimal(19, 4)    NOT NULL,
    LineTotal                decimal(19, 4)    NOT NULL,
    SubTotal                 decimal(19, 4)    NOT NULL,
    TaxAmount                decimal(19, 4)    NOT NULL,
    Freight                  decimal(19, 4)    NOT NULL,
    TotalDue                 decimal(19, 4)    NOT NULL,
    ReceivedQty              decimal(8, 2)     NOT NULL,
    RejectedQty              decimal(8, 2)     NOT NULL,
    StockedQty               decimal(9, 2)     NOT NULL,
    OrderDate                date              NOT NULL,
    ShipDate                 date              NULL,
    DueDate                  date              NOT NULL,
    OrderDateKey             int               NOT NULL,
    ShipDateKey              int               NOT NULL,
    DueDateKey               int               NOT NULL,
    EmployeeKey              int               NOT NULL,
    ShipMethodKey            int               NOT NULL,
    ProductVendorKey         int               NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY NONCLUSTERED (PurchaseOrderKey)
)
go



IF OBJECT_ID('FactPurchaseOrder') IS NOT NULL
    PRINT '<<< CREATED TABLE FactPurchaseOrder >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FactPurchaseOrder >>>'
go

/* 
 * TABLE: DimEmployee 
 */

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimGeography37 
    FOREIGN KEY (GeographyKey)
    REFERENCES DimGeography(GeographyKey)
go


/* 
 * TABLE: DimProductVendor 
 */

ALTER TABLE DimProductVendor ADD CONSTRAINT RefDimProduct33 
    FOREIGN KEY (ProductKey)
    REFERENCES DimProduct(ProductKey)
go

ALTER TABLE DimProductVendor ADD CONSTRAINT RefDimVendor34 
    FOREIGN KEY (VendorKey)
    REFERENCES DimVendor(VendorKey)
go


/* 
 * TABLE: DimVendor 
 */

ALTER TABLE DimVendor ADD CONSTRAINT RefDimGeography35 
    FOREIGN KEY (GeographyKey)
    REFERENCES DimGeography(GeographyKey)
go


/* 
 * TABLE: FactPurchaseOrder 
 */

ALTER TABLE FactPurchaseOrder ADD CONSTRAINT RefDimDate27 
    FOREIGN KEY (DueDateKey)
    REFERENCES DimDate(DateKey)
go

ALTER TABLE FactPurchaseOrder ADD CONSTRAINT RefDimDate28 
    FOREIGN KEY (ShipDateKey)
    REFERENCES DimDate(DateKey)
go

ALTER TABLE FactPurchaseOrder ADD CONSTRAINT RefDimDate30 
    FOREIGN KEY (OrderDateKey)
    REFERENCES DimDate(DateKey)
go

ALTER TABLE FactPurchaseOrder ADD CONSTRAINT RefDimEmployee38 
    FOREIGN KEY (EmployeeKey)
    REFERENCES DimEmployee(EmployeeKey)
go

ALTER TABLE FactPurchaseOrder ADD CONSTRAINT RefDimShipMethod39 
    FOREIGN KEY (ShipMethodKey)
    REFERENCES DimShipMethod(ShipMethodKey)
go

ALTER TABLE FactPurchaseOrder ADD CONSTRAINT RefDimProductVendor40 
    FOREIGN KEY (ProductVendorKey)
    REFERENCES DimProductVendor(ProductVendorKey)
go


