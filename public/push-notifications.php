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

<?php require("common/php/header.php"); ?>

<div class="main-container">

	<?php require("common/php/sidebar.php"); ?>

	<div class="main-content">

		<div class="item-wrapper full">

            <?php if(Session::get_session_by_key("type") == "firebase_auth"){
                Session::unset_session_by_key("type");
                if($errors) echo "<div class='plr-15 mb-15 mt-10'>" . $errors->format() . "</div>";
                if($message) echo "<div class='plr-15 mb-15 mt-10'>" .$message->format() . "</div>";
            }?>


			<div class="item">
				<div class="item-inner">
					
				</div><!--item-inner-->
			</div><!--item-->

		</div><!--item-wrapper-->


		<div class="item-wrapper">

			<div class="top-header">
				<h4 class="left">Notifications</h4>
				<h6 class="right"><b><a class="c-btn" href="push-notification-form.php">Create Notification</a></b></h6>
			</div>

            <?php if(Session::get_session_by_key("type") == "push_notification"){
                Session::unset_session_by_key("type");
                if($errors) echo "<div class='plr-10 mb-20 mt-10'>" . $errors->format() . "</div>";
                if($message) echo "<div class='plr-10 mb-20 mt-10'>" .$message->format() . "</div>";
            }?>

            

            <?php
            if(!empty($notifications)){
                foreach ($notifications as $notification) { ?>
                    <div class="item">
                        <div class="item-inner">
                            <div class="p-25">
                                <div class="two-sided-80">
                                    <div class="left">
                                        <img src="<?php echo "uploads/". $notification->img ?>" alt="image">
                                    </div>
                                    
                                </div><!--$item-->
                            </div>
                            <div class="item-content">
                                <h6 class="color-semi-dark">Notification Title</h6>
                                <h5><?php echo $notification->title; ?></h5>
                                <h6 class="mt-15 color-semi-dark">Description</h6>
                                <h5><?php echo $notification->message; ?></h5>
                            </div><!--item-content-->

                            <div class="item-footer two">

                                <form class="footer-link" action="../private/controllers/send_notification.php" method="post">
                                    <input type="hidden" name="title" value="<?php echo $notification->title; ?>">
                                    <input type="hidden" name="message" value="<?php echo $notification->message; ?>">
                                    <input type="hidden" name="firebase_auth" value="<?php echo $site_configuration->firebase_auth; ?>">
                                    <button type="submit">Notify</button>
                                </form>
                                <a href="<?php echo '../private/controllers/push_notification.php?id=' .
                                    $notification->id . '&&admin_id=' . $notification->admin_id; ?>"
                                   data-confirm="Are you sure you want to delete this item?">Delete</a>
                            </div><!--item-footer-->

                        </div><!--item-inner-->
                    </div><!--item-->
                <?php   }
            } ?>

		</div><!--item-wrapper-->
	</div><!--main-content-->
</div><!--main-container-->


<?php require("common/php/php-footer.php"); ?>