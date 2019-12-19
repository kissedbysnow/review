## Struts2 概述

Struts2中大量使用拦截器来处理用户请求，从而允许用户的**业务逻辑控制器Action**与**Servlet API**分离。

Struts2的控制器由两部分组成：

- 核心控制器：**StrutsPrepareAndExecuteFilter**
- 业务逻辑控制器：**Action**

Struts2的配置文件有两种：

- 配置 Struts2 的 struts.**properties** 文件

  ```properties
  # 指定 web 应用的默认的编码及，相当于调用 HttpServletRequest 的 setCharacterEncoding 方法
  struts.i18n.encoding=GBK
  # 当 struts.xml 修改后是否重新加载该文件，在开发阶段最好打开
  struts.configuration.xml.reload=true
  # 设置浏览器是否缓存静态内容，开发阶段最好关闭
  struts.serve.static.browserCache=false
  ```

- 配置 Action 的 struts.**xml** 文件

### Struts2 的处理步骤（Struts2 处理请求直到返回响应的完整过程）

1. 客户端浏览器发送一个请求
2. 经过核心控制器 **StrutsPrepareAndExecuteFilter** 过滤处理，转交给相应的 **Action** 代理。
3. **Action** 通过配置文件中的信息找到对应的 **Action** 类，创建 **Action** 对象并调用其 **execute()** 方法
4. 调用 **Action** 前后，涉及相关拦截器的调用。拦截器链自动对请求应用通用功能
5. 一旦 **Action** 执行完毕，找到 **execute()** 方法返回值对应的结果

## Strust2 深入

配置常量的方式：

- struts.xml
- struts.properties
- web.xml

![Strust2常量加载与覆盖顺序](./Strust2常量加载与覆盖顺序.png)

**struts.xml** 中配置了一个常量A，**web.xml** 中也配置了常量A，那么先加载 **struts.xml**，即 **web.xml** 会覆盖 **struts.xml**

配置常量的代码：

- struts.xml

```xml
<struts>
    <constant name="" value=""/>
</struts>
```

- struts.properties

```properties
key=value
```

#### 3.1.3 命名空间配置

目的：避免同名 <u>**Action**</u> 之间的冲突

- struts.xml:

```xml
<struts>
	<package name="p1" extends="struts-default" namespace="/admin">
    	<action name="login" class="">
        	<result name="error">/error.jsp</result>
            <result>/success.jsp</result>
        </action>
    </package>
</struts>
```

struts2 搜索 <u>**Action**</u> 的顺序：

1. 查找指定命名空间下的 <u>**Action**</u> ，如果找到则执行。
2. 如果找不到，则转入到默认命名空间中查找 <u>**Action**</u> ，找到则执行。
3. 如果还找不到 <u>**Action**</u> ，则 Struts2 将报错。

### 3.2 Action 详解（很重要）

1. 对于使用 Struts2 框架开发的应用而言，<u>**Action**</u> 是应用的核心,每个 **Action**类就是一个**工作单元**,包含了对用户**请求的处理逻辑**,因此 <u>**Action**</u> 也被称为**业务控制器**。
2. 在开发过程中，开发者需要根据处理逻辑的不同写出相应的 <u>**Action**</u> 类,并在 struts.xml 文件中配置好每个 <u>**Action**</u> 类。

#### 3.2.1 Action 实现

- POJO 实现方式

  - ```java
    public class POJOAction{
      private String name;
      
      public String getName(){
          return name;
      }
      public void setName(String name){
          this.name=name;
      }
      
      public String execute(){
          // 略
          return "OK";
      }
    }
    ```
    
  - POJO 实现方式：就是一个简单的 **JavaBean**，每个属性对应 **get**/**set** 方法，并有 **execute()** 方法，其返回字符串，Struts2 框架对该字符串进行判断，从而转发到正确的界面用于响应用户的请求。

- 实现 <u>**Action**</u> 接口

- 继承 **<u>Action</u>Support **类

