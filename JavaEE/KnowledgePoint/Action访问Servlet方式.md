# Action访问ActionContext

- Struts2的Action并没有直接和任何Servlet API耦合。
- 但Struts2的Action不访问Servlet API通常是不能实现业务逻辑的。
>Servlet API指的是HttpServletRequest、HttpSession和ServletContext等

- Struts2提供了一个ActionContext类，Struts2的Action可以通过该类来访问Servlet API。 

- Struts2框架给ServletContext、HttpServletRequest等对象都提供一个对应的Map对象，通过操作该Map对象来达到操作Servlet API对象的目的。

- ActionContext是Action执行的上下文，Action在执行时需要用到的Servlet相关对象（例如：request、session等对象）都存放在ActionContext对象中，在每次执行Action之前都会为每个Action创建一个ActionContext对象的副本，在多线程环境下不会发生线程访问问题。

> Struts2中框架使用了ThreadLocal对象来对ActionContext进行处理。ThreadLocal为“线程局部变量”。

- 示例3.10  创建counter.jsp和CounterAction类来统计用户访问页面的次数，用于演示Action访问ActionContext的方式。
创建CounterAction类，其代码如下：
```
public class CounterAction extends ActionSupport{
   public String execute(){
            //获取ActionContext对象，通过该对象访问Servlet API
            ActionContext ctx=ActionContext.getContext();
            //获取ActionContext里面的count属性
            Integer counter=(Integer)ctx.getApplication().get("counter");
            //如果counter的属性为null,设置counter属性为1
                 if(counter==null){
                          counter=1;       
                 }else{
                 //将counter加1
                  counter++;
                 }
                 //将加1后的counter值保存在application中
                 ctx.getApplication().put("counter",counter);
                 return SUCCESS;
          }
}
```

上述代码中，从ActionContext对象中获取了ServletContext对应的Map对象，然后对Map对象操作，从而间接地操纵了ServletContext对象。

- counter.jsp界面的页面代码如下：

```
<%@page language="java" contentType="text/html;charset=UTF-8" pageeEncoding="UTF-8">
<html>
<head>
<title>页面访问次数统计</title>
</head>
<body>
<form action="counter.action" method="post">
       <h1><input type="sumbit" value="点击！"/>
       <!--输出点击次数-->
       <h1>点击按钮，已经点击了
       <!--通过表达式访问ServletContext对象的属性-->
       ${empty applicationScope.counter?0:applicationScope.counter}次</h1>
 </form>
 </body>
 </html>
```

上述代码中，创建了一个表单，表单属性action的值为counter.action,用来访问名称为counter的Action

- struts.xml的配置如下所示：
```
<struts>
.......
       <package name="counter" extends="struts-default"> 
            <action name="counter" class="com.dh.ch03.action.CounterAction">
              <result name="success">/pages/counter.jsp</result>
             </action>
        </package>
</struts>
```

从运行结果可以得知，当用户单击“点击”按钮时，浏览器发出请求，Struts2框架会把请求转发到name为counter的CounterAction进行处理，如果是用户第一次访问，那么counter的初始值为1；否则，counter值在原来的基础上加一，__然后把结果保存在Map对象中。实际上counter值最终保存到了ServletContext中，最后在counter.jsp界面上通过EL表达式取出来并显示。__

# Action直接访问Servlet API

- Struts2框架提供了一系列的接口，通过Action实现这些接口，来访问Servlet API。
  - ServletContextAware:可以直接访问web应用的ServletContext对象
  - ServletRequestAware:可以直接访问用户请求的HttpServletRequest对象
  - ServletResponseAware:可以直接访问服务器响应的HttpServletResponse对象
- 示例3.11 以ServletRequestAware接口为例，通过获取HttpSession,来统计每个浏览器用户访问的次数。
  - 创建CounterAction类，继承ActionSupport,实现ServletRequestAware接口，其代码如下：