<!doctype html>
<#import "spring.ftl" as spring />
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>

    <title><@spring.message 'profile.page.title'/></title>
    <#include "commons/bootstrap-jetty-common.ftlh" />
    <#--  ВНИМАНИЕ: в  script src="/js/profile.js"    ВСЕГДА проставляется сначала "/" !! -->
    <script src="/js/profile.js"></script>

    <#--  ПОПЫТКА написать отдельно: <link rel="stylesheet" type="text/css" href="scss/problem_ppp.scss"/>  ..не проходит:(  -->
    <style>
    /*http://htmlbook.ru/blog/svoi-shrift-na-stranitse*/
    /*https://ofont.ru/view/5126 примеры шрифтов*/
    @font-face {
        font-family: Copperplate; /* Гарнитура шрифта */
        src: url(/fonts/copperplate.ttf); /* Путь к файлу со шрифтом  */
    }
    @font-face {
        font-family: A_La_Russ;
        src: url(/fonts/A_La_Russ.ttf); /* >>>>>>> ВНИМАНИЕ!->> "/" в "/fonts.." обязателен! */
    }
    /*.container{*/
    /*    width: 1100px;*/
    /*}*/
    .jumbotron{
        background: none;
        text-align: center;
    }
    #font_for_jumbo {
        font-family: A_La_Russ, 'Comic Sans MS', serif; /* 2-.., если не поддерживается для старых версий... */
    }

    .contentContainer_2{
        background: url("/img/fond/fond_problem_ppp_jombo.png") 0 0 no-repeat;
        background-size: cover;
        color: slateblue;
    }
</style>
</head>

<body>
    <!-- HEADER -->
    <div class="container-fluid header">
        <nav class="navbar navbar-light bg-light">
            <a class="btn btn-outline-success" href="/logout" role="button"><@spring.message 'profile.page.exit'/></a>
            <h5>${authUser.email}</h5>
        </nav>
    </div>

    <!-- если не задан contener с фикс.рамером текст (картинка) будет 'разъезжаться'.. (FULL-HD, 1920px для картинки) -->

    <!-- CONTENT 1 -->
    <div class="container-fluid contentContainer_1">
        <div class="container"> <!-- container дополнительные классы !не задаются!! -->
            <div class="row">
                <div class="col-lg-4">Контент строки (колонка col-lg-4)</div>
                <div class="col-lg-4">Контент строки (колонка col-lg-4)</div>
                <div class="col-lg-4">Контент строки (колонка col-lg-4)</div>
            </div>
            <div class="row">
                <div class="col-lg-12"><h3 align="center">контент строки row-2 ....</h3></div>
            </div>
        </div>
    </div>

    <!-- CONTENT 2 -->
    <div class="container-fluid contentContainer_2">
        <div class="container"> <!-- container дополнительные классы !не задаются!! -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="jumbotron">
                        <h3 id="font_for_jumbo" class="display-4">Привет, мир!</h3>
                        <p class="lead">Это простой пример блока с компонентом в стиле jumbotron для привлечения дополнительного внимания к содержанию или информации.</p>
                        <hr class="my-4">
                        <p>Использются служебные классы для типографики и расстояния содержимого в контейнере большего размера.</p>
                        <p class="lead">
                            <a class="btn btn-light btn-lg" href="#" role="button">Пример Bootstrap/CSS</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- CONTENT 3 -->
    <div class="container-fluid contentContainer_3 mt-5">
        <div class="container">
            <div class="row justify-content-left">
                <div class="col">
                    <table class="table">
                        <thead class="thead-light">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col"><@spring.message 'profile.page.table.columns.name'/></th>
                            <th scope="col"><@spring.message 'profile.page.table.columns.lastname'/></th>
                            <th scope="col"><@spring.message 'profile.page.table.columns.email'/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list users as user>
                            <tr>
                                <th scope="row">${user?counter}</th>
                                <td>${user.firstName}</td>
                                <td>${user.lastName}</td>
                                <td>${user.email}</td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
                <div class="col">
                    <table class="table">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Имя темы</th>
                            <#--            <th>Участники</th>-->
                        </tr>
                        </thead>
                        <tbody>
                        <#list themes as theme>
                            <tr>
                                <th scope="row">${theme?counter}</th>
                                <td>${theme.name}</td>
                                <#--                <td>${theme.users}</td>-->
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row">
                <div class="col-2"></div>
                <div class="col-10">
                    <h3>Send user to Theme with Ajax:</h3><br>
                    <div>
                        <input id="idNameTheme" type="text" name="themeName" value="Relations" placeholder="Relations">
                        <input id="idUserEmail" type="text" name="userEmail" value="user3@gmail.com"
                               placeholder="user3@gmail.com">
                        <button onclick="addUserToTheme($('#idNameTheme').val(), $('#idUserEmail').val())">
                            Add user to Theme
                        </button>
                    </div>
                </div>
            </div>

            <div class="row align-content-center mt-3">
                <div class="col-12">
                    <div id="usersTableOn_problemPersonPage">
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- FOOTER -->
    <div class="container-fluid footer">
        <nav class="navbar navbar-light bg-light justify-content-center mt-4">
          <span class="navbar-text">
              Produced by @2CodeProduction. 2021
          </span>
        </nav>
    </div>
</body>
</html>
