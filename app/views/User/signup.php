<div class="single-form-page-container flex">
    <div class="single-form-title bold" data-aos="leftSlideMedium" data-aos-once="false" data-aos-duration="450"><span>Sign Up</span></div>
    <div class="curly-underline-block backslash flex" data-aos="leftSlideLong" data-aos-once="false" data-aos-duration="800">
        <img src="/lib/img/decorative_underline.svg" alt="">
    </div>

    <div class="contact-form-container">
        <form method='post' id='signup' action='/user/signup' class='form single-form-backslash' role='form'>
            <div class="has-feedback">
                <p class='field required half italic' data-aos="upSlideLong" data-aos-once="true">
                    <label class='label required' for='login'>Login</label>
                    <input autocomplete="off" class='text-input' id='login' name='login' maxlength="20" type='text' value="<?= $_SESSION['temp_user']['login']?? ""; ?>" required>
                </p>
                <p class='field required half italic' data-aos="upSlideLong" data-aos-once="true">
                    <label class='label' for='password'>Password</label>
                    <input class='text-input' id='password' name='password' minlength="6" type="password" required>
                </p>
                <p class='field required italic' data-aos="upSlideLong" data-aos-once="true">
                    <label class='label required' for='name'>Name</label>
                    <input autocomplete="off" class='text-input' id='name' name='name' type='text' value="<?= $_SESSION['temp_user']['name']?? ""; ?>" required>
                </p>
                <p class='field required italic' data-aos="upSlideLong" data-aos-once="true">
                    <label class='label' for='email'>Email</label>
                    <input autocomplete="off" class='text-input' id='email' name='email' type="email" value="<?= $_SESSION['temp_user']['email']?? ""; ?>" required>
                </p>
                <p class='field required italic' data-aos="upSlideLong" data-aos-once="true">
                    <label class='label' for='address'>Address</label>
                    <input autocomplete="off" class='text-input' id='address' name='address' type="name" value="<?= $_SESSION['temp_user']['address']?? ""; ?>" required>
                </p>
                <div class="field captcha-container flex " data-aos="upSlideLong" data-aos-duration="600" data-aos-once="true">
                    <div style="display:inline-block; border: 1.5px solid #7f7f7f" class="g-recaptcha captcha-content" data-sitekey="6LccSl4UAAAAAMrVxXy5PF5EZPLEz-AgnHFj2CeP"></div>
                </div>
                <p class='field field-button' data-aos="upSlideLong" data-aos-duration="750" data-aos-once="true">
                    <input class='button backslash' type='submit' value='Sign Up'>
                </p>
            </div>
        </form>
    </div>
</div>
