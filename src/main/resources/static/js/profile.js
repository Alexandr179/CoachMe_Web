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
        data: JSON.stringify(themeForm),
        beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (data) {
            let resultList = "<ul>";
            data.forEach(function (value, index, array) {
                resultList += '<li>' + value["themeName"] + '</li>';
            })
            resultList += '</ul>';
            document.getElementById("usersTable").innerHTML = resultList;
        },
        error: function(data){
            alert("Something wrong, try again!")
            location.reload();
        },
        contentType: "application/json",
        dataType: "json"
    });
}
