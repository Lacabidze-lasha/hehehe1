Database 1

CREATE TABLE Task1_SalesSource (

    SaleId INT NOT NULL,

    LineNumber INT NOT NULL,

    SaleDate DATE NOT NULL,



    CustomerCode VARCHAR(10) NOT NULL,

    CustomerName NVARCHAR(100) NOT NULL,

    CustomerCity NVARCHAR(50) NOT NULL,



    ProductCode VARCHAR(10) NOT NULL,

    ProductName NVARCHAR(100) NOT NULL,

    CategoryName NVARCHAR(50) NOT NULL,



    Quantity INT NOT NULL,

    UnitPrice DECIMAL(10,2) NOT NULL,



    CONSTRAINT PK_SalesSource

        PRIMARY KEY (SaleId, LineNumber)

);



INSERT INTO Task1_SalesSource (

    SaleId, LineNumber, SaleDate,

    CustomerCode, CustomerName, CustomerCity,

    ProductCode, ProductName, CategoryName,

    Quantity, UnitPrice

)

VALUES

(1001, 1, '20261001',

 'C01', N'ანა ბერიძე', N'თბილისი',

 'P01', N'ფეხბურთის ბურთი', N'გუნდური სპორტი',

 2, 60.00),



(1001, 2, '20261001',

 'C01', N'ანა ბერიძე', N'თბილისი',

 'P02', N'იოგას ხალიჩა', N'ფიტნესი',

 1, 40.00),



(1002, 1, '20261002',

 'C02', N'ლუკა მაისურაძე', N'ბათუმი',

 'P03', N'ჩოგბურთის ჩოგანი', N'ჩოგბურთი',

 1, 150.00),



(1003, 1, '20261003',

 'C01', N'ანა ბერიძე', N'თბილისი',

 'P01', N'ფეხბურთის ბურთი', N'გუნდური სპორტი',

 1, 55.00),



(1004, 1, '20261003',

 'C03', N'ანა ბერიძე', N'ქუთაისი',

 'P02', N'იოგას ხალიჩა', N'ფიტნესი',

 2, 35.00),



(1004, 2, '20261003',

 'C03', N'ანა ბერიძე', N'ქუთაისი',

 'P03', N'ჩოგბურთის ჩოგანი', N'ჩოგბურთი',

 1, 140.00);





 CREATE TABLE Task2_Employees (

    EmployeeId INT PRIMARY KEY,

    EmployeeName NVARCHAR(100) NOT NULL,

    DepartmentId INT NOT NULL,

    DepartmentName NVARCHAR(100) NOT NULL

);



CREATE TABLE Task2_Sales (

    SaleId INT PRIMARY KEY,

    EmployeeId INT NOT NULL,

    SaleDate DATE NOT NULL,

    SaleAmount DECIMAL(10,2) NOT NULL,



    CONSTRAINT FK_Sales_Employees

        FOREIGN KEY (EmployeeId)

        REFERENCES Task2_Employees(EmployeeId)

);



INSERT INTO Task2_Employees (

    EmployeeId, EmployeeName, DepartmentId, DepartmentName

)

VALUES

(101, N'ანა ბერიძე',      10, N'კორპორაციული გაყიდვები'),

(102, N'ლუკა მაისურაძე',  10, N'კორპორაციული გაყიდვები'),

(103, N'ნინო გელაშვილი', 20, N'საცალო გაყიდვები'),

(104, N'გიორგი ლომიძე',  20, N'საცალო გაყიდვები');



INSERT INTO Task2_Sales (

    SaleId, EmployeeId, SaleDate, SaleAmount

)

VALUES

(1001, 101, '20261001', 1500.00),

(1002, 101, '20261002', 2200.00),

(1003, 102, '20261002', 1800.00),

(1004, 103, '20261003',  950.00),

(1005, 104, '20261003', 1200.00);





CREATE TABLE Task3_ProductSales (

    SaleId INT PRIMARY KEY,

    ProductId INT NOT NULL,

    ProductName NVARCHAR(100) NOT NULL,

    CategoryId INT NOT NULL,

    CategoryName NVARCHAR(100) NOT NULL,

    SaleDate DATE NOT NULL

);



INSERT INTO Task3_ProductSales (

    SaleId, ProductId, ProductName,

    CategoryId, CategoryName, SaleDate

)

VALUES

(1, 101, N'კლავიატურა',

 10, N'აქსესუარები', '20260101'),



(2, 101, N'კლავიატურა',

 10, N'აქსესუარები', '20260111'),



