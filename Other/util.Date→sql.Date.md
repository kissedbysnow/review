### 共同点

都有 `getTime()` 方法返回毫秒数，可以直接构建

### 不同点

1. java.sql.Date 是针对 SQL 语句使用的，只包含**日期**而没有**时间**部分，一般在读写数据库的时候使用。

   - `PrepareStament` 的 `setDate()` 的参数
   - `ResultSet` 的 `getDate()` 方法

   都是 java.sql.Date

2. java.util.Date 是在除了 SQL 语句的情况下面使用，一般是日常日期字段
3. java.util.Date 是 java.sql.Date 的父类，即：继承关系：java.lang.Object → java.util.Date →  java.sql.Date

### 相互转化

- java.sql.Date 转为 java.util.Date

  ```java
  java.sql.Date date = new java.sql.Date();
  java.util.Date d = new java.util.Date (date.getTime());
  ```

- java.util.Date 转为 java.sql.Date

  ```java
  java.util.Date utilDate = new Date();
  java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
  
  java.sql.Time sTime = new java.sql.Time(utilDate.getTime());
  java.sql.Timestamp stp = new java.sql.Timestamp(utilDate.getTime());
  
  这里所有时间日期都可以被 SimpleDateFormat 格式化 format()
      
  SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
  f.format(stp);
  f.format(sTime);
  f.format(sqlDate);
  f.format(utilDate)
  
  java.sql.Date sqlDate = java.sql.Date.valueOf("2005-12-12");
  
  utilDate=new java.util.Date(sqlDate.getTime());
  
  另类取得年月日的方法：
  
  import java.text.SimpleDateFormat;
  
  import java.util.*;
  
  java.util.Date date = new java.util.Date();
  
  如果希望得到YYYYMMDD的格式SimpleDateFormat
  
  sy1=new SimpleDateFormat("yyyyMMDD");
  
  String dateFormat=sy1.format(date);
  
  如果希望分开得到年，月，日SimpleDateFormat
  
  sy=new SimpleDateFormat("yyyy");
  
  SimpleDateFormat sm=new SimpleDateFormat("MM");
  
  SimpleDateFormat sd=new SimpleDateFormat("dd");
  
  String syear=sy.format(date);
  
  String smon=sm.format(date);
  
  String sday=sd.format(date);
  ```
