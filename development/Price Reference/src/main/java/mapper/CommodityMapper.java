package mapper;

import entity.Commodity;

import java.util.List;
import java.util.Map;

public interface CommodityMapper {

    public List<Commodity> read();

    public void create(Commodity commodity);

    public void delete(int id);

    public Commodity readById(int id);

    public void update(Commodity commodity);


    public List<Commodity> readByCriteria(String criteria);


    int queryTotalRows(Map<String, String[]> condition);

    List<Commodity> readByPage(int start, int pageSize, Map<String, String[]> condition);
}
