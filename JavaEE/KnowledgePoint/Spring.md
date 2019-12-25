### 7.1 Spring 概述

#### 7.1.1 Spring 起源背景

功能：

- 基于依赖注入（控制反转IoC）的核心机制
- 声明式的面向切面编程（AOP）支持
- 与多种技术整合
- 优秀的 Web MVC 框架

优势：

1. 低侵入式设计，代码无污染
2. 独立于各种应用服务器，真正实现 Write Once、Run Anywhere（一次编写、随处运行）的承诺
3. IoC 容器降低了业务对象替换的复杂性，降低了组件之间的耦合
4. AOP 容器允许将一些通用任务如安全、事务、日志...进行集中式处理
5. Spring 中的 ORM 和 DAO 支持提供了与第三方持久层框架的良好整合，并简化了底层的数据库访问
6. Spring 的高度开放性，并不强制开发者完全依赖于 Spring，可自由选用 Spring 框架的部分 or 全部功能

#### 7.1.2 Spring 体系结构

- Core：Spring 框架中最为基础、重要的模块。它提供了 IoC 功能，将类之间的依赖从代码中脱离出来，使用配置的方式进行依赖关系描述，由 IoC 容器负责依赖类之间的创建、拼接、管理、获取...功能
- AOP：提供 AOP 面向切面编程的实现，比如拦截器、事务管理...
- DAO：提供了 JDBC 的抽象层，消除了冗长的 JDBC 代码，并能够解析数据库厂商特有的错误代码
- ORM：提供了 ORM 框架的整合支持，包括 Hibernate、JPA、JDO、iBatis
- Web：提供了针对 Web 开发的集成特性，而且提供了一个完整的类似于 Struts 的 MVC 框架，但 Spring 的 MVC 框架不仅提供一种传统的实现，还提供了清晰的分离模型。同时 Spring 也提供了对常见的 Web 框架的支持
- JEE：Spring 提供了 Java EE 的功能，包括 JMX、JMS、JCA、EJB 和 Email 等

### 7.2 IoC 容器

IoC（Inversion of Control，控制反转）

#### 7.2.2 BeanFactory

```xml
<bean id="" class="">
	<property name="id" value="1"/>
</bean>
```

#### 7.2.3 ApplicationContext

ApplicationContext 接口的主要实现类：

- **ClassPath**XmlApplicationContext：从**类路径**加载配置文件

  - ```java
    ApplicationContext ctx = new ClassPathXmlApplicationContext("bean.xml");
    ```

- **FileSystem**XmlApplicationContext：从**文件系统**中装载配置文件

  - ```java
    ApplicationContext ctx = new FileSystemXmlApplicationContext("E:/workspace/ch07/src/bean.xml");
    ```

### 7.3 IoC 容器中装配 Bean

#### 7.3.2 Bean 基本配置

```xml
<bean id="名称" class="类名"/>
```

#### 7.3.3 依赖注入的方式

依赖注入（Dependency Injection，DI）

控制反转（Inversion of Control，IoC）

含义： 当某个 Java 实例（调用者）需要另一个 Java 实例（被调用者）时，在**传统**的程序设计过程中，通常由**调用者**来创建**被调用者**的实例；在 Spring 里，这个创建工作不再由调用者来完成，因此也称为**控制反转**。创建**被调用者**实例的工作通常由 Spring **容器**来完成，然后注入给**调用者**，因此也称为**依赖注入**。

根据注入方式的不同，Bean 的依赖注入通常表现为如下两种格式：

- 设值注入，通过使用**属性的 setter 方法**注入 Bean 的属性值or依赖对象。
  - 使用设值注入要求 Bean 提供一个默认的**无参构造**方法，并为需要注入的属性提供对应的 **setter 方法**。
- 构造注入，通过使用**构造**来注入 Bean 的属性or依赖对象。
  - 可以确保一些必要的属性在 Bean 实例化时就得到设置，从而使 Bean 在实例化后就可以使用。

##### 设值注入

```java
//Film.java
public class Film implements Serializable{
    private Integer id;
    
    public Film(){}
    public Film(Integer id){
        this.id = id;
    }
    
    public Integer getId(){
        return id;
    }
    public void setId(Integer id){
        this.id = id;
    }
    
    public String toString(){
        return String.format("%d",id);
    }
}
```

```xml
<!-- bean-film.xml -->
<bean id="film" class="">
	<property name="id" value="1"/>
</bean>
```

