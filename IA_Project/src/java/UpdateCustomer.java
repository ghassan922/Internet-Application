/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gh-jr
 */
@WebServlet(urlPatterns = {"/UpdateAdmin"})
public class UpdateCustomer extends HttpServlet {

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
            String name = request.getParameter("name").toString();
            String pass = request.getParameter("pass").toString();
            String email = request.getParameter("email").toString();
            String agee = request.getParameter("age").toString();
            String phoneNumb = request.getParameter("phone");
            int phone =Integer.parseInt(phoneNumb);
            int age = Integer.parseInt(agee);
            //int CID = Get The customer ID from the Session ..... 
            int CID= 1 ;
            
            
            String url = "jdbc:mysql://localhost:3306/MovieHouse";
            String user = "root";
            String password = "root";
            String query;
            Connection Con =null;
            Statement Stmt = null;

            int RowsAffected = 0 ;

            try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
            try
            {   
                Con = DriverManager.getConnection(url, user, password);
                Stmt =  Con.createStatement();
                
                query = "UPDATE administrator SET"+"Name ='"+name+"',"+
                        "Password ='"+pass+"',"+
                        "Email ='"+email+"'"+
                        "Age ='"+age+"'"+
                        "PhoneNumber ='"+phone+"'"+
                        "WHERE CID = '"+CID+"'";
                        Stmt.executeUpdate(query);
                        
                RowsAffected = Stmt.executeUpdate(query);
            }
            catch(Exception cnfe)
            {
            System.err.println("Exception: " + cnfe);
            }
            
            if(RowsAffected != 0){
                out.println("Update Successfully ... ;)");
                System.out.println("Rows Affected: "+RowsAffected);
            
            }
            else{
                out.println("Update FAILED .... :)");
            }
        
    }}

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
