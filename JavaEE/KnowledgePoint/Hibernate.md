## 5 Hibernate 基础

### 5.1 Hibernate 概述

ORM（Object Relational Mapping，对象关系映射）

#### 5.1.1 ORM框架（对象关系映射~）

目前应用最为广泛的数据库是**关系**型数据库，存放的是**关系**型数据而非**对象**数据，带来了**对象**——**关系**之间数据映射的问题。

针对**关系**型数据的操作转换成**对象**操作，需要实现关系数据到对象的映射，这种映射关系通常写在ORM框架的配置文件中。

- 映射规则：将**数据库中的表**映射到**面向对象语言中的类**，**表中的列**映射成**类的属性**，表中的**每一条记录**对应**一个该类的对象**，**表与表之间的关系**则映射成**对象之间的关系**。

ORM框架的优点：

- 贯彻面向对象的编程思想。													   （思想）
- 减少代码的编写量，提高工作效率。										（效率）
- 提高访问数据库的性能，降低访问数据库的频率。			 	（性能）
- 具有相对独立性，发生变化时不会影响上层的实现。		 	（独立性）

####  5.1.2 Hibernate 概述

持久化对象（PO，Persistent Object）的作用：完成持久化操作，即通过该**对象**可对数据库以面向对象的方式进行操作。应用程序无需直接访问数据库，只需创建、修改或删除持久化对象，Hibernate 则会负责将这些操作转换成相应的对**数据库表**的操作。

Hibernate 中的 PO 采用低侵入设计，完全使用 POJO（Plain Old Java Object，普通传统的 Java 对象）作为持久化对象。

- **persistent**  adj. 执着的，坚持不懈的；持续的，反复出现的；（动植物某部位，如角、叶等）存留的，不落的 

- **plain** adj. 平的；简单的；朴素的；清晰的 n. 平原；无格式；朴实无华的东西 adv. 清楚地；平易地

映射文件示例：
```xml
<hibernate-mapping>
       <class name="com.dh.ch05.pojo.User" table="USERDETAILS">
            <id name="id" column="ID">
                  <generator class="uuid.hex"/>
            </id>
            <property name="name" column="userName" type="string" not-null="true"/>
            <property name="pwd" column="pwd" type="string" not-null="true">
       <class>
</hibernate-mapping>
```
上述配置文件中，<hibernate-mapping>元素是Hibernate映射文件的根元素，<class>元素描述类和表之间的映射，这样每个class元素将映射成一个PO,即:

```java
PO = POJO + 映射文件
```

#### Hibernate API

| 名称                | 说明                                                         |
| ------------------- | ------------------------------------------------------------ |
| Configuration 类    | 用于配置、启动 Hibernate，创建 SessionFactory 实例对象       |
| SessionFactory 接口 | 用于初始化 Hibernate，创建 Session 实例，充当数据源代理      |
| Session 接口        | 用于保存、更新、删除、加载和查询持久化对象，充当持久化管理器 |
| Transaction 接口    | 用于封装底层的事务，充当事务管理器                           |
| Query 接口          | 用于执行 HQL 数据库查询，充当 Hibernate 查询器               |
| Criteria 接口       | 用于常见并执行面向对象方式的查询，充当 Hibernate 查询器      |

- **transaction**  n. 交易；事务；办理；会报，学报

- **query** n. 疑问，质问；疑问号 ；[计] 查询 vt. 询问；对……表示疑问 vi. 询问；表示怀疑

- **criteria**  n. 标准，条件 

### 5.2 Hibernate 应用开发方式（了解）

三种开发方式：

- 自**底**向**上** 数据库表 to 持久化类，根据数据库中**表的结构**生成对应的**映射文件**和**持久化类**
- 自**顶**向**下** 持久化类 to 数据库表，先编写**持久化类**，然后编写**映射文件**，进而生成**数据库表结构**
- 从中间出发，先编写映射文件，然后向上生成**持久化类**，向下生成**数据库表结构**

Hibernate 应用程序的开发步骤：

1. **配置** Hibernate **应用环境**，在应用中**添加** Hibernate 所需的 **jar 包**，并**创建** Hibernate **配置文件**
2. **创建持久化类**及其 **ORM 映射文件**
3. 利用 Configuration **装载配置**
4. 利用 SessionFactory **创建 Session**
5. 通过 Session 进行**持久化对象的管理**
6. 利用 Transaction **管理事务**
7. 利用 Query **进行 HQL 查询** or 利用 Criteria **实现条件查询**

