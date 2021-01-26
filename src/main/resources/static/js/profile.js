function addUserToTheme(themeName, userEmail) {
    let themeForm = {
        "themeName": themeName,
        "userEmail": userEmail
    };

    let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");

    $.ajax({
        type: "POST",
        url: "/themes/users/add",
        beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
        data: JSON.stringify(themeForm),
        success: function (data) {
            let resultList = "<ul>";
            data.forEach(function (value, index, array) {
                resultList += '<li>' + value["themeName"] + '</li>';
            })
            resultList += '</ul>';
            document.getElementById("usersTableOn_problemPersonPage").innerHTML = resultList;
        },
        error: function(data){
            alert("Something wrong, try again!")
            location.reload();
        },
        contentType: "application/json",
        dataType: "json"
    });
}
