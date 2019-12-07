<?php
    $prod_id = $_POST["sub_id"]; 
    $prod_name = $_POST["title"];
    $par_id = $_POST["par_category"];

    $ser_name="localhost";
    $u_name="root";
    $ps="";
    $db = "admin_db";
    
    $conn = new mysqli($ser_name, $u_name, $ps,$db);
    if($conn -> connect_error){
        die("Connection Rejected ".$conn -> connect_error );
    }
    
    $query = "UPDATE sub_category SET Sub_name = '$prod_name', parent_id = '$par_id' WHERE Sub_id = '$prod_id'";
    if(mysqli_query($conn, $query)){
    // echo "Form Submitted";
    echo "<script> location.href = 'http://localhost/woodstreet/public/sub1_category.php'; </script> "; 
 }
 else{
     echo "Cannot submit a form";
 }


?>