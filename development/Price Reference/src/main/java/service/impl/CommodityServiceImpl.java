package service.impl;

import entity.Commodity;
import mapper.CommodityMapper;
import mapper.impl.CommodityMapperImpl;
import service.CommodityService;

import java.util.List;

public class CommodityServiceImpl implements CommodityService {

    private CommodityMapper mapper = new CommodityMapperImpl();

    @Override
    public List<Commodity> read() {
        return mapper.read();
    }

    @Override
    public void create(Commodity c) {
        mapper.create(c);
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
        mapper.update(c);
    }
}
