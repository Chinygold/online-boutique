<?php
function OpenCon()
{$dbhost="localhost";
$dbuser="root";
$dbpass="";
$db="db_project";

$conn= new mysqli_connect($dbhost,$dbuser,$dbpass,$db) or die("connect failed:%s\n".$conn->error);
return $conn;
}

function closeCon($conn)
{
	$conn ->close();
}

//mysqli_select_db('db_project',  mysqli_connect('localhost','root',''))or die(mysqli_error());
?>