Hibernate 配置文件

- hibernate.properties
- hibernate.cfg.xml

举例：

```xml
<hibernate-configuration>
	<session-factory>
    	<property name="connection.url">jabc:mysql://localhost:3306/xxx</property>
        <mapping resource=""/>
    </session-factory>
</hibernate-configuration>
```

#### 5.3.2 创建持久化类及 ORM 映射文件

- 持久化类：实际上就是 **属性** + **有参构造** + **无参构造** + **set**&**get**方法
```java
public class Customer implements Serializable{
    private Integer id;

    public Customer(Integer id){
    	this.id=id;
    }
    public Customer(){
    }

    //set&get方法
}
```

- 映射文件：Customer.hbm.xml


```xml
<hibernate-mapping package="">
	<class name="" table="">
    	<id name="" column="">
        	<generator class=""/>
        </id>
        <property name="" column="" type="" not-null="true"/>
    </class>
</hibernate-mapping>
```

#### 5.3.3 利用 Configuration 装载配置

创建 Configuration 对象：

```java
Configuration configuration = new Configuration();//实例化
configuration.configure("/hibernate.cfg.xml");//加载配置文件
```

1. Configuration 的作用是读取配置文件并创建 SessionFactory 对象。
2. 通常一个应用程序会创建一个 Configuration 对象，然后再建立一个唯一的 SessionFactory 实例。
3. 这意味着 Configuration 只存在于系统的初始化阶段，然后所有持久化操作都通过 SessionFactory 实例来完成。

#### 5.3.4 利用 SessionFactory 创建 Session

创建 SessionFactory 对象：

```java
SessionFactory sessionFactory = configuration.buildSessionFactory();
```

Configuration 对象会根据配置文件构建 SessionFactory 实例，即当 SessionFactory 一旦构建完毕，之后改变 Configuration 实例不会影响到已经构建完成的 SessionFactory 实例。

SessionFactory 的作用是生成 Session 对象：

```java
Session session = sessionFactory.openSession();
Session session = sessionFactory.getCurrentSession();
```

#### 5.3.5 利用 Session 操作数据库

Session 是 Hibernate 持久化操作的关键对象、基础。持久化对象的生命周期、事务的管理、对象的查询/更新/删除都是通过 Session 完成。

#### 5.3.6 利用 Transaction 管理事务

```java
Transaction trans = session.beginTransaction();//开始事务
trans.commit();//提交事务
```

持久化操作步骤：

1. 创建 Configuration 并装载配置
2. 创建 SessionFactory 对象
3. 打开 Session
4. 开始事务
5. 持久化操作
6. 提交事务
7. 关闭 Session

```java
public class UserTest{
    public static void main(String[] args){
        //创建 User 对象
        User user = new User("","");
        
        //实例化 Configuration
        Configuration c = new Configuration();
        
        //加载 hibernate 配置文件
        c.configure("/hibernate.cfg.xml");
        
        //创建 SessionFactory
        SessionFactory sf = c.buildSessionFactory();
        
        //打开 Session
        Session s = sf.openSession();
        
        //开始事务
        Transaction t = s.beginTransaction();
        
        //持久化操作
        s.save(user);
        
        //提交事务
        t.commit();
        
        //关闭 Session
        s.close();
    }
}
```

#### 5.3.7 利用 Query 进行 HQL 查询

HQL（Hibernate Query Language）

```java
Query query = session.createQuery("from User");
List<User> list = query.list();
for(User user:list){
    System.out.println();
}
```

#### 5.3.8 利用 Criteria 进行条件查询

criteria n. 标准，条件

```java
//创建 Criteria 查询对象，查询 User 类所有对象
Criteria criteria = session.createCriteria(User.class);
List<User> list = criteria.list();
for(User user:list){}
```

### 5.4 Hibernate 配置文件详解 不考吧

### 5.5 Hibernate 映射文件详解 我赌不考

#### 5.5.3 映射集合属性

| 集合映射元素       | 集合属性             | 特性                           |
| ------------------ | -------------------- | ------------------------------ |
| \<list>            | java.util.List       | 可重复，有索引                 |
| \<set>             | java.util.Set        | 不可重复                       |
| \<map>             | java.util.Map        | key-value                      |
| \<array>           | 数组                 | 1. 基本数据类型数组 2.对象数组 |
| \<primitive-array> | 基本数据类型的数组   | 1. 基本数据类型数组            |
| \<bag>             | java.util.Collection | 无序集合                       |
| \<idbag>           | java.util.Collection | 无语集合，可以增加逻辑次序     |

