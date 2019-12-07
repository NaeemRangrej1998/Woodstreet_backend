 <?php require_once('../private/init.php'); ?>

<?php
$errors = Session::get_temp_session(new Errors());
$message = Session::get_temp_session(new Message());
$admin = Session::get_session(new Admin());

if(!empty($admin)){
    $all_categories = new Category();

    $pagination = "";
    $pagination_msg = "";

    if(Helper::is_get()){
        $page = Helper::get_val('page');
        if($page){
            $pagination = new Pagination($all_categories->count(), BACKEND_PAGINATION, $page, "Sub_category.php");
            if(($page > $pagination->get_page_count()) || ($page < 1)) $pagination_msg = "Nothing Found.";
        }else {
            $page = 1;
            $pagination = new Pagination($all_categories->count(), BACKEND_PAGINATION, $page, "categories.php");
        }
    }

    $start = ($page - 1) * BACKEND_PAGINATION;
    $all_categories = $all_categories->where(["admin_id" => $admin->id])->orderBy("id")->desc()->limit($start, BACKEND_PAGINATION)->all();
    function get_subcategory(){
        $ser_name="localhost";
        $u_name="root";
        $ps="";
        $db = "admin_db";

        $conn = new mysqli($ser_name, $u_name, $ps,$db);
        if($conn -> connect_error){
            die("Connection Rejected ".$conn -> connect_error );
        }

        $query = "SELECT Sub_id,sub_name, id,title FROM sub_category INNER JOIN category on parent_id = id ";
        $result = $conn->query($query);

        if ($result->num_rows > 0) {
            return $result;
        } 
    }
    $all_sub_cat = get_subcategory();
}else Helper::redirect_to("login.php");

?>


<?php require("common/php/php-head.php"); ?>

    <body>

<?php require("common/php/header.php"); ?>

    <div class="main-container">

        <?php require("common/php/sidebar.php"); ?>

        <div class="main-content">
            <?php if($message) echo $message->format(); ?>

            <div class="oflow-hidden mb-15 mb-xs-0">
                <h4 class="float-l mb-15 lh-45 lh-xs-40">Sub_categories</h4>
                <h6 class="float-r mb-15"><b><a class="c-btn" href="Sub_category-form.php">+ Add Sub_category</a></b></h6>
            </div>

            <?php if(!empty($pagination_msg)) echo $pagination_msg; ?>

            <div class="item-wrapper">
                <div class="masonry-grid four">

                    <?php if(count($all_sub_cat) > 0){
                        foreach ($all_sub_cat as $item){ ?>

                            <div class="masonry-item">
                                <div class="item">

                                    <div class="item-inner">

                                        <!-- <div class="video-header">
                                            <h6 class="all-status video-status"><?php
                                                // if($item->status == 1) echo "<span class='active'>Active</span>";
                                                // else echo "<span class='inactive'>Inactive</span>"; ?>
                                            </h6>
                                        </div> -->

                                        <div class="p-25">
                                            <div class="two-sided-80">
                                                <div class="center">
                                                    <h4 class=""><?php echo $item["sub_name"]; ?></h4>
                                                </div>
                                                <div class="right">
                                                    <h4 class=""><?php echo $item["title"]; ?></h4>
                                                </div>
                                            </div><!--$item-->
                                        </div><!--item-inner-->

                                        <div class="item-footer two">
                                            <a href="<?php echo 'sub_category-update-form.php?sub_id=' . $item["Sub_id"] . "&sub_name=".$item["sub_name"] . "&par_id=".$item["id"] ?>"><i class="ion-compose"></i></a>
                                            <a data-confirm = "Are you sure?" href="<?php echo '../private/controllers/Sub_category.php?id=' . $item->id . '&&admin_id=' . $item->admin_id; ?>">
                                                <i class="ion-trash-a"></i></a>
                                        </div><!--item-footer-->

                                    </div><!--item-inner-->
                                </div><!--item-->
                            </div><!--masonry-item-->

                        <?php }
                    } ?>

                </div><!--masonry-grid-->
            </div><!--item-wrapper-->

            <?php echo $pagination->format(); ?>

        </div><!--main-content-->
    </div><!--main-container-->

<?php require("common/php/php-footer.php"); ?> 