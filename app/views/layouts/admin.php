<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <base href="/adminlte/">
    <link rel="icon" href="<?= PATH; ?>/lib/img/logo.ico">
    <?= $this->getMeta(); ?>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
            </li>
        </ul>

        <!-- SEARCH FORM -->
<!--        <form class="form-inline ml-3">-->
<!--            <div class="input-group input-group-sm">-->
<!--                <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">-->
<!--                <div class="input-group-append">-->
<!--                    <button class="btn btn-navbar" type="submit">-->
<!--                        <i class="fa fa-search"></i>-->
<!--                    </button>-->
<!--                </div>-->
<!--            </div>-->
<!--        </form>-->

        <!-- Logout -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/user/logout">Log Out</a>
            </li>
        </ul>

        <!-- Right navbar links -->
        <!-- ... -->
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="<?= PATH; ?>" class="brand-link" target="_blank">
            <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
                 style="opacity: .8">
            <span class="brand-text font-weight-light">Utile</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <a href="<?= ADMIN; ?>/user/edit?id=<?= $_SESSION['user']['id']; ?>" class="d-block"><?= $_SESSION['user']['name']; ?></a>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
                         with font-awesome or any other icon font library -->
                    <li class="nav-item">
                        <a href="<?= ADMIN; ?>" class="nav-link">
                            <i class="fa fa-home"></i>
                            <p>Home</p>
                        </a>
                    <li class="nav-item">
                        <a href="<?= ADMIN; ?>/order" class="nav-link">
                            <i class="fa fa-shopping-cart"></i>
                            <p>Orders</p>
                        </a>
                    </li>
                    <li class="nav-item has-treeview">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fa fa-cubes"></i>
                            <p>Products<i class="right fa fa-angle-left"></i></p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="<?= ADMIN; ?>/product" class="nav-link">
                                    <i class="fa fa-circle-o nav-icon"></i>
                                    <p>List of Products</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="<?= ADMIN; ?>/product/add" class="nav-link">
                                    <i class="fa fa-circle-o nav-icon"></i>
                                    <p>Add a Product</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="<?= ADMIN ?>/cache" class="nav-link">
                            <i class="fa fa-database"></i>
                            <p>Cache</p>
                        </a>
                    </li>
                    <li class="nav-item has-treeview">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fa fa-users"></i>
                            <p>Users<i class="right fa fa-angle-left"></i></p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="<?= ADMIN; ?>/user" class="nav-link">
                                    <i class="fa fa-circle-o nav-icon"></i>
                                    <p>List of Users</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="<?= ADMIN; ?>/user/add" class="nav-link">
                                    <i class="fa fa-circle-o nav-icon"></i>
                                    <p>Add a User</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item has-treeview">
                        <a href="#" class="nav-link">
                            <i class="fa fa-usd"></i>
                            <p>Currencies</p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="<?= ADMIN ?>/currency" class="nav-link">
                                    <i class="fa fa-circle-o nav-icon"></i>
                                    <p>List of Currencies</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="<?= ADMIN ?>/currency/add" class="nav-link">
                                    <i class="fa fa-circle-o nav-icon"></i>
                                    <p>Add a Currency</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <?= $content; ?>
    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <strong>Copyright &copy; 2014-2018 <a href="http://adminlte.io">AdminLTE.io</a>.</strong>
        All rights reserved.
        <div class="float-right d-none d-sm-inline-block">
            <b>Version</b> 3.0.0-alpha
        </div>
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<script>
    var path = '<?= PATH; ?>',
        adminpath = '<?= ADMIN; ?>';
</script>

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>

<?php
//$logs = \R::getDatabaseAdapter()
//    ->getDatabase()
//    ->getLogger();
//
//debug( $logs->grep( 'SELECT' ) );
//?>

</body>
</html>
