package controller.servlet.create;

import entity.Commodity;
import org.apache.commons.beanutils.BeanUtils;
import service.impl.CommodityServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/createServlet")
public class CreateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //1.设置编码
        request.setCharacterEncoding("UTF-8");
        //2.获取参数
        Map<String, String[]> map = request.getParameterMap();

        //3.封装对象
        Commodity c = new Commodity();
        try {
            BeanUtils.populate(c, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //4.调用Service保存
        CommodityServiceImpl cS = new CommodityServiceImpl();
        cS.create(c);

        //5.跳转到userListServlet
        response.sendRedirect(request.getContextPath() + "/readServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
