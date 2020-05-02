package service;

import entity.Commodity;
import entity.PageBean;

import java.util.Map;

/**
 * 用户管理的业务接口
 */
public interface UserService {


    /**
     * 修改用户信息
     * @param user
     */
    void updateUser(Commodity user);

    /**
     * 批量删除用户
     * @param ids
     */
    void delSelectedUser(String[] ids);

    /**
     * 分页条件查询
     * @param currentPage
     * @param rows
     * @param condition
     * @return
     */
    PageBean<Commodity> findUserByPage(String currentPage, String rows, Map<String, String[]> condition);
}
