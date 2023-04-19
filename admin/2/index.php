<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset="UTF-8" /> 
    <title>
    NACOA Bags Shop
    </title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<div class="form-wrapper">
  
  <form action="#" method="post">
    <h3>Login here</h3>
	
    <div class="form-item">
		<input type="text" name="username" required="required" placeholder="Username" autofocus required></input>
    </div>
    
    <div class="form-item">
		<input type="password" name="password" required="required" placeholder="Password" required></input>
    </div>
    
    <div class="button-panel">
		<input type="submit" name="go" id="go" value="Log in">
	
  </p>
  </center>
</form>
	<?php
							include('connect.php');
							
							if(isset($_POST['go']))
							{
							
							$username=$_POST['username'];
							$password=$_POST['password'];
							
								
								$result = mysql_query("SELECT * FROM tb_user WHERE username = 	'$username' AND password = '$password'") or die(mysql_error());
							
								$row = mysql_fetch_array($result);
								$numberOfRows = mysql_num_rows($result);				
																	
																
																if ($numberOfRows == 0) 
																	{
																		echo " <br><center><font color= 'red' size='3'>Please fill up the fields correctly</center></font>";
																	} 
																else if ($numberOfRows > 0)
																	{
																	session_start();
																	$_SESSION['id'] = $row['user_id'];
																header("location:product.php");
																
															}	
							
												}
							?>
	



</body>
</html>