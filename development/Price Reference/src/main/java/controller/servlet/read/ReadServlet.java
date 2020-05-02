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

@WebServlet("/readServlet")
public class ReadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CommodityService commodityService = new CommodityServiceImpl();
        List<Commodity> commodities = commodityService.read();

        request.setAttribute("commodities",commodities);

        //        request.getRequestDispatcher("/findUserByPageServlet").forward(request,response);
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