(3, 101, N'კლავიატურა',

 10, N'აქსესუარები', '20260131'),



(4, 102, N'მაუსი',

 10, N'აქსესუარები', '20260201'),



(5, 102, N'მაუსი',

 10, N'აქსესუარები', '20260221'),



(6, 103, N'ვებკამერა',

 10, N'აქსესუარები', '20260301'),



(7, 201, N'მონიტორი',

 20, N'ეკრანები', '20260101'),



(8, 201, N'მონიტორი',

 20, N'ეკრანები', '20260302'),



(9, 202, N'პროექტორი',

 20, N'ეკრანები', '20260401'),



(10, 202, N'პროექტორი',

 20, N'ეკრანები', '20260516');













Tasks with the answers:



***გამოიყენეთ მხოლოდ  Task1_SalesSource  ცხრილი***



სპორტული ინვენტარის მაღაზია გაყიდვებს ერთ ცხრილში — SalesSource — ინახავს. კლიენტისა და პროდუქტის აღწერითი მონაცემები სხვადასხვა გაყიდვაში მეორდება.



შექმენით Star Schema: ერთი Fact და ორი Dimension ცხრილი:

მთავარი ცხრილის გამოყენებით დაწერეთ 3 ცალი SELECT, რომლებითაც მიიღებთ Star Schema-ს.

DimCustomer 

DimProduct

FactSales(ახალი ცხრილები არ შექმნათ მხოლოდ Select დაწერეთ, რომელიც დააბრუნებს საჭირო ცხრილებს).


SELECT DISTINCT
    CustomerCode,
    CustomerName,
    CustomerCity
FROM Task1_SalesSource;

SELECT DISTINCT
    ProductCode,
    ProductName,
    CategoryName
FROM Task1_SalesSource;

SELECT 
    SaleId,
    LineNumber,
    SaleDate,
    CustomerCode,
    ProductCode,
    Quantity,
    UnitPrice,
    (Quantity * UnitPrice) AS TotalAmount
FROM Task1_SalesSource;









***გამოიყენეთ მხოლოდ   Task2_Sales და   Task2_Employees ცხრილები***



კომპანია თანამშრომლებისა და მათი გაყიდვების მონაცემებს ორ ცხრილში ინახავს. ორივე ცხრილი მეორე ნორმალურ ფორმაშია



საჭიროა ახალი ცხრილის დამატება და არსებულის ცვლილება რათა მივიდეთ მესამე ფორმამდე. 



დაწერეთ შესაბამისი SELECT ბრძანებები. ერთმა დააბრუნოს ახალი ცხრილი, მეორემ შეცვალოს არსებული.



(CREATE და UPDATE არ გააკეთოთ, მხოლოდ SELECT გამოიყენეთ)
SELECT DISTINCT
    DepartmentId,
    DepartmentName
FROM Task2_Employees;

SELECT 
    EmployeeId,
    EmployeeName,
    DepartmentId
FROM Task2_Employees;





***გამოიყენეთ მხოლოდ  Task3_ProductSales  ცხრილი***

მაღაზია გაყიდვებს ProductSales ცხრილში ინახავს. ერთი სტრიქონი წარმოადგენს კონკრეტული პროდუქტის ერთ გაყიდვას.

ამ ამოცანაში პროდუქტის სასიცოცხლო ციკლი განისაზღვრება როგორც მის პირველ და ბოლო გაყიდვას შორის გასული დღეების რაოდენობა.

შიდა მოთხოვნაში იპოვეთ თითო პროდუქტის პირველი და ბოლო გაყიდვის თარიღი და გამოთვალეთ მათ შორის სხვაობა;

მთავარ მოთხოვნაში შეცვალეთ Grain და გამოთვალეთ მიღებული ხანგრძლივობების საშუალო კატეგორიის მიხედვით.
SELECT 
    CategoryName,
    AVG(1.0 * ProductLifecycleDays) AS AvgLifecycleDays
FROM (
    SELECT 
        ProductId,
        CategoryName,
        DATEDIFF(DAY, MIN(SaleDate), MAX(SaleDate)) AS ProductLifecycleDays
    FROM Task3_ProductSales
    GROUP BY 
        ProductId, 
        CategoryName
) AS ProductLifecycles
GROUP BY 
    CategoryName;

















































Datebase 2:


CREATE TABLE TASK1_Tickets
(
    TicketId  INT PRIMARY KEY,
    AgentName NVARCHAR(100),
    CreatedAt DATETIME2
);

