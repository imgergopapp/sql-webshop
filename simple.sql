DROP TABLE IF EXISTS Customer CASCADE;
DROP TABLE IF EXISTS Orders CASCADE;
DROP TABLE IF EXISTS Order_Detail CASCADE;
DROP TABLE IF EXISTS Product CASCADE;

CREATE TABLE Customer(
	CustomerID SERIAL PRIMARY KEY,
	CompanyName TEXT,
	ContactName TEXT,
	ContactTitle TEXT,
	Addres TEXT,
	City TEXT,
	Region TEXT,
	PostalCode INTEGER CHECK (PostalCode > 0),
	Country TEXT,
	PHONE TEXT,
	FAX TEXT
);

CREATE TABLE Orders(
	OrderID SERIAL PRIMARY KEY  ,
	CustomerID INTEGER,
	EmployeeID INTEGER,
	OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
	ShipVia TEXT,
	Freight TEXT,
    ShipName TEXT,
    ShipAddress TEXT,
    ShipCity TEXT,
    ShipRegion TEXT,
    ShipPostalCode INTEGER CHECK (ShipPostalCode > 0),
    ShipCountry TEXT
);

CREATE TABLE Order_Detail(
	OrderID INTEGER,
	ProductID INTEGER,
    UnitPrice MONEY,
    Quantity INTEGER CHECK (Quantity > 0),
    DISCOUNT INTEGER
);
CREATE TABLE Product(
	ProductID SERIAL PRIMARY KEY,
    ProductName TEXT,
	SupplierID INTEGER,
    CategoryID INTEGER,
    QuantityPerUnit INTEGER,
    UnitsPrice MONEY,
    UnitsInStock INTEGER CHECK (UnitsInStock > 0),
    UnitsOnOrder INTEGER,
    ReorderLevel INTEGER,
    Disscontinued BOOLEAN
);
ALTER TABLE Orders
	ADD CONSTRAINT fk_customerid FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);

ALTER TABLE Order_Detail
    ADD CONSTRAINT fk_orderid FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    ADD CONSTRAINT fk_productid FOREIGN KEY (ProductID) REFERENCES Product(ProductID);

INSERT INTO Customer
    (companyname, contactname, contacttitle, addres, city, region, postalcode, country, phone, fax)
    VALUES('Company1', 'ContactName1', 'contacttitle1 ', 'addres1', 'city1', 'region1', 20724, 'country1', '06-543','fax addr');

INSERT INTO Orders
    (customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry)
    VALUES(1, 1, '2000-06-23', '2000-12-22', '2003-02-22', 'shipvia1', 'freight1', 'Unsinkable_final XIII', 'shipaddress!', 'shipcity', 'shipregion', 24829, 'shipcountry!');

INSERT INTO Product
    (productname, supplierid, categoryid, quantityperunit, unitsprice, unitsinstock, unitsonorder, reorderlevel, disscontinued)
    VALUES('Pen', 112, 13, 5267, 30000 , 24598, 1, 1, true);

INSERT INTO Order_Detail
    (orderid, productid, unitprice, quantity, discount)
    VALUES(1, 1, 20045 , 2179, 12151);
