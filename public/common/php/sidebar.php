<?php

$current = basename($_SERVER["SCRIPT_FILENAME"]);

function isActive($page){
    $current = basename($_SERVER["SCRIPT_FILENAME"]);

    if($current == $page){
        echo "active"; 
    }else{
        echo " ";
    }
}

?>

<div class="sidebar">
    <ul class="sidebar-list">
        <li class="<?php isActive("index.php")?>"><a href="index.php"><i class="ion-ios-pie"></i><span>Dashboard</span></a></li>
        <li class="<?php isActive("categories.php");?>"><a href="categories.php"><i class="ion-social-buffer"></i><span>Category</span></a></li>
        <li class="<?php isActive("sub1_category.php");?>"><a href="sub1_category.php"><i class="ion-social-buffer"></i><span>Sub_category</span></a></li>
        <li class="<?php isActive("attributes.php") ?>"><a href="attributes.php"><i class="ion-pricetags"></i><span>Attributes</span></a></li>
        <li class="<?php isActive("products.php")?>"><a href="products.php"><i class="ion-android-apps"></i><span>Product</span></a></li>
        <li class="<?php isActive("orders.php")?>"><a href="orders.php"><i class="ion-android-cart"></i><span>Orders</span></a></li>
        <!-- <li class="<?php isActive("payment.php") ?>"><a href="payment.php"><i class="ion-cash"></i><span>Payment</span></a></li> -->
        <li class="<?php isActive("ui.php")?>"><a href="ui.php"><i class="ion-android-phone-portrait"></i><span>UI</span></a></li>
        <li class="<?php isActive("about.php")?>"><a href="about.php"><i class="ion-android-phone-portrait"></i><span>About us</span></a></li>
        <li class="<?php isActive("contact.php")?>"><a href="contact.php"><i class="ion-android-phone-portrait"></i><span> Contact us</span></a></li>
        <li class="<?php isActive("cancel.php")?>"><a href="cancel.php"><i class="ion-android-cart"></i><span>Cancel policy</span></a></li>

        <li class="<?php isActive("users.php") ?>"><a href="users.php"><i class="ion-person"></i><span>Register Users</span></a></li>
        <!-- <li class="<//?php echo $b_admob; ?>"><a href="admob.php"><i class="ion-closed-captioning"></i><span>Admob</span></a></li> -->
        <li class="<?php isActive("push-notifications.php")?>"><a href="push-notifications.php"><i class="ion-ios-bell"></i><span>Push Notification</span></a></li>
        <!-- <li class="<?php// echo $b_site_config; ?>"><a href="site-config.php"><i class="ion-settings"></i><span>Configuration</span></a></li> -->
        <!-- li class="<?php //echo $b_setting; ?>"><a href="setting.php"><i class="ion-android-settings"></i><span>Setting</span></a></li> -->
    </ul>
</div><!--sidebar-->