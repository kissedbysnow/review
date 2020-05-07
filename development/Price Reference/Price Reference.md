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
  `weight_capacity` 	smallint(5) 	DEFAULT NULL 	COMMENT '重量or容量',
  `quantity` 			tinyint(3) 		DEFAULT NULL 	COMMENT '数量',
    
  `price` 				float(5,2) 		DEFAULT NULL	 COMMENT '标价',
  `cost_performance1` 	float(6,2) 		DEFAULT NULL 	COMMENT '性价比1 =weight*quantity/price',
  `unit_price1` 		float(5,2) 		DEFAULT NULL 	COMMENT '单价1 =price/quantity',
    
  `lowest_price` 		float(5,2) 		DEFAULT NULL 	COMMENT '历史最低价格',
  `cost_performance2` 	float(6,2) 		DEFAULT NULL 	COMMENT '性价比2 =weight*quantity/lowest_price',
  `unit_price2`	 		float(5,2) 		DEFAULT NULL 	COMMENT '单价2 =price/quantity',
    
  `actual_payment` 		float(5,2) 		DEFAULT NULL 	COMMENT '实际支付',
  `cost_performance3` 	float(6,2) 		DEFAULT NULL 	COMMENT '性价比3 =weight*quantity/actual_payment',
  `unit_price3` 		float(5,2) 		DEFAULT NULL 	COMMENT '单价3 =price/quantity',
    
  `date` 				date 			DEFAULT NULL 	COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `commodity` VALUES ('1', '插排', '公牛', 'H4053', '抗电涌', null, null, null, null, null, '174.00', null, null, null, null, null, '2020-05-06');
INSERT INTO `commodity` VALUES ('2', '插排', '小米', null, '五孔位', null, null, '39.00', null, null, null, null, null, '36.00', null, null, '2020-04-29');
INSERT INTO `commodity` VALUES ('3', '洗手器', '小米', '', '', null, null, '72.00', null, null, '63.00', null, null, '66.00', null, null, '2020-05-04');
INSERT INTO `commodity` VALUES ('8', '面膜', '芙芙', '绿芙芙', '清痘复颜面膜', '25', '5', '70.00', '1.79', '14.00', '55.00', '2.27', '11.00', '63.00', '1.98', '12.60', '2020-05-05');
INSERT INTO `commodity` VALUES ('9', '鸭脖', '周黑鸭', '140g×2', '独立小包装', '140', '2', '19.60', '14.29', '9.80', null, null, null, '16.60', '16.87', '8.30', '2020-05-05');
INSERT INTO `commodity` VALUES ('10', '沐浴露', 'Mario Badescu', '', '果酸AHA', '236', '1', null, null, null, '72.00', '3.28', null, null, null, null, '2020-05-05');
INSERT INTO `commodity` VALUES ('11', '沐浴露', 'Mario Badescu', '', '果酸AHA', '472', '1', null, null, null, '93.00', '5.08', null, '87.00', '5.43', null, '2020-05-05');
INSERT INTO `commodity` VALUES ('12', '口罩', '醉蓝', 'GB/T32610-2016', '日常防护型口罩', null, '10', null, null, null, '13.00', null, '1.30', null, null, null, '2020-05-06');
INSERT INTO `commodity` VALUES ('13', '口罩', '醉蓝', 'GB/T32610-2016', '日常防护型口罩', null, '50', null, null, null, '65.00', null, '1.30', null, null, null, '2020-05-06');
INSERT INTO `commodity` VALUES ('14', '口罩', '康沃伦', 'GB/T32610-2016', '日常防护型口罩', null, '50', null, null, null, '38.90', null, '0.78', '35.90', null, '0.72', '2020-05-06');
INSERT INTO `commodity` VALUES ('15', '口罩', '乐活时光', 'GB/T32610-2016', '日常防护型口罩', null, '10', null, null, null, '12.80', null, '1.28', null, null, null, '2020-05-06');
INSERT INTO `commodity` VALUES ('16', '口罩', '乐活时光', 'GB/T32610-2016', '日常防护型口罩', null, '50', null, null, null, '49.00', null, '0.98', null, null, null, '2020-05-06');
INSERT INTO `commodity` VALUES ('17', '口罩', '梦创', 'GB15979-2002', '一次性使用卫生用品', null, '10', null, null, null, '8.90', null, '0.89', null, null, null, '2020-05-06');
INSERT INTO `commodity` VALUES ('18', '口罩', '梦创', 'GB15979-2002', '一次性使用卫生用品', null, '50', null, null, null, '39.50', null, '0.79', null, null, null, '2020-05-06');
INSERT INTO `commodity` VALUES ('19', '口罩', '暖火', 'GB15979-2002', '一次性使用卫生用品', null, '50', null, null, null, '55.00', null, '1.10', null, null, null, '2020-05-06');
INSERT INTO `commodity` VALUES ('20', '口罩', '俞兆林', 'GB15979-2002', '一次性使用卫生用品', null, '50', null, null, null, '49.90', null, '1.00', null, null, null, '2020-05-06');
INSERT INTO `commodity` VALUES ('21', '口罩', '萱草', 'GB15979-2002', '一次性使用卫生用品', null, '50', null, null, null, '80.50', null, '1.61', null, null, null, '2020-05-06');
INSERT INTO `commodity` VALUES ('22', '口罩', '宝梦安', 'YY/T0969-2013', '一次性使用医用口罩', null, '10', null, null, null, '17.80', null, '1.78', null, null, null, '2020-05-06');
INSERT INTO `commodity` VALUES ('23', '口罩', '宝梦安', 'YY/T0969-2013', '一次性使用医用口罩', null, '50', null, null, null, '85.00', null, '1.70', null, null, null, '2020-05-06');
INSERT INTO `commodity` VALUES ('24', '口罩', '一秒', 'YY/T0969-2013', '一次性使用医用口罩', null, '10', null, null, null, '17.90', null, '1.79', null, null, null, '2020-05-06');
INSERT INTO `commodity` VALUES ('25', '口罩', '一秒', 'YY/T0969-2013', '一次性使用医用口罩', null, '50', null, null, null, '79.90', null, '1.60', null, null, null, '2020-05-06');
INSERT INTO `commodity` VALUES ('26', '口罩', '育星', 'YY/T0969-2013', '一次性使用医用口罩', null, '10', null, null, null, '15.00', null, '1.50', null, null, null, '2020-05-06');
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