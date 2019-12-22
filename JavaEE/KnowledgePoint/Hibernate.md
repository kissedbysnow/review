## 5 Hibernate 基础

### 5.1 Hibernate 概述

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
```
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

### 5.2 Hibernate 应用开发方式

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
5. 实现 Serializable 接口，是持久化对象可序列化

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