### 5.6 持久化对象

1. 无参构造
2. 表示属性，主键
3. setter&getter
4. 非 final 类
5. **需要**（非必须）实现 Serializable 接口，使持久化对象可序列化

#### 5.6.1 持久化对象状态（了解即可）

1. 瞬时状态(Transient)
2. 持久化状态(Persistent)
3. 托管状态(Detached)

## 小结

- Hibernate 应用的开发方式分三种
  - 自底向上，从数据库表到持久化类
  - 自顶向下，从持久化类到数据库
  - 自中间开始，从配置文件生成持久化类和数据库表
- Configuration 用于配置并启动 Hibernate，解析配置文件和映射文件，创建 SessionFactory 实例
- 通过 **SessionFactory** 获取 Session 对象，一个 SessionFactory 实例对应一个数据库对象，**线程安全**，可悲多个线程共享
- Session 是 Hibernate 框架的核心类，提供了和持久化相关的操作，**非线程安全**，一个 Session 对象一般只有一个单一线程使用
- hibernate.cfg.xml 中可以直接配置映射文件，文件结构性强、易读和配置灵活
- hibernate.properties 中不能配置映射文件

## 6 Hibernate 核心技能

### 6.1 Hibernate 关联关系（掌握理论，不会考问答、代码）

单向 N-1

```xml
<many-to-one name="customer" column="CUSTOMER_ID" class="Customer"/>
```

单向 1-N

```xml
<set name="orders">
	<key column="CUSTOMER_ID"/>
    <one-to-many class="Order"/>
</set>
```

#### 6.1.2 级联关系

```xml
<set name="" cascade="save-update">
	<key column=""/>
    <one-to-many class=""/>
</set>
```

控制反转

```xml
<set name="" inverse="true" cascade="">
	<key column=""/>
    <one-to-many class=""/>
</set>
```

### 6.2 Hibernate 批量处理 ※

#### 6.2.1 批量插入

```java
public static void addUser(){
    Session s = HibernateUtils.getSession();
    Transaction t = s.beginTransaction();
    for(int i = 0; i < 1000000; i++){
        User user = new User();
        user.setNmae("name"+(i+1));
        s.save(user);
        if(i % 20 == 0){
            s.flush();
            s.clear();
            t.commit();
            t = s.beginTransaction();
        }
    }
    HibernateUtils.closeSession();
}
```

#### 6.2.2 批量更新

```java
public static void updateUser(){
    Session s = HibernateUtils.getSession();
    Transaction t = s.beginTransaction();
    ScrollableResults users = s.createQuery("from User").scroll();
    int count = 0;
    while(usesr.next()){
        User user = (User)users.get(0);
        user.setName("name");
        if(count % 20 == 0){
            s.flush();
            s.clear();
            t.commit();
            t = s.beginTransaction();
        }
        count++;
    }
    t.commit();
    HibernateUtils.closeSession();
}
```

使用 HQL批量更新

```java
public static void updateUser(){
    Session s = HibernateUtils.getSession();
    Transaction t = s.beginTransaction();
    //
    Query q = s.createQuery("update User set name=:name");
    q.setString("name","name");
    q.executeUpdate();
    t.commit();
    HibernateUtils.closeSession();
}
```

### 6.3 Hibernate 检索方式 (多选)

| 检索方式   | 描述                                                         |
| ---------- | ------------------------------------------------------------ |
| 导航对象图 | 根据已加载的对象，利用对象之间关联关系，导航到其他对象。     |
| OID        | 可以使用 Session 的 load() 或 get() 方法。例如，检索 OID 为 1 的 User 对象：load(User.class,1) |
| HQL        | Hibernate Query Language                                     |
| QBC        | Query By Criteria 提供了更加面向对象的接口，用于各种复杂查询 |
| 本地 SQL   | 把检索到的 JDBC ResultSet 结果集映射为持久化对象图           |

### 6.4 HQL 与 QBC 检索（重要，好好看）

- HQL 检索
  1. 获取 Hibernate 的 Session 对象`Session s = HibernateUtils.getSession();`
  2. 编写 HQL 查询语句 `String hql = "";`
  3. 以 HQL 作为参数，调用 Session 对象的 createQuery() 方法，创建 Query 对象 `Query q = s.createQuery(hql);`
  4. 如果 HQL 语句中包含参数，调用 Query 对象的 setXXX() 方法为参数赋值 `query.setString("","");`
  5. 调用 Query 对象的 list() 等方法得到查询结果`List<User> list = query.list();`
  
