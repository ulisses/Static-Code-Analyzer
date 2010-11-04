<?
//***************************************
// This is downloaded from www.plus2net.com //
/// You can distribute this code with the link to www.plus2net.com ///
//  Please don't  remove the link to www.plus2net.com ///
// This is for your learning only not for commercial use. ///////
//The author is not responsible for any type of loss or problem or damage on using this script.//
/// You can use it at your own risk. /////
//*****************************************

include "include/z_db.php";// database connection details stored here

?>
<!doctype html public "-//w3c//dtd html 3.2//en">

<html>

<head>
<title>(Type a title for your page here)</title>
<script type="text/javascript"> 
function validate(form) { 
if (!document.form1.agree.checked) { alert("Please Read the guidlines and check the box below  ."); 
 return false; } 
return true;
}
</script>

<meta name="GENERATOR" content="Arachnophilia 4.0">
<meta name="FORMATTER" content="Arachnophilia 4.0">
</head>

<body bgcolor="#ffffff" text="#000000" link="#0000ff" vlink="#800080" alink="#ff0000">

<table border='0' width='50%' cellspacing='0' cellpadding='0' align=center><form name=form1 method=post action=signupck.php onsubmit='return validate(this)'><input type=hidden name=todo value=post>

<tr bgcolor='#f1f1f1'><td align=center colspan=2><font face='Verdana' size='2' ><b>Signup</b></td></tr>
<tr ><td >&nbsp;<font face='Verdana' size='2' >User ID (alphanumeric  chars only)</td><td ><font face='Verdana' size='2'><input type=text name=userid></td></tr>

<tr bgcolor='#f1f1f1'><td >&nbsp;<font face='Verdana' size='2' >Password</td><td ><font face='Verdana' size='2'><input type=password name=password></td></tr>
<tr ><td >&nbsp;<font face='Verdana' size='2' >Re-enter Password</td><td ><font face='Verdana' size='2'><input type=password name=password2></td></tr>


<tr bgcolor='#f1f1f1'><td ><font face='Verdana' size='2' >&nbsp;Email</td><td  ><input type=text name=email></td></tr>
<tr ><td >&nbsp;<font face='Verdana' size='2' >Name</td><td ><font face='Verdana' size='2'><input type=text name=name></td></tr>

<tr bgcolor='#f1f1f1'><td >&nbsp;<font face='Verdana' size='2' >Sex</td><td ><font face='Verdana' size='2'>  <input type='radio' value=male checked name='sex'>Male <input type='radio' value=female  name='sex'>Female</td></tr>

<tr ><td >&nbsp;<font face='Verdana' size='2' >I agree to terms and conditions</td><td ><font face='Verdana' size='2'><input type=checkbox name=agree value='yes'></td></tr>

<tr bgcolor='#f1f1f1'><td align=center colspan=2><input type=submit value=Signup></td></tr>
</table>

<?
require "bottom.php";
?>

<center>
<br><br><font face='Verdana' size='2' ><a href='http://www.plus2net.com'>PHP SQL HTML free tutorials and scripts</a></font></center> 

</body>

</html>
