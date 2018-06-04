<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

    <base href="/">
    <meta name="author" content="Dan Stetsenko">

    <link rel="icon" href="lib/img/logo.ico">
    <link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="css/form.css">
    <link rel="stylesheet" href="css/animations.css">
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/currency-picker.css">
    <link rel="stylesheet" href="css/single.css">
<!--    <link rel="stylesheet" href="css/hamburger.css">-->
<!--    <link rel="stylesheet" href="css/hamburger-responsive.css">-->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <?=$this->getMeta();?>

</head>
<body>

<!-- REGULAR HEADER -->
<header class="header-main">
    <div class="header-wrapper flex">

        <div class="fifty-percent-block"></div>

        <div class="fifty-percent-block header-menu-container flex">
            <ul class="header-menu flex" data-aos="leftSlideLong" data-aos-duration="550" data-aos-once="true">
                <li class="header-menu-unit"><a class="header-menu-link" href="<?= PATH; ?>">Home</a></li>
<!--                <li class="header-menu-unit"><a class="header-menu-link" href="#specials">Specials</a></li>-->
<!--                <li class="header-menu-unit"><a class="header-menu-link" href="#about">About</a></li>-->
<!--                <li class="header-menu-unit"><a class="header-menu-link" href="#menu">Menu</a></li>-->
                <li class="header-menu-unit"><a class="header-menu-link" href="#contact">Contact</a></li>
                <ul class="header-menu-unit user-action flex">
                    <?php if (!empty($_SESSION['user'])): ?>
                    <li><a href="#"><?= $_SESSION['user']['login']; ?></a></li>
                    <li><a href="user/logout">Log Out</a></li>
                    <?php else: ?>
                    <li><a href="user/signup">Sign Up</a></li>
                    <li><a href="user/login">Sign In</a></li>
                    <?php endif; ?>
                </ul>
            </ul>
            <ul class="header-menu flex" data-aos="leftSlideLong" data-aos-duration="550" data-aos-once="true">
                <li class="header-menu-unit">
                    <a class="header-cart-link" href="cart/show" onclick="getCart(); return false">
                        <div class="header-cart-container flex">
                            <img src="/lib/icons/icon-cart.svg" alt="" class="header-cart-image">
                            <?php if (!empty($_SESSION['cart'])): ?>
                            <span class="header-cart-info"><?= $_SESSION['cart.currency']['symbol_left'] . $_SESSION['cart.sum'] . $_SESSION['cart.currency']['symbol_right']; ?></span>
                            <?php else: ?>
                            <span class="header-cart-info">Empty Cart</span>
                            <?php endif; ?>
                        </div>
                    </a>
                </li>
            </ul>
        </div>

    </div>
</header>

<!-- BOXED HEADER -->
<!--<div class="fs_menu_overlay"></div>-->
<!--<div class="hamburger_menu">-->
<!--    <div class="hamburger_close"><i class="fa fa-times" aria-hidden="true"></i></div>-->
<!--    <div class="hamburger_menu_content text-right">-->
<!--        <ul class="menu_top_nav">-->
<!--            <li class="menu_item has-children">-->
<!--                <a href="#">-->
<!--                    usd-->
<!--                    <i class="fa fa-angle-down"></i>-->
<!--                </a>-->
<!--                <ul class="menu_selection">-->
<!--                    <li><a href="#">cad</a></li>-->
<!--                    <li><a href="#">aud</a></li>-->
<!--                    <li><a href="#">eur</a></li>-->
<!--                    <li><a href="#">gbp</a></li>-->
<!--                </ul>-->
<!--            </li>-->
<!--            <li class="menu_item has-children">-->
<!--                <a href="#">-->
<!--                    English-->
<!--                    <i class="fa fa-angle-down"></i>-->
<!--                </a>-->
<!--                <ul class="menu_selection">-->
<!--                    <li><a href="#">French</a></li>-->
<!--                    <li><a href="#">Italian</a></li>-->
<!--                    <li><a href="#">German</a></li>-->
<!--                    <li><a href="#">Spanish</a></li>-->
<!--                </ul>-->
<!--            </li>-->
<!--            <li class="menu_item has-children">-->
<!--                <a href="#">-->
<!--                    My Account-->
<!--                    <i class="fa fa-angle-down"></i>-->
<!--                </a>-->
<!--                <ul class="menu_selection">-->
<!--                    <li><a href="#"><i class="fa fa-sign-in" aria-hidden="true"></i>Sign In</a></li>-->
<!--                    <li><a href="#"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>-->
<!--                </ul>-->
<!--            </li>-->
<!--            <li class="menu_item"><a href="#">home</a></li>-->
<!--            <li class="menu_item"><a href="#">shop</a></li>-->
<!--            <li class="menu_item"><a href="#">promotion</a></li>-->
<!--            <li class="menu_item"><a href="#">pages</a></li>-->
<!--            <li class="menu_item"><a href="#">blog</a></li>-->
<!--            <li class="menu_item"><a href="#">contact</a></li>-->
<!--        </ul>-->
<!--    </div>-->
<!--</div>-->


