<%-- 
    Document   : dashboard3
    Created on : 18 Jun, 2018, 11:08:12 AM
    Author     : HP
--%>

<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>

<html>
    <head>
        <title>Dashboard</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
            <%
                String uname=request.getParameter("uname");
                String passwd=request.getParameter("password");
                
				Class.forName("oracle.jdbc.OracleDriver");                          
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@10.11.1.49:1521:PSER", "bg", "bg");
		
		
		PreparedStatement st=con.prepareStatement("select count(*) from bg_employee_view where username=? and password=?");
		//Statement st4=con4.createStatement();
		//st.setString(1, uname);
                //st.setString(2,passwd);
                
                
		ResultSet rs=null;
		//rs= st.executeQuery();
                
boolean flag=false;
int cnt=0;
if( uname.equals("isso") && passwd.equals("isso123")){
   flag = true;
  
}
if(flag){
    
  	//Class.forName("oracle.jdbc.OracleDriver");                          
        //Connection con1 = DriverManager.getConnection("jdbc:oracle:thin:@10.11.1.49:1521:PSER", "bg", "bg");
	//PreparedStatement st1=con.prepareStatement("select name, deptt_description, loc_desc from bg_employee_view where username=?");
  //st1.setString(1, uname);
  //ResultSet rs1=st1.executeQuery();
      
      String name="ISSO";
      String dept="IT, SYS & MSX";
      String loc = "KOLKATA";
      
      session.setAttribute("empid", uname);
      session.setAttribute("name", name);
      session.setAttribute("dept", dept);
      session.setAttribute("loc", loc);
      
      String sessionID = (String) session.getId();
session.setAttribute("sessionID", sessionID );
  
}
if((session.getAttribute("sessionID") != null) &&
                (session.getAttribute("sessionID").toString().equals(session.getId().toString()))){%>

           
    <div id="grad1">
           <div id="img1" class="header"><img src="Logo1_BHEL.jpg"/></div>
        
        <h1 align="center" ><font color="white" size="10">ISMS Documentation Portal-Dashboard</font></h1></div>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="left3.jsp"/>

         <button class="btn" align><i class="fa fa-sign-out" aria-hidden="true"></i><a href ="login.jsp"/>Signout</button>
        <main class="col-md-9 col-xs-11 p-l-2 p-t-2">
            <a href="#sidebar" data-toggle="collapse"><i class="fa fa-navicon fa-lg"></i></a>
            
                   <div class="page-header">
                       
                <h1><font color="blue">Bharat Heavy Electricals Limited</font></h1>
            </div>
            <p class="lead">This Portal is created for-<br>
            </p>
            <ul>
            <li>sdsafa</li><br><li>sdsafa</li><br><li>sdsafa</li><br><li>sdsafa</li><br><li>sdsafa</li><br><li>sdsafa</li><br><li>sdsafa</li><br></ul>
        </main>
    </div>
</div>
<%}else{

response.sendRedirect("login.jsp?errorFlag=1");
}%>
    </body>
</html>

