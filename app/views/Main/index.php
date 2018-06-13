<!--CURRENCY PICKER-->
<div class="currency-picker-container">
    <select id="currency" class="currency-picker bold">
        @@ $curr = new \app\widgets\currency\Currency();
    </select>
</div>

<!-- INTRO PAGE -->
<section class="intro-section">

    <div class="intro-page-wrapper flex">

        <div class="intro-page-container flex">
            <div class="fifty-percent-block"></div>

            <div class="fifty-percent-block flex-centered flex">
                <div class="intro-page-title-wrapper flex">

                    <div class="text-centered" data-aos="leftSlideMedium" data-aos-once="true" data-aos-duration="400">
                        <h1 class="intro-page-title light">Utile es bonus vobis, <br />proinde vos postulo essum.</h1>
                    </div>

                    <div class="curly-underline-block backslash flex" data-aos="leftSlideLong" data-aos-duration="700" data-aos-once="true">
                        <img src="/lib/img/decorative_underline.svg" alt="">
                    </div>

                </div>
            </div>

        </div>

    </div>

</section>


<section class="categories-section flex" id="categories">
    <div class="categories-container flex">

        <div class="categories-block text-centered">
            <div class="categories-image-container flex" data-aos="downSlideMedium" data-aos-duration="400"><img src="/lib/icons/icon-noodle.svg" alt="" class="categories-image"></div>
            <div class="categories-title bold uppercase" data-aos="downSlideMedium" data-aos-duration="400">Turnip greens</div>
            <div class="categories-info light" data-aos="downSlideMedium" data-aos-duration="400">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore, animi voluptates qui, velit deleniti.</div>
        </div>
        <div class="categories-block text-centered">
            <div class="categories-image-container flex" data-aos="downSlideMedium" data-aos-duration="400"><img src="/lib/icons/icon-bottle.svg" alt="" class="categories-image"></div>
            <div class="categories-title bold uppercase" data-aos="downSlideMedium" data-aos-duration="400">Beetroot water</div>
            <div class="categories-info light" data-aos="downSlideMedium" data-aos-duration="400">Laborum ut a qui, placeat repudiandae odio corporis deleniti pariatur illo error nulla.</div>
        </div>
        <div class="categories-block text-centered">
            <div class="categories-image-container flex" data-aos="downSlideMedium" data-aos-duration="400"><img src="/lib/icons/icon-social.svg" alt="" class="categories-image"></div>
            <div class="categories-title bold uppercase" data-aos="downSlideMedium" data-aos-duration="400">Get social</div>
            <div class="categories-info light" data-aos="downSlideMedium" data-aos-duration="400"><div>Officia minus assumenda sapiente vero, doloribus eligendi atque laborum  labore eius eos.</div></div>
        </div>

    </div>
</section>


<!-- if $specials -->
@@ $curr = \utile\App::$app->getProperty('currency');
<section class="specials-section" id="specials" data-scroll-reveal="enter from the bottom after 0.9s">
    <div class="specials-wrapper">

        <h1 class="title light text-centered">This month specials</h1>
        <div class="curly-underline-block backslash flex"><img src="/lib/img/decorative_underline.svg" alt=""></div>

        <div class="specials-catalogue-container flex">

            <!-- foreach ($specials as $special) -->
                <div class="specials-catalogue-unit flex">
                    <div class="specials-catalogue-image-container">
                        <a href="product/{{ $special->alias; }}">
                            <img src="/lib/img/{{ $special->img; }}" alt="" class="specials-catalogue-image">
                        </a>
                    </div>
                    <div class="specials-catalogue-info flex text-centered" data-aos="simpleAppear" data-aos-once="false">
                        <h2 class="bold"><a href="product/<?=$special->alias;?>">{{ $special->title; }}</a></h2>
                        <div class="specials-catalogue-info-divider"></div>
                        <p class="">{{ $special->content }}</p>
                        <div class="specials-catalogue-cart-container flex">
                            <a class="specials-catalogue-cart add-to-cart-link" data-id="{{ $special->id; }}" href="cart/add?id=<?=$special->id;?>"><img src="/lib/icons/icon-cart.svg" alt=""></a>
                            <span class="bold">{{ $curr['symbol_left'] . $special->price * $curr['value'] . $curr['symbol_right']; }}</span>
                        </div>
                    </div>
                </div>
            <!-- endforeach -->

        </div>

    </div>
</section>
<!-- endif -->


<section class="about-section" id="about">
    <div class="about-container flex">

        <h2 class="standard-title text-centered light">About us</h2>
        <div class="curly-underline-block backslash flex">
            <img src="/lib/img/decorative_underline.svg" alt="">
        </div>

        <div class="text-centered backslash light" data-aos="downSlideShort"><span>Nore grape silver beet broccoli kombu beet greens fava bean potato quandong celery. Bunya nuts black-eyed pea prairie turnop leek lentil turnip greens parsnip.</span></div>
        <div class="about-signature-container flex backslash" data-aos="leftSlideMedium"><img src="/lib/img/about-signature.png" alt="" class="about-signature"></div>

    </div>
</section>


<!-- if $products -->
<section class="menu-section" id="menu">
    <div class="menu-container flex">

        <h2 class="standard-title text-centered light">Menu</h2>
        <div class="curly-underline-block backslash flex">
            <img src="/lib/img/decorative_underline.svg" alt="">
        </div>

        <ul class="menu-navigation-container flex" data-tabgroup="navigation-tab-group" data-aos="downSlideShort" data-aos-duration="400" data-aos-once="false">
            @@ foreach ($categories as $category):
                @@ if ($category->id == 1):
                    <li class="menu-navigation-unit"><a href="#tab<?= $category->id; ?>" class="menu-navigation-link active-tab">{{ $category->title; }}</a></li>
                @@ else:
                    <li class="menu-navigation-unit">
                        <a href="#tab<?= $category->id; ?>" class="menu-navigation-link">{{ $category->title; }}</a>
                    </li>
                @@ endif;
            @@ endforeach;
        </ul>

        <section class="menu-cart-wrapper flex tabgroup" id="navigation-tab-group" data-aos="downSlideShort" data-aos-once="false">

            @@ foreach ($categories as $category):
            <div class="menu-cart-container light flex" id="tab<?= $category->id; ?>">
                @@ foreach ($products as $product):
                    @@ if ($product->category_id == $category->id):
                    <ul class="menu-cart-item-container flex">
                        <a href="product/<?= $product->alias ?>"><li class="menu-cart-item-title">{{ $product->title; }}</li></a>
                        <li class="menu-cart-empty-dotted"></li>
                        <li class="menu-cart-item-price">{{ $curr['symbol_left'] . $product->price * $curr['value'] . $curr['symbol_right']; }}</li>
                        <li class="menu-cart-item-ingredients italic">
                            <span>{{ $product->ingredients; }}</span>
                        </li>
                    </ul>
                    @@ endif;
                @@ endforeach;
            </div>
            @@ endforeach;
        </section>

    </div>
</section>
<!-- endif -->