CREATE TABLE TASK1_TicketEvents
(
    EventId   INT PRIMARY KEY,
    TicketId  INT,
    EventType VARCHAR(30),
    CreatedAt DATETIME2,

    FOREIGN KEY (TicketId)
        REFERENCES TASK1_Tickets(TicketId)
);

INSERT INTO TASK1_Tickets
    (TicketId, AgentName, CreatedAt)
VALUES
    (1,  N'ანა კახიძე',   '2026-01-05 09:00'),
    (2,  N'ანა კახიძე',   '2026-01-06 10:00'),
    (3,  N'ანა კახიძე',   '2026-01-07 11:00'),
    (4,  N'ანა კახიძე',   '2026-01-08 12:00'),
    (5,  N'ანა კახიძე',   '2026-01-09 09:30'),
    (6,  N'ანა კახიძე',   '2026-01-10 14:00'),

    (7,  N'ლუკა ბერიძე',  '2026-01-05 09:15'),
    (8,  N'ლუკა ბერიძე',  '2026-01-06 11:00'),
    (9,  N'ლუკა ბერიძე',  '2026-01-07 13:00'),
    (10, N'ლუკა ბერიძე',  '2026-01-08 15:00'),
    (11, N'ლუკა ბერიძე',  '2026-01-09 10:00'),
    (12, N'ლუკა ბერიძე',  '2026-01-10 12:00'),

    (13, N'მარიამ დვალი', '2026-01-05 10:00'),
    (14, N'მარიამ დვალი', '2026-01-06 12:00'),
    (15, N'მარიამ დვალი', '2026-01-07 14:00'),
    (16, N'მარიამ დვალი', '2026-01-08 09:00'),
    (17, N'მარიამ დვალი', '2026-01-09 11:00'),
    (18, N'მარიამ დვალი', '2026-01-10 13:00'),
    (19, N'მარიამ დვალი', '2026-01-11 10:00');

    INSERT INTO TASK1_TicketEvents
    (EventId, TicketId, EventType, CreatedAt)
VALUES
    -- ანა კახიძე
    (1,  1, 'Created',    '2026-01-05 09:00'),
    (2,  1, 'InProgress', '2026-01-05 09:30'),
    (3,  1, 'Resolved',   '2026-01-05 12:00'),

    (4,  2, 'Created',    '2026-01-06 10:00'),
    (5,  2, 'InProgress', '2026-01-06 11:00'),

    (6,  3, 'Created',    '2026-01-07 11:00'),
    (7,  3, 'InProgress', '2026-01-07 11:45'),
    (8,  3, 'Resolved',   '2026-01-08 10:00'),

    (9,  4, 'Created',    '2026-01-08 12:00'),

    (10, 5, 'Created',    '2026-01-09 09:30'),
    (11, 5, 'InProgress', '2026-01-09 10:00'),
    (12, 5, 'Resolved',   '2026-01-09 16:00'),

    (13, 6, 'Created',    '2026-01-10 14:00'),
    (14, 6, 'InProgress', '2026-01-10 15:30'),

    -- ლუკა ბერიძე
    (15, 7, 'Created',    '2026-01-05 09:15'),
    (16, 7, 'InProgress', '2026-01-05 09:40'),
    (17, 7, 'Resolved',   '2026-01-05 11:30'),

    (18, 8, 'Created',    '2026-01-06 11:00'),
    (19, 8, 'InProgress', '2026-01-06 11:20'),
    (20, 8, 'Resolved',   '2026-01-06 14:00'),

    (21, 9, 'Created',    '2026-01-07 13:00'),
    (22, 9, 'InProgress', '2026-01-07 15:00'),

    (23, 10, 'Created',   '2026-01-08 15:00'),

    (24, 11, 'Created',    '2026-01-09 10:00'),
    (25, 11, 'InProgress', '2026-01-09 10:30'),
    (26, 11, 'Resolved',   '2026-01-09 13:00'),

    (27, 12, 'Created',    '2026-01-10 12:00'),
    (28, 12, 'InProgress', '2026-01-10 13:00'),
    (29, 12, 'Resolved',   '2026-01-11 09:00'),

    -- მარიამ დვალი
    (30, 13, 'Created',    '2026-01-05 10:00'),
    (31, 13, 'InProgress', '2026-01-05 10:20'),
    (32, 13, 'Resolved',   '2026-01-05 15:00'),

    (33, 14, 'Created',    '2026-01-06 12:00'),
    (34, 14, 'InProgress', '2026-01-06 13:30'),

    (35, 15, 'Created',    '2026-01-07 14:00'),
    (36, 15, 'InProgress', '2026-01-07 14:30'),
    (37, 15, 'Resolved',   '2026-01-08 09:30'),

    (38, 16, 'Created',    '2026-01-08 09:00'),
    (39, 16, 'InProgress', '2026-01-08 09:15'),
    (40, 16, 'Resolved',   '2026-01-08 12:00'),

    (41, 17, 'Created',    '2026-01-09 11:00'),

    (42, 18, 'Created',    '2026-01-10 13:00'),
    (43, 18, 'InProgress', '2026-01-10 14:00'),

    (44, 19, 'Created',    '2026-01-11 10:00'),
    (45, 19, 'InProgress', '2026-01-11 10:45'),
    (46, 19, 'Resolved',   '2026-01-11 16:00');

    CREATE TABLE TASK2_SalesTransactions
