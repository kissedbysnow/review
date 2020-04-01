## 一、网页入门知识

### 1.3 web 标准

|            |                                            |
| ---------- | ------------------------------------------ |
| Html       | 用于标记网页的内容，使得更加清晰，更有逻辑 |
| css        | 用于实现网页的布局，改变元素的默认表现形式 |
| JavaScript | 实现网页的元素的交互式设计                 |

### 1.4 常见浏览器

| 浏览器          | 内核            | 私有前缀 |
| --------------- | --------------- | -------- |
| IE              | Trident         | -ms-     |
| Google Chrome   | webkit，Blink   | -webkit- |
| 双核浏览器      | Trident，webkit |          |
| Mozilla FireFox |                 | -moz-    |
| Opera           |                 | -o-      |

| 系统            | 内核     |      |
| --------------- | -------- | ---- |
| IOS             | webkit   |      |
| Android 4.4 前  | webkit   |      |
| Android 4.4 后  | Chromium |      |
| Windows Phone 8 | Trident  |      |

## 二、Html 语法基础

### 2.4 列表标签

- 无序列表

    ```html
    <ul>
        <li></li>
    </ul>
    ```

- 有序列表

     ```html
    <ol>
        <li></li>
    </ol>
    ```

### 2.5 表格标签

```html
<table border="1" width="200" height="200" align="center">
    
</table>
```

### 2.6 图像标签

```html
<img src="image-url" alt="替代说明" title="设置提示文字">
```

- alt：设置图像的替代说明，当图像无法显示时，显示“替代说明”

### 2.8 链接标签

```html
<a href="file-url" target="">链接的触发器</a>
```

- target：指定打开链接的方式

  | target="" |                              |
  | --------- | ---------------------------- |
  | _self     | 在原窗口打开                 |
  | _blank    | 在新窗口打开                 |
  | new       | 在新窗口打开，只能同时开一个 |

## 三、网页设计原则

### 3.1 版面设计原则

### 字号

|        |                                              |
| ------ | -------------------------------------------- |
| 正文   | 14px~16px                                    |
| 导航   | 16px~20px                                    |
| 网站名 | log 采用最大的字体，最好可以处理成图片的形式 |
| 标题   | 16px~28px 采用偶数                           |
| 页脚   | 12px 浅色                                    |

## 十一、表单

### 11.1 Input 控件

```html
<form>
    <input type="text"/>
    <input type="password"/>
    <input type="radio"/>		<!--单选框-->
    <input type="checkbox"/>	<!--复选框-->
    <input type="button"/>
    <input type="submit"/>
    <input type="reset"/>		<!--重置-->
    <input type="image"/>		<!--图像形式的提交按钮-->
    <input type="hidden"/>		<!--隐藏域-->
    <input type="file"/>		<!--文件选择-->
</form>
```

### 11.2 Select 控件（下拉框）

```html
<select>
    <option></option>
    <option></option>
    <option></option>
</select>
```

| 标记名        | 常用属性 | 描述                                                         |
| ------------- | -------- | ------------------------------------------------------------ |
| **\<select>** | size     | 下拉菜单的可见选项数                                         |
|               | multiple | 下来菜单将具有多项选择的功能，方法为按住 Ctrl 键的同时选择多项 |
| **\<option>** | selected | 当前项即为默认选中项                                         |

### **11.3 TextArea 控件（文本框）**

```html
<textarea cols="每行的字符数" rows="行数">
</textarea>
```

### 11.4 Label 控件

一般用来标记表单控件的提示信息，for 属性取表单控件的 id 值

```html
<label for="name">姓名</label>
<input type="text" id="name"/>
```

### 11.5 表单的美化