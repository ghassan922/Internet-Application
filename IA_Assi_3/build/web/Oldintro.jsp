<%--
    Document   : Intro
    Created on : Nov 29, 2016, 11:52:31 AM
    Author     : gh-jr
--%>

<%@page import="java.awt.Button"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.sun.xml.ws.runtime.dev.SessionManager"%>
<%@page import="java.util.Map"%>
<%@page import="javax.jms.Session"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Intro Page</title>
    </head>
    <body>
        <%--<script>
           function CheckName(){
               var name =  document.getElementById("Username").value ;
               var xmlhttp = new XMLHttpRequest();
                    <%  
                        application.setAttribute("pewpew","MEMEMEME");
                    %>
                    xmlhttp.open("GET","StoreTheSession?name="+name,true);
                    xmlhttp.send();
                    xmlhttp.onreadystatechange = function(){
                   if(xmlhttp.readyState==4 && xmlhttp.status == 200){
                       document.getElementById("ss").innerHTML = xmlhttp.responseText;
                   }
                   }
               
               
           } 
        </script>--%>
    <center><h1>Intro Page</h1>
       
           <form action="StoreTheSession" >
       <%!Integer hitCount = 0;
            
           %>
        <%//** Integer hitCount = (Integer) application.getAttribute("hitCounter");
               // First visit check
           if(hitCount == null || hitCount == 0 )
            {
                int name ;
            out.println("First Visit .... WELCOME ..... :)");
               //**request.setAttribute("myname",(String)"ghassan");
                
            // to do code : input and redirect to store the session servlet
           // Cookie newCookie = new Cookie("MycurrentSession","Ghassan");
            //response.addCookie(newCookie);
            
            hitCount++;
           //**Auto refresh statement
           //*response.setIntHeader("Refresh", 5);
            
            //**response.sendRedirect("StoreTheSession"); 
           %>
                <br>Enter Your Name Here :  
                <input type="text" id="Username" name="Usernam">
                <input type="button" name="chkbtn" value="CheckName" onclick="CheckName()"/>
                <br>
                <b><div id="ss"></div></b>
                <br>
           </form>
            <%
            }
            else 
            {   
                Cookie[]  hh =  request.getCookies();
                for(int i =0 ; i<hh.length;i++){
                    if (hh[i].getName() == "MyCurrentSession"){
                        //out.println(hh[i].getValue());
                        // to do code  : check if SessionManager exists
                        HashMap<String,HttpSession> MySessionManager = (HashMap) application.getAttribute("MySessionManager");
                        if (MySessionManager == null){
                        //Go back to step 1
                        out.println("No Map Found ...");
                        }
                        else{
                            int l = 0; 
                            for(String uu:MySessionManager.keySet()){
                                if(MySessionManager.get(uu).getId()==hh[i].getValue()){
                                    out.println("Session"+(++l));
                                    out.println("HI, +\n"+MySessionManager.get(uu).getAttribute("UName"));
                                    out.println("Session Life Time : "+MySessionManager.get(uu).getMaxInactiveInterval());
                                    %>
                                    <form action="LogOutServlet">
                                        <input type="submit" value="LogOut">
                                    </form>
                                    <%
                                }
                            }  
                        }
                        //HttpSession MySession = MySessionManager.get(hh[i].getValue());
                    }
                    else{
                        // go back to step 1
                           
                    }
                } 
                out.println("You Are Refreshed ... !!!! "+hitCount);
           }
            hitCount++;
            %>
    </body>
</html>