(
    TransactionId INT PRIMARY KEY,
    Salesperson    NVARCHAR(100),
    SaleDate       DATE,
    Amount         DECIMAL(10,2)
);

INSERT INTO TASK2_SalesTransactions
    (TransactionId, Salesperson, SaleDate, Amount)
VALUES
    (1,  N'ანა კახიძე',    '2026-03-01',  500.00),
    (2,  N'ანა კახიძე',    '2026-03-03',  800.00),
    (3,  N'ანა კახიძე',    '2026-03-05', 1200.00),
    (4,  N'ანა კახიძე',    '2026-03-07',  700.00),
    (5,  N'ანა კახიძე',    '2026-03-09', 1000.00),

    (6,  N'ლუკა ბერიძე',   '2026-03-01',  400.00),
    (7,  N'ლუკა ბერიძე',   '2026-03-03',  450.00),
    (8,  N'ლუკა ბერიძე',   '2026-03-05',  500.00),
    (9,  N'ლუკა ბერიძე',   '2026-03-07',  550.00),
    (10, N'ლუკა ბერიძე',   '2026-03-09', 1600.00),

    (11, N'მარიამ დვალი',  '2026-03-02',  900.00),
    (12, N'მარიამ დვალი',  '2026-03-04',  950.00),
    (13, N'მარიამ დვალი',  '2026-03-06', 1000.00),
    (14, N'მარიამ დვალი',  '2026-03-08', 1050.00),
    (15, N'მარიამ დვალი',  '2026-03-10', 1100.00),

    (16, N'გიორგი მაისურაძე', '2026-03-02',  300.00),
    (17, N'გიორგი მაისურაძე', '2026-03-04',  600.00),
    (18, N'გიორგი მაისურაძე', '2026-03-06',  900.00),
    (19, N'გიორგი მაისურაძე', '2026-03-08', 1200.00),
    (20, N'გიორგი მაისურაძე', '2026-03-10', 1500.00);



CREATE TABLE TASK3_LabSampleEvents
(
    EventId    INT PRIMARY KEY,
    SampleId   INT,
    DoctorName NVARCHAR(100),
    Type       VARCHAR(30),
    CreatedAt  DATETIME2
);

INSERT INTO TASk3_LabSampleEvents
    (EventId, SampleId, DoctorName, Type, CreatedAt)
