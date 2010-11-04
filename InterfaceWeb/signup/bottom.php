<?
////// To update session status for plus_login table to get who is online ////////
if(isset($_SESSION['id'])){
$tm=date("Y-m-d H:i:s");
$q=mysql_query("update plus_login set status='ON',tm='$tm' where id='$_SESSION[id]'");
echo "<center><font face='Verdana' size='2' ><br>Welcome $_SESSION[userid] Click <a href=logout.php>here to logout</a> &nbsp; | &nbsp; <a href=change-password.php>Change Password</a>| &nbsp; <a href=update-profile.php>Update Profile</a><br></center></font>";
echo mysql_error();}
else{
echo "<center><font face='Verdana' size='2' ><a href=login.php>Already a member, please Login</a> </center></font>";

}

///// ////////////// End of updating login status for who is online ///////

// Find out who is online /////////
$gap=10; // change this to change the time in minutes, This is the time for which active users are collected. 
$tm=date ("Y-m-d H:i:s", mktime (date("H"),date("i")-$gap,date("s"),date("m"),date("d"),date("Y")));
//// Let us update the table and set the status to OFF 
////for the users who have not interacted with 
////pages in last 10 minutes ( set by $gap variable above ) ///

$ut=mysql_query("update plus_login set status='OFF' where tm < '$tm'");
echo mysql_error();
/// Now let us collect the userids from table who are online ////////
$qt=mysql_query("select userid from plus_login where tm > '$tm' and status='ON'");
echo mysql_error();

while($nt=mysql_fetch_array($qt)){
echo "$nt[userid],";
}



?>