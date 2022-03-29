<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/login/login.css">
</head>
<body>
<div class="main">
    <form action="/_admin/doLogin" method="POST" class="form" id="form-1">
        <h3 class="heading">Vui lòng đăng nhập</h3>

        <div class="spacer"></div>

        <div class="form-group">
            <label for="fullname" class="form-label">User Name</label>
            <input id="fullname" name="userName" type="text" placeholder="User Name" class="form-control">
            <span class="form-message"></span>
        </div>

<%--        <div class="form-group">--%>
<%--            <label for="email" class="form-label">Email</label>--%>
<%--            <input id="email" name="email" type="text" placeholder="VD: email@domain.com" class="form-control">--%>
<%--            <span class="form-message"></span>--%>
<%--        </div>--%>

        <div class="form-group">
            <label for="password" class="form-label">PassWord</label>
            <input id="password" name="passwd" type="password" placeholder="Nhập mật khẩu" class="form-control">
            <span class="form-message"></span>
        </div>

<%--        <div class="form-group">--%>
<%--            <label for="password_confirmation" class="form-label">Nhập lại mật khẩu</label>--%>
<%--            <input id="password_confirmation" name="password_confirmation" placeholder="Nhập lại mật khẩu" type="password" class="form-control">--%>
<%--            <span class="form-message"></span>--%>
<%--        </div>--%>

        <button class="form-submit">Đăng ký</button>
    </form>

</div>
<script src="/validator/validate.js"></script>
<script>

    // Mong muốn
    Validator({
        form: '#form-1',
        errorSelector: '.form-message',
        rules:[
            // hoten
            Validator.isRequired('#fullname', 'Vui lòng nhập trường này'),
            Validator.isRequired('#password', 'Vui lòng nhập PassWord'),
            // email
            // Validator.isRequired('#email', 'Vui lòng nhập trường này'),
            // Validator.isEmail('#email', 'Trường này phải là emai'),
            // password
            // Validator.minLength('#password', 6, 'Vui lòng nhập tối thiểu 6 ký tự'),
            // confirm password
            // Validator.isRequired('#password_confirmation', 'Vui lòng nhập trường này'),
            // Validator.isConfirmed('#password_confirmation', function() {
            //     return document.querySelector('#form-1 #password').value;
            // }, 'Mật khẩu nhập lại không trùng khớp'),
        ]
    });
</script>
</body>
</html>