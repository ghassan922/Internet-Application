<%-- 
    Document   : newjsp
    Created on : Dec 23, 2016, 11:34:47 AM
    Author     : gh-jr
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
           function LogOut(){
               
               var xmlhttp = new XMLHttpRequest();
                    
                    xmlhttp.open("GET","LogOutServlet?",true);
                    xmlhttp.send();
                    xmlhttp.onreadystatechange = function(){
                   if( xmlhttp.readyState == 4 && xmlhttp.status == 200){
                       document.getElementById("ss").innerHTML = xmlhttp.responseText.toString();
                   }
                   }
               
               
           } 
           </script>
        <form action="StoreTheSession">
        <%
            Cookie c =new Cookie("test",null);
        Cookie[] MyCookie = request.getCookies();
        for(int i = 0 ; i<MyCookie.length;i++){
             out.println(MyCookie[i].getName().toString());
             if(MyCookie[i].getName().equals("MyCurrentSession")){
                
                c=MyCookie[i];
             }
             //out.println(c.getName().toString());
        }
           
            HashMap<String,HttpSession> MySessionManager = (HashMap) application.getAttribute("MySessionManager");
           // if(!MyCookie[i].getName().equals("MyCurrentSession")){
                 //if(!c.getName().equals("MyCurrentSession")){
                //out.println("Cookie does not exist ...... !!!!!");
                if(MySessionManager == null ){
                    out.println("MySessionManager Does Not Exist .... ");
                    MySessionManager = new HashMap();
                    application.setAttribute("MySessionManager",MySessionManager);
                }%>
                <h1>WELCOME ...... ;)</h1>
                <br>
                <b>Enter UserName :</b>
                <input type="text" name="UserName" >
                <input type ="submit" value="Send">
        </form>
                <%
                
                
            //}
            //else{
               /* out.println("Cookie is found");
                if(MySessionManager == null){
                    out.println("Cookie is found but No SessionManager .... ");
                    c.setMaxAge(0);
                    c.setPath("/");
                    response.addCookie(c);
                    MySessionManager = new HashMap();
                    application.setAttribute("MySessionManager",MySessionManager);
                */
                %>
                <h1>WELCOME ...... ;)</h1>
                <br>
                <b>Enter UserName :</b>
                <input type="text" name="UserName" >
                <input type ="submit" value="Send">
    </form> 
                <%
               // }
                else{
                    out.println("Cookie is found and SessionManager is found ... ");
                    String CookieSessionId = c.getValue().toString();
                    HttpSession MySession = MySessionManager.get(CookieSessionId);
                        if(MySession.getAttribute("UName") == null){
                            out.println("UName is not found .... ");
                            c.setMaxAge(0);
                            c.setPath("/");
                            response.addCookie(c);
                            MySessionManager = new HashMap();
                            application.setAttribute("MySessionManager",MySessionManager);
                
                            %>
                            <h1>WELCOME ...... ;)</h1>
                            <br>
                            <b>Enter UserName :</b><input type="text" name="UserName" >
                            <input type ="submit" value="Send">
                            </form>
                            <%
                        }
                        else{
                        out.println("Hi, ");
                        out.println((String) MySession.getAttribute("UName"));
                        out.println("Current Opened Sessions : ");
                        out.println(MySessionManager.size());
                        %>
                        <form action="LogOutServlet">
                            <input type="button" name="outbtn" id="outbtn" value="LogOut"  onclick="sendname()" />
                           
                        </form>
                        
                        
                        <%
                        }
            }
        }
//}
        %>
       
    </body>
</html>
