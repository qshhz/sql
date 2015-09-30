CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;

CREATE TABLE IF NOT EXISTS Users ( User_Id INT NOT NULL AUTO_INCREMENT, Banned ENUM('Yes', 'No') , Role ENUM ('client', 'driver', 'partner') , PRIMARY KEY (User_Id ) );


INSERT INTO Users(User_Id, Banned, Role) VALUES(1, 'No', 'client');
INSERT INTO Users(User_Id, Banned, Role) VALUES(2, 'Yes', 'client');
INSERT INTO Users(User_Id, Banned, Role) VALUES(3, 'No', 'client');
INSERT INTO Users(User_Id, Banned, Role) VALUES(4, 'No', 'client');
INSERT INTO Users(User_Id, Banned, Role) VALUES(10, 'No', 'driver');
INSERT INTO Users(User_Id, Banned, Role) VALUES(11, 'No', 'driver');
INSERT INTO Users(User_Id, Banned, Role) VALUES(12, 'No', 'driver');
INSERT INTO Users(User_Id, Banned, Role) VALUES(13, 'No', 'driver');


CREATE TABLE IF NOT EXISTS Trips
(
	Id           INT NOT NULL AUTO_INCREMENT,
	Client_Id        INT ,
	Driver_Id    INT,
	City_Id         INT,
	Status   ENUM('completed', 'cancelled_by_driver', 'cancelled_by_client') ,
	Request_at DATETIME,
	PRIMARY KEY (Id),
	FOREIGN KEY (Client_Id ) REFERENCES Users(User_Id )ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (Driver_Id ) REFERENCES Users(User_Id )ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO Trips(Id, Client_Id, Driver_Id, City_Id, Status, Request_at)
VALUES
(1, 1, 10, 1, 'completed', '2013-10-01'),
(2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01'),
(3, 3, 12, 6, 'completed', '2013-10-01'),
(4, 4, 13, 6, 'cancelled_by_client', '2013-10-01'),
(5, 1, 10, 1, 'completed', '2013-10-02'),
(6, 2, 11, 6, 'completed', '2013-10-02'),
(7, 3, 12, 6, 'completed', '2013-10-02'),
(8, 2, 12, 12, 'completed', '2013-10-03'),
(9, 3, 10, 12, 'completed', '2013-10-03'),
(10,4, 13, 12, 'cancelled_by_driver', '2013-10-03');



SELECT * FROM  Users INNER JOIN Trips ON User_Id = Client_Id
WHERE Banned = 'No' AND Role = 'Client' AND Request_at BETWEEN '2013-10-01' AND '2013-10-03'
ORDER BY Request_at;












































