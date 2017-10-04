

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sun.xml.ws.runtime.dev.Session;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.HashMap;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gh-jr
 */
@WebServlet(urlPatterns = {"/StoreTheSession"})
public class old extends HttpServlet {

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
            
            
            String name = (String) request.getParameter("name");
            HttpSession CurrentSession = request.getSession(true); 
            CurrentSession.setAttribute("UName", name);
            CurrentSession.setMaxInactiveInterval(3*60);
            HashMap<String,HttpSession> MySessionManager; 
            ServletContext MyApplicationScope = request.getServletContext();
            MySessionManager = (HashMap) MyApplicationScope.getAttribute("MySessionManager");
            
            MySessionManager.put(CurrentSession.getId().toString(), CurrentSession);
            MyApplicationScope.setAttribute("MySessionManager",MySessionManager); 
            Cookie MyCookie = new Cookie("MyCurrentSession",CurrentSession.getId());
            MyCookie.setMaxAge(3*60);
            response.addCookie(MyCookie);
            
            response.sendRedirect("Intro.jsp");
            /*
            String c = (String) request.getParameter("name");
            HashMap<String,HttpSession> MySessionManager; 
            ServletContext MyApplicationScope = request.getServletContext();
            MySessionManager = (HashMap) MyApplicationScope.getAttribute("MySessionManager");
            if(MySessionManager == null){
                HttpSession ss = request.getSession(true);
                ss.setAttribute("UName",c);
                ss.setMaxInactiveInterval(3*60);
                MySessionManager = new HashMap<>();
                MySessionManager.put("UNameSession",ss);
                MyApplicationScope.setAttribute("MySessionManager",MySessionManager);
                
                out.println("MySessionManager:Map Created and Added To The Application Scope .... :)");
                out.println("Session ID        : "+ss.getId().toString());
                out.println("Session Life Time : "+ss.getMaxInactiveInterval()+" Seconds");
                Cookie MyCookie = new Cookie("MyCurrentSession",ss.getId());
                MyCookie.setMaxAge(3*60);
                response.addCookie(MyCookie);
                out.println("\nCookie has been Created.\nCookie Name : "+MyCookie.getName()+"\nValue : "+MyCookie.getValue()+"\nLife Time : "+MyCookie.getMaxAge());
                response.sendRedirect("newjsp.jsp");
            }
            else{
                out.println(MySessionManager.get("UNameSession").getAttribute("UName").toString());
            }*/
           // response.sendRedirect("Intro.jsp");
            /*if(c.equals("pewpew")){
            //    ServletContext s = request.getServletContext();
                out.println(se.getAttribute(c));
                out.println("DONE ");
            }
            else{
                
                out.println("Failed");
            }
            */
            /* TODO output your page here. You may use following sample code. */
           /*
            out.println(request.getCookies().equals(new Cookie("MycurrentSession","Ghassan")));
           out.println((String)request.getParameter("myname"));
            if(request.getCookies()==null){
                // to do code
                out.println("No Cookies in the request ..... ");
            }
            else{
                Cookie[] C =request.getCookies();
                for(int i=0 ; i <C.length;i++){
                    if(C[i].getName()=="MycurrentSession"){
                        out.println("Cookie Exists ..... ");
                       
                    }
                }
                
            }*/
        }
        finally{
            out.close();
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
