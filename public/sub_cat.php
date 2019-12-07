<?php
 $title= $_POST["title"];
 $par_id = $_POST["par_category"];



 /** Connection to database  */
 $ser_name="localhost";
 $u_name="root";
 $ps="";
 $db = "admin_db";

 $conn = new mysqli($ser_name, $u_name, $ps,$db);
 if($conn -> connect_error){
     die("Connection Rejected ".$conn -> connect_error );
 }

 $query = "INSERT INTO sub_category(Sub_name,parent_id) VALUES ('$title', '$par_id')";

 if(mysqli_query($conn, $query)){
    // echo "Form Submitted";
    echo "<script> location.href = 'http://localhost/woodstreet/public/sub1_category.php'; </script> "; 
 }
 else{
     echo "Cannot submit a form";
 }


?> 