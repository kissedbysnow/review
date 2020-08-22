### 批处理插入

```java
public class test {
	public static void main(String[] args) throws Exception {
		String sql = "INSERT INTO able VALUES (null,null,?)";
		Connection conn = JdbcUtils.getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);

		for (int i = 1; i <= 50000; i++) {
			ps.setString(1, "hi");
            
			ps.executeUpdate();//不使用批处理
		}
		JdbcUtils.free(null, ps, conn);
	}
}
```

```java
public class test {
	public static void main(String[] args) throws Exception {
		String sql = "INSERT INTO able VALUES (null,null,?)";
		Connection conn = JdbcUtils.getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);

		for (int i = 1; i <= 50000; i++) {
			ps.setString(1, "hi");
            
			ps.addBatch();// 将sql语句添加到批处理包（将苹果装到框中）
			if (i % 1000 == 0) {
				ps.executeBatch();// 执行批处理包的所有语句（将框运到教室）
				ps.clearBatch();// 清空批处理包的sql语句（卸苹果）
			}
		}
		JdbcUtils.free(null, ps, conn);
	}
}
```

