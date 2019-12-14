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

根据注入方式的不同，Bean 的依赖注入通常表现为如下两种格式：

- 设值注入，通过使用**属性的 setter 方法**注入 Bean 的属性值or依赖对象。
  - 使用设值注入要求 Bean 提供一个默认的无参构造方法，并为需要注入的属性提供对应的 setter 方法。
- 构造注入，通过使用**构造**来注入 Bean 的属性or依赖对象。
  - 可以确保一些必要的属性在 Bean 实例化时就得到设置，从而使 Bean 在实例化后就可以使用。

区别：

给实例中属性赋值的时机不同：设值注入是先创建一个默认的 Bean 实例，然后调用对应 setter 方法注入依赖关系，而构造注入则在创建 Bean 实例时完成依赖关系的注入。

对比：

没有绝对的好坏区分，只是适应的场景不同，各有各的优点。

- 设值注入的优点：
  - 与传统的 JavaBean 写法更相似，通过 setter 方法设定依赖关系显得更加直观、自然。
  - 对于复杂的依赖关系，如果采用构造注入，会导致构造器过于臃肿，难以阅读。Spring 在创建 Bean 实例时，需要同时实例化其依赖的全部实例，因为导致性能下降，而使用设值注入则能避免这些问题。
- 构造注入的优点：
  - 构造注入可以在构造器中决定依赖关系的注入顺序。优先依赖的优先注入。比如 Web 开发时使用数据库，可以优先注入数据库连接的信息。
  - 对于依赖关系无需变化的 Bean，构造注入更有用处。没有 setter 方法，所有的依赖关系全部在构造器内部设定，后续代码不会对依赖关系产生破坏。依赖关系只能在构造器中设定，所以只有组件的创建者才能改变组件的依赖关系。而对组件的调用者而言，组件内部的依赖关系完全透明，更符合高内聚的原则。