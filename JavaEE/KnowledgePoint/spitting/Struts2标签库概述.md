# Struts2标签库概述
- Struts2标签库提供了非常丰富的功能，不仅提供了表示层数据处理，也提供了基本的流程控制功能。

- 此外，还提供了国际化、Ajax支持等功能。
## 标签库简介

- 自定义标签库的优势：
  - 使用简单
  - 可维护性强
  - 复用性高
  
- JSTL，即JSP标准标签库

## 标签库的组成

可将所有Struts2标签分为三类：

- UI(User Interface,用户界面)标签：主要用来生成HTML元素的标签。
  - 表单标签：主要用于生成HTML页面的form标签及普通表单元素的标签；
  - 非表单标签：主要用于生成页面上的树、Tab页等特殊展示内容的标签。

- 非UI标签：主要用于数据访问、逻辑控制的标签
  - 流程控制标签：主要包含用于实现分支、循环等流程控制的标签；
  - 数据访问标签：主要包含用于操作值栈和完成国际化功能的标签。

- Ajax标签：该类标签用来支持Ajax技术。

为了在JSP页面中使用Struts2标签库中提供的标签，__必须使用taglib指令__导入Struts2标签库:

```
<%@ taglib prefix="s" uri="/struts-tags"%>
```

- prefix属性指定标签的前缀，即使用Struts2标签库中的任一标签时，前面都应加上"s",例如"<<s:property>>"

- uri属性指定标签库描述文件的路径