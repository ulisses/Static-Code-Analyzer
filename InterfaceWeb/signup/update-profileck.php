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
//////////////////////////////


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
$todo=$_POST['todo'];
$name=$_POST['name'];
$email=$_POST['email'];
$sex=$_POST['sex'];
// check the login details of the user and stop execution if not logged in
require "check.php";

if(isset($todo) and $todo=="update-profile"){

// set the flags for validation and messages
$status = "OK";
$msg="";

// if name is less than 5 char then status is not ok
if (strlen($name) < 5) {
$msg=$msg."Your name  must be more than 5 char length<BR>";
$status= "NOTOK";}	

// you can add email validation here if required. 
// The code for email validation is available at www.plus2net.com

if($status<>"OK"){ // if validation failed
echo "<font face='Verdana' size='2' color=red>$msg</font><br><input type='button' value='Retry' onClick='history.go(-1)'>";
}else{ // if all validations are passed.
if(mysql_query("update plus_signup set email='$email',name='$name',sex='$sex' where userid='$_SESSION[userid]'")){
echo "<font face='Verdana' size='2' color=green>You have successfully updated your profile<br></font>";
}else{echo "<font face='Verdana' size='2' color=red>There is some problem in updating your profile. Please contact site admin<br></font>";}
}}

require "bottom.php";
?>
<center>
<br><br><a href='http://www.plus2net.com'>PHP SQL HTML free tutorials and scripts</a></center> 

</body>

</html>
