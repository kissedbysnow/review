

# [每个元素都是对象]()

## 一、简介

| Language   |          |                                |
| ---------- | -------- | ------------------------------ |
| Java       | 面向对象 | 类的设计，对象的调用           |
| JavaScript | 基于对象 | 所有的对象已经有浏览器提供好了 |

名称变迁：LiveScript → JavaScript → EcmaScript

可以模拟面向对象编程，可以进行**服务器端编程（Node.JS）**

|       | [JS]() (JavaScript)               | [JSP]() (Java Server Page)                  |
| ----- | --------------------------------- | ------------------------------------------- |
| targe | `<Script></Script>`               | `<% %>`                                     |
| 组成  | Html 代码和嵌入其中的 JS 代码组成 | Html 代码和嵌入其中的 Java 代码组成         |
| 运行  | 客户端，浏览器需支持 JS           | 服务器端，服务器需部署 Sevelet 的服务器程序 |

### 格式一

- index.html

    ```html
    <script type="text/javascript">
        alert("Hello");
    </script>
    ```

### 格式二

- index.html

    ```html
    <script type="text/javascript" src="index.js"></script>
    ```
    
- index.js

    ```js
    alert("Hello");
    ```

## 二、语法

### 2.1 输出语句

向页面输出 Html 代码

```js
document.write("<h1>xxx</h1>")
```

后台调试输出

```js
console.log();
```

### 2.2 定义变量

```js
var num = 10;			//定义变量
console.log(typeof num);//输出类型
```

例子：

```js
var n;
if (!n) {
    document.write(typeof(n));//输出：undefined
}
```

- 变量可以直接判断，未定义类型(undefined)为false

### 2.3 定义数组

天生就是动态数组

```js
var result = new Array();
result[0]="aaa";
result[1]=100;
result[2]=true;
for (var i = 0; i < result.length; i++) {
    document.write(typeof result[i]+"<br/>");//输出：string number boolean
}
```

### 2.4 定义函数

```js
function functionName([parameter]){
    [return value;]
}
```

调用

```js
functionName([parameter]);
```

例：

```js
function add(x,y){
    switch(add.arguments.length){
        case 0:
            return 0;
        case 1:
            return x;
        case 2:
            return x+y;
        default:
            return "不可能的操作";
    }
}
alert(add(10,20,30,40,50));
```

类与对象

```js
function Book(){//定义类
}
// prototype 属于对原生的操作扩展
Book.prototype.getIndo=function(){//扩展方法
    return "this is a book";
}
var book = new Book();//构造函数
alert(book.getInfo());
```

- ```js
  var y;
  function Book(x){
      y=x;
      function getInfo(){
          return y;
      }
      return getInfo;
  }
  var Book = new Book(10);
  alert(Book());
  ```

### 2.5 字符串切分 split

```js
var result = "aaa bbb ccc".split(" ");
for (var i = 0; i < result.length; i++) {
    document.write(result[i]+"<br/>");
}
```

### 2.6 定时函数

```js
setTimeout(function,millisecond)
```

利用此函数可以实现定期的操作调用

```html
<body>
	<div id="time"></div>
</body>
<script type="text/javascript">
    function setClock(){
        document.getElementById("time").innerHTML="<h1>当前时间:"+new Date()+"</h1>";
        setTimeout(setClock,100);
    }
    setClock();
</script>
```

## 三、事件处理

### 3.1 基础事件

所有的事件都是以“onXxx“命名的

|          |          | location |
| -------- | -------- | -------- |
| onload   | 页面加载 | `<body>` |
| onunload | 页面卸载 | `<body>` |

- 分离式（静态加载）index.html

    ```html
    <head>
        <script type="text/javascript">
            function loadHandle(){
            alert("页面加载事件");
            } 
        </script>
    </head>
    <body onload="loadHandle();">
    </body>
    ```

- 整合式（动态加载 ）index.html

    ```html
    <script type="text/javascript">
        function handle(){
            alert("页面加载事件 2");
        }
        window.onload = function(){
            handle();
        }
    </script>
    ```

### 3.2 鼠标事件

|                 |          |
| --------------- | -------- |
| onmouse**up**   | 鼠标弹开 |
| onmouse**down** | 鼠标按下 |
| onmouse**over** | 鼠标进入 |
| onmouse**out**  | 鼠标移出 |
| onmouse**move** | 鼠标移动 |

- 分离式（静态加载）index.html

    ```html
    <script type="text/javascript">
        function change(object,bgcolor){
            object.bgColor = bgcolor;
        }
    </script>
    ```
    
    ```HTML
    <table>
        <tr onmouseover="change(this,'red')" onmouseout="change(this,'white')">
            <td>1</td>
            <td>2</td>
            <td>3</td>
        </tr>
    </table>
    ```
    
    所有的对象都在元素上，也就是说每个元素都属于对象。例如：`<tr>`  `<td>`

- 整合式（动态加载 ）index.html

  ```html
  <script type="text/javascript">
      function change(object,bgcolor){
          object.bgColor = bgcolor;
      }
  
      window.onload = function(){
          document.getElementById("tr1").onmouseover=function(){
              change(this,'red');
          }
          document.getElementById("tr1").onmouseout=function(){
              change(this,'white');
          }
      }
  </script>
  ```

  ```html
  <table>
      <tr id="tr1">
          <td>1</td>
          <td>2</td>
          <td>3</td>
      </tr>
  </table>
  ```

|               |      |
| ------------- | ---- |
| onclick       | 单击 |
| on[db]()click | 双击 |
|               |      |

### 3.3 动态绑定事件

#### 3.3.1 动态绑定 第一种

​	见 3.2 动态加载

#### 3.3.2 动态绑定 第二种

使用 `addEventListener(事件类型,处理函数名称,触发时机);` 进行动态设置

例如：`addEventListener("click",handle,false);`

- 事件类型 前面不加 `on`
- 处理函数名称 后面不加 `()`

对于整个 javaScript 事件的处理分为两个部分：

- 事件的冒泡过程
- 事件的触发过程

触发时机都会设置为 false，表示在事件的触发过程进行处理。阻止事件的冒泡。

```html
<script type="text/javascript">
    function dynamic(){
        alert("动态绑定");
    }
    window.onload = function(){
        document.getElementById("tr1").addEventListener("mouseover",dynamic,false);
    }
</script>
```

```html
<table>
    <tr id="tr1">
        <td>1</td>
        <td>2</td>
        <td>3</td>
    </tr>
</table>
```

动态设置的好处：Html 代码不会和 JavaScript 代码混合在一起

##### 图片展示

```html
<script type="text/javascript">
    window.onload = function(){
        document.getElementById("button").addEventListener("click",function(){
            document.getElementById("info").innerHTML = "<img src='N:/Pictures/教父.jpg'>"
        },false);
    }
</script>
```

```html
<body>
	<button id="button">显示图片</button>
	<span id="info"></span>
</body>
```

`.innerHTML=""` 在此元素内容增加指定内容，而且内容可以是 HTML 代码

## 四、表单交互

### 4.1 正则表达式

```js
/^正则$/.test(待检测数据)
```

## 五、Window 对象

```js
window.alert();
```

确认框

```html
<a href="x" onclick="return window.confirm('确定删除吗')">删除</a>
```

窗口 IO

```js
var str = window.prompt("请输入你的名字","名字是？");
document.write(str);
```

弹窗

```js
window.open("xxx.html");
```

关闭当前页面

```js
window.close();
```

重定向

```js
window.location = xxx;
```

