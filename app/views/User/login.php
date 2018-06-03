<div class="single-form-page-container flex">
    <div class="single-form-title bold" data-aos="leftSlideLong" data-aos-once="false" data-aos-duration="450"><span>Log In</span></div>
    <div class="curly-underline-block backslash flex" data-aos="leftSlideLong" data-aos-once="false" data-aos-duration="800">
        <img src="/lib/img/decorative_underline.svg" alt="">
    </div>

    <div class="contact-form-container">
        <form method='post' id='login' action='/user/login' class='form single-form-backslash' role='form'>
            <div class="has-feedback">
                <p class='field required half italic' data-aos="upSlideLong" data-aos-once="true">
                    <label class='label' for='login-sup'>Login</label>
                    <input class='text-input' id='login-sup' name='login-sup' type='text' required>
                </p>
                <p class='field required half italic' data-aos="upSlideLong" data-aos-once="true">
                    <label class='label' for='password-sup'>Password</label>
                    <input class='text-input' id='password-sup' name='password-sup' min="6" type='password' required>
                </p>
                <div class="contact-form-forgot-container flex" data-aos="upSlideLong" data-aos-once="true" data-aos-duration="850">
                    <a href="/user/forgot" class="contact-form-forgot"><span>Forgot password?</span></a>
                </div>
                <p class='field field-button' data-aos="upSlideLong" data-aos-duration="600" data-aos-once="true">
                    <input class='button backslash' type='submit' value='Log In'>
                </p>
            </div>
        </form>
    </div>
</div>