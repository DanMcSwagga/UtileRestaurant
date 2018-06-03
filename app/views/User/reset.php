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
    <link rel="stylesheet" href="css/single.css">
    <!--    <link rel="stylesheet" href="css/hamburger.css">-->
    <!--    <link rel="stylesheet" href="css/hamburger-responsive.css">-->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <title>Reset - Utile</title>

</head>
<body>


<div class="single-form-page-container flex">
    <div class="single-form-title bold" data-aos="leftSlideLong" data-aos-once="false" data-aos-duration="450"><span>Choose new password</span></div>
    <div class="curly-underline-block backslash flex" data-aos="leftSlideLong" data-aos-once="false" data-aos-duration="800">
        <img src="/lib/img/decorative_underline.svg" alt="">
    </div>

    <div class="contact-form-container">
        <form method='post' id='reset' action='/user/reset' class='form single-form-backslash' role='form'>
            <div class="has-feedback">
                <p class='field required italic' data-aos="upSlideLong" data-aos-once="true">
                    <label class='label' for='password-new'>New Password</label>
                    <input class='text-input' id='password-new' name='password-new' type='password' required>
                </p>
                <p class='field field-button' data-aos="upSlideLong" data-aos-duration="600" data-aos-once="true">
                    <input class='button backslash' type='submit' value='Reset'>
                </p>
            </div>
        </form>
    </div>
</div>

<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/aos.js"></script>
<script src="/js/formLabels.js"></script>
<script src="/js/onScroll.js"></script>
<script src="/js/main.js"></script>


</body>
</html>