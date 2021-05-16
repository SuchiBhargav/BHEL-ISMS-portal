<!DOCTYPE html>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<html>
    <head>
        <title>Change implemented</title>
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

.table-editable {
  position: relative;
            width: 900px;
  
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
  .glyphicon {
    font-size: 20px;
  }


.table-remove {
  color: #700;
  cursor: pointer;
  
  &:hover {
    color: #f00;
  }
}

.table-up, .table-down {
  color: #007;
  cursor: pointer;
  
  &:hover {
    color: #00f;
  }
}

.table-add {
  color: #070;
  cursor: pointer;
  position: absolute;
  top: 8px;
  right: 0;
  
  &:hover {
    color: #0b0;
  }
}     
</style>
 </head>
   
        <body>
         <%
                java.util.Date dt = new java.util.Date();
                SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                String  curdate = formatter.format(dt);
                
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
        <button class="btn" align><i class="fa fa-sign-out" aria-hidden="true"></i><a href ="login.jsp"/>Signout</button>
                       <button class="btn" align><i class="fa fa-home"></i><a href ="dashboard1.jsp"/>Dashboard</button>
          
        <main class="col-md-9 col-xs-11 p-l-2 p-t-2">
            <a href="#sidebar" data-toggle="collapse"><i class="fa fa-navicon fa-lg"></i></a>
            
                   <div class="page-header">
                       <%
                           String crno = request.getParameter("crno");
                           Class.forName("oracle.jdbc.OracleDriver");                          
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@10.11.1.49:1521:PSER", "bg", "bg");
		
		String crtext="";
		Statement st=con.createStatement();
                String qry = "select CRTEXT from CHANGEREQUEST where CRNO='"+crno+"'";
                ResultSet rs = st.executeQuery(qry);
                
if(rs.next()){
   crtext = rs.getString(1); 
}
                           %>
<form action="procCI.jsp" method="POST" name="thisForm">
                <h1><font color="blue">Bharat Heavy Electricals Limited</font></h1>
                       <h3 align="center" ><font color="black" >Format for Change Implemented</font></h3><hr>
        <h4 align="right" ><font color="black" >Document No. =  <input type="text" name="firstname" value="<%=crno%>" disabled="true"></font></h4>
            </div>
            <div class="container">
  <div id="table" class="table-editable">
  
    <table class="table">
      <tr>
        <th width="10%">Change Request No.(&#42;)</th>
        <th width="10%">Date</th>
          <th width="50%">Change Requested</th>
          <th width="50%">Impact Analysis Details</th>
        <th width="50%">Change Approved By</th>
       <th width="50%">Actual Changes made and its impact</th>
        </tr>
      <tr>
          <td><textarea name="crno" rows="5" cols="10" readonly="true"><%=crno%></textarea></td>
        <td><textarea name="curdate" rows="5" cols="10" readonly="true"><%=curdate%></textarea></td>
        <td><textarea name="crtext" rows="10" cols="20" readonly="true"><%=crtext%></textarea></td>
        <td><textarea name="impactanalysis" rows="10" cols="20"></textarea></td>
        <td><textarea name="changeapprovedby" rows="10" cols="20"><%=session.getAttribute("name").toString()%></textarea></td>
          <td><textarea name="actualchanges" rows="10" cols="20"></textarea></td>
        
      </tr>
      <!-- This is our clonable table line -->
      <tr class="hide">
        <td contenteditable="true">Untitled</td>
        <td contenteditable="true">undefined</td>
        
      </tr>
    </table>
  </div>
  
  
</div>

             <div id="form3" class="header">
                <p>Select</p>
            
  <select name="status">
    <option value="draft">Save as Draft</option>
    <option value="final">Final submission</option>
  
   
  </select>
               </div>  
      <div>    <input type="submit" placeholder="Enter" class="submit1" value="submit"/></div>   
        </main>
    </div>
     </form>
<h4 align ="center"><strong>Forwarded to ISSO<br>
    Inmitation to User<br>

    &#42; It should be Unique No example,CRN-060-01,<br>
    06 is for the year 2006-07 01 is running serial no.</strong></h4>
            </div>
    </body>
    <%}
else{%>
<font color="red">Session has expired</font>
<%}%>
</html>