VALUES
    (1,  101, N'ნინო ბერიძე', 'Received',       '2026-04-01 08:00'),
    (2,  101, N'ნინო ბერიძე', 'TestingStarted', '2026-04-01 08:25'),
    (3,  101, N'ნინო ბერიძე', 'Completed',      '2026-04-01 10:30'),

    (4,  102, N'ნინო ბერიძე', 'Received',       '2026-04-01 08:10'),
    (5,  102, N'ნინო ბერიძე', 'TestingStarted', '2026-04-01 09:00'),
    (6,  102, N'ნინო ბერიძე', 'Completed',      '2026-04-01 11:20'),

    (7,  103, N'ნინო ბერიძე', 'Received',       '2026-04-01 08:30'),
    (8,  103, N'ნინო ბერიძე', 'TestingStarted', '2026-04-01 08:55'),
    (9,  103, N'ნინო ბერიძე', 'Completed',      '2026-04-01 10:45'),

    (10, 104, N'ნინო ბერიძე', 'Received',       '2026-04-01 09:00'),
    (11, 104, N'ნინო ბერიძე', 'TestingStarted', '2026-04-01 09:15'),
    (12, 104, N'ნინო ბერიძე', 'Completed',      '2026-04-01 12:00'),

    (13, 105, N'ნინო ბერიძე', 'Received',       '2026-04-01 09:30'),
    (14, 105, N'ნინო ბერიძე', 'TestingStarted', '2026-04-01 10:00'),
    (15, 105, N'ნინო ბერიძე', 'Completed',      '2026-04-01 12:30'),

    (16, 106, N'ლუკა ხუციშვილი', 'Received',       '2026-04-01 10:00'),
    (17, 106, N'ლუკა ხუციშვილი', 'TestingStarted', '2026-04-01 11:30'),
    (18, 106, N'ლუკა ხუციშვილი', 'Completed',      '2026-04-01 14:00'),

    (19, 107, N'ლუკა ხუციშვილი', 'Received',       '2026-04-01 10:15'),
    (20, 107, N'ლუკა ხუციშვილი', 'TestingStarted', '2026-04-01 10:45'),
    (21, 107, N'ლუკა ხუციშვილი', 'Completed',      '2026-04-01 13:00'),

    (22, 108, N'ლუკა ხუციშვილი', 'Received',       '2026-04-01 10:30'),
    (23, 108, N'ლუკა ხუციშვილი', 'TestingStarted', '2026-04-01 11:10'),
    (24, 108, N'ლუკა ხუციშვილი', 'Completed',      '2026-04-01 13:40'),

    (25, 109, N'ლუკა ხუციშვილი', 'Received',       '2026-04-01 11:00'),
    (26, 109, N'ლუკა ხუციშვილი', 'TestingStarted', '2026-04-01 11:20'),
    (27, 109, N'ლუკა ხუციშვილი', 'Completed',      '2026-04-01 14:10'),

    (28, 110, N'ლუკა ხუციშვილი', 'Received',       '2026-04-01 11:15'),
    (29, 110, N'ლუკა ხუციშვილი', 'TestingStarted', '2026-04-01 12:00'),
    (30, 110, N'ლუკა ხუციშვილი', 'Completed',      '2026-04-01 15:00');









Tasks with the answers:





გამოიყენეთ მხოლოდ TASK1_TicketEvents და TASK1_Tickets ცხრილები. მოცემულია კომპანიის Ticket-ების მართვის სისტემის მონაცემები. თითოეული აგენტისთვის დაითვალეთ:- ყველა Ticket-ის რაოდენობა;- Resolved Ticket-ების რაოდენობა;- Resolution Rate. გჭირდებათ subquery-ს გამოყენება. Grain : Event → Ticket → Agent უნდა მიიღოთ ეს შედეგი



