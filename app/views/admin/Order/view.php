<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0 text-dark">
                    Order #<?= $order['id']; ?>
                    <?php if(!$order['status']): ?>
                        <a href="<?= ADMIN; ?>/order/change?id=<?= $order['id']; ?>&status=1" class="btn btn-success btn-xs offset-left">Approve</a>
                    <?php else: ?>
                        <a href="<?= ADMIN; ?>/order/change?id=<?= $order['id']; ?>&status=0" class="btn btn-default btn-xs offset-left">Revise</a>
                    <?php endif; ?>
                    <a href="<?= ADMIN; ?>/order/delete?id=<?= $order['id']; ?>" class="btn btn-danger btn-xs delete offset-left">Delete</a>
                </h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="<?= ADMIN; ?>">Main</a></li>
                    <li class="breadcrumb-item"><a href="<?= ADMIN; ?>/order">List of orders</a></li>
                    <li class="breadcrumb-item active">Order #<?= $order['id']; ?></li>
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
                            <tbody>
                                <tr>
                                    <td>Order date</td>
                                    <td><?= $order['date'] ?></td>
                                </tr>
                                <tr>
                                    <td>Date of change</td>
                                    <td><?= $order['update_at'] ?></td>
                                </tr>
                                <tr>
                                    <td>Order products</td>
                                    <td><?= count($order_products); ?></td>
                                </tr>
                                <tr>
                                    <td>Order sum</td>
                                    <td><?= $order['sum']; ?> <?= $order['currency']; ?></td>
                                </tr>
                                <tr>
                                    <td>Order buyer</td>
                                    <td><?= $order['name'] ?></td>
                                </tr>
                                <tr>
                                    <td>Order status</td>
                                    <td><?= $order['status'] ? 'Completed' : 'New'; ?></td>
                                </tr>
                                <tr>
                                    <td>Order note</td>
                                    <td><?= $order['note']; ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <h3 style="margin-top: 10px;">Order details</h3>
            <div class="box" style="width: 100%;">
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Quantity</th>
                                <th>Price</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php $qty = 0; foreach ($order_products as $product): ?>
                            <tr>
                                <td><?= $product->id; ?></td>
                                <td><?= $product->title; ?></td>
                                <td><?= $product->qty; $qty += $product->qty; ?></td>
                                <td><?= $product->price; ?></td>
                            </tr>
                            <?php endforeach; ?>
                            <tr class="active">
                                <td colspan="2"><b>Overall:</b></td>
                                <td><b><?= $qty; ?></b></td>
                                <td><b><?= $order['sum']; ?> <?= $order['currency']; ?></b></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.row -->
    </div><!-- /.container-fluid -->
</section>
<!-- /.content -->