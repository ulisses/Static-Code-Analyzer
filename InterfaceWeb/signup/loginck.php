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

$userid=$_POST['userid'];
$password=$_POST['password'];
?>
<!doctype html public "-//w3c//dtd html 3.2//en">

<html>

<head>
<title>(Type a title for your page here)</title>
<meta name="GENERATOR" content="Arachnophilia 4.0">
<meta name="FORMATTER" content="Arachnophilia 4.0">
</head>

<body bgcolor="#ffffff" text="#000000" link="#0000ff" vlink="#800080" alink="#ff0000">
<?
$userid=mysql_real_escape_string($userid);
$password=mysql_real_escape_string($password);

if($rec=mysql_fetch_array(mysql_query("SELECT * FROM plus_signup WHERE userid='$userid' AND password = '$password'"))){
	if(($rec['userid']==$userid)&&($rec['password']==$password)){
	 include "include/newsession.php";


$tm=date("Y-m-d H:i:s");

//$ip=@$REMOTE_ADDR; 
// The above line is commented and the line below is used for the servers where register_global=Off
$ip=$_SERVER['REMOTE_ADDR'];

echo $ip;
$rt=mysql_query("insert into plus_login(id,userid,ip,tm) values('$_SESSION[id]','$_SESSION[userid]','$ip','$tm')");

echo mysql_error();
            echo "<p class=data> <center>Successfully,Logged in<br><br><a href='logout.php'> Log OUT </a><br><br><a href=welcome.php>Click here if your browser is not redirecting automatically or you don't want to wait.</a><br></center>";
     print "<script>";
       print " self.location='welcome.php';"; // Comment this line if you don't want to redirect
          print "</script>";

				} 
		}	
	else {

		session_unset();
echo "<font face='Verdana' size='2' color=red>Wrong Login. Use your correct  Userid and Password and Try <br><center><input type='button' value='Retry' onClick='history.go(-1)'></center>";
		
	}
?>
<center>
<br><br><a href='http://www.plus2net.com'>PHP SQL HTML free tutorials and scripts</a></center> 

</body>

</html>
