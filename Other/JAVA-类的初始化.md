### 内部类

```java
public class Demo {
	public static void main(String[] args) {
		B b = new Demo().new B();
	}
	public class B{}
}
```

### 外部类

```java
public class Demo {
	public static void main(String[] args) {
		B b = new B();
	}
}
class B{}
```