- QBC 检索

  1. 获取 Hibernate 的 Session 对象
  2. 以某类的 Class 对象作为参数调用 Session 对象的 createCriteria() 方法，创建 Criteria 对象。
  3. 通过调用 Criteria 对象的 add() 方法，增加 Criterion 查询条件
  4. 执行 Criteria 的 list() 等方法得到查询结果

  Criteria 代表一次查询

  Criterion 代表一个查询条件

  Restrictions 产生查询条件的工具类

#### 6.4.1 Query 与 Criteria 接口

#### 6.4.2 使用别名

HQL 别名同 SQL

QBC 检索方式不需要由应用程序显式地指定类的别名，Hibernate 会自动把查询语句中的根节点实体赋予别名 this 。例如：

```java
List result = s.createCriteria(User.class)
    .add(Restrictions.eq("name","xxx"))
    .list();

List result = s.createCriteria(User.class)
    .add(Restrictions.eq("this.name","xxx"))
    .list();
```

#### 6.4.4 分页查询

HQL 分页查询

```java
pulic class BusinessService{
    public static void main(String[] args){
        int pageNo = 1;
        int perPageNum = 10;
        
        Session session = HibernateUtils.getSession();
        String hql = "from User u order by c.id desc";
        Query query = session.createQuery(hql);
        query.setFirstResult((pageNo - 1) * perPageNum);//设置满足条件第一条记录位置
        query.setMaxResults(perPageNum);//限定查询返回的记录的总数
        List<User> list = query.list();
        for(User user:list){
            System.out.println(user.getName());
        }
    }
}
```

QBC Criteria 分页查询

```java
public class BusniessService{
    public static void main(String[] args){
        int pageNo = 10;
        int perPageNum = 10;
        
        Session session = HibernateUtils.getSession();
        Criteria criteria = session.createCriteria(User.class);
        criteria.setFirstResult((pageNo - 1) * perPageNum);
        criteria.setMaxResults(perPageNum);
        List<User> list = criteria.list();
        for(User user:list){
            System.out.println(user.getName());
        }
    }
}
```

#### 6.4.6 设置查询条件（两种检索方式如何）

**restriction** n. 限制；约束；束缚

| HQL 运算符      | QBC 运算方法             | 描述                   |
| --------------- | ------------------------ | ---------------------- |
| =               | Restrictions.eq()        | 等于                   |
| >               | Restrictions.gt()        | 大于                   |
| \>=             | Restrictions.ge()        | 大于等于               |
| <               | Restrictions.lt()        | 小于                   |
| <=              | Restrictions.le()        | 小于等于               |
| <>              | Restrictions.ne()        | 不等于                 |
| is null         | Restrictions.isNull()    |                        |
| is not null     | Restrictions.isNotNull() |                        |
| in              | Restrictions.in()        |                        |
| not in          |                          |                        |
| between and     | Restrictions.between()   |                        |
| not between and |                          |                        |
| like            | Restrictions.like()      |                        |
|                 | Restrictions.ilike()     | 匹配的字符串忽略大小写 |
| and             | Restrictions.and()       |                        |
| or              | Restrictions.or()        |                        |
| not             | Restrictions.not()       |                        |

- HQL

  2. 范围运算

     ```java
     session.createQuery("from User u where c.name not in('xx','yy','zz')");
     ```

  3. 字符串模式匹配

     1. 百分号%：匹配任意长度任意类型的字符串，长度可为0.
     2. 下划线_：匹配单个任意字符串，常用来限制字符串表达式的长度。

  4. 逻辑运算

     ```java
     session.createQuery("from User u where c.name like 'z%' and length(password)>6 and c.age not between 20 and 30");
     ```

- Criteria 的查询条件

  1. 比较运算

     ```java
     criteria.add(Restrictions.ge("age",20));//年龄大于20
     ```

     ```java
     criteria.add(Restrictions.isNOtNull("name"));//姓名不为空
     ```

  2. 范围运算

     ```java
     String[] names = {"xx","yy","zz"};
     criteria.add(Restrictions.in("name",names));
     ```

     ```java
     criteria.add(Restrictions.between("age",18,20));
     ```

  3. 字符串模式匹配

     | 匹配模式           | 描述        |
     | ------------------ | ----------- |
     | MatchMode.START    | xx%         |
     | MatchMode.END      | %xx         |
     | MatchMode.ANYWHERE | %xx%        |
     | MatchMode.EXACT    | 精确匹配 xx |

     ```java
     criteria.add(Restrictions.like("user","z",MatchMode.START));
     ```

  4. 逻辑运算

     ```java
     criteria.add(Restrictions.or(Restrictions.between("age",18,20),Restrictions.in("name",names)));
     ```

