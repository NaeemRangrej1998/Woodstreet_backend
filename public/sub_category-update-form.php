<?php require_once('../private/init.php'); ?>

<?php

$errors = Session::get_temp_session(new Errors());
$message = Session::get_temp_session(new Message());
$admin = Session::get_session(new Admin());
$deletable_image_ids = "";

$sub_id = $_GET["sub_id"];
$sub_name = $_GET["sub_name"];
$parent_id = $_GET["par_id"];

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

                <form data-validation="true" action="../public/update_subcat.php" method="post" enctype="multipart/form-data">
                    <div class="item-inner">

                        <div class="item-header">
                            <h5 class="dplay-inl-b">Sub_Category</h5>

                        </div><!--item-header-->

                        <div class="item-content">

                            <label>Title</label>
                            <input type="hidden" value="<?php echo $sub_id ?>" name="sub_id">
                            <input type="text" data-required="true" value="<?php echo $sub_name?>"placeholder="Site Title" name="title" value="<?php echo $category->title; ?>"/>
                            
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



<?php require("common/php/php-footer.php"); ?>

</body>