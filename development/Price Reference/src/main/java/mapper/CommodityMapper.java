package mapper;

import entity.Commodity;

import java.util.List;

public interface CommodityMapper {

    public List<Commodity> read();

    public void create(Commodity commodity);

    public void delete(int id);

    public Commodity readById(int id);

    public void update(Commodity commodity);
}