SELECT
    AgentName,
    COUNT(*) AS TotalTickets,
    SUM(IsResolved) AS ResolvedTickets,
    CAST(SUM(IsResolved) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS ResolutionRate
FROM
(
    SELECT
        T.TicketId,
        T.AgentName,
        MAX(
            CASE
                WHEN E.EventType = 'Resolved' THEN 1
                ELSE 0
            END
        ) AS IsResolved
    FROM TASK1_Tickets T
    LEFT JOIN TASK1_TicketEvents E
        ON T.TicketId = E.TicketId
    GROUP BY
        T.TicketId,
        T.AgentName
) AS TicketLevel
GROUP BY AgentName;





მოცემულია გაყიდვების ტრანზაქციები. თითოეული გაყიდვების წარმომადგენლისთვის: Window Function-ით ტრანზაქციები  დანომრეთ თანხის კლებადობით  და დაითვალეთ  მათუ საშუალო გაყიდვის თანხა;საბოლოო შედეგში დატოვეთ მხოლოდ: წარმომადგენლის ის ტრანზაქციები, რომლებიც მის Top 2 გაყიდვაში შედის. ასევე გამოთვალეთ: DifferenceFromAverage = Amount - AverageAmount




SELECT
    Salesperson,
    TransactionId,
    SaleDate,
    Amount,
    AverageAmount,
    Amount - AverageAmount AS DifferenceFromAverage
FROM
(
    SELECT
        TransactionId,
        Salesperson,
        SaleDate,
        Amount,
        ROW_NUMBER() OVER
        (
            PARTITION BY Salesperson
            ORDER BY Amount DESC, TransactionId
        ) AS SalesRank,
        AVG(Amount) OVER
        (
            PARTITION BY Salesperson
        ) AS AverageAmount
    FROM TASK2_SalesTransactions
) AS RankedSales
WHERE SalesRank <= 2
ORDER BY Salesperson, SalesRank;




















გამოიყენეთ მხოლოდ TASK3_LabSampleEvents ცხრილი ლაბორატორია ნიმუშების დამუშავების ეტაპებს LabSampleEvents ცხრილში ინახავს. nთითოეული ექიმისთვის გამოთვალეთ: დამუშავებული ნიმუშების რაოდენობა;ნიმუშის მიღებიდან (Received) ტესტირების დაწყებამდე (TestingStarted) გასული საშუალო დრო წუთებში. გამოიყენეთ subquery. შიდა მოთხოვნაში Grain იქნება Sample ხოლო მთავარ მოთხოვნაში გადავა ექიმის grain-ზე

SELECT
    DoctorName,
    COUNT(*) AS ProcessedSamples,
    AVG(
        CAST(
            DATEDIFF(MINUTE, ReceivedAt, TestingStartedAt)
            AS DECIMAL(10,2)
        )
    ) AS AverageMinutes
FROM
(
    SELECT
        SampleId,
        DoctorName,
        MIN(CASE
            WHEN Type = 'Received' THEN CreatedAt
        END) AS ReceivedAt,
        MIN(CASE
            WHEN Type = 'TestingStarted' THEN CreatedAt
        END) AS TestingStartedAt
    FROM TASK3_LabSampleEvents
    GROUP BY
        SampleId,
        DoctorName
) AS SampleLevel
GROUP BY DoctorName;

































































/*
=========================================================
Readable summary of the final SQL explanations
=========================================================

This section was reformatted only for readability.
No SQL logic was changed.
*/

/*
---------------------------------------------------------
Star Schema from Task1_SalesSource
---------------------------------------------------------
*/

/*
Query 1:
SELECT DISTINCT
    CustomerCode,
    CustomerName,
    CustomerCity
FROM Task1_SalesSource;

Explanation:
- SELECT DISTINCT keeps only unique records, so repeated customer information is not duplicated.
- CustomerCode represents the customer identifier.
- CustomerName is the customer’s name.
- CustomerCity is the customer’s city.
- FROM Task1_SalesSource reads from the raw sales table.
- Result: this is the customer dimension table (DimCustomer), because one customer can appear many times in the sales table, but we keep one row per customer.
*/

/*
Query 2:
SELECT DISTINCT
    ProductCode,
    ProductName,
    CategoryName
FROM Task1_SalesSource;

Explanation:
- SELECT DISTINCT removes duplicate product rows.
- ProductCode is the product identifier.
- ProductName is the product name.
- CategoryName is the product category.
- FROM Task1_SalesSource reads from the original sales dataset.
- Result: this is the product dimension table (DimProduct), because product details repeat across sales lines.
*/

/*
Query 3:
SELECT
    SaleId,
    LineNumber,
    SaleDate,
    CustomerCode,
    ProductCode,
    Quantity,
    UnitPrice,
    (Quantity * UnitPrice) AS TotalAmount
FROM Task1_SalesSource;

Explanation:
- SaleId is the sales document identifier.
- LineNumber identifies each row within one sale.
- SaleDate is the sale date.
- CustomerCode is a foreign key to the customer dimension.
- ProductCode is a foreign key to the product dimension.
- Quantity is how many units were sold.
- UnitPrice is the price per unit.
- (Quantity * UnitPrice) AS TotalAmount calculates the revenue for that sales line.
- Result: this is the fact table (FactSales), because it stores measurable transaction information and keys to dimensions.
*/

/*
---------------------------------------------------------
Task2 normalization logic
---------------------------------------------------------
*/

/*
Query 4:
SELECT DISTINCT
    DepartmentId,
    DepartmentName
FROM Task2_Employees;

Explanation:
- SELECT DISTINCT keeps only one row per department.
- DepartmentId is the department key.
- DepartmentName is the department name.
- FROM Task2_Employees uses the employee table.
- Meaning: this represents the department dimension/table created from the employee table to remove repeated department data.
*/

/*
Query 5:
SELECT
    EmployeeId,
    EmployeeName,
    DepartmentId
FROM Task2_Employees;

Explanation:
- EmployeeId is the unique employee identifier.
- EmployeeName is the employee name.
- DepartmentId is the department reference for the employee.
- FROM Task2_Employees uses the original employee table.
- Meaning: this represents the employee table after the department information is separated out, leaving the employee with only a department reference instead of repeating department fields in every employee row.
*/

/*
---------------------------------------------------------
Product lifecycle by category
---------------------------------------------------------
*/

/*
Query 6:
SELECT
    CategoryName,
    AVG(1.0 * ProductLifecycleDays) AS AvgLifecycleDays
FROM (
    SELECT
        ProductId,
        CategoryName,
        DATEDIFF(DAY, MIN(SaleDate), MAX(SaleDate)) AS ProductLifecycleDays
    FROM Task3_ProductSales
    GROUP BY
        ProductId,
        CategoryName
) AS ProductLifecycles
GROUP BY
    CategoryName;

Explanation:
- SELECT CategoryName groups the final output by product category.
- AVG(1.0 * ProductLifecycleDays) calculates the average lifecycle length in days for each category.
- 1.0 * ProductLifecycleDays forces decimal math so the average is not rounded to an integer.
- FROM ( ... ) AS ProductLifecycles creates an inner temporary result set.
- ProductId is each product analyzed separately.
- CategoryName indicates each product's category.
- DATEDIFF(DAY, MIN(SaleDate), MAX(SaleDate)) calculates the number of days between the first and last sale date for that product.
- MIN(SaleDate) is the earliest sale of that product.
- MAX(SaleDate) is the latest sale of that product.
- GROUP BY ProductId, CategoryName means: for each product in each category.
- Outer GROUP BY CategoryName aggregates all product lifecycles by category.
- Result: average product lifecycle (in days) per category.
*/

/*
---------------------------------------------------------
Ticket resolution rate per agent
---------------------------------------------------------
*/

/*
Query 7:
გამოიყენეთ მხოლოდ TASK1_TicketEvents და TASK1_Tickets ცხრილები. მოცემულია კომპანიის Ticket-ების მართვის სისტემის მონაცემები. თითოეული აგენტისთვის დაითვალეთ:- ყველა Ticket-ის რაოდენობა;- Resolved Ticket-ების რაოდენობა;- Resolution Rate. გჭირდებათ subquery-ს გამოყენება. Grain : Event → Ticket → Agent უნდა მიიღოთ ეს შედეგი
SELECT
    AgentName,
    COUNT(*) AS TotalTickets,
    SUM(IsResolved) AS ResolvedTickets,
    CAST(SUM(IsResolved) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS ResolutionRate
FROM (
    SELECT
        T.TicketId,
        T.AgentName,
        MAX(
            CASE
                WHEN E.EventType = 'Resolved' THEN 1
                ELSE 0
            END
        ) AS IsResolved
    FROM TASK1_Tickets T
    LEFT JOIN TASK1_TicketEvents E
        ON T.TicketId = E.TicketId
    GROUP BY
        T.TicketId,
        T.AgentName
) AS TicketLevel
GROUP BY AgentName;

Explanation:
- SELECT AgentName groups results by agent.
- COUNT(*) AS TotalTickets counts all tickets assigned to each agent.
- SUM(IsResolved) AS ResolvedTickets adds up how many tickets were resolved.
- CAST(... AS DECIMAL(5,2)) AS ResolutionRate converts the percentage to a decimal value with 2 digits after the decimal.
- FROM ( ... ) AS TicketLevel builds a ticket-level result set.
- T.TicketId is the ticket identifier from the master ticket table.
- T.AgentName is the agent assigned to the ticket.
- MAX(CASE WHEN E.EventType = 'Resolved' THEN 1 ELSE 0 END) AS IsResolved checks each ticket’s events.
- If a ticket has a Resolved event, it gets 1; otherwise 0.
- MAX ensures a ticket ends up with 1 if it was resolved at least once.
- LEFT JOIN TASK1_TicketEvents E ON T.TicketId = E.TicketId keeps all tickets even if no event exists.
- GROUP BY T.TicketId, T.AgentName ensures each ticket is treated as one row after aggregation.
- Outer GROUP BY AgentName totals the results per agent.
- Result: for every agent, show total tickets, resolved tickets, and resolution percentage.
*/

/*
---------------------------------------------------------
Top 2 sales per salesperson by amount, with difference from average
---------------------------------------------------------
*/

/*
Query 8:
მოცემულია გაყიდვების ტრანზაქციები. თითოეული გაყიდვების წარმომადგენლისთვის: Window Function-ით ტრანზაქციები  დანომრეთ თანხის კლებადობით  და დაითვალეთ  მათუ საშუალო გაყიდვის თანხა;საბოლოო შედეგში დატოვეთ მხოლოდ: წარმომადგენლის ის ტრანზაქციები, რომლებიც მის Top 2 გაყიდვაში შედის. ასევე გამოთვალეთ: DifferenceFromAverage = Amount - AverageAmount
SELECT
    Salesperson,
    TransactionId,
    SaleDate,
    Amount,
    AverageAmount,
    Amount - AverageAmount AS DifferenceFromAverage
FROM (
    SELECT
        TransactionId,
        Salesperson,
        SaleDate,
        Amount,
        ROW_NUMBER() OVER (
            PARTITION BY Salesperson
            ORDER BY Amount DESC, TransactionId
        ) AS SalesRank,
        AVG(Amount) OVER (
            PARTITION BY Salesperson
        ) AS AverageAmount
    FROM TASK2_SalesTransactions
) AS RankedSales
WHERE SalesRank <= 2
ORDER BY Salesperson, SalesRank;

Explanation:
- SELECT Salesperson, TransactionId, SaleDate, Amount, AverageAmount, Amount - AverageAmount shows the transaction details and how much each transaction differs from the salesperson’s average.
- FROM ( ... ) AS RankedSales runs the inner query first.
- TransactionId identifies each transaction.
- Salesperson is the salesperson name.
- SaleDate is the transaction date.
- Amount is the sale amount.
- ROW_NUMBER() OVER (PARTITION BY Salesperson ORDER BY Amount DESC, TransactionId) ranks transactions for each salesperson.
- It orders them by amount descending and then by TransactionId for ties.
- AVG(Amount) OVER (PARTITION BY Salesperson) calculates the average sale amount for each salesperson.
- WHERE SalesRank <= 2 keeps only the top 2 sales per salesperson.
- ORDER BY Salesperson, SalesRank sorts the final result by salesperson and rank.
- Result: only each salesperson’s two highest-value transactions are displayed, along with the difference from their average transaction value.
*/

/*
---------------------------------------------------------
Average sample processing time from Received to TestingStarted, by doctor
---------------------------------------------------------
*/

/*
Query 9:
SELECT
    DoctorName,
    COUNT(*) AS ProcessedSamples,
    AVG(
        CAST(
            DATEDIFF(MINUTE, ReceivedAt, TestingStartedAt)
            AS DECIMAL(10,2)
        )
    ) AS AverageMinutes
FROM (
    SELECT
        SampleId,
        DoctorName,
        MIN(CASE
            WHEN Type = 'Received' THEN CreatedAt
        END) AS ReceivedAt,
        MIN(CASE
            WHEN Type = 'TestingStarted' THEN CreatedAt
        END) AS TestingStartedAt
    FROM TASK3_LabSampleEvents
    GROUP BY
        SampleId,
        DoctorName
) AS SampleLevel
GROUP BY DoctorName;

Explanation:
- SELECT DoctorName groups the final result by doctor.
- COUNT(*) AS ProcessedSamples counts how many samples were processed by each doctor.
- AVG(CAST(DATEDIFF(MINUTE, ReceivedAt, TestingStartedAt) AS DECIMAL(10,2))) AS AverageMinutes calculates the average time between Received and TestingStarted.
- DATEDIFF(MINUTE, ReceivedAt, TestingStartedAt) subtracts the receive time from the testing-start time in minutes.
- CAST(... AS DECIMAL(10,2)) ensures the value is stored with decimal precision.
- FROM ( ... ) AS SampleLevel builds a sample-level result set.
- SampleId represents each lab sample.
- DoctorName is the doctor responsible for that sample.
- MIN(CASE WHEN Type = 'Received' THEN CreatedAt END) AS ReceivedAt picks the earliest Received timestamp for each sample.
- MIN(CASE WHEN Type = 'TestingStarted' THEN CreatedAt END) AS TestingStartedAt picks the earliest TestingStarted timestamp for each sample.
- GROUP BY SampleId, DoctorName aggregates by sample and doctor.
- Outer GROUP BY DoctorName calculates total processed samples and average processing time per doctor.
- Result: for each doctor, you get how many samples they processed and the average time between sample receipt and testing start.
*/

/*
---------------------------------------------------------
Overall meaning
---------------------------------------------------------

The answers are correct in principle because each query solves a specific analytical problem:
- dimensional modeling
- normalization
- lifecycle/day-span analysis
- ticket resolution reporting
- top-k sales analysis
- process timing analysis

Each query uses proper SQL concepts such as DISTINCT, GROUP BY, CASE, JOIN, WINDOW FUNCTIONS, and subqueries to turn raw operational data into business-ready reporting results.
*/