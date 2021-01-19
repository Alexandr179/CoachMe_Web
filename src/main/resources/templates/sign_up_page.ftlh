<!doctype html>
<#import "spring.ftl" as spring />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <#--Bootstrap-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">

    <#--    <base href="/">-->

    <#-- jQuery CDN  https://www.codebyamir.com/blog/typeerror-ajax-is-not-a-function -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
    <#-- Bootstrap CDN -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <#--popper-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <title>SignUp</title>
</head>
<style>
    .error {
        color: #d71010;
    }
</style>
<body>
<!-- HEADER -->
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                    aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="navbar-brand" href="/">
                            <img src="/img/logo_coach.png" alt="" width="60" height="60">
                        </a>
                    </li>
                    <li class="nav-item mt-2">
                        <span class="navbar-brand mb-0 h1">CoathMe</span>
                    </li>
                    <li class="nav-item mt-2">
                        <a class="nav-link" href="/signIn"><@spring.message 'sign_up.page.login'/></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<!-- ОСНОВНОЕ СОДЕРЖИМОЕ -->
<section>
<#-- ----------------------------------- форма регистрации ...в строку: ------------------------------ -->
    <div class="row justify-content-center">
        <@spring.bind "userForm"/>
        <form action="/signUp" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <@spring.formInput "userForm.firstName" "placeholder='Имя'"/>
            <@spring.showErrors "<br>" "error"/>
            <#--        <input name="firstName" placeholder="firstName">-->
            <@spring.formInput "userForm.lastName" "placeholder='Фамилия'"/>
            <@spring.showErrors "<br>" "error"/>
            <#--        <input name="lastName" placeholder="lastName">-->
            <@spring.formInput "userForm.email" "placeholder='Введите email'"/>
            <@spring.showErrors "<br>" "error"/>
            <#--        <input name="email" placeholder="email">-->

            <@spring.formPasswordInput "userForm.password" "placeholder='Введите пароль'"/>
            <@spring.showErrors "<br>" "error"/>
            <#--        <input name="password" placeholder="password">-->
            <#--        <input type="submit" value="<@spring.message 'sign_up.page.registration'/>">-->
            <button class="btn btn-primary" type="submit"><@spring.message 'sign_up.page.registration'/></button>
        </form>
    </div>
</section>

<#--<div class="row justify-content-center">-->
<#--<div class="col-4">-->
<#--    <@spring.bind "userForm"/>-->
<#--    <form action="/signUp" method="post">-->
<#--        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">-->
<#--        <div class="mb-2">-->
<#--            <@spring.message 'profile.page.table.columns.name'/>-->
<#--            <span class="ml-5">-->
<#--                <@spring.formInput "userForm.firstName" "placeholder='Ferst name'"/>-->
<#--                <@spring.showErrors "<br>" "error"/>-->
<#--            </span>-->
<#--        </div>-->
<#--        <div class="mb-2">-->
<#--            <@spring.message 'profile.page.table.columns.lastname'/>-->
<#--            <span class="ml-3">-->
<#--                <@spring.formInput "userForm.lastName" "placeholder='Last name'"/>-->
<#--                <@spring.showErrors "<br>" "error"/>-->
<#--            </span>-->
<#--        </div>-->
<#--        <label for="validationServer02"><@spring.message 'sign_in.page.email'/></label>-->
<#--        <div class="mb-2">-->
<#--            <@spring.formInput "userForm.email" "placeholder='Email'"/>-->
<#--            <@spring.showErrors "<br>" "error"/>-->
<#--        </div>-->
<#--        <label for="validationServer02"><@spring.message 'sign_in.page.password'/></label>-->
<#--        <div class="mb-2">-->
<#--            <@spring.formPasswordInput "userForm.password" "placeholder='Password'"/>-->
<#--            <@spring.showErrors "<br>" "error"/>-->
<#--        </div>-->
<#--        <button class="btn btn-primary" type="submit"><@spring.message 'sign_up.page.registration'/></button>-->
<#--    </form>-->
<#--</div>-->
<#--</div>-->

<#--  <p><@spring.message 'sign_up.page.text'/></p>-->
 <div class="container-fluid mt-5">
        <div class="row">
            <div class="col-3">
            </div>
            <div class="col-6">
                <p><@spring.message 'sign_up.page.text'/></p>
            </div>
            <div class="col-3">
            </div>
        </div>
</div>

<!-- FOOTER -->
<footer>
    <nav class="navbar navbar-light bg-light justify-content-center mt-4">
      <span class="navbar-text">
          Produced by @2CodeProduction. 2021
      </span>
    </nav>
</footer>

</body>
</html>
