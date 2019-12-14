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