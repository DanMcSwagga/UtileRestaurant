<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0 text-dark">List of Orders</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item">Main</li>
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
                                <th>Buyer</th>
                                <th>Status</th>
                                <th>Sum</th>
                                <th>Date of creation</th>
                                <th>Date of change</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($orders as $order): ?>
                                <?php $class = $order['status'] ? 'success' : '' ?>
                                <tr class="<?= $class; ?>">
                                    <td><?= $order['id'] ?></td>
                                    <td><?= $order['name'] ?></td>
                                    <td><?= $order['status'] ? 'Completed' : 'New' ?></td>
                                    <td><?= $order['sum'] ?> <?= $order['currency'] ?></td>
                                    <td><?= $order['date'] ?></td>
                                    <td><?= $order['update_at'] ?></td>
                                    <td><a href="<?= ADMIN; ?>/order/view?id=<?= $order['id']; ?>"><i class="fa fa-fw fa-eye"></i></a></td>
                                </tr>
                            <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="text-center">
                        <p>(<?= count($orders); ?> / <?= $count ?>)</p>
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