package service.impl;

import entity.Commodity;
import entity.PageBean;
import mapper.CommodityMapper;
import mapper.impl.CommodityMapperImpl;
import service.CommodityService;

import java.util.List;
import java.util.Map;

public class CommodityServiceImpl implements CommodityService {

    private CommodityMapper mapper = new CommodityMapperImpl();

    @Override
    public List<Commodity> read() {
        return mapper.read();
    }

    @Override
    public void create(Commodity c) {
        mapper.create(formatting(c));
    }

    @Override
    public void delete(String id) {
        mapper.delete(Integer.parseInt(id));
    }

    @Override
    public Commodity readById(String id) {
        return mapper.readById(Integer.parseInt(id));
    }

    @Override
    public void update(Commodity c) {
        mapper.update(formatting(c));
    }

    @Override
    public List<Commodity> readByCriteria(String criteria) {
        return mapper.readByCriteria(criteria);
    }

    @Override
    public PageBean<Commodity> readByPage(String currentPage, String rows, Map<String, String[]> condition) {

        int curPage = Integer.parseInt(currentPage);
        int pageSize = Integer.parseInt(rows);

        if (curPage < 1) {//页码范围限定
            curPage = 1;
        }

        PageBean<Commodity> page = new PageBean<>();

        page.setRows(pageSize);//设置 页的容量

        int totalRows = mapper.queryTotalRows(condition);//通过 条件 查询总记录数
        page.setTotalRows(totalRows);//设置 总记录数

        int totalPage = (totalRows % pageSize) == 0 ? (totalRows / pageSize) : (totalRows / pageSize) + 1;
        page.setTotalPage(totalPage);//设置 总页码数

        if (curPage > totalPage) {//页码范围限定
            curPage = totalPage;
        }

        page.setCurrentPage(curPage);

        //各种参数都明确了，就可以开始查询了

        int start = (curPage - 1) * pageSize;
        if (start<0){
            start=0;
        }

        List<Commodity> list = mapper.readByPage(start,pageSize,condition);
        page.setList(list);

        return page;
    }

    @Override
    public void deleteSelected(String[] ids) {
        if(ids != null && ids.length>0){
            for (String id : ids){
                mapper.delete(Integer.parseInt(id));
            }
        }
    }

    // 格式化方法
    public Commodity formatting(Commodity c) {

        Integer weightCapacity = (Integer) defaultIsNull(c.getWeightCapacity());
        Integer quantity = (Integer) defaultIsNull(c.getQuantity());
        Float price = (Float) defaultIsNull(c.getPrice());
        Float lowestPrice = (Float) defaultIsNull(c.getLowestPrice());
        Float actualPayment = (Float) defaultIsNull(c.getActualPayment());


        if (price!=null){
            if (quantity!=null){
                // 单价 p/q
                c.setUnitPrice1(price/quantity);
                if (weightCapacity!=null){
                    // 性价比 w*q/p
                    c.setCostPerformance1((float) round(weightCapacity*quantity/price,2));
                }
            }else{
                if (weightCapacity!=null){
                    // 性价比 w/p
                    c.setCostPerformance1((float) round(weightCapacity/price,2));
                }
            }
        }

        if (lowestPrice!=null){
            if (quantity!=null){
                // 单价 p/q
                c.setUnitPrice2(lowestPrice/quantity);
                if (weightCapacity!=null){
                    // 性价比 w*q/p
                    c.setCostPerformance2((float) round(weightCapacity*quantity/lowestPrice,2));
                }
            }else{
                if (weightCapacity!=null){
                    // 性价比 w/p
                    c.setCostPerformance2((float) round(weightCapacity/lowestPrice,2));
                }
            }
        }

        if (actualPayment!=null){
            if (quantity!=null){
                // 单价 p/q
                c.setUnitPrice3(actualPayment/quantity);
                if (weightCapacity!=null){
                    // 性价比 w*q/p
                    c.setCostPerformance3((float) round(weightCapacity*quantity/actualPayment,2));
                }
            }else{
                if (weightCapacity!=null){
                    // 性价比 w/p
                    c.setCostPerformance3((float) round(weightCapacity/actualPayment,2));
                }
            }
        }

        c.setWeightCapacity(weightCapacity);
        c.setQuantity(quantity);
        c.setPrice(price);
        c.setLowestPrice(lowestPrice);
        c.setActualPayment(actualPayment);
        return c;
    }

    //把默认值设为 null
    public Object defaultIsNull(Object o) {
        if (o.equals(0) || o.equals(0.0) || o.equals(0.0f)) {
            o = null;
        }
        return o;
    }



    //四舍五入工具类 round(1.123,2)=1.12
    public double round(float number, int scale) {
        double magnitude = Math.pow(10, scale);
        return Math.round(number * magnitude) / magnitude;
    }
}
