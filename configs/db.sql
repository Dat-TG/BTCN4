-- ----------------------------
-- Table structure for Categories
-- ----------------------------
DROP TABLE IF EXISTS "Categories"  CASCADE;
CREATE TABLE "Categories" (
  "CategoryID" int4 NOT NULL,
  "CategoryName" varchar(15) NOT NULL
)
;

-- ----------------------------
-- Records of Categories
-- ----------------------------
BEGIN;
INSERT INTO "Categories" VALUES (1, 'Beverages');
INSERT INTO "Categories" VALUES (2, 'Condiments');
INSERT INTO "Categories" VALUES (3, 'Confections');
INSERT INTO "Categories" VALUES (4, 'Dairy Products');
INSERT INTO "Categories" VALUES (5, 'Grains/Cereals');
INSERT INTO "Categories" VALUES (6, 'Meat/Poultry');
INSERT INTO "Categories" VALUES (7, 'Produce');
INSERT INTO "Categories" VALUES (8, 'Seafood');
COMMIT;

-- ----------------------------
-- Table structure for Customers
-- ----------------------------
DROP TABLE IF EXISTS "Customers"  CASCADE;
CREATE TABLE "Customers" (
  "CusID" int4 NOT NULL,
  "CustomerName" varchar(50) NOT NULL,
  "Token" varchar(255) NOT NULL
)
;

-- ----------------------------
-- Table structure for Order Details
-- ----------------------------
DROP TABLE IF EXISTS "Order Details"  CASCADE;
CREATE TABLE "Order Details" (
  "OrderID" int4 NOT NULL,
  "ProductID" int4 NOT NULL,
  "UnitPrice" numeric(19,4) NOT NULL,
  "Quantity" int2 NOT NULL,
  "Discount" float4 NOT NULL
)
;

