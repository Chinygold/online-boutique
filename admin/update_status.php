<?php
include('connect.php');


$get_id=$_GET['id'];

mysqli_query("update order_details set status='Delivered', modeofpayment='MTN Mobile Money' where orderid='$get_id'")or die(mysqli_error());

header('location:orders.php');

?>