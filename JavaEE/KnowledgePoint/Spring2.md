### 7.2.2 BeanFactory

- 使用Spring配置文件为Bean提供配置信息bean-film.xml

```
<!-- 创建一个id为film的Bean对象 -->
<bean id="film" class="com.dh.ch07.pojos.Film">
   <!-- 根据属性名称注入相应的值 -->
   <property name="id" value="1"/>
   <property name="name" value="这个杀手不太冷"/>
   <property name="year" value="1994"/>
   <property name="director" value="吕克 贝松"/>
</bean>
```

- 通过BeanFactory装载配置文件，启动Spring IoC容器

```
//根据配置文件创建ClassPathResource对象
ClassPathResource is=new ClassPathResource("bean-film.xml");
//创建BeanFactory对象
DefaultListableBeanFactory factory=new DefaultListableBeanFactory();
XmlBeanDefinitionReader reader=new XmlBeanDefinitionReader(factory);
reader.loadBeanDifinitions(is);
//从BeanFactory对象中，根据id获取具体对象
Film film=(Film)factory.getBean("film");
```

上述代码使用ClassPathResource指定配置文件（bean-film.xml 放在源代码根目录下），并使用XmlBeanDefinitionReader解析此配置文件，再通过BeanFactory中的getBean()方法从IoC容器中获取Bean。

### 7.2.3 ApplicationContext

ApplicationContext 接口的主要实现类：

- **ClassPath**XmlApplicationContext：从**类路径**加载配置文件

  - ```java
    ApplicationContext ctx = new ClassPathXmlApplicationContext("bean.xml");
    ```

- **FileSystem**XmlApplicationContext：从**文件系统**中装载配置文件

  - ```java
    ApplicationContext ctx = new FileSystemXmlApplicationContext("E:/workspace/ch07/src/bean.xml");
    ```

### 7.3.3 依赖注入的方式

依赖注入（Dependency Injection，DI）

控制反转（Inversion of Control，IoC）

含义： 当某个 Java 实例（调用者）需要另一个 Java 实例（被调用者）时，在**传统**的程序设计过程中，通常由**调用者**来创建**被调用者**的实例；在 Spring 里，这个创建工作不再由调用者来完成，因此也称为**控制反转**。创建**被调用者**实例的工作通常由 Spring **容器**来完成，然后注入给**调用者**，因此也称为**依赖注入**。

根据注入方式的不同，Bean 的依赖注入通常表现为如下两种形式：

1. 设值注入，通过使用**属性的 setter 方法**注入 Bean 的属性值or依赖对象。

- 使用设值注入要求 Bean 提供一个默认的无参构造方法，并为需要注入的属性提供对应的 setter 方法。

- 以设值注入的方式对Film注入属性值
  - 在com.dh.ch07.pojos包中创建Film类。代码如下：
```
public class Film implements Serializable{
      /*ID*/
      private Integer id;
       /*中文名*/
      private String name;
       /*上映年份*/
      private Integer year;
        /*导演*/
      private String director;
      /*默认无参构造方法*/
      public Film(){
      }
      /*根据属性创建构造方法*/
      public Film(Integer id,String name,Integer year,String director){
             this.id=id;
             this.name=name;
             this.year=year;
             this.director=director;
      }
      public Integer getId(){
      return id;
      }
      public void setId(Integer id){
      this.id=id;
      }
      ....//省略
      /*规范格式输出*/
      public String toString(){
      return String.format("%d 《%s》,上映于%d年,导演是%s。",id,name,year,director);
      }
}
```
- 在src根目录下，创建bean-film.xml配置文件。在配置文件中使用<bean>元素配置Film类，并使用<property>元素对属性进行赋值
```
<beans>
    <bean id="film" class="com.dh.ch07.pojos.Film">
             <property name="id" value="1"/>
             <property name="name" value="这个杀手不太冷"/>
             <property name"year" value="1994"/>
             <property name="diretor" value="吕克 贝松"/>
      </bean>
</beans>
```
- 在com.dh.ch07.test包下创建一个FilmTest类FilmTest.java:

  ```
  public class FilmTest{
         public static void main(String[] args){
         //创建Spring容器
         ApplicationContext ctx=new ClassPathXmlApplicationContext("bean-film.xml");
         //获取film实例
         Film film=(Film)ctx.getBean("film");
         //输出属性值
         System.out.println("film.toString");
         }
  }
  ```

  
2. 在构造注入，通过使用**构造器**来注入 Bean 的属性or依赖对象。
  - 可以确保一些必要的属性在 Bean 实例化时就得到设置，从而使 Bean 在实例化后就可以使用。
  - 在bean-film.xml中以构造注入的方式对Film注入属性值：

```
<bean id="film2" class="com.dh.ch07.pojos.Film">
    <constructor-arg type="java.lang.Integer">
           <value>2</value>
    </constructor-arg>
    <constructor-arg type="java.lang.String">
           <value>阿凡达</value>
    </constructor-arg>
    <constructor-arg type="java.lang.Ineger">
           <value>2009</value>
    </constructor-arg>
    <constructor-arg type="java.lang.String">
           <value>詹姆斯卡梅隆</value>
    </constructor-arg>
</bean>
```

- 测试代码FilmTest.java
```
public class FilmTest{
public static void main(String[] args){
 //创建Spring容器
 ApplicationContext ctx=new ClassPathXmlApplicationContext("bean-film.xml");
 //获取film实例
 Film film=(Film)ctx.getBean("film2");
 //输出属性值
 System.out.println(film.toString());
}
}
```
区别：

