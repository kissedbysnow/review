package service;

import entity.Commodity;
import entity.PageBean;

import java.util.List;
import java.util.Map;

/**
 * 商品 service 接口
 */

public interface CommodityService {

    public List<Commodity> read();

    public void create(Commodity commodity);

    public void delete(String id);

    public Commodity readById(String id);

    public void update(Commodity commodity);

    /**
     * 条件查询
     * @param criteria
     * @return
     */
    public List<Commodity> readByCriteria(String criteria);


    /**
     * 分页条件查询
     * @param currentPage
     * @param rows
     * @param condition
     * @return
     */
    public PageBean<Commodity> readByPage(String currentPage, String rows, Map<String, String[]> condition);


    /**
     * 删除选中
     * @param ids
     */
    public void deleteSelected(String[] ids);
}