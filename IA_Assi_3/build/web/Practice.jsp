<%-- 
    Document   : newjsp
    Created on : Dec 22, 2016, 10:30:00 PM
    Author     : gh-jr
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INTRO Page</title>
    </head>
    <body>
        <script>
           function sendName(){
               var name =  document.getElementById("Username").value ;
               var xmlhttp = new XMLHttpRequest();
                    
                    xmlhttp.open("GET","StoreTheSession?name="+name,true);
                    xmlhttp.send();
                    xmlhttp.onreadystatechange = function(){
                   if( xmlhttp.readyState == 4 && xmlhttp.status == 200){
                       document.getElementById("ss").innerHTML = xmlhttp.responseText;
                   }
                   }
               
               
           } 
           </script>
           <form action = "StoreTheSession">
           <%
               HashMap<String,HttpSession> MySessionManager;
               Cookie[] MyCookies = request.getCookies();
               for(int i =0 ; i<MyCookies.length;i++){
                   if(MyCookies[i].getName().equals("MyCurrentSession")){
                       
                        MySessionManager = (HashMap) application.getAttribute("MySessionManager");
                       if(MySessionManager == null){
                           // MySessionManager does not exist remove cookie
                       
                       MySessionManager = new HashMap();
                       application.setAttribute("MySessionManager", MySessionManager);
                       %>
                       <h1>WELCOME .. THIS IS YOUR FIRST VISIT ... :)</h1>
                       <b>Enter UserName :</b>
                       <input type="text" name="UName" id="Username">
                       <input type="submit" name="sendbtn"  value="sendName" >
                       </form><%
                           out.println("SessionManager does not exist ... Cookie has been removed ..");
                           MyCookies[i].setMaxAge(0);
                           //response.setIntHeader("Refresh",1);
                           break;
                       }
                       else{
                           // MySessionManager does exist get the session and compare with Cookie value
                            out.println("Session Manager does exist .. ");
                           HttpSession MySession ;
                          
                           MySession = (HttpSession) MySessionManager.get(MyCookies[i].getValue().toString());
                           if(MySession == null ){ 
                                   out.println("Cookie has been removed ... No Session With The Same ID .... ");
                                   MyCookies[i].setMaxAge(0);
                                   //response.setIntHeader("Refresh",1);
                                   break;
                           }
                          /* Iterator iter = (Iterator) MySessionManager.values().iterator();
                            while(iter.hasNext()){
                               //HashMap.Entry entry = (HashMap.Entry) iter.next();
                                MySession =  (HttpSession) iter.next();
                                
                                if(MyCookies[i].getValue()==MySession.getId()){
                                    out.println("Hi, ");
                                    out.println(MySession.getAttribute("UName").toString());*/
                                    %>
           
                                    
                                        <br><input type="submit" value="LogOut" onclick="LogOutServlet">
                                        <br>
                                    <%
                               else{
                                    // Session is found ...print UName attribute and Life Time ...
                                       
                                       out.println(MySession.getAttribute("UName").toString());
                               }
                           }
                       }
                   else{
                       
                        <%
                       
                   }
               }
           
           
           %>
           <br><b><div name="ss" id="ss"></div></b>
           
           </body>
</html>
