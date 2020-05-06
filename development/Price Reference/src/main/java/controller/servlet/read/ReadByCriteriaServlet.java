package controller.servlet.read;

import entity.Commodity;
import service.CommodityService;
import service.impl.CommodityServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/readByCriteriaServlet")
public class ReadByCriteriaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        //获取条件查询参数
        String criteria = request.getParameter("criteria");

        //2.调用service查询
        CommodityService cS = new CommodityServiceImpl();
        List<Commodity> commodities = cS.readByCriteria(criteria);

        //3.将 Commodity 存入 request
        request.setAttribute("commodities",commodities);
        request.setAttribute("criteria",criteria);//将查询条件存入request，返回给前端使用

        //4.转发到list.jsp
        request.getRequestDispatcher("/read.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
