<!doctype html>
<#import "spring.ftl" as spring />
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- necessarily! from Ajax/csrf.. https://coderoad.ru/27824273/%D0%9A%D0%B0%D0%BA-%D0%BF%D1%80%D0%B5%D0%B4%D0%BE%D1%81%D1%82%D0%B0%D0%B2%D0%B8%D1%82%D1%8C-%D1%82%D0%BE%D0%BA%D0%B5%D0%BD-CSRF-%D0%B2-%D0%BE%D0%B4%D0%BD%D0%BE%D1%81%D1%82%D1%80%D0%B0%D0%BD%D0%B8%D1%87%D0%BD%D0%BE%D0%BC-%D0%BF%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D0%B8-spring-security  -->
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>

    <title><@spring.message 'profile.page.title'/></title>

    <#--Bootstrap-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <#-- My own CSS stylesheet -->
    <#-- .... -->

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

    <#--JavaScript-->
    <script src="js/profile.js"></script>

</head>

<body>
<div class="container-fluid">
    <nav class="navbar navbar-light bg-light">
        <a class="btn btn-outline-success" href="/logout" role="button"><@spring.message 'profile.page.exit'/></a>
        <h3><@spring.message 'profile.page.welcome'/></h3>
        <h3>${authUser.email}</h3>
    </nav>

    <div class="row justify-content-left">
        <div class="col-2"></div>
        <div class="col-2">
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
        <div class="col-2"></div>
        <div class="col-3">
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
        <div class="col-3"></div>
    </div>

    <div class="row">
        <div class="col-2"></div>
        <div class="col-5">
            <h3>Send user to Theme with Ajax:</h3><br>
            <div>
                <input id="idNameTheme" type="text" name="themeName" value="Relations" placeholder="Relations">
                <input id="idUserEmail" type="text" name="userEmail" value="user3@gmail.com" placeholder="user3@gmail.com">
                <button onclick="addUserToTheme($('#idNameTheme').val(), $('#idUserEmail').val())">
                    Add user to Theme
                </button>
            </div>
        </div>
        <div class="col-5">
            <div id="usersTable">
            </div>
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
