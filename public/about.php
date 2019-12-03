<?php require_once('../private/init.php'); ?>

<?php

$errors = Session::get_temp_session(new Errors());
$message = Session::get_temp_session(new Message());
$admin = Session::get_session(new Admin());

if(!empty($admin)){
    $push_obj = new Push_Notification();
    $notifications = $push_obj->where(["admin_id" => $admin->id])->orderBy("id")->desc()->all();
    $site_configuration = new Site_Config();
    $site_configuration = $site_configuration->where(["admin_id" => $admin->id])->one();
}else{
    Helper::redirect_to("login.php");
}

?>

<?php require("common/php/php-head.php"); ?>

<body>
<style> 

.about-desc{
    width : 90%; 
    background : white; 
    border-radius : 10px;
    padding : 15px;
    font-size : 1em;
}
</style> 
<?php require("common/php/header.php"); ?>

<div class="main-container">

	<?php require("common/php/sidebar.php"); ?>
	<div class="main-content">
        <div class="top-header">
				<h4 class="left">About us</h4>
				<!-- <h6 class="right"><b><a class="c-btn" href="push-notification-form.php">Create Notification</a></b></h6> -->
			</div>
            <div class="about-desc"> 
                Amazon.com, Inc., is an American multinational technology company based in Seattle, Washington, that focuses on e-commerce, cloud computing, digital streaming, and artificial intelligence. It is considered one of the 
                Amazon.com, Inc., is an American multinational technology company based in Seattle, Washington, that focuses on e-commerce, cloud computing, digital streaming, and artificial intelligence. It is considered one of the 
                Amazon.com, Inc., is an American multinational technology company based in Seattle, Washington, that focuses on e-commerce, cloud computing, digital streaming, and artificial intelligence. It is considered one of the 
                Amazon.com, Inc., is an American multinational technology company based in Seattle, Washington, that focuses on e-commerce, cloud computing, digital streaming, and artificial intelligence. It is considered one of the 
            </div> 

		</div><!--item-wrapper-->
	</div><!--main-content-->
</div><!--main-container-->


<?php require("common/php/php-footer.php"); ?>