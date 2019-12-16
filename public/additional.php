<?php
        $ser_name="localhost";
        $u_name="root";
        $ps="";
        $db = "admin_db";

        $conn = new mysqli($ser_name, $u_name, $ps,$db);
        if($conn -> connect_error){
            
            die("Connection Rejected ".$conn -> connect_error );
        }
        else
        {
            echo "connection established";
        }

        // $query = "SELECT Sub_id,sub_name, id,title FROM sub_category INNER JOIN category on parent_id = id ";
        // $result = $conn->query($query);

        // if ($result->num_rows > 0) {
        //     return $result;
        // } 
    
?>