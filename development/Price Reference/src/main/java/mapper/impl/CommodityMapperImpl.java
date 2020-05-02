package mapper.impl;

import entity.Commodity;
import mapper.CommodityMapper;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JdbcUtils;

import java.util.List;

public class CommodityMapperImpl implements CommodityMapper {

    private JdbcTemplate template = new JdbcTemplate(JdbcUtils.getDataSource());

    @Override
    public List<Commodity> read() {
        String sql="SELECT * FROM commodity";
        return template.query(sql,new BeanPropertyRowMapper<Commodity>(Commodity.class));
    }

    @Override
    public void create(Commodity c) {
        String sql="INSERT INTO commodity VALUES(null,?,?,?,?,?,?,?,?,?,?,?)";
        template.update(sql,
                c.getClassify(),
                c.getBrand(),
                c.getVersion(),
                c.getDescription(),
                c.getLowestPrice(),
                c.getPrice(),
                c.getDiscountPrice(),
                c.getDeduction(),
                c.getActualPayment(),
                c.getUpdatedDate(),
                c.getPurchasingDate());
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM commodity WHERE id = ?";
        template.update(sql, id);
    }

    @Override
    public Commodity readById(int id) {
        String sql="SELECT * FROM commodity WHERE id = ?";
        return template.queryForObject(sql,new BeanPropertyRowMapper<Commodity>(Commodity.class),id);
    }

    @Override
    public void update(Commodity c) {
        String sql = "UPDATE commodity SET classify = ?,brand = ?,version = ?,description = ?,lowest_price = ?,price = ?,discount_price = ?,deduction = ?,actual_payment = ?,updated_date= ?,purchasing_date= ? WHERE id = ?";
        template.update(sql,c.getClassify(),
                            c.getBrand(),
                            c.getVersion(),
                            c.getDescription(),
                            c.getLowestPrice(),
                            c.getPrice(),
                            c.getDiscountPrice(),
                            c.getDeduction(),
                            c.getActualPayment(),
                            c.getUpdatedDate(),
                            c.getPurchasingDate(),
                            c.getId());
    }
}
