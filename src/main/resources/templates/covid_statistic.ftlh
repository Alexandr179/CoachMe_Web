<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Covid_statistic</title>
</head>
<body>
<div>
    <h3>Covid_statistic is:</h3>
    <div>
        <table>
            <tr>
                <th>Страна</th>
                <th>Новые подтвержденные случаи</th>
                <th>Общее количество подтвержденных случаев</th>
            </tr>
            <#list countries as country>
                <tr>
                    <td>${country.country}</td>
                    <td>${country.newConfirmed}</td>
                    <td>${country.totalConfirmed}</td>
                </tr>
            </#list>
        </table>
    </div>
</div>
</body>
</html>