<div class="content">
    <div class="registration-alert-container">
        <div class="row">
            <div class="col-md-12">
                <?php if(isset($_SESSION['error'])): ?>
                    <div class="alert alert-danger registration-alert">
                        <?php echo $_SESSION['error']; unset($_SESSION['error']); ?>
                    </div>
                <?php endif; ?>
                <?php if(isset($_SESSION['success'])): ?>
                    <div class="alert alert-info">
                        <?php echo $_SESSION['success']; unset($_SESSION['success']); ?>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
<!--    --><?php //debug($_SESSION); ?>
    <?=$content;?>
</div>

<section class="contact-section flex" id="contact">
    <div class="contact-section-wrapper flex">
        <div class="fifty-percent-block"></div>

        <div class="contact-wrapper fifty-percent-block flex-centered flex">

            <h2 class="standard-title text-centered light">Contact</h2>
            <div class="curly-underline-block backslash flex">
                <img src="/lib/img/decorative_underline.svg" alt="">
            </div>

            <div class="contact-info-container backslash flex light" data-aos="leftSlideMedium" data-aos-duration="300" data-aos-once="false">
                <div class="contact-info flex">
                    <div class="contact-info-title"><span>Restaurant-name</span></div>
                    <p class="contact-info-text">3428 Magnolia Avenue<br />Hackettstown, NJ 07840</p>
                </div>
                <div class="contact-info flex">
                    <div class="contact-info-title"><span>Reservations</span></div>
                    <p class="contact-info-text">reservations@utile.com<br />+48 202-555-0114</p>
                </div>
            </div>

            <div class="contact-form-title light" data-aos="upSlideLong" data-aos-once="false"><span>Contact form</span></div>

            <div class="contact-form-container">
                <form action='' class='form'>
                    <p class='field required half italic' data-aos="upSlideLong" data-aos-once="false">
                        <label class='label required' for='name-cont'>Name</label>
                        <input class='text-input' id='name-cont' name='name-cont' required type='text'>
                    </p>
                    <p class='field required half italic' data-aos="upSlideLong" data-aos-once="false">
                        <label class='label' for='email-cont'>Email</label>
                        <input class='text-input' id='email-cont' name='email-cont' required type='email'>
                    </p>
                    <p class='field italic' data-aos="upSlideLong" data-aos-once="false">
                        <label class='label' for='message'>Message</label>
                        <textarea class='textarea' cols='50' id='message' name='message' required rows='4'></textarea>
                    </p>
                    <p class='field field-button backslash' data-aos="upSlideLong" data-aos-duration="700" data-aos-once="false">
                        <input class='button' type='submit' value='Send'>
                    </p>
                </form>
            </div>

        </div>
    </div>


    <footer>
        <div class="footer-wrapper flex">
            <div class="footer-empty flex"></div>
            <div class="footer-copyright flex"><span>Copyright 2018 © Dan Stetsenko</span></div>
            <div class="footer-social flex">
                <div class="footer-social-icon-container">
                    <a href="https://www.youtube.com/channel/UCrnyYSV_PluCANqms0wX3YQ"><img class="footer-social-icon" src="/lib/icons/icon-facebook-thin.svg" alt="Facebook"></a>
                </div>
                <div class="footer-social-icon-container">
                    <a href="https://www.instagram.com/danmcswagga"><img class="footer-social-icon" src="/lib/icons/icon-instagram.svg" alt="Instagram"></a>
                </div>
            </div>
        </div>
    </footer>
</section>


<!-- MODAL -->
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">

                <form action="" class="form">
                    <p class='field field-button' data-aos="simpleAppear" data-aos-duration="600" data-aos-once="true">
                        <input data-dismiss="modal" class='button backslash continue-button' type='submit' value='Continue'>
                    </p>
                </form>
                <form action="/cart/view" class="form">
                    <p class='field field-button' data-aos="simpleAppear" data-aos-duration="600" data-aos-once="true">
                        <input class='button backslash checkout-button' type='submit' value='Checkout'>
                    </p>
                </form>
                <form action="" class="form">
                    <p class='field field-button' data-aos="simpleAppear" data-aos-duration="600" data-aos-once="true">
                        <button class='button backslash clear-cart-button' type="button" onclick="clearCart()" style="text-decoration: none;">Clear cart</button>
                    </p>
                </form>
<!--                <button type="button" class="btn btn-secondary" data-dismiss="modal">Continue</button>-->
<!--                <a href="cart/view" type="button" class="btn btn-primary">Checkout</a>-->
<!--                <button type="button" class="btn btn-danger" onclick="clearCart()">Clear cart</button>-->

            </div>
        </div>
    </div>
</div>


<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/aos.js"></script>
<script src="/js/formLabels.js"></script>
<script src="/js/onScroll.js"></script>
<script src="/js/tabNavigation.js"></script>
<script src="/js/jquery.elevateZoom.min.js"></script>
<script src="/js/product-zoom.js"></script>
<script src="/js/main.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>


</body>
</html>