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
// Collect the data from post method of form submission // 
$userid=$_POST['userid'];
$password=$_POST['password'];
$password2=$_POST['password2'];
$agree=$_POST['agree'];
$todo=$_POST['todo'];
$email=$_POST['email'];
$name=$_POST['name'];
$sex=$_POST['sex'];

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
if(isset($todo) and $todo=="post"){

$status = "OK";
$msg="";

// if userid is less than 3 char then status is not ok
if(!isset($userid) or strlen($userid) <3){
$msg=$msg."User id should be =3 or more than 3 char length<BR>";
$status= "NOTOK";}					

if(!ctype_alnum($userid)){
$msg=$msg."User id should contain alphanumeric  chars only<BR>";
$status= "NOTOK";}					


if(mysql_num_rows(mysql_query("SELECT userid FROM plus_signup WHERE userid = '$userid'"))){
$msg=$msg."Userid already exists. Please try another one<BR>";
$status= "NOTOK";}					


if ( strlen($password) < 3 ){
$msg=$msg."Password must be more than 3 char legth<BR>";
$status= "NOTOK";}					

if ( $password <> $password2 ){
$msg=$msg."Both passwords are not matching<BR>";
$status= "NOTOK";}					


if ($agree<>"yes") {
$msg=$msg."You must agree to terms and conditions<BR>";
$status= "NOTOK";}	

if($status<>"OK"){ 
echo "<font face='Verdana' size='2' color=red>$msg</font><br><input type='button' value='Retry' onClick='history.go(-1)'>";
}else{ // if all validations are passed.
$query=mysql_query("insert into plus_signup(userid,password,email,name,sex) values('$userid','$password','$email','$name','$sex')");
echo "<font face='Verdana' size='2' color=green>Welcome, You have successfully signed up<br><br><a href=login.php>Click here to login</a><br></font>";
}
}
?>
<center>
<br><br><a href='http://www.plus2net.com'>PHP SQL HTML free tutorials and scripts</a></center> 

</body>

</html>
