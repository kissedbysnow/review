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

## 四、CSS 基础选择器

### 4.4 CSS 文本的设置

#### 4.4.1 CCS 字体

定义文本的字体系列、大小、风格、变形...

##### font-family 字体系列

用于设置字体系列，可同时指定多个字体，以逗号隔开，表示如果浏览器不支持第一个字体，则会尝试下一个，直到找到合适的字体

```css
p{font-family:"Times New Roman",Times,serif;}
```

- serif 系统默认字体

##### font-size 字号大小

| 相对长度大小 |                                |
| ------------ | ------------------------------ |
| em           | 相对于当前对象内文本的字体尺寸 |
| px           | 像素                           |

##### font-weight 字体粗细

| 值                      | 描述                           |
| ----------------------- | ------------------------------ |
| normal                  | 标准的字符                     |
| bold                    | 粗体的字符                     |
| bolder                  | 更粗的字符                     |
| lighter                 | 更细的字符                     |
| 100~900（100 的整数倍） | 400 等同 normal，700 等同 bold |

##### font-style 字体风格

| 值      |                |
| ------- | -------------- |
| normal  | 标准的字体样式 |
| italic  | 斜体的字体样式 |
| oblique | 倾斜的字体样式 |

- italic 与 oblique 无区别

##### font-variant 变体

仅对英文字符有效

| 值         |                    |
| ---------- | ------------------ |
| normal     |                    |
| small-caps | 显示小型的大写字体 |

##### font 综合设置字样式

顺序：

- font-style
- font-variant
- font-weight
- font-size/line-height
- font-family

至少设置字体大小，字体系列，其他缺省时取默认值

```css
p{font:italic bold 12px/30px arial,sans-serif;}
```

#### 4.4.2 CSS 文本

定义文本的外观，可以改变文本的颜色、字符间距、对齐文本、装饰文本，对文本进行缩进...

##### color 文本颜色

取值方式有以下 3 种

- 预定义的颜色值，如 `color:red`

- RGB

  |      | 六位    | 三位 |       |              |
  | ---- | ------- | ---- | ----- | ------------ |
  | 黑色 | #000000 | #000 | black | `color:#000` |
  | 白色 | #ffffff | #fff | white | `color:#fff` |

- RGBA

  A 表示颜色透明度，取值范围：0~1

  ```css
  p{color:rgba(255,255,0,0.5);}
  ```

##### letter-spacing 字间距

可以使用负值

##### word-spacing 单词间距

仅对英文有效，可以使用负值

##### line-height 行间距

单位有三种：

- 像素 px
- 相对值 em
- 百分比 %

```css
p{line-height:150%}
```

##### text-transform 文本转换

| 值         |                |
| ---------- | -------------- |
| none       | 默认值，不转换 |
| capitalize | 首字母大写     |
| uppercase  | 转换为大写     |
| lowercase  | 转换为小写     |

##### text-decoration 文本装饰

| 值           |        |
| ------------ | ------ |
| none         |        |
| underline    | 下划线 |
| overline     | 上划线 |
| line-through | 删除线 |

##### text-align 水平对齐方式

相当于 html 中的 align 对齐属性

| value  |              |
| ------ | ------------ |
| left   | 左对齐，默认 |
| right  | 右对齐       |
| center | 居中对齐     |

##### text-indent 首行缩进

可以使用负值，建议使用 em 作为设置单位

##### white-space 空白符处理

| value  |                                                              |
| ------ | ------------------------------------------------------------ |
| normal | 文本中的空格、空行无效，满行（到达区域边界）后自动换行       |
| pre    | 预格式化，按文档的书写格式保留空格、空行、换行...斗鱼原样显示 |
| nowrap | 空格、空行无效，强制文本不能换行，除非遇到 `<br/>`。内容超出元素的边界也不换行，若超出浏览器页面则会自动增加滚动条 |

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