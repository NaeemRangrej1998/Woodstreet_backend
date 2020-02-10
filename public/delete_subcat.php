<?php
    $prod_id = $_GET["del_id"]; 
    // $prod_name = $_POST["title"];
    // $par_id = $_POST["par_category"];

    $ser_name="localhost";
    $u_name="root";
    $ps="";
    $db = "admin_db";
    
    $conn = new mysqli($ser_name, $u_name, $ps,$db);
    if($conn -> connect_error){
        die("Connection Rejected ".$conn -> connect_error );
    }
    
    $query = "DELETE FROM sub_category  WHERE Sub_id = '$prod_id'";
    if(mysqli_query($conn, $query)){
        echo "<script> alert('Sub category deleted ');location.href = 'http://localhost/woodstreet/public/sub1_category.php'; </script> "; 
    }
    else{
     echo "Cannot submit a form";
    }
    echo "naim rangrej"

?>