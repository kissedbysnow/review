package controller.servlet.backups;

import service.impl.CommodityServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteServlet")
public class DeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //1.获取id
        String id = request.getParameter("id");
        //2.调用service删除
        CommodityServiceImpl cS = new CommodityServiceImpl();
        cS.delete(id);
        //3.跳转到查询所有Servlet
        response.sendRedirect(request.getContextPath()+"/readServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
