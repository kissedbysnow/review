package dao;

import entity.Commodity;

import java.util.List;
import java.util.Map;

/**
 * 用户操作的DAO
 */
public interface UserDao {


    public List<Commodity> findAll();

    Commodity findUserByUsernameAndPassword(String username, String password);

    void add(Commodity user);

    void delete(int id);

    Commodity findById(int i);

    void update(Commodity user);

    /**
     * 查询总记录数
     * @return
     * @param condition
     */
    int findTotalCount(Map<String, String[]> condition);

    /**
     * 分页查询每页记录
     * @param start
     * @param rows
     * @param condition
     * @return
     */
    List<Commodity> findByPage(int start, int rows, Map<String, String[]> condition);
}
