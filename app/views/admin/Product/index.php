<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0 text-dark">List of Orders</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="<?= ADMIN; ?>">Main</a></li>
                    <li class="breadcrumb-item active">List of orders</li>
                </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<section class="content">
    <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
            <div class="box" style="width: 100%;">
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Сategory</th>
                                <th>Title</th>
                                <th>Price</th>
                                <th>Special</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($products as $product): ?>
                                <tr>
                                    <td><?= $product['id']; ?></td>
                                    <td><?= $product['cat']; ?></td>
                                    <td><?= $product['title']; ?></td>
                                    <td><?= $product['price']; ?></td>
                                    <td><?= $product['special'] ? 'Yes' : 'No'; ?></td>
                                    <td><?= $product['status'] ? 'On' : 'Off'; ?></td>
                                    <td>
                                        <a href="<?= ADMIN; ?>/product/edit?id=<?= $product['id']; ?>"><i class="fa fa-fw fa-edit"></i></a>
                                        <a class="delete" href="<?=ADMIN;?>/product/delete?id=<?=$product['id'];?>"><i class="fa fa-fw fa-close text-danger"></i></a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="text-center">
                        <p>(<?= count($products); ?> / <?= $count ?>)</p>
                        <?php if ($pagination->countPages > 1): ?>
                            <?= $pagination; ?>
                        <?php endif; ?>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.row -->
    </div><!-- /.container-fluid -->
</section>
<!-- /.content -->