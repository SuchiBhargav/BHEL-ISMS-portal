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
  
  <script language="javascript">
      function popCR(x){
          document.thisForm112.crno.value=x;
          document.thisForm112.submit();
          
      }
      </script>
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

       


</style>
 </head>
   
        <body>
            <form name="thisForm112" method="POST" action="procICDraft.jsp">
                <input type="hidden" name="crno" value="">
            </form>
            
            <%
                            if( (session.getAttribute("sessionID") != null) &&
                (session.getAttribute("sessionID").toString().equals(session.getId().toString()))){
                %>
    <div id="grad1">
           <div id="img1" class="header"><img src="Logo1_BHEL.jpg"/></div>
        <h1 align="center" ><font color="white" size="10">ISMS Documentation Portal-Dashboard</font></h1>
            </div>

<div class="container-fluid">
    <div class="row">
          <jsp:include page="left2.jsp"/>
          
                       
                       <div>
                <h1><font color="blue">Bharat Heavy Electricals Limited</font></h1>

</div>
    </div>
          <%
              
              Class.forName("oracle.jdbc.OracleDriver");                          
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@10.11.1.49:1521:PSER", "bg", "bg");
		
		
		Statement st=con.createStatement(); 
String query = "select a.CRNO, a.DATEOFCIMP, b.CRTEXT, a.IMPACTAREA, a.BCPREQ, a.RECOMMREASON from CHANGEREQUEST b, CHANGEIMPACT a where a.STATUS='draft' "+
        "and a.CRNO=b.CRNO order by TO_NUMBER(CRNO)";
ResultSet rs = st.executeQuery(query);
int cnt=0;

%>
<table align="center" border="1" bordercolor="blue" width="80%">
    <tr bgcolor="cyan">
        <th width="5%">CR No</th>
        <th width="10%">DATE of Change Impact</th>
        <th width="30%">Change Request</th>
        <th width="25%">Probable Impact Area</th>
        <th width="10%">Whether change may lead to BCP & System backup is Required</th>
        <th width="20%">Recommended/Not Recommended with reasons</th>
        <th>&nbsp;</th>
    </tr>
 <%
        while(rs.next()){
            cnt++;
            out.println("<tr>");
            out.println("<td>"+rs.getString(1)+"</td>");
            out.println("<td>"+rs.getString(2)+"</td>");
            out.println("<td>"+rs.getString(3)+"</td>");
            out.println("<td>"+rs.getString(4)+"</td>");
            out.println("<td>"+rs.getString(5)+"</td>");
            out.println("<td>"+rs.getString(6)+"</td>");
            out.println("<td>"+
   "<input type=\"button\" name=\"btn"+cnt+"\" onClick=\"popCR('"+rs.getString(1)+"');\" value=\"Submit\"></td>");
            out.println("</tr>");
       }
%>   
</table>
          
    <%}else{%>
    <font color="red">Session has expired</font>
    <%}%>
        </body>
</html>