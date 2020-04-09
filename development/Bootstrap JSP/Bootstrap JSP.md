## 数据库设计

```sql
DROP DATABASE IF EXISTS loginForm;
CREATE DATABASE loginForm CHARACTER SET UTF8;
USE loginForm;
DROP TABLE IF EXISTS member;
CREATE TABLE member(
	mid			VARCHAR(50),
    password	VARCHAR(32)			NOT NULL,
    CONSTRAINT pk_mid PRIMARY KEY(mid)	
);
INSERT INTO member(mid,password) VALUES ('admin','123456');
```

## 开发环境搭建

使用 IDEA 搭建 JavaWeb 项目

## 前台登录页面

index.jsp

```html
<meta name="viewport" content="width=device-width,inital-scale=1">
<%-- 由于 Bootstrap 基于 JQuery 完成，所以需要先导入 JQuery 的开发包 --%>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
```

