```sql
DROP DATABASE IF EXISTS mis;
CREATE DATABASE mis CHARACTER SET UTF8;
USE mis;
DROP TABLE IF EXISTS user;
CREATE TABLE user(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    gender VARCHAR(5),
    age INT,
    address VARCHAR(32),
    qq VARCHAR(20),
    email VARCHAR(50),
    username VARCHAR(20),
    password VARCHAR(32)
);
INSERT INTO user VALUES (NULL,'荀彧','男','24','陕西','123456','xunyu@163.com','admin','123');
INSERT INTO user VALUES (NULL,'曹操','男','29','北京','999999','999999@emp.com','admin','123456');

```

