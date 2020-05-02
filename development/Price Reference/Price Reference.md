### 数据库

```mysql
DROP DATABASE IF EXISTS price_reference;
CREATE DATABASE price_reference CHARACTER SET UTF8;
USE price_reference;

DROP TABLE IF EXISTS commodity;
CREATE TABLE `commodity` (
  `id` 					smallint(6) 	NOT NULL 		AUTO_INCREMENT,
  `classify` 			char(8) 		NOT NULL 		COMMENT '分类',
  `brand` 				char(16) 		NOT NULL 		COMMENT '品牌',
  `version` 			char(16) 		DEFAULT NULL 	COMMENT '型号',
  `description` 		char(32) 		DEFAULT NULL 	COMMENT '描述',
  `lowest_price`		float(5,2) 		DEFAULT NULL 	COMMENT '历史最低价格',
  `price` 				float(5,2) 		DEFAULT NULL 	COMMENT '吊牌价',
  `discount_price` 		float(5,2) 		DEFAULT NULL 	COMMENT '折后价格',
  `deduction` 			float(5,2) 		DEFAULT NULL 	COMMENT '抵扣金额',
  `actual_payment` 		float(5,2) 		DEFAULT NULL 	COMMENT '到手价格',
  `updated_date` 		date 			DEFAULT NULL 	COMMENT '更新日期',
  `purchasing_date` 	date 			DEFAULT NULL 	COMMENT '购买日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `commodity` VALUES ('1', '插排', '公牛', 'H4053', '五孔位，抗电涌', '174.00', '249.00', null, null, null, '2020-04-29', null);
INSERT INTO `commodity` VALUES ('2', '插排', '小米', null, '五孔位', null, null, '39.00', '3.00', '36.00', '2020-04-29', '2020-04-30');
INSERT INTO `commodity` VALUES ('3', '洗手机', '小米', null, null, '63.00', '79.00', '72.00', '6.00', '66.00', '2020-04-29', '2020-04-29');
```

### 增删改查 CRUD

1. 查看 Read
   - 查看
   - 分页查看
2. 增加 Create
   - 增加
3. 删除 delete
   - 删除
4. 修改 Update
   - 回显
     - 修改