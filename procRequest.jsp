<!DOCTYPE html>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<html>
    <head>
        <title>Process Change Request</title>
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

       @import "compass/css3";


</style>
 </head>
   
        <body><%
                            if( (session.getAttribute("sessionID") != null) &&
                (session.getAttribute("sessionID").toString().equals(session.getId().toString()))){
                %>
    <div id="grad1">
           <div id="img1" class="header"><img src="Logo1_BHEL.jpg"/></div>
        <h1 align="center" ><font color="white" size="10">ISMS Documentation Portal-Dashboard</font></h1>
            </div>
<div class="container-fluid">
    <div class="row">
          <jsp:include page="left1.jsp"/>
          <%
              String crtext = request.getParameter("crtext");
              String status = request.getParameter("status");
              
              Class.forName("oracle.jdbc.OracleDriver");                          
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@10.11.1.49:1521:PSER", "bg", "bg");
		
		
		Statement st=con.createStatement();
                
                String qry = "select MAX(TO_NUMBER(CRNO)) from CHANGEREQUEST";
                ResultSet rs = st.executeQuery(qry);
                
                int crno=1;
                int cnt=0;
                if(rs.next()){
                   if( rs.getString(1) == null)
                       cnt=0;
                   else
                    cnt = Integer.parseInt(rs.getString(1));
                    
                    if( cnt < 1)
                        crno=1;
                    else
                        crno=cnt +1;
                }
		//Statement st4=con4.createStatement();
		String qry1 = "insert into CHANGEREQUEST values('"+crno+"', TO_CHAR(sysdate, 'dd/MM/yyyy'), '"+
                session.getAttribute("loc").toString()+"', '"+
                session.getAttribute("dept").toString()+"', '"+
                session.getAttribute("name").toString()+"', '"+
                crtext+"', '"+status+"', '0', '0', '"+session.getAttribute("empid").toString()+"')"; 
int execStatus = st.executeUpdate(qry1);
if( 1== execStatus)
out.println("Change Request No.<font color=\"blue\">" + crno +"</font> has been successfully raised..");
else
out.println("<font color=\"red\">Error: Change Request could not be raised...</font>");
                
              %>
    </div></div>
    <%}else{%>
    <font color="red">Session has expired</font>
    <%}%>
        </body>
</html>