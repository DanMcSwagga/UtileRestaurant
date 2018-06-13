<!--CURRENCY PICKER-->
<div class="currency-picker-container">
    <select id="currency" class="currency-picker bold">
        <?php new \app\widgets\currency\Currency(); ?>
    </select>
</div>

<!--CHECKOUT-->
<div class="single-form-page-container flex">
    <div class="single-form-title bold" data-aos="leftSlideMedium" data-aos-once="false" data-aos-duration="450"><span>Checkout</span></div>
    <div class="curly-underline-block backslash flex" data-aos="leftSlideLong" data-aos-once="false" data-aos-duration="800">
        <img src="/lib/img/decorative_underline.svg" alt="">
    </div>

    <div class="checkout-table-container">
    <?php if (!empty($_SESSION['cart'])): ?>
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th>Photo</th>
                    <th>Title</th>
                    <th>Quantity</th>
                    <th>Price</th>
<!--                    <td><span data-id="--><?//= $id; ?><!--" class="fa fa-remove text-secondary del-item" aria-hidden="true"></span></td>-->
                </tr>
                </thead>

                <tbody>
                <?php foreach ($_SESSION['cart'] as $id => $item) : ?>
                    <tr>
                        <td><a href="product/<?= $item['alias']; ?>"><img class="checkout-image" src="/lib/img/<?= $item['img']; ?>" alt="<?= $item['title']; ?>"></a></td>
                        <td><a href="product/<?= $item['alias']; ?>"><?= $item['title']; ?></a></td>
                        <td><?= $item['qty']; ?></td>
                        <td><?= $_SESSION['cart.currency']['symbol_left'] . $item['price'] . $_SESSION['cart.currency']['symbol_right']; ?></td>
                        <td><a href="cart/delete/?id=<?= $id; ?>"><span data-id="<?= $id; ?>" class="fa fa-remove text-secondary del-item" aria-hidden="true" style="cursor: pointer;"></span></a></td>
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

        <div class="contact-form-container">
            <form method='post' id='checkout' action='/cart/checkout' class='form' role='form'>
                <?php if (!isset($_SESSION['user'])): ?>
                <div class="has-feedback">
                    <p class='field required half italic' data-aos="upSlideLong" data-aos-once="true">
                        <label class='label required' for='login'>Login</label>
                        <input class='text-input' id='login' name='login' maxlength="20" type='text' required value="<?= isset($_SESSION['form_data']['login']) ? $_SESSION['form_data']['login'] : '' ?>">
                    </p>
                    <p class='field required half italic' data-aos="upSlideLong" data-aos-once="true">
                        <label class='label' for='password'>Password</label>
                        <input class='text-input' id='password' name='password' minlength="6" type="password" required value="<?= isset($_SESSION['form_data']['password']) ? $_SESSION['form_data']['password'] : '' ?>">
                    </p>
                </div>
                <div class="has-feedback">
                    <p class='field required half italic' data-aos="upSlideLong" data-aos-once="true">
                        <label class='label' for='email'>Email</label>
                        <input class='text-input' id='email' name='email' type="email" required value="<?= isset($_SESSION['form_data']['email']) ? $_SESSION['form_data']['email'] : '' ?>">
                    </p>
                    <p class='field required half italic' data-aos="upSlideLong" data-aos-once="true">
                        <label class='label required' for='name'>Name</label>
                        <input class='text-input' id='name' name='name' type='text' required value="<?= isset($_SESSION['form_data']['name']) ? $_SESSION['form_data']['name'] : '' ?>">
                    </p>
                    <p class='field required italic' data-aos="upSlideLong" data-aos-once="true">
                        <label class='label' for='address'>Address</label>
                        <input class='text-input' id='address' name='address' type="name" required value="<?= isset($_SESSION['form_data']['address']) ? $_SESSION['form_data']['address'] : '' ?>">
                    </p>
                </div>
                <?php endif; ?>
                <div class="has-feedback">
                    <p class='field italic checkout-note' data-aos="upSlideLong" data-aos-once="true">
                        <label class='label' for='note'>Note (not required)</label>
                        <textarea class='textarea' cols='50' id='note' name='note' rows='4'></textarea>
                    </p>
                    <p class='field field-button' data-aos="upSlideLong" data-aos-duration="600" data-aos-once="true">
                        <input class='button backslash' type='submit' value='Checkout'>
                    </p>
                </div>
            </form>
            <?php if(isset($_SESSION['form_data'])) unset ($_SESSION['form_data']); ?>
        </div>

    <?php else: ?>
        <h5 class="bold italic" data-aos="leftSlideLong" data-aos-once="false" data-aos-duration="650" style="text-align: center">-- Nothing added here yet --</h5>
    <?php endif; ?>
    </div>

</div>
