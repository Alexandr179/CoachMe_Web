<!doctype html>
<#import "spring.ftl" as spring />
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <style>
        #wrapper {width: 400px;}
        #wrapper .container {max-width: 100%; display: block;}
    </style>

    <#include "commons/bootstrap-jetty-common.ftlh" />
    <script src="js/signIn.js"></script>

    <title><@spring.message 'sign_in.page.title'/></title>
</head>
<body>
    <!-- HEADER -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                    aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <div class="dropdown">
                            <a class="navbar-brand dropdown-toggle" href="/" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="img/logo_lamp_coach.png" class="image-fluid" alt="" width="60" height="60" onmousemove=
                                imageChange(this,"img/logo_lamp_coach.png","img/logo_lamp_on_coach.png")>
                            </a>
                            <div class="dropdown-menu p-4 text-muted" id="wrapper">
                                <p>
                                    <@spring.message 'sign_in.page.about'/>
                                </p>
                                <p class="mb-0">
                                    <@spring.message 'sign_in.page.about.last'/>
                                </p>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item mt-2">
                        <span class="navbar-brand mb-0 h1">CoathMe</span>
                    </li>
                    <li class="nav-item mt-2">
                        <a class="nav-link" href="/signUp"><@spring.message 'sign_in.page.registration'/></a>
                    </li>
                    <li class="nav-item dropdown mt-2">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Language
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="/signIn?lang=en"><@spring.message 'sign_in.page.locale.en'/></a>
                            <a class="dropdown-item" href="/signIn?lang=ru"><@spring.message 'sign_in.page.locale.ru'/></a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- CONTENT 1 -->
    <div class="container-fluid justify-content-center contentContainer_1">
        <div class="container mt-3">
            <div class="row">
                <div class="col-4"></div>
                <div class="col-4">
                    <form action="/signIn" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label"><@spring.message 'sign_in.page.email'/></label>
                            <input name="email" placeholder="email" type="email" value="admin@gmail.com" class="form-control"
                                   id="exampleInputEmail1"
                                   aria-describedby="emailHelp">
                            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1"
                                   class="form-label"><@spring.message 'sign_in.page.password'/></label>
                            <input name="password" type="password" placeholder="password" value="qwerty" class="form-control"
                                   id="exampleInputPassword1">
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" name="remember-me" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label"
                                   for="exampleCheck1"><@spring.message 'sign_in.page.remember_me'/></label>
                        </div>
                        <input type="submit" class="btn btn-primary" value="<@spring.message 'sign_in.page.sign_in'/>">
                        <#--                    <button type="submit" class="btn btn-primary"><@spring.message 'sign_in.page.sign_in'/></button>-->
                    </form>
                </div>
                <div class="col-4"></div>
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