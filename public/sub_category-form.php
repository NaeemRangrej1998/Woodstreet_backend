<?php require_once('../private/init.php'); ?>

<?php

$errors = Session::get_temp_session(new Errors());
$message = Session::get_temp_session(new Message());
$admin = Session::get_session(new Admin());
$deletable_image_ids = "";

if(!empty($admin)){

    $category = new Category();
    $category->admin_id = $admin->id;
    $category->status = 1;
    $all_categories = new Category();
    $all_categories = $all_categories->where(["status"=>1])->all();

    if(Helper::is_get() && isset($_GET["id"])){
        $category->id = $_GET["id"];
        $category = $category->where(["id" => $category->id])->andwhere(["admin_id" => $admin->id])->one();
    }
}else Helper::redirect_to("login.php");
    $ser_name="localhost";

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

                <form data-validation="true" action="../public/sub_cat.php" method="post" enctype="multipart/form-data">
                    <div class="item-inner">

                        <div class="item-header">
                            <h5 class="dplay-inl-b">Sub_Category</h5>

                            <h5 class="float-r oflow-hidden">
                                <label class="status switch">
                                    <input type="checkbox" name="status"
                                        <?php if($category->status == 1) echo "checked"; ?>/>
                                    <span class="slider round">
                                        <b class="active">Active</b>
                                        <b class="inactive">Inactive</b>
                                    </span>
                                </label>
                                <span class="toggle-title"></span>
                            </h5>
                        </div><!--item-header-->

                        <div class="item-content">

                            <label>Title</label>
                            <input type="text" data-required="true" placeholder="Site Title" name="title" value="<?php echo $category->title; ?>"/>
                            
                            <label>Parent category </label>
                            <?php if($all_categories > 0){ ?>
                                <select name="par_category" data-required="dropdown">
                                    <option selected="true" disabled="disabled">Please select a category</option>
                                    <?php foreach($all_categories as $item){ ?>
                                        <?php if($product->category == $item->id) $selected_cat = "selected";
                                            else $selected_cat = ""; ?>

                                        <option value="<?php echo $item->id; ?>"  <?php echo $selected_cat; ?>><?php echo $item->title; ?></option>
                                    <?php }?>
                                </select>
                            <?php  } ?>    
                            <div class="btn-wrapper"><button  type="submit" class="c-btn mb-10"><b>Save</b></button></div>
                            
                            <?php if($errors) echo $errors->format(); ?>

                        </div><!--item-content-->
                    </div><!--item-inner-->

                </form>
            </div><!--item-->

        </div><!--item-wrapper-->
    </div><!--main-content-->
</div><!--main-container-->

<?php echo "<script>maxUploadedFile = '" . MAX_IMAGE_SIZE  . "'</script>"; ?>
<?php echo "<script>maxUploadedFileCount = '" . MAX_FILE_COUNT  . "'</script>"; ?>
<?php echo "<script>adminId = '" . $admin->id  . "'</script>"; ?>


<?php require("common/php/php-footer.php"); ?>

</body>
<!-- 
    change redirection of sub-cat.php to sub-category 
 -->