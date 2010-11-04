<?
error_reporting(E_ERROR | E_PARSE | E_CORE_ERROR);

$dbservertype='mysql';

$servername='127.0.0.1';

$dbusername='root';
$dbpassword='123';

$dbname='signup';



////////////////////////////////////////
////// DONOT EDIT BELOW  /////////
///////////////////////////////////////

connecttodb($servername,$dbname,$dbusername,$dbpassword);
function connecttodb($servername,$dbname,$dbuser,$dbpassword)
{
global $link;
$link=mysql_connect ("$servername","$dbuser","$dbpassword");
if(!$link){die("Could not connect to MySQL");}
mysql_select_db("$dbname",$link) or die ("could not open db".mysql_error());
}
?>
