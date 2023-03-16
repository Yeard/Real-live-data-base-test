<?php
include "config.php";

$query="SELECT `name`, `email`, `mobile` FROM `registereduser`";
$exe=mysqli_query($connect,$query);
$arr=[];

while($row=mysqli_fetch_array($exe)){

    $arr[]=$row;
}
print(json_encode($arr))

?>