#### 6.4.7 HQL 中绑定参数

1. **<u>按照参数名字绑定</u>**（代码）🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒

   ```java
   public static List<User> findUserByName(String name){
       Session session = HibernateUtils.getSession();
       String hql = "from User where name = :name";
       Query query = session.createQuery(hql);
       query.setString("name",name);//按照参数名进行绑定
       return query.list();
   }
   ```

2. 按照参数位置绑定

   ```java
   public static List<User> findUserByName(String name){
       Session session = HibernateUtils.getSession();
       String hql = "from User where name = ?";
       Query query = session.createQuery(hql);
       query.setString(0,name);//按照参数位置绑定
       return query.list();
   }
   ```

#### 6.4.9 投影、分组与统计

##### 投影查询

1. 实例化查询结果

   ```java
   String hql = "select new User(id,name) from ..."
   ```

   ```java
   String hql = "select new map(id,name) from ..."
   ```

2. 性能分析

   ```java
   from User;//返回持久化对象
   
   select new map(id,name) from User;//返回关系数据
   ```

   - **持久化对象**位于 Session 缓存中。大量查询会降低性能。
   - **关系型数据**不会占用 Session 缓存，只要应用程序中没有任何变量引用这些数据，其占用的内存就会被 JVM 回收。

##### HQL 分组与统计查询

 1. 统计函数查询

    ```java
    String hql = "select count(id) from ..."
    ```
    ```java
    String hql = "select avg(age) from ..."
    ```
    ```java
    String hql = "select max(age),min(age) from ..."
    ```

 2. 分组查询

    ```java
    ... group by ... having ...
    ```

#### 6.4.10 动态查询（代码）🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒🆒

1. HQL 动态查询

   ```java
   public static List<User> findUser(String name,Integer age){
       Session session = HibernateUtils.getSession();
       StringBuffer buffer = new StringBuffer();
       buffer.append("from User where 1=1 ");
       if(name != null){
           buffer.append("and name like :name");
       }
       if(age != null && age != 0){
           buffer.append("and age = :age");
       }
       Query query = session.createQuery(buffer.toString());
       if(name != null){
           query.setString("name","%"+name.toLowerCase()+"%");
       }
       if(age != null && age != 0){
           query.setInteger("age",age);
       }
       return query.list();
   }
   ```

2. Criteria 动态查询

   ```java
   public static List<User> findUser(String name,Integer age){
       Session session = HibernateUtils.getSession();
       Criteria criteria  = session.createCriteria(User.class);
       if(name != null){
           criteria.add(Restrictions.ilike("name",name,MatchMode.ANYWHERE));
       }
       if(age != null && age != 0){
           criteria.add(Restrictions.eq("age",age));
       }
       return criteria.list();
   } 
   ```

#### 6.4.11 子查询

1. 单行子查询

   ```java
   String hql = "from User where age=(select age from User where name=:name)";
   ```

2. 多行子查询

   | 操作   | 含义                           |
   | ------ | ------------------------------ |
   | all    | 全部值                         |
   | any    | 每个值                         |
   | in     |                                |
   | some   | 与 any 等价                    |
   | exists | 表示子查询语句至少返回一条记录 |

   ```sql
   where 10>all(select age from ...)
   ```
   
3. 操纵集合的函数和属性

#### 6.4.12 查询方式比较

| 检索方式 | 优点                                                         | 缺点                                                         |
| -------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| HQL      | 1. 和 SQL 查询相似，较容易读懂 2. 功能强大，支持各种查询     | 1. 必须基于字符串形式的查询 2. 只有在运行时才被解析 3. 动态查询编程麻烦 |
| QBC      | 1. 封装了基于字符串形式的查询，提供了更加面向对象的查询 2. 编译期会检查，易于排错 3. 适合生成动态查询语句 | 1. 没有 HQL 功能强，对连接查询支持不友好，不支持子查询。但可以通过 Detached Criteria 和 Subqueries 实现子查询 2. 查询语句被拆分成一组 Criterion 实例，可读性差 |

