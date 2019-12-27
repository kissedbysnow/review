## 实现Action接口
> 在Struts2框架中提供了一个Action接口，该结构提供了一个开发Action的通用规范，其代码如下:

  ```  
 public interface Action{
 //定义静态常量
 public static final String SUCCESS="success";
 public static final String NONE="none";
 public static final String ERROR="ERROR";
 public static final String INPUT="input";
 public static final String LOGIN="login";
 //execute()方法
 public String execute() throws Exception;
 }
  ```
* 示例3.8  通过实现Action接口来创建RegAction类。

```
public class RegAction implements Action{
.......
    public String execute(){
           System.out.println("---注册的用户信息如下---");
           System.out.println("用户名："+userName);
           System.out.println("密码："+password);
           //暂不做逻辑判断，直接返回成功页面
           return SUCCESS;
    }
}
```
* 配置文件struts.xml代码更改如下：
```
<struts>
      <!--配置一个name为reg的包，该包继承了struts-default包，命名空间默认-->
      <package name="reg" extends="struts-default">
         <action name="reg" class="com.dh.ch03.action.RegAction">
         <!--配置一个name为success的结果类型-->
         <result name="success">/page/regsuccess.jsp</result>
         </action>
      </package>
......
</struts>
```
## 继承ActionSupport类
* Struts2框架还提供了Axtion接口的一个实现类ActionSupport,该类提供了许多默认方法，包括__获取国际化信息的方法，数据校验的方法，默认处理用户请求的方法__等。实际上，ActionSupport类是Struts2缺省的Action处理类，当用户配置Action类没有指定class属性时，系统自动使用该类处理请求。
>在实际应用中，通常在编写Action时继承ActionSupport类，这样可以大大简化Action的开发，从而能够方便、快捷地实现业务控制器。

* 示例3.9  通过继承ActionSupport类创建RegAction类，并重写validate()方法。
```
public class RegAction extends ActionSupport{
......
      //重写execute()方法
      public String execute(){
           System.out.println("---注册的用户信息如下---");
           System.out.println("用户名："+userName);
           System.out.println("密码："+password);
           //暂不做逻辑判断，直接返回成功页面
           return SUCCESS;
      }
      //重写validate()方法
      public void validate(){
           //简单验证用户输入
           if(this.userName==null||this.userName.equals("")){
           //将此错误信息写入到Action类的FieldErrors中
           //此时，Struts2框架自动返回INPUT视图
            addFiledError("userName","用户名不能为空");
            System.out.println("用户名为空！");
           }
      }
}
```
- 上述代码中，增加了validate()数据校验方法，该方法在执行execute()方法之前运行，如果发现数据不符合条件。

- 配置文件struts.xml代码更改如下:
```
<struts>
        <package name="reg" extends="struts-default">
         <action name="reg" class="com.dh.ch03.action.RegAction">
          <result name="success">/page/regsuccess.jsp</result>
         <!--Struts2框架定义结果类型，当FieldError中有错误信息时，流程转到input-->
             <result name="input">/reg.jsp</result>
          </action>
      </package>
.....
</struts>
```


​	
​	
​	
​	
​	