package controller.servlet.read;


import entity.Commodity;
import entity.PageBean;
import service.CommodityService;
import service.impl.CommodityServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/readByPageServlet")
public class readByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        //1.获取参数
        String currentPage = request.getParameter("currentPage");//当前页码
        String rows = request.getParameter("rows");//每页显示条数

        if (currentPage == null || "".equals(currentPage)) {
            currentPage = "1";
        }
        if (rows == null || "".equals(rows)) {
            rows = "10";
        }

        System.out.println("read By Page Servlet ==> rows:" + rows);
        //获取条件查询参数
        Map<String, String[]> condition = request.getParameterMap();

        //2.调用service查询

        CommodityService cS = new CommodityServiceImpl();
        PageBean<Commodity> page = cS.readByPage(currentPage, rows, condition);

        System.out.println("readByPageServlet.java:" + page);

        //3.将PageBean存入request
        request.setAttribute("page", page);
        request.setAttribute("condition", condition);//将查询条件存入request，返回给前端使用

        //4.转发到list.jsp
        request.getRequestDispatcher("/readByPage.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
