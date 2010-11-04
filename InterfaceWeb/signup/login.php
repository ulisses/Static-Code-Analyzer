<?

include "include/session.php";

include "include/z_db.php";

?>
<!doctype html public "-//w3c//dtd html 3.2//en">

<html>

<head>
<title>Moshak</title>

<meta name="GENERATOR" content="Arachnophilia 4.0">
<meta name="FORMATTER" content="Arachnophilia 4.0">
</head>
<head>Sistema de submiss&atilde;o</head>
<body bgcolor="#ffffff" text="#000000" link="#0000ff" vlink="#800080" alink="#ff0000">
<form action='loginck.php' method=post>
<table border='0' cellspacing='0' cellpadding='0' align=center>
  <tr id='cat'>
  <tr> <td bgcolor='#f1f1f1' ><font face='verdana, arial, helvetica' size='2' align='center'>  &nbsp;Login ID  &nbsp; &nbsp;
</font></td> <td bgcolor='#f1f1f1' align='center'><font face='verdana, arial, helvetica' size='2' >
<input type ='text' class='bginput' name='userid' ></font></td></tr>

<tr> <td bgcolor='#ffffff' ><font face='verdana, arial, helvetica' size='2' align='center'>  &nbsp;Password  
</font></td> <td bgcolor='#ffffff' align='center'><font face='verdana, arial, helvetica' size='2' >
<input type ='password' class='bginput' name='password' ></font></td></tr>

<tr> <td bgcolor='#f1f1f1' colspan='2' align='center'><font face='verdana, arial, helvetica' size='2' align='center'>  
<input type='submit' value='Submit'> <input type='reset' value='Reset'>
</font></td> </tr>


<tr> <td bgcolor='#ffffff' ><font face='verdana, arial, helvetica' size='2' align='center'> &nbsp;<a href='signup.php'>New Member Sign UP</a></font></td> <td bgcolor='#ffffff' align='center'><font face='verdana, arial, helvetica' size='2' ><a href=forgot-password.php>
Forgot Password</a> ?</font></td></tr>

<tr> <td bgcolor='#f1f1f1' colspan='2' align='center'><font face='verdana, arial, helvetica' size='2' align='center'>  
&nbsp;</font></td> </tr>


</table></center></form>
<?
require "bottom.php";
?>
<center>
<br><br><a href='http://www.plus2net.com'>PHP SQL HTML free tutorials and scripts</a></center> 

</body>

</html>