-- ----------------------------
-- Table structure for Orders
-- ----------------------------
DROP TABLE IF EXISTS "Orders"  CASCADE;
CREATE TABLE "Orders" (
  "OrderID" int4 NOT NULL,
  "OrderDate" timestamp NOT NULL,
  "Freight" numeric(19,4) NOT NULL,
  "ShipAddress" varchar(15) NOT NULL,
  "CusID" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for Products
-- ----------------------------
DROP TABLE IF EXISTS "Products"  CASCADE;
CREATE TABLE "Products" (
  "ProductID" int4 NOT NULL,
  "ProductName" varchar(40) NOT NULL,
  "CategoryID" int4,
  "UnitPrice" numeric(19,4),
  "UnitsInStock" int2
)
;

-- ----------------------------
-- Records of Products
-- ----------------------------
BEGIN;
INSERT INTO "Products" VALUES (1, 'Chai', 1, 18.0000, 39);
INSERT INTO "Products" VALUES (2, 'Chang', 1, 19.0000, 17);
INSERT INTO "Products" VALUES (3, 'Aniseed Syrup', 2, 10.0000, 13);
INSERT INTO "Products" VALUES (4, 'Chef Anton''s Cajun Seasoning', 2, 22.0000, 53);
INSERT INTO "Products" VALUES (5, 'Chef Anton''s Gumbo Mix', 2, 21.3500, 0);
INSERT INTO "Products" VALUES (6, 'Grandma''s Boysenberry Spread', 2, 25.0000, 120);
INSERT INTO "Products" VALUES (7, 'Uncle Bob''s Organic Dried Pears', 7, 30.0000, 15);
INSERT INTO "Products" VALUES (8, 'Northwoods Cranberry Sauce', 2, 40.0000, 6);
INSERT INTO "Products" VALUES (9, 'Mishi Kobe Niku', 6, 97.0000, 29);
INSERT INTO "Products" VALUES (10, 'Ikura', 8, 31.0000, 31);
INSERT INTO "Products" VALUES (11, 'Queso Cabrales', 4, 21.0000, 22);
INSERT INTO "Products" VALUES (12, 'Queso Manchego La Pastora', 4, 38.0000, 86);
INSERT INTO "Products" VALUES (13, 'Konbu', 8, 6.0000, 24);
INSERT INTO "Products" VALUES (14, 'Tofu', 7, 23.2500, 35);
INSERT INTO "Products" VALUES (15, 'Genen Shouyu', 2, 15.5000, 39);
INSERT INTO "Products" VALUES (16, 'Pavlova', 3, 17.4500, 29);
INSERT INTO "Products" VALUES (17, 'Alice Mutton', 6, 39.0000, 0);
INSERT INTO "Products" VALUES (18, 'Carnarvon Tigers', 8, 62.5000, 42);
INSERT INTO "Products" VALUES (19, 'Teatime Chocolate Biscuits', 3, 9.2000, 25);
INSERT INTO "Products" VALUES (20, 'Sir Rodney''s Marmalade', 3, 81.0000, 40);
INSERT INTO "Products" VALUES (21, 'Sir Rodney''s Scones', 3, 10.0000, 3);
INSERT INTO "Products" VALUES (22, 'Gustaf''s Knäckebröd', 5, 21.0000, 104);
INSERT INTO "Products" VALUES (23, 'Tunnbröd', 5, 9.0000, 61);
INSERT INTO "Products" VALUES (24, 'Guaraná Fantástica', 1, 4.5000, 20);
INSERT INTO "Products" VALUES (25, 'NuNuCa Nuß-Nougat-Creme', 3, 14.0000, 76);
INSERT INTO "Products" VALUES (26, 'Gumbär Gummibärchen', 3, 31.2300, 15);
INSERT INTO "Products" VALUES (27, 'Schoggi Schokolade', 3, 43.9000, 49);
INSERT INTO "Products" VALUES (28, 'Rössle Sauerkraut', 7, 45.6000, 26);
INSERT INTO "Products" VALUES (29, 'Thüringer Rostbratwurst', 6, 123.7900, 0);
INSERT INTO "Products" VALUES (30, 'Nord-Ost Matjeshering', 8, 25.8900, 10);
INSERT INTO "Products" VALUES (31, 'Gorgonzola Telino', 4, 12.5000, 0);
INSERT INTO "Products" VALUES (32, 'Mascarpone Fabioli', 4, 32.0000, 9);
INSERT INTO "Products" VALUES (33, 'Geitost', 4, 2.5000, 112);
INSERT INTO "Products" VALUES (34, 'Sasquatch Ale', 1, 14.0000, 111);
INSERT INTO "Products" VALUES (35, 'Steeleye Stout', 1, 18.0000, 20);
INSERT INTO "Products" VALUES (36, 'Inlagd Sill', 8, 19.0000, 112);
INSERT INTO "Products" VALUES (37, 'Gravad lax', 8, 26.0000, 11);
INSERT INTO "Products" VALUES (38, 'Côte de Blaye', 1, 263.5000, 17);
INSERT INTO "Products" VALUES (39, 'Chartreuse verte', 1, 18.0000, 69);
INSERT INTO "Products" VALUES (40, 'Boston Crab Meat', 8, 18.4000, 123);
INSERT INTO "Products" VALUES (41, 'Jack''s New England Clam Chowder', 8, 9.6500, 85);
INSERT INTO "Products" VALUES (42, 'Singaporean Hokkien Fried Mee', 5, 14.0000, 26);
INSERT INTO "Products" VALUES (43, 'Ipoh Coffee', 1, 46.0000, 17);
INSERT INTO "Products" VALUES (44, 'Gula Malacca', 2, 19.4500, 27);
INSERT INTO "Products" VALUES (45, 'Rogede sild', 8, 9.5000, 5);
INSERT INTO "Products" VALUES (46, 'Spegesild', 8, 12.0000, 95);
INSERT INTO "Products" VALUES (47, 'Zaanse koeken', 3, 9.5000, 36);
INSERT INTO "Products" VALUES (48, 'Chocolade', 3, 12.7500, 15);
INSERT INTO "Products" VALUES (49, 'Maxilaku', 3, 20.0000, 10);
INSERT INTO "Products" VALUES (50, 'Valkoinen suklaa', 3, 16.2500, 65);
INSERT INTO "Products" VALUES (51, 'Manjimup Dried Apples', 7, 53.0000, 20);
INSERT INTO "Products" VALUES (52, 'Filo Mix', 5, 7.0000, 38);
INSERT INTO "Products" VALUES (53, 'Perth Pasties', 6, 32.8000, 0);
INSERT INTO "Products" VALUES (54, 'Tourtière', 6, 7.4500, 21);
INSERT INTO "Products" VALUES (55, 'Pâté chinois', 6, 24.0000, 115);
INSERT INTO "Products" VALUES (56, 'Gnocchi di nonna Alice', 5, 38.0000, 21);
INSERT INTO "Products" VALUES (57, 'Ravioli Angelo', 5, 19.5000, 36);
INSERT INTO "Products" VALUES (58, 'Escargots de Bourgogne', 8, 13.2500, 62);
INSERT INTO "Products" VALUES (59, 'Raclette Courdavault', 4, 55.0000, 79);
INSERT INTO "Products" VALUES (60, 'Camembert Pierrot', 4, 34.0000, 19);
INSERT INTO "Products" VALUES (61, 'Sirop d''érable', 2, 28.5000, 113);
INSERT INTO "Products" VALUES (62, 'Tarte au sucre', 3, 49.3000, 17);
INSERT INTO "Products" VALUES (63, 'Vegie-spread', 2, 43.9000, 24);
INSERT INTO "Products" VALUES (64, 'Wimmers gute Semmelknödel', 5, 33.2500, 22);
INSERT INTO "Products" VALUES (65, 'Louisiana Fiery Hot Pepper Sauce', 2, 21.0500, 76);
INSERT INTO "Products" VALUES (66, 'Louisiana Hot Spiced Okra', 2, 17.0000, 4);
INSERT INTO "Products" VALUES (67, 'Laughing Lumberjack Lager', 1, 14.0000, 52);
INSERT INTO "Products" VALUES (68, 'Scottish Longbreads', 3, 12.5000, 6);
INSERT INTO "Products" VALUES (69, 'Gudbrandsdalsost', 4, 36.0000, 26);
INSERT INTO "Products" VALUES (70, 'Outback Lager', 1, 15.0000, 15);
INSERT INTO "Products" VALUES (71, 'Flotemysost', 4, 21.5000, 26);
INSERT INTO "Products" VALUES (72, 'Mozzarella di Giovanni', 4, 34.8000, 14);
INSERT INTO "Products" VALUES (73, 'Röd Kaviar', 8, 15.0000, 101);
INSERT INTO "Products" VALUES (74, 'Longlife Tofu', 7, 10.0000, 4);
INSERT INTO "Products" VALUES (75, 'Rhönbräu Klosterbier', 1, 7.7500, 125);
INSERT INTO "Products" VALUES (76, 'Lakkalikööri', 1, 18.0000, 57);
INSERT INTO "Products" VALUES (77, 'Original Frankfurter grüne Soße', 2, 13.0000, 32);
COMMIT;

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE IF EXISTS "Users"  CASCADE;
CREATE TABLE "Users" (
  "UserID" int4 NOT NULL,
  "Username" varchar(50) NOT NULL,
  "Password" varchar(255) NOT NULL,
  "FullName" varchar(50) NOT NULL,
  "Token" varchar(255),
  "Address" varchar(255) NOT NULL
)
;

-- ----------------------------
-- Primary Key structure for table Categories
-- ----------------------------
ALTER TABLE "Categories" ADD CONSTRAINT "PK_Categories" PRIMARY KEY ("CategoryID");

-- ----------------------------
-- Primary Key structure for table Customers
-- ----------------------------
ALTER TABLE "Customers" ADD CONSTRAINT "PK_Customer" PRIMARY KEY ("CusID");

-- ----------------------------
-- Primary Key structure for table Order Details
-- ----------------------------
ALTER TABLE "Order Details" ADD CONSTRAINT "PK_Order_Details" PRIMARY KEY ("OrderID", "ProductID");

-- ----------------------------
-- Primary Key structure for table Orders
-- ----------------------------
ALTER TABLE "Orders" ADD CONSTRAINT "PK_Orders" PRIMARY KEY ("OrderID");

-- ----------------------------
-- Primary Key structure for table Products
-- ----------------------------
ALTER TABLE "Products" ADD CONSTRAINT "PK_Products" PRIMARY KEY ("ProductID");

-- ----------------------------
-- Primary Key structure for table Users
-- ----------------------------
ALTER TABLE "Users" ADD CONSTRAINT "PK_Users" PRIMARY KEY ("UserID");

-- ----------------------------
-- Foreign Keys structure for table Order Details
-- ----------------------------
ALTER TABLE "Order Details" ADD CONSTRAINT "FK_Order_Details_Orders" FOREIGN KEY ("OrderID") REFERENCES "Orders" ("OrderID");
ALTER TABLE "Order Details" ADD CONSTRAINT "FK_Order_Details_Products" FOREIGN KEY ("ProductID") REFERENCES "Products" ("ProductID");

-- ----------------------------
-- Foreign Keys structure for table Orders
-- ----------------------------
ALTER TABLE "Orders" ADD CONSTRAINT "FK_Orders_Customers" FOREIGN KEY ("CusID") REFERENCES "Customers" ("CusID");

-- ----------------------------
-- Foreign Keys structure for table Products
-- ----------------------------
ALTER TABLE "Products" ADD CONSTRAINT "FK_Products_Categories" FOREIGN KEY ("CategoryID") REFERENCES "Categories" ("CategoryID");
