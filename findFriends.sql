CREATE TABLE IF NOT EXISTS People(Id INT NOT NULL AUTO_INCREMENT, Name Varchar(50) NOT NULL, Addr Varchar(50), PRIMARY KEY(Id));

INSERT INTO People(Name)VALUES('Alex'),('Ben'),('Blake'),('Emily'),('Mason'),('Jacob'),('James'),('Noah'),('Will'),('Daniel'),('Christ'),('Amy');


CREATE TABLE IF NOT EXISTS Friends(Id INT NOT NULL AUTO_INCREMENT, Pid INT, Fid INT, FOREIGN KEY (Pid ) REFERENCES People(Id ),FOREIGN KEY (Fid ) REFERENCES People(Id ), PRIMARY KEY(Id));

 INSERT INTO Friends(Pid, Fid)VALUES(1,2),(1,3),(1,10),(2,1),(3,1),(10,1),(2,7),(7,2),(3,9),(9,3),(7,5),(5,7),(8,1),(1,8),(11,4),(4,11);


INSERT INTO Friends(Pid, Fid)VALUES(1,2),(1,3),(1,10),(2,7),(3,9),(5,7),(1,8),(11,4);



SELECT Fid, Name FROM(SELECT F1.Fid FROM (SELECT Fid  FROM Friends WHERE Pid=1 UNION SELECT PID from Friends WHERE Fid=1) AS T1 INNER JOIN Friends as F1 ON (T1.Fid = F1.Pid AND F1.Fid <> 1) OR (T1.Fid = F1.Fid AND F1.Pid <> 1) ) AS F INNER JOIN People AS P ON P.id = F.Fid;