给实例中属性赋值的时机不同：设值注入是先创建一个默认的 Bean 实例，然后调用对应 setter 方法注入依赖关系，而构造注入则在创建 Bean 实例时完成依赖关系的注入。

对比：

没有绝对的好坏区分，只是适应的场景不同，各有各的优点。

- 设值注入的优点：
  - 与传统的 JavaBean 写法更相似，通过 setter 方法设定依赖关系显得更加直观、自然。
  - 对于复杂的依赖关系，如果采用构造注入，会导致构造器过于臃肿，难以阅读。Spring 在创建 Bean 实例时，需要同时实例化其依赖的全部实例，因而导致性能下降，而使用设值注入则能避免这些问题。
- 构造注入的优点：
  - 构造注入可以在构造器中决定依赖关系的注入顺序。优先依赖的优先注入。比如 Web 开发时使用数据库，可以优先注入数据库连接的信息。
  - 对于依赖关系无需变化的 Bean，构造注入更有用处。没有 setter 方法，所有的依赖关系全部在构造器内部设定，后续代码不会对依赖关系产生破坏。依赖关系只能在构造器中设定，所以只有组件的创建者才能改变组件的依赖关系。而对组件的调用者而言，组件内部的依赖关系完全透明，更符合高内聚的原则。
### 7.3.4注入值的类型 
1. 字面值

2. 引用其他Bean

3. 集合值

### 7.3.5 Bean之间的关系

1. 继承
- 父类Bean
```
abstract="true"
```

- 子类Bean
```
parent=""
```

2. 依赖
- 使用<ref>元素建立，Spring负责管理这些Bean的关系

### 8.1.2 AOP术语

- 连接点(Joinpoint)：一个类或一段程序代码拥有一些具有边界性质的特定点，这些代码中的特定点就称为”连接点“，实际上，连接点就是程序执行的某个特定位置，如类初始化前，类初始化后，类的某个方法调用前、调用后、方法异常抛出时。通常每个程序都拥有多个连接点，比如一个类有两个方法，那么在这个方法在调用前、调用后、方法异常抛出时都可以作为连接点。Spring框架仅支持针对方法的连接点。
- 切入点(Pointcut):被增强的连接点。在多个连接点中，AOP通过”切入点“定位到特定的连接点,当某个连接点满足指定的条件时，该链接点将被添加增强，该连接点就变成了一个切入点。
- 增强(Advice):织入到目标特定连接点上的一段程序代码。由于增强既包含了用于添加到目标连接点上的一段执行逻辑，又包含了用于定位连接点的方位信息，所以在Spring中提供的增强接口都是带方位的，例如：BeforeAdvice、AfterAdvice。
### 8.1.4基于XML配置的AOP

- 在Spring的配置文件中，所有切面、切入点和增强都必须在<<aop:config../>>元素内部定义。<beans../>元素下可以包含多个<<aop:config../>>元素，一个<<aop:config../>>可以包含多个<pointcut>、<advisor>、<aspect>元素，并且这三个元素必须按照此顺序来定义。

1. 配置切面
- 切面是通过<<aop:aspect.../>>元素来声明的，该元素必须放置在<<aop:config../>>元素内部，使用<<aop:aspect.../>>来配置切面时，实质上是将一个已有Spring Bean转换成切面Bean,所以首先要定义一个普通的Spring Bean。
- 由于切面Bean可以当做一个普通的Spring Bean来配置，所以可以为该切面Bean配置依赖注入，当切面Bean定义完成后，通过<<aop:aspect.../>>元素中使用ref属性来引用该Bean,就可以将一个普通的Bean转换成一个切面Bean。
  - 创建一个切面类MyAspect,当张三写字或画画（业务操作）时，模拟佣人准备笔墨纸砚、装裱等非业务操作。

```
public class MyAspect{
/**
*模拟前置增强（适用于方法调用前的权限检查）
*/
public void before(){
       System.out.println("佣人准备笔墨纸砚...");
}
/**
*模拟后置增强（适用于方法执行完毕后释放资源，如关闭数据库连接等）
*/
public void after(){
       System.out.println("佣人撤去笔墨纸砚...");
}
/**
*模拟返回后增强（适用于日志记录）
*/
public void afterReturn(Object result){
        if(result=null){
                System.out.println("什么都没做，佣人无所适从");
        }else{
             System.out.println("佣人装裱后挂于墙上");
        }
}
/**
*模拟异常处理增强（适用于日志记录）
*/
public void afterException(Throwable ex){
             System.out.println("异常信息为："+ex.getMessage());
             System.out.println("佣人将其焚毁...");
}
/**
*模拟环绕增强（适用于事务控制）
*/
public Object around(ProceedingJoinPoint joinpoint)throws Throwable{
            System.out.println("开始创作...");
            Object object =joinpoint.proceed();
            System.out.println("结束创作...");
            return object;
}
}
```

- 转换成切面Bean

```
<aop:config>
           <aop:aspect id="adviceAspect" ref="myAspect">
                <!--还没有配置增强-->
            </aop:aspect>
</aop:config>
<!--配置切面-->
<bean id="myAspect" class="com.dh.ch08.aspect.MyAspect"/>

```

### 8.1.5 基于Annotation配置的AOP

1. 配置切面

```
<aop:aspectj-autoproxy/>
```

- 创建MyAspect2切面类：

```
@Aspect
public class MyAspect2{
    ...省略其他内容
}
```

2. 配置增强

```
@Aspect
public class MyAspect2{
/**
*模拟前置增强
*/
@Before("execution(*com..*)")
}
```

