<?php require_once('../private/init.php'); ?>

<?php

$errors = Session::get_temp_session(new Errors());
$message = Session::get_temp_session(new Message());
$push_notification = new Push_Notification();
$admin = Session::get_session(new Admin());

if(!empty($admin)){
    $push_notification->admin_id = $admin->id;
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
        <div class="item-wrapper one">

            <div class="item">

                <?php if($message) echo $message->format(); ?>
                    <div class="item-content">
                        <input type="hidden" name="id" value="<?php echo $push_notification->id; ?>">
                        <input type="hidden" name="admin_id" value="<?php echo $push_notification->admin_id; ?>">
                        <input type="hidden" name="notify-image" value="<?php echo $push_notification->img; ?>"/>

                        <label class="control-label" for="file">Primary Image(<?php echo "Max Image Size : " . MAX_IMAGE_SIZE . "MB. Required Format : png/jpg/jpeg"; ?>)</label>

                        <div class="image-upload">

                            <img src="<?php if(!empty($push_notification->image_name))
                                echo UPLOADED_FOLDER . DIRECTORY_SEPARATOR . $push_notification->img; ?>" alt="" class="uploaded-image"/>

                            <div class="h-100" class="upload-content">
                                <div class="dplay-tbl">
                                    <div class="dplay-tbl-cell">
                                        <i class="ion-ios-cloud-upload"></i>
                                        <h5><b>Choose Your Image to Upload</b></h5>
                                        <h6 class="mt-10 mb-70">Or Drop Your Image Here</h6>
                                    </div>
                                </div>
                            </div><!--upload-content-->
                            <input data-required="image" type="file" name="notify-image" class="image-input"
                                    data-traget-resolution="image_resolution" value="<?php echo $push_notification->img; ?>"/>
                            <input type="hidden" name="image_resolution" value="<?php echo $push_notification->image_resolution; ?>"/>
                        </div>

                    <div class="item-content">
                        <form data-validation="true" action="../private/controllers/push_notification.php"
                              method="post" enctype="multipart/form-data">

                            <input type="hidden" name="id" value="<?php echo $push_notification->id; ?>"/>
                            <input type="hidden" name="admin_id" value="<?php echo $push_notification->admin_id; ?>"/>

                            <label>Title</label>
                            <input type="text" placeholder="Title" name="title" data-required="true"
                                   value="<?php echo $push_notification->title; ?>"/>

                            <label>Message</label>
                            <input type="text"  placeholder="Message" name="message" data-required="true"
                                   value="<?php echo $push_notification->message; ?>" />

                            <div class="btn-wrapper"><button type="submit" class="c-btn mb-10"><b>Save</b></button></div>

                            <?php if($errors) echo $errors->format(); ?>

                        </form>
                    </div><!--item-content-->

                </div><!--item-inner-->
            </div><!--item-->

        </div><!--item-wrapper-->
    </div><!--main-content-->
</div><!--main-container-->



<?php require("common/php/php-footer.php"); ?>