<%-- 
    Document   : index
    Created on : Nov 27, 2016, 12:08:41 PM
    Author     : gh-jr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%
                Model.Course crs =(Model.Course) session.getAttribute("course");
                if(crs == null){
                    session.setAttribute("Course",new Model.Course());
                    // if Course has a constructor otherwise declare an object and initilize it 
                }
            %>
    </body>
</html>
