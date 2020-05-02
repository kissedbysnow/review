//package service.impl;
//
//import dao.UserDao;
//import dao.impl.UserDaoImpl;
//import entity.PageBean;
//import entity.Commodity;
//import service.UserService;
//
//import java.util.List;
//import java.util.Map;
//
//public class UserServiceImpl implements UserService {
//    private UserDao dao = new UserDaoImpl();
//
//

//    @Override
//    public void updateUser(Commodity user) {
//        dao.update(user);
//    }
//
//    @Override
//    public void delSelectedUser(String[] ids) {
//        if(ids != null && ids.length > 0){
//            //1.遍历数组
//            for (String id : ids) {
//                //2.调用dao删除
//                dao.delete(Integer.parseInt(id));
//            }
//        }
//    }
//
//    @Override
//    public PageBean<Commodity> findUserByPage(String _currentPage, String _rows, Map<String, String[]> condition) {
//
//        int currentPage = Integer.parseInt(_currentPage);
//        int rows = Integer.parseInt(_rows);
//
//        if(currentPage <=0) {
//            currentPage = 1;
//        }
//        //1.创建空的PageBean对象
//        PageBean<Commodity> pb = new PageBean<Commodity>();
//        //2.设置参数
//
//        pb.setRows(rows);
//
//        //3.调用dao查询总记录数
//        int totalCount = dao.findTotalCount(condition);
//        pb.setTotalCount(totalCount);
//
//        //5.计算总页码
//        int totalPage = (totalCount % rows)  == 0 ? totalCount/rows : (totalCount/rows) + 1;
//        pb.setTotalPage(totalPage);
//
//        if(currentPage > totalPage) {
//            currentPage = totalPage;
//        }
//        pb.setCurrentPage(currentPage);
//
//        //4.调用dao查询List集合
//        //计算开始的记录索引
//        int start = (currentPage - 1) * rows;
//
//        if(start<0){//防止查询不到数据的时候，因 currentPage=0 导致 start = 负值
//            start=0;
//        }
//        List<Commodity> list = dao.findByPage(start,rows,condition);
//        pb.setList(list);
//
//        return pb;
//    }
//}
