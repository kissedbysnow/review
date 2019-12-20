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