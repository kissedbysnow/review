package mapper.impl;

import entity.Commodity;
import mapper.CommodityMapper;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JdbcUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class CommodityMapperImpl implements CommodityMapper {

    private JdbcTemplate template = new JdbcTemplate(JdbcUtils.getDataSource());

    @Override
    public List<Commodity> read() {
        String sql = "SELECT * FROM commodity";
        return template.query(sql, new BeanPropertyRowMapper<Commodity>(Commodity.class));
    }

    @Override
    public void create(Commodity c) {


        String sql = "INSERT INTO commodity VALUES(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        template.update(sql,
                c.getClassify(),
                c.getBrand(),
                c.getVersion(),
                c.getDescription(),
                c.getWeightCapacity(),
                c.getQuantity(),
                c.getPrice(), c.getCostPerformance1(), c.getUnitPrice1(),
                c.getLowestPrice(), c.getCostPerformance2(), c.getUnitPrice2(),
                c.getActualPayment(), c.getCostPerformance3(), c.getUnitPrice3(),
                c.getDate());
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM commodity WHERE id = ?";
        template.update(sql, id);
    }

    @Override
    public Commodity readById(int id) {
        String sql = "SELECT * FROM commodity WHERE id = ?";
        return template.queryForObject(sql, new BeanPropertyRowMapper<Commodity>(Commodity.class), id);
    }

    @Override
    public void update(Commodity c) {
        String sql = "UPDATE commodity SET classify=?, brand=?, version=?, description=?, weight_capacity=?, quantity=?," +
                " price=?, cost_performance1=?, unit_price1=?," +
                " lowest_price=?, cost_performance2=?, unit_price2=?," +
                " actual_payment=?, cost_performance3=?, unit_price3=?," +
                " date=? WHERE id=?";
        template.update(sql, c.getClassify(),
                c.getBrand(),
                c.getVersion(),
                c.getDescription(),
                c.getWeightCapacity(),
                c.getQuantity(),
                c.getPrice(), c.getCostPerformance1(), c.getUnitPrice1(),
                c.getLowestPrice(), c.getCostPerformance2(), c.getUnitPrice2(),
                c.getActualPayment(), c.getCostPerformance3(), c.getUnitPrice3(),
                c.getDate(),
                c.getId());
        template.toString();
    }

    @Override
    public List<Commodity> readByCriteria(String criteria) {

        String sql = "SELECT * FROM commodity WHERE classify LIKE '" + criteria +
                "' OR brand LIKE '" + criteria +
                "' OR version LIKE '" + criteria +
                "' OR description LIKE '" + criteria + "'";
        return template.query(sql, new BeanPropertyRowMapper(Commodity.class));
    }

    @Override
    public int queryTotalRows(Map<String, String[]> condition) {

        String sql = "SELECT COUNT(*) FROM commodity WHERE 1=1 ";
        StringBuilder sqlStr = new StringBuilder(sql);

        Set<String> keySet = condition.keySet();
        List<Object> params = new ArrayList<>();
        for (String key : keySet) {

            //排除分页条件参数
            if ("currentPage".equals(key) || "rows".equals(key)) {
                continue;
            }

            String value = condition.get(key)[0];
            if (value != null && !"".equals(value)) {
                sqlStr.append(" and " + key + " like ? ");
                params.add("%" + value + "%");
            }
        }

        System.out.println("Query Total Rows ===> Mapper Implement ===> sql语句 ："+ sqlStr.toString());
        System.out.println("Query Total Rows ===> Mapper Implement ===>    参数 ："+ params);
        return template.queryForObject(sqlStr.toString(),Integer.class,params.toArray());
    }

    @Override
    public List<Commodity> readByPage(int start, int pageSize, Map<String, String[]> condition) {
        String sql = "SELECT * FROM commodity WHERE 1=1";
        StringBuilder sqlStr = new StringBuilder(sql);
        Set<String> keySet = condition.keySet();
        List<Object> params = new ArrayList<>();
        for (String key : keySet) {

            //排除分页条件参数
            if ("currentPage".equals(key) || "rows".equals(key)) {
                continue;
            }

            String value = condition.get(key)[0];
            if (value != null && !"".equals(value)) {
                sqlStr.append(" and " + key + " like ? ");
                params.add("%" + value + "%");
            }
        }

        //分页
        sqlStr.append(" limit ?,? ");
        params.add(start);
        params.add(pageSize);
        sql = sqlStr.toString();

        System.out.println("Read By Page ===> Mapper Implement ===> sql语句 ："+ sqlStr.toString());
        System.out.println("Read By Page ===> Mapper Implement ===>    参数 ："+ params);
        return template.query(sql,new BeanPropertyRowMapper<Commodity>(Commodity.class),params.toArray());
    }
}
