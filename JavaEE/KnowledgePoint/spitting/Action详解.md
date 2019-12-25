#Action详解  
1. 对于使用Struts2框架开发的应用而言,Action是应用的核心,每个Action类就是一个工作单元,包含了对用户请求的处理逻辑,因此Action也被称为业务控制器  
2. 在开发过程中,开发者需要根据处理逻辑的不同写出相应的Action类,并在struts.xml文件中配置好每个Action类  
3. Struts2框架负责将请求与Action匹配，如果匹配成功，此Action类就会被Struts2框架调用，进而完成请求的处理。  
##Action实现  
在开发过程中，通常有三种方式实现Action:  
1. POJO实现方式  
2. 实现Action接口  
3. 继承ActionSupport类  
###POJO实现方式  
使用该方式实现的Action就是一个普通的Java类，该类通常包含一个特定方法execute(),该方法没有任何参数，返回值类型是字符串类型。  
***
示例3.7 使用POJO方式实现用户注册功能，创建RegAction类，其中该Action的属性有用户名、密码和姓名等。  
创建一个RegAction类，实现execute()方法，其代码如下：  

    public class RegAction{  
           /*用户名*/
           private String userName;
           /*密码*/
           private String password;
           private String name;
           public String getUserName(){
                return userName;
    }
           public void setUserName(String userName){
           this.userName=userName;
    }
           public String getPassword(){
                return password;
    }
           public void setPassword(String password){
           this.password=password;
    }
           public String getName(){
                return name;
    }
           public void setName(String name){
           this.name=name;
    }
    /**
      *调用业务逻辑方法，控制业务流程
      *该方法实现只有输出用户输入的内容，并无过多逻辑判断，直接返回成功页面  
     */
     public String execute(){
        System.out.println("---注册的用户信息如下----");
        System.out.println("用户名："+userName);
        System.out.println("密码："+password);
        System.out.println("姓名："+name);
       //暂不做逻辑判断，直接返回成功页面
       return "OK";   
    }
    }  
从上述代码可见，RegAction就是一个简单的JavaBean,每个属性对应get/set方法，并且类中还有一个execute（）方法，其返回字符串，Struts2框架对该字符串进行判断，从而转发到正确的界面用于响应用户的请求。  
***
在struts.xml文件中对RegAction的配置如下所示：  

    <struts>  
        <!--配置一个name为reg的包,该包继承了struts-default包，命名空间默认-->
        <package name="reg" extends="struts-default">
           <action name="reg" class="com.dh.ch03.action.RegAction">
           <!--配置一个name为ok的结果类型，与实现类RegAction中execute返回结果匹配-->
               <result name="OK">/page/regsuccess.jsp</result>
           </action>
         </package> 
    ...
     </struts>      
Action不但可以设置与Http请求参数对应的属性，也可以定义Http参数中没有的属性，并且用户可以访问这些属性。  
  >Action中的属性名不一定和表单中的元素属性名完全相同，但对于表单中的每个元素名在Action中一定要有对应的get/set方法，例如，表单的元素名为userName,在Action中有setUserName()和getUserName()方法与之对应，但这两个方法处理的Action属性名称可以不是userName。  

整个注册功能运行的步骤和流程如下：  
1. 用户在注册界面中填入注册信息后提交，浏览器向服务器发出请求，请求的URL为：http://localhost8080/ch03/reg.action。
2. Web服务器接收到请求后，首先查找名为ch03的Web应用，然后把reg.action交给Struts2框架处理。  
3. Struts2根据规则去掉.action后缀，查找是否存在name为reg的Action对象，如果存在，首先进行参数的封装处理，即把请求中的参数值通过调用RegAction中的set方法一一存入其属性中，然后调用RegAction的execute()方法进行控制台打印，最后返回字符串“OK”。  
4. Struts2框架获取字符串“OK”,然后在配置文件中匹配名为“OK”的result元素，最终转发到regsuccess.jsp界面。