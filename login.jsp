<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script language="javascript">
      function popDB(){
          
          var v = document.getElementById("usertype").value;
          //alert(v);
          if( v == "User")
              document.thisForm.action= "dashboard1.jsp";
          else if( v == "IT-Admin")
              document.thisForm.action= "dashboard2.jsp";
          else
              document.thisForm.action= "dashboard3.jsp";
          
          document.thisForm.submit();
          
      }
      </script>
<style>
    #grad1 {
    height: 200px;
    background: blue; /* For browsers that do not support gradients */
    background: linear-gradient(to bottom right, blue, white); /* Standard syntax (must be last) */
}
    #grad2 {
    height: 300px;
    background: blue; /* For browsers that do not support gradients */
    background: linear-gradient(to bottom right, blue, white); /* Standard syntax (must be last) */
}
  * {
    box-sizing: border-box;
}

/* Create two equal columns that floats next to each other */
.column {
    float: left;
    width: 50%;
    padding: 10px;
    height: 300px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
} 
     #img1{
     left: auto; 
            height:50px;
            width:100px;
           
        } 
       #form3{
            left:650px; 
            height:60px;
            width:180px;
            top:113px;
            font-family:verdana; font-size:12px;
        }
        #form1{
            left:750px; 
            height:60px;
            width:180px;
            top:120px;
            font-family:verdana; font-size:12px;
        }
                #form12{
            left:750px; 
            height:60px;
            width:180px;
            top:170px;
            font-family:verdana; font-size:12px;
        }
        #form2{
            left:940px;
            height:60px; 
            width:250px;
            top:120px; 
            font-family:verdana; 
            font-size:12px;
        } 
        .submit1{
            left:1130px;
            top:135px;
            background:#5b7bc0;
            color:white;
            position:fixed;
            z-index:20;
            height:22px; 
            width:90px; 
            cursor:pointer;
        }
    
    .header{
        width:100%; 
        height:160px; 
        position: fixed; 
        
        top:0; 
        left:;
        color:black; 
        z-index:7;
        font-family:verdana;
        padding-top: 30 px;
        }
</style>
    </head>
    <body>
   
        <div class="header"> <div id="grad1">
        <div id="img1" class="header"><img src="Logo_BHEL.jpg"/></div>
        <div class="login" style="padding: 10">
            <div class = "middle">
            <p align="center" style="padding-left: 30;" hspace="50" ><font color="white" size="15">ISMS Documentation Portal</font></p></div>
            <br>
            <br>
            <div id="form3" class="header">
                <p>User</p>
            <form action="dashboard1.jsp" method="POST" name="thisForm">
  <select name="usertype" id="usertype" size="1">
    <option value="User">User</option>
    <option value="IT-Admin">IT-Admin</option>
    <option value="ISSO">ISSO</option>
   
  </select>
                </div>  
            <div id="form1" class="header">Username<br>
            <input placeholder="Username" type="text" name="uname"/></div>    
            <div id="form2" class="header">Password<br>
            <input placeholder="Enter password" type="password" name="password"/></div>    
        
            <input type="button" placeholder="Enter" class="submit1" value="submit" onClick="popDB();"/>
            <div id="form12" class="header">
                            <%
            String errorFlag = request.getParameter("errorFlag");
            if( errorFlag == null) errorFlag="0";
            
if( errorFlag.equals("1"))
out.println("<font color=\"red\">Incorrect Login/Password</font>");
            %>
            </div>
        </div>    </div></div>
        <br>
            </form>
                <table align="center"><tr><td>
                    

                        </td></tr>
                    <tr><td>
                        <img src="bhel.jpg" alt="bhel" style="width:1350px;height:500px;">
                        </td></tr>
                </table>
       
        <br>
        <div class="row"><div id="grad2">
  <div class="column" style=" padding-top: 5;">
    <h2>Column 1</h2>
    <ul>  
 <li>data</li>  
 <li>data</li>  
 <li>data</li>  
 <li>data</li> 
         <li>data</li>  <li>data</li>  <li>data</li>  <li>data</li>  <li>data</li> 
</ul>  
  </div>
  <div class="column" >
    <h2>Column 2</h2>
    <ul>  
 <li>data</li>  
 <li>data</li>  
 <li>data</li>  
 <li>data</li>   <li>data</li>  <li>data</li>  <li>data</li>  <li>data</li>  <li>data</li>  <li>data</li> 
</ul>  
            </div></div>
</div>
             </body></html>