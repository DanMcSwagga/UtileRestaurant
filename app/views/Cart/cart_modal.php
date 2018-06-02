<?php if (!empty($_SESSION['cart'])): ?>
    <div class="table-responsive">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>Photo</th>
                <th>Title</th>
                <th>Quantity</th>
                <th>Price</th>
                <td><span data-id="<?= $id; ?>" class="fa fa-remove text-secondary del-item" aria-hidden="true"></span></td>
            </tr>
            </thead>

            <tbody>
            <?php foreach($_SESSION['cart'] as $id => $item) : ?>
                <tr>
                    <td><a href="/product/<?= $item['alias']; ?>"><img src="/lib/img/<?= $item['img']; ?>" alt=""></a></td>
                    <td><a href="/product/<?= $item['alias']; ?>"><?= $item['title']; ?></a></td>
                    <td><?= $item['qty']; ?></td>
                    <td><?= $_SESSION['cart.currency']['symbol_left'] . $item['price'] . $_SESSION['cart.currency']['symbol_right']; ?></td>
                    <td><span data-id="<?= $id; ?>" class="fa fa-remove text-secondary del-item" aria-hidden="true"></span></td>
                </tr>
            <?php endforeach; ?>
            <tr>
                <td>Total quantity:</td>
                <td colspan="4" class="text-right cart-qty"><?= $_SESSION['cart.qty']; ?></td>
            </tr>
            <tr>
                <td>Amount:</td>
                <td colspan="4" class="text-right cart-sum"><?= $_SESSION['cart.currency']['symbol_left'] . $_SESSION['cart.sum'] . $_SESSION['cart.currency']['symbol_right']; ?></td>
            </tr>
            </tbody>
        </table>
    </div>
<?php else: ?>
    <h5>Nothing added here yet</h5>
<?php endif; ?>
