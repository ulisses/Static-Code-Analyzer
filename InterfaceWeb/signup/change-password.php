<?
//***************************************
// This is downloaded from www.plus2net.com //
/// You can distribute this code with the link to www.plus2net.com ///
//  Please don't  remove the link to www.plus2net.com ///
// This is for your learning only not for commercial use. ///////
//The author is not responsible for any type of loss or problem or damage on using this script.//
/// You can use it at your own risk. /////
//*****************************************
include "include/session.php";
include "include/z_db.php";

?>
<!doctype html public "-//w3c//dtd html 3.2//en">

<html>

<head>
<title>(Type a title for your page here)</title>

<meta name="GENERATOR" content="Arachnophilia 4.0">
<meta name="FORMATTER" content="Arachnophilia 4.0">
</head>

<body >
<?
// check the login details of the user and stop execution if not logged in
require "check.php";

echo "<form action='change-passwordck.php' method=post><input type=hidden name=todo value=change-password>

<table border='0' cellspacing='0' cellpadding='0' align=center>
 <tr bgcolor='#f1f1f1' > <td colspan='2' align='center'><font face='verdana, arial, helvetica' size='2' align='center'>&nbsp;<b>Change  Password</b> </font></td> </tr>

<tr bgcolor='#ffffff' > <td ><font face='verdana, arial, helvetica' size='2' align='center'>  &nbsp;New Password  
</font></td> <td  align='center'><font face='verdana, arial, helvetica' size='2' >
<input type ='password' class='bginput' name='password' ></font></td></tr>

<tr bgcolor='#f1f1f1' > <td ><font face='verdana, arial, helvetica' size='2' align='center'>  &nbsp;Re-enter New Password  
</font></td> <td  align='center'><font face='verdana, arial, helvetica' size='2' >
<input type ='password' class='bginput' name='password2' ></font></td></tr>

<tr bgcolor='#ffffff' > <td colspan=2 align=center><input type=submit value='Change Password'><input type=reset value=Reset></font></td></tr>

";


echo "</table>";

require "bottom.php";

?>
<center>
<br><br><a href='http://www.plus2net.com'>PHP SQL HTML free tutorials and scripts</a></center> 

</body>

</html>
