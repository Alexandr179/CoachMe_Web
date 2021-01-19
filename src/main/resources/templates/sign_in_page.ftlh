<!doctype html>
<#import "spring.ftl" as spring />
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <!-- Jquery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
            crossorigin="anonymous"></script>

    <title><@spring.message 'sign_in.page.title'/></title>
</head>

<body>
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

<div class="container-fluid">
    <div class="row">
        <div class="col-2"></div>
        <div class="col-2">
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="/img/carousel_signin_1.png" class="d-block w-100">
                    </div>
                    <div class="carousel-item">
                        <img src="/img/carousel_signin_2.png" class="d-block w-100">
                    </div>
                    <div class="carousel-item">
                        <img src="/img/carousel_signin_3.png" class="d-block w-100">
                    </div>
                    <div class="carousel-item">
                        <img src="/img/carousel_signin_4.png" class="d-block w-100">
                    </div>
                </div>
            </div>
        </div>

        <div class="col-4">
            <form action="/signIn" method="post">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label"><@spring.message 'sign_in.page.email'/></label>
                    <input name="email" placeholder="email" type="email" value="admin@gmail.com" class="form-control" id="exampleInputEmail1"
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
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <input type="submit" class="btn btn-primary" value="<@spring.message 'sign_in.page.sign_in'/>">
                <#--                    <button type="submit" class="btn btn-primary"><@spring.message 'sign_in.page.sign_in'/></button>-->
            </form>
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