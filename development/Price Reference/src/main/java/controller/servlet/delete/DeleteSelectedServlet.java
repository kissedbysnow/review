package controller.servlet.delete;

import service.CommodityService;
import service.impl.CommodityServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteSelectedServlet")
public class DeleteSelectedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取所有id
        String[] ids = request.getParameterValues("checkBoxChild");
        //2.调用service删除

        CommodityService cS = new CommodityServiceImpl();
        cS.deleteSelected(ids);

        //3.跳转查询所有Servlet
        response.sendRedirect(request.getContextPath()+"/readByPageServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
