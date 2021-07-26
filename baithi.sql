CREATE DATABASE SellPoint
GO
USE SellPoint
GO
CREATE TABLE Categories(
       CateID char(6) PRIMARY KEY,
	   CateName nvarchar(100) NOT NULL,
	   Description nvarchar(200)
)
INSERT INTO Categories(CateID,CateName,Description ) VALUES (101,'RAM',N'Mới Nhập ')
INSERT INTO Categories(CateID,CateName,Description ) VALUES (102,'CPU',N'Cũ')
INSERT INTO Categories(CateID,CateName,Description ) VALUES (103,'HDD',N'Dùng Tốt')


CREATE TABLE Parts(
       PartID INT PRIMARY KEY IDENTITY(1,1),
       PartName nvarchar(100) NOT NULL,
       CateID CHAR(6),
       Description nvarchar(1000),
       Price MONEY  NOT NULL DEFAULT(0),
	   Quantity INT DEFAULT(0),
	   Warranty INT DEFAULT(1),
	   Photo NVARCHAR(20) DEFAULT('photo/nophoto.png'),
	   CONSTRAINT FK_CateID FOREIGN KEY (CateID) REFERENCES Categories(CateID)
	   )
INSERT INTO Parts(PartName,CateID,Description,Price,Quantity) VALUES('Phần Cứng',101,N'Mới Nhập','100',200)
INSERT INTO Parts(PartName,CateID,Description,Price,Quantity)  VALUES('Phần Mềm',102,N'Cũ','300',300)
INSERT INTO Parts (PartName,CateID,Description,Price,Quantity) VALUES('Ổ Đĩa',103,N'Dùng Tốt','250',100)

SELECT * FROM Parts WHERE Price >100
SELECT *FROM Categories WHERE CateName ='CPU'
CREATE VIEW v_Parts 
AS
SELECT (PartID,PartName,CateName,Price,Quantity) FROM Categories AS a JOIN Parts AS b ON a.CateID = b.CateID
GO