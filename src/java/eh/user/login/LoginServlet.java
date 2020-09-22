/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eh.user.login;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import eh.bean.event.EventBean;
import eh.bean.user.UserBean;
import eh.businesslogic.event.EventLogic;
import eh.businesslogic.user.UserLogic;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author grdul
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            System.out.println("servlet->LoginServlet");
            RequestDispatcher rd = null;

            String user = request.getParameter("email");

            UserBean userBean = new UserBean();
            userBean.setEmail_address(request.getParameter("email"));
            userBean.setPword(request.getParameter("pword"));

            UserBean login = new UserLogic().getLogin(userBean);

            if (login != null) {

                HttpSession session = request.getSession(true);
                session.setAttribute("currentuser", login);

//                Date date = new Date();
//                String modifiedDate = new SimpleDateFormat("yyyy-MM-dd").format(date);

                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    //get current date time with Date()
                Date date = new Date();
                String curDate = dateFormat.format(date);

                session.setAttribute("currentdate", curDate);

                System.out.println("login.getUni_org_type():" + login.getUni_org_type());
                switch (login.getUni_org_type()) {
                    case "UNIVERSITY":
                        rd = request.getRequestDispatcher("/home-university.jsp");
                        List<EventBean> userEventList = new EventLogic().getUserEventList(login.getUni_org_id());
                        request.setAttribute("userEventList", userEventList);
                        break;
                    case "ORGANIZATION":
                        rd = request.getRequestDispatcher("/home-organization.jsp");
                        break;
                    case "EHUB":
                        List<EventBean> userEventListc = new EventLogic().getUserEventList(0);
                        request.setAttribute("userEventList", userEventListc);
                        rd = request.getRequestDispatcher("/home-admin.jsp");
                        break;

                }

            } else {
                System.err.println("invalid username or password");
                request.setAttribute("msg", "Invalid username or password");
                rd = request.getRequestDispatcher("/login.jsp");
            }

//              rd = request.getRequestDispatcher("/event.jsp");
            rd.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
