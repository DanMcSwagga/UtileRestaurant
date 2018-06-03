<!--<!--CURRENCY PICKER-->-->
<!--<div class="currency-picker-container">-->
<!--    <select id="currency" class="currency-picker bold">-->
<!--        --><?php //new \app\widgets\currency\Currency(); ?>
<!--    </select>-->
<!--</div>-->

<!--PRODUCT-->
<?php $curr = \utile\App::$app->getProperty('currency'); ?>
<div class="product flex">
    <section class="product-section flex">
        <div class="product-section__image-container flex" data-aos="leftSlideMedium" data-aos-once="false" data-aos-duration="750">
            <img src="/lib/img/<?= $product->img; ?>" alt="" class="product-section__image" id="product-image-zoomable" data-zoom-image="/lib/img/<?= $product->img; ?>">
        </div>
        <div class="product-section-info flex">
            <h2 class="product-section-info__title light" data-aos="leftSlideLong" data-aos-duration="750" data-aos-once="true"><?= $product->title; ?></h2>
            <div class="curly-underline-block flex" data-aos="leftSlideLong" data-aos-duration="950" data-aos-once="true">
                <img src="/lib/img/decorative_underline.svg" alt="">
            </div>
            <p class="product-section-info__desc" data-aos="simpleAppear" data-aos-once="false">
                <span class="bold product-section-cart__offset-right">Description:</span>
                <?= $product['full_content']; ?>
            </p>
            <p class="product-section-info__consist-of" data-aos="simpleAppear" data-aos-once="false">
                <span class="bold product-section-cart__offset-right">Inredients:</span>
                <span class="light italic"><?= $product->ingredients; ?></span>
            </p>
            <div class="product-section-info__divider" data-aos="downSlideShort" data-aos-duration="750" data-aos-once="true"></div>
            <div class="product-section-cart flex">
                <span class="product-section-cart__price" data-aos="leftSlideMedium" data-aos-duration="750" data-aos-once="true">
                    <?= $curr['symbol_left']; ?><?=$product->price * $curr['value'];?><?= $curr['symbol_right']; ?>
                </span>
                <div class="product-section-cart-form-field flex quantity" data-aos="leftSlideMedium" data-aos-duration="750" data-aos-once="true">
                    <span class="bold product-section-cart__offset-right">Quantity:</span>
                    <input min="1" step="1" type="number" value="1" name="quantity" id="" class="product-section-cart-form-field__input flex" placeholder="Amount">
                </div>
                <div class="product-section-cart-btn-container flex" data-aos="leftSlideMedium" data-aos-duration="950" data-aos-once="true">
                    <a class="product-section-cart-btn flex add-to-cart-link" id="productAdd" data-id="<?= $product->id; ?>" href="cart/add?id=<?= $product->id; ?>">
                        <span> Add to cart</span>
                    </a>
                </div>
            </div>
        </div>
    </section>
</div>
