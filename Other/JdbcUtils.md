### 内置

```java
//JdbcUtils.java

package utils;

import java.sql.*;

public final class JdbcUtils {

	private static String url = "jdbc:mysql://localhost:3306/swxxzydb"
			+ "?useUnicode=true&characterEncoding=utf-8&useSSL=false";
	private static String user = "root";
	private static String password = "123456";

	private JdbcUtils() {}

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new ExceptionInInitializerError(e);
		}
	}

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, user, password);
	}

	public static void free(ResultSet rs, Statement st, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null) {
					st.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}
```

### 外置

```java
//JdbcUtils.java

package utils;

import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public final class JdbcUtils {

	private static String driver="";
	private static String url = "";
	private static String user = "";
	private static String password = "";

	private JdbcUtils() {}

	static {
		InputStream inS=JdbcUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
		Properties pro = new Properties();
		try {
			pro.load(inS);
			driver=pro.getProperty("driver");
			url=pro.getProperty("url");
			user=pro.getProperty("user");
			password=pro.getProperty("password");
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws Exception {
		return DriverManager.getConnection(url, user, password);
	}

	public static void free(ResultSet rs, Statement st, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null) {
					st.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}
```

```properties
//resources/jdbc.properties

driver=com.mysql.jdbc.Driver
url=jdbc:mysql://localhost:3306/swxxzydb
user=root
password=123456
```

