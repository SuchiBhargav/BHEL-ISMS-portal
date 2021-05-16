<%-- 
    Document   : isso
    Created on : 15 Jun, 2018, 3:59:04 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<style>
             #grad1 {
    height: 100px;
    background: blue; /* For browsers that do not support gradients */
    background: linear-gradient(to bottom right, blue, white); /* Standard syntax (must be last) */
}
             #grad2 {
    height: 900px;
    background: blue; /* For browsers that do not support gradients */
    background: linear-gradient(to bottom right, blue, white); /* Standard syntax (must be last) */
}
            #img1{
     left: auto; 
            height:30px;
                width:50px;
            }

            .btn:hover {
    background-color: white;
}
            .btn {
    background-color:white;
    border: none;
    color: black;
    padding: 12px 16px;
    font-size: 16px;
    cursor: pointer;
    float : right;
}
</style>
    </head>
    <body>
       <div id="grad1">
           <div id="img1" class="header"><img src="Logo1_BHEL.jpg"/></div>
        <h1 align="center" ><font color="white" size="10">ISMS Documentation Portal-Dashboard</font></h1>
            </div>
        
         <button class="btn" align><i class="fa fa-sign-out" aria-hidden="true"></i><a href ="login.jsp"/>Signout</button>
                       <button class="btn" align><i class="fa fa-home"></i><a href ="dashboard1.jsp"/>Dashboard</button>
   
     <jsp:include page="left3.jsp"/></body>
</html>