```java
ApplicationContext ctx = new ClassPathXmlApplicationContext("bean-film.xml");
Film film = (Film)ctx.getBean("film");
System.out.println(film.toString());
```

##### 构造注入

```xml
<!-- bean-film.xml -->
<bean id="film2" class="">
	<constructor-arg type="java.lang.Integer">
    	<value>2</value>
    </constructor-arg>
</bean>
```

```java
ApplicationContext ctx = new ClassPathXmlApplicationContext("bean-film.xml");
Film film = (Film)ctx.getBean("film2");
System.out.println(film.toString());
```

##### 区别：

给实例中属性赋值的时机不同：设值注入是先创建一个默认的 Bean 实例，然后调用对应 setter 方法注入依赖关系，而构造注入则在创建 Bean 实例时完成依赖关系的注入。

##### 对比：

没有绝对的好坏区分，只是适应的场景不同，各有各的优点。

- 设值注入的优点：
  - 与传统的 JavaBean 写法更相似，通过 setter 方法设定依赖关系显得更加直观、自然。
  - 对于复杂的依赖关系，如果采用构造注入，会导致构造器过于臃肿，难以阅读。Spring 在创建 Bean 实例时，需要同时实例化其依赖的全部实例，因为导致性能下降，而使用设值注入则能避免这些问题。
- 构造注入的优点：
  - 构造注入可以在构造器中决定依赖关系的注入顺序。优先依赖的优先注入。比如 Web 开发时使用数据库，可以优先注入数据库连接的信息。
  - 对于依赖关系无需变化的 Bean，构造注入更有用处。没有 setter 方法，所有的依赖关系全部在构造器内部设定，后续代码不会对依赖关系产生破坏。依赖关系只能在构造器中设定，所以只有组件的创建者才能改变组件的依赖关系。而对组件的调用者而言，组件内部的依赖关系完全透明，更符合高内聚的原则。

#### 7.3.4 注入值的类型

1. 字面值

    ```xml
    <bean id="" class="">
        <property name="" value=""/> 
    </bean>
    ```

2. 引用其他 Bean

    ```xml
    <bean id="" class="">
        <property name="" ref=""/>
    </bean>
    ```

3. 集合值

    ```xml
    <bean id="" class="">
    	<property name="List">
        	<list>
            	<value>xxx</value>
                <value>yyy</value>
            </list>
        </property>
        
        <property name="Map">
        	<map>
            	<entry key="" value=""/>
                <entry key="" value=""/>
            </map>
        </property>
        
        <property name="Propertis">
        	<props>
            	<prop key="">xxx</prop>
                <prop key="">yyy</prop>
            </props>
        </property>
        
        <property name="Set">
        	<set>
            	<value>xxx</value>
                <bean id="k1" class="com.k1"/>
                <ref local="k2"/>
            </set>
        </property>
    </bean>
    <bean id="k2" class="com.k2"/>
    ```

#### 7.3.5 Bean 间关系（技巧）

##### 继承

```xml
<bean id="p" class="" abstract="true">
<property name="" value=""/>
...
</bean>
<bean id="son" parent="p">
<property name="" value=""/>
</bean>
```

**父 Bean** 的配置信息会传递给**子 Bean**，如果**子 Bean** 提供了**父 Bean** 已有的配置信息，则**子 Bean** 的配置信息将覆盖**父 Bean** 的配置信息。

##### 依赖

当实例化一个 Bean 时，Spring 保证该 Bean 所依赖的其他 Bean 已经初始化

```xml
<bean id="a" class=""/>
<bean id="b" class="" depends-on="a"/>
```

```xml
<bean id="c" class=""/>
<bean id="d" class="">
	<property name="Id">
        <idref bean="c"/>
        <!--<value>xxx</value>-->
    </property>
</bean>
```

#### 7.3.6 Bean 作用域

- singleton：在每个 Spring IoC 容器中，一个 Bean 定义对应唯一一个对象实例，Bean 以单例的方式存在

- prototype：一个 Bean 定义对应多个对象实例，每次调用 getBean() 时，就创建一个新实例

- request：在一次 HTTP 请求中，一个 Bean 定义对应一个实例，即每次 HTTP 请求都将会有各自的 Bean 实例

- session：在一个 HTTP Session 中，一个 Bean 定义对应一个实例

- global session：在一个全局的 HTTP Session 中，一个 Bean 定义对应一个实例。仅在使用 portlet context 的时候有效

#### 7.3.7 自动装配 autowire

## 第八章 Spring 深入

### 8.1 Spring AOP

