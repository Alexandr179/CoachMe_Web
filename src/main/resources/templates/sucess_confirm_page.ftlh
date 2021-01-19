<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>success_confirm_page</title>
</head>
<body>
<#if isConfirmed == true>
    <h3>isConfirmed! ConfirmCode User-ра подтвержден.</h3>
<#else >
    <h3>NOT isConfirmed! ConfirmCode User-ра не подтвержден.</h3>
</#if>
</body>
</html>