- HQl
  - 优点
    1. 和 SQL 查询相似，较容易读懂
    2. 功能强大，支持各种查询
  - 缺点
    1. 必须基于字符串形式的查询
    2. 只有在运行时才被解析
    3. 动态查询编程麻烦

- QBC
  - 优点
    1. 封装了基于字符串形式的查询，提供了更加面向对象的查询
    2. 编译期会检查，易于排错
    3. 适合生成动态查询语句
  - 缺点
    1. 没有 HQL 功能强，对连接查询支持不友好，不支持子查询。但可以通过 Detached Criteria 和 Subqueries 实现子查询
    2. 查询语句被拆分成一组 Criterion 实例，可读性差

### 6.5 Hibernate 事务管理

#### 6.5.1 数据库事务

事务（transaction）是访问并可能操作各种数据项的一个**数据库操作序列**，这些操作要么全部执行，要么全部不执行，是一个不可分割的工作单位。

事务由**事务开始**与**事务结束**之间执行的**全部数据库操作**组成。

##### 性质：

- 原子性 (**Atomicity**)：事务中的**全部操作**在数据库中是不可分割的，要么全部完成，要么全部不执行
- 一致性 (**Consistency**)：几个**并**列执**行**的事务，其执行结果必须与按某一顺序串行执行的结果相一致
- 隔离性 (**Isolation)**：事务的执行**不受**其他事务的**干扰**，事务执行的**中间结果**对其他事务必须是**不可见的**
- 持久性 (**Durability**)：对于任意**已提交事务**，系统必须保证该事务对数据库的改变**不被丢失**，即数据库出现故障

事务的 ACID 特性由**<u>关系数据库系统</u>**（DBMS）实现，采用**<u>日志</u>**保证**原子性**、**一致性**、**持久性**。对于**隔离性** DBMS 采用**<u>锁机制</u>**。

实际应用中，由事务的隔离性不完全而引发的问题有：

1. **更新丢失**（lost update）：当两个事务同时更新同一数据时，有于某一事务的撤销，导致另一事务对数据的修改也失效了。
2. **脏读**（dirty read）：一个事务读取到了另一个事务还**没有提交**但**已经更改**过的数据。此时数据可能不是一致性的。
3. **不可重复读**（non-repeatableread）：当一个事务读取到了某些数据后，另一个事务修改了这些数据并进行了提交。这样当该事务再次读取这些数据时，发现这些数据已经被修改了。
4. **幻读**（phantom read）：同一查询在同一事务中多次进行，由于其他事务所做的插入操作，导致每次查询返回不同的结果集。幻读严格来说可以算是“不可重复读”的一种。
   - 幻读：在第二次读取时，一些新数据被添加进来
   - 不可重复读：相同数据的减少 or 更新，而不是增加

**事务的隔离级别**用来定义**事务**与事物之**间**的**隔离程度**。**隔离级别**与**并发性**是**相互矛盾**的，隔离程度越高，数据库的并发性越差；隔离程度越低，数据库的并发性越好。

隔离级别：

- 读**未**提交（read uncommitted）：如果一个事务已经开始写数据，则其他事务不能同时进行写操作，但允许其他事物读取。一个事务可能看到其他事务未提交的修改。
- 读**已**提交（read committed）：读取数据的事务允许其他事务继续访问其正在读取的数据，未提交的写事务将会禁止其他事务访问其正在写的数据
- 可**重复**读（repeatable read）：被 select 语句读取的记录**不能被修改**
- **序列化**级别（**serializable**）：事务之间**完全隔离**。事务一个接一个执行，不能并发执行

事务比较

|          隔离级别           | 更新丢失 | 脏读 | 不可重复读 | 幻读 |
| :-------------------------: | :------: | :--: | :--------: | :--: |
|         读未提交：1         |          |  Y   |     Y      |  Y   |
|         读已提交：2         |          |      |     Y      |  Y   |
|        可重复读: ：4        |          |      |            |  Y   |
| 序列化:1st_place_medal: ：8 |          |      |            |      |

#### 6.5.2 Hibernate 中的事务

```java
public void adduser(User user){
    Session session = HibernateUtils.getSession();
    Transaction trans = session.beginTransaction();//设定事务开始边界
    try{
        session.save(user);
    }catch(Exception e){
        e.printStackTrace();
        trans.rollback();//回滚
    }
    trans.commit();//提交
    HibernateUtils.closeSession();
}
```

### 小结

- HQL 是一种完全**面向对象**的查询语言，其操作的对象是类、实例、属性...支持**继承**和**多态**
- SQL 操作对象是数据表和列...