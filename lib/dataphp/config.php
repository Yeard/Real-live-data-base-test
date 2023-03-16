<?php 
  $username="onetiger_yeard";
	$password="@2022shop"; 
	$hostname="localhost";
	$db_name="onetiger_myshop"; 
	

	$connect=mysqli_connect($hostname,$username,$password,$db_name);
    

	if(!$connect)
	{
		//echo json_encode("Connection Failed");
	}

    if($connect){
       // echo json_encode("Connection done!!!");
    }
 

	

	?>