package service;

import entity.Commodity;

import java.util.List;

/**
 * 商品 service 接口
 */

public interface CommodityService {

    public List<Commodity> read();

    public void create(Commodity commodity);

    public void delete(String id);

    public Commodity readById(String id);

    public void update(Commodity commodity);
}
