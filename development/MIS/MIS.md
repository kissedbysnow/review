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
    user VARCHAR(20),
    password VARCHAR(32)
);
INSERT INTO user VALUES (NULL,'张三','男','14','陕西','12345','zs@123.com','admin','123');
INSERT INTO user VALUES (NULL,'莉莉','女','18','临淄','342','324@qq.com','admin','123456');

```