AOP（Aspect Oriented Programming，面向切面编程）

**面向对象编程**从**静态**角度考虑程序的结构，而**面向切面编程**则从**动态**角度考虑程序的运行过程

#### 8.1.1 AOP 思想和本质

Aspect（切面）将与业务无关却为业务模块共同调用的逻辑封装起来，从而减少系统的重复代码，降低模块间的耦合度，有利于系统的可维护性和可拓展性。

#### AOP 术语

- 连接点 Join point：一个类 or 一段程序代码拥有一些具有边界性质的特定点。实际上，就是程序执行的某个特定位置
- 切入点 Point cut：被增强的连接点
- 增强 Advice：织入到目标类特定连接电商的一段程序代码
- 目标对象 Target：增强被织入的目标类
- 引入 Introduction：一种特殊的增强，它为类添加一些属性和方法
- 织入 Weaving：将增强添加到目标类具体连接点上的过程
- 代理 Proxy：一个类被 AOP 织入增强后，就会产生一个结果类，该结果类就是融合了目标类和增强逻辑的代理类，根据不同的代理方式，该结果类既可能是和目标类具有相同接口的类，也可能就是目标类的子类，所以可使用调用目标类的方式来调用该结果类
- 切面 Aspect：切面由切入点和增强组成

需要开发人员参与的有三方面：

1. 定义普通业务类
2. 定义切入点，一个切入点可能横切多个业务组件
3. 定义增强，增强就是在 AOP 框架为普通业务组织织入的处理逻辑

#### 8.1.3 Advice 类型

- 前置增强：在某个连接点方法之前执行的增强
- 后置增强：指连接点方法无论在任何情况下退出时所执行的增强
- 返回后增强：指在某个连接点方法正常执行后执行的增强
- 抛出异常后增强：指在连接点方法抛出异常后执行的增强
- 环绕增强：指包围连接点方法的增强

#### 8.1.4 基于 XML 配置的 AOP

2. 配置增强

```xml
<aop:config>
	<aop:aspect id="adviceAspect" ref="myAspect">
    	<aop:before method="before" pointcut="execution(*)"/>
        <aop:after method="after" pointcut="..."/>
        <aop:after-returning method='afterReturn' pointcut="..." returning="result"/>
        <aop:after-throwing method="afterException" pointcut="..." throwing="ex"/>
        <aop:around method="around" pointcut="..."/>
    </aop:aspect>
</aop:config>

<!-- 配置切面 -->
<bean id="myAspect" class=""/>
```

3. 配置切入点

```xml
<aop:config>
    <aop:pointcut id="mypointcut" expression="execution(*)"/>
    <aop:aspect id="adviceAspect" ref="myAspect">
    	<aop:before method="before" pointcut-ref="mypointcut"/>	
        <aop:before method="before" pointcut="execution(*)"/>
    </aop:aspect>
</aop:config>
```

4. 切入点指示符
5. 组合切入点表达式

#### 基于 Annotation 配置的 AOP

1. 配置切面

   ```xml
   <aop:aspectj-autoproxy/>
   ```

2. 配置增强

   | 名称            | 描述       |
   | --------------- | ---------- |
   | @Before         | 前置增强   |
   | @AfterReturning | 返回后增强 |
   | @Around         | 环绕增强   |
   | @AfterThrowing  | 抛出增强   |
   | @After          | 后置增强   |

   ```java
   @Aspect
   public class MyAspect2{
       @Before("execution(*com..*.JXLService.*(..))")
       public void before(){}
       
       @After()
       public void after(){}
       
       @AfterReturning(returning="result",pointcut="execution()")
       public void afterReturn(Object result){}
       
       @AfterThrowing(pointcut="executijon()",throwing="ex")
       public void afterException(Throwable ex){syso:ex.getMessage();}
       
       @Around("execution()")
       public Object around(ProceedingJoinPoint joinpoint)throws Throwable{
           Object object = joinpoint.proceed();
           return object;
       }
   }
   ```

   ```xml
   <!-- 启动 AspectJ 注解的支持 -->
   <aop:aspectj-autoproxy/>
   <!-- 配置切面 Bean -->
   <bean id="myAspect2" class=""/>
   <!-- 配置 UserService 类 -->
   <bean id="jxlService" class=""/>
   ```

3. 配置切入点

   ```java
   @Aspect
   public class AspectBean{
       @Pointcut("execution()")
       private void crud(){};
       
       @Before("crud()")
       public void checkAuth(){}
   }
   ```

### 8.2 Spring 事务管理

