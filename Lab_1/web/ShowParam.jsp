<%-- 
    Document   : ShowParam
    Created on : Oct 9, 2016, 12:00:38 PM
    Author     : gh-jr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assignment #1</title>
    </head>
    
    <body>
        <%
            String s= request.getParameter("counter");
        %>
        <%=s%>
        <hr/>
    <center><h2>Thanks for using Assignment #1</h2></center>
        <br/>
           
           
                    
                         <%
                             int temp; 
                            int square = Integer.parseInt(request.getParameter("counter"));
                            int row = square*2;
                            int counter = 0 ;
                            for( int h=1 ; h<row ; h++){
                                temp = h ;
                                counter = 1 ;
                         %> 
                         <table border ="1" width ="500" background="blue">
                             
                                <tr>
                            <%
                                for(int col = 0 ; col<square ; col++){
                            
                                    if(h<=square)
                                    {if(h<=col){%>                          
                                        <td >
                                <center> <%=" "%>
                                        </td>
                                        <%
                                        }else{%>
                                <td bgcolor="blue"> 
                                            <center> <%="*" %>
                                        </td>
                                        
                                        <%}}
                               if(h>square){
                                     
                                    if((h-col)>=col && !((h-square)>=(square-col))){%>                          
                                        <td bgcolor ="blue">
                                        <center>  <%="*"%>
                                        </td>
                                        <%}else{%>
                                <td > 
                                            <center> <%=" " %>
                                        </td>
                                       <% }                                 
                                }
                                    }%>
                                
                                </tr>
                                </table>

                            <%}%>
                
            
    </body>
</html>
