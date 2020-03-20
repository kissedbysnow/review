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

