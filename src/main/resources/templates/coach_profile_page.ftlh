<!doctype html>
<#import "spring.ftl" as spring />
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<#--    <meta name="_csrf" content="${_csrf.token}"/>-->
<#--    <meta name="_csrf_header" content="${_csrf.headerName}"/>-->

    <title><@spring.message 'profile.page.title'/></title>
<#--    <#include "commons/bootstrap-jetty-common.ftlh" />-->

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

<#--    <script src="js/profile.js"></script>-->
</head>

<body>
    <div class="container-fluid">
        <!-- navbar -->
        <nav class="navbar navbar-light bg-light">
            <a class="btn btn-outline-success" href="/logout" role="button"><@spring.message 'profile.page.exit'/></a>
            <h5>${authUser.email}</h5>
        </nav>
    </div>

    <!-- content -->
    <div class="container-fluid">

        <div class="row justify-content-left ml-5">
            <div class="col-2"></div>
            <div class="col-7">
<#--                <img class="ml-4" src="/img/logo_width.png" alt="" width="700" height="463">-->
<#--                <h5 class="mt-3 ml-4">How are you? And what are you doing here:)</h5>-->
            </div>
            <div class="col-3"></div>
        </div>


        <div class="row justify-content-left mt-4">
            <div class="col-2"></div>
            <div class="col-8">
<#--                <p class="word-break: break-word"><@spring.message 'profile.page.text.main'/></p>-->
            </div>
            <div class="col-2"></div>
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
