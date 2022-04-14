<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" %>

<link rel="stylesheet" href="/login/login.css">
<div class="main">
    <form action="/Save" method="POST" class="form" id="form-1">
        <h3 class="heading">Đăng ký thành viên</h3>

        <div class="spacer"></div>

        <div class="form-group">
            <label for="fullname" class="form-label">Tên đầy đủ</label>
            <input id="fullname" name="userName" type="text" placeholder="Nhập FullName" class="form-control">
            <span class="form-message"></span>
        </div>

        <div class="form-group">
            <label for="email" class="form-label">Email</label>
            <input id="email" name="email" type="text" placeholder="Nhập Email" class="form-control">
            <span class="form-message"></span>
        </div>

        <div class="form-group">
            <label for="phone" class="form-label">Phone</label>
            <input id="phone" name="phone" type="text" placeholder="Nhập số điện thoại" class="form-control">
            <span class="form-message"></span>
        </div>

        <div class="form-group">
            <label for="password" class="form-label">Mật khẩu</label>
            <input id="password" name="passwd" type="password" placeholder="Nhập mật khẩu" class="form-control">
            <span class="form-message"></span>
        </div>

        <div class="form-group">
            <label for="password_confirmation" class="form-label">Nhập lại mật khẩu</label>
            <input id="password_confirmation" placeholder="Nhập lại mật khẩu" type="password" class="form-control">
            <span class="form-message"></span>
        </div>

        <button class="form-submit" style="margin-bottom: 12px">Đăng Ký</button>
        <a href="/_admin/login" style="text-decoration: none; font-size: 13px">Already Have An Account</a>
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
            // email
            Validator.isRequired('#email', 'Vui lòng nhập trường này'),
            Validator.isEmail('#email', 'Trường này phải là emai'),
            // password
            Validator.minLength('#password', 6, 'Vui lòng nhập tối thiểu 6 ký tự'),
            // phone
            Validator.minmaxLength('#phone', 10, 11, 'Nhập tối thiểu 10 số và tối đa 11 số'),
            // confirm password
            Validator.isRequired('#password_confirmation', 'Vui lòng nhập trường này'),
            Validator.isConfirmed('#password_confirmation', function() {
                return document.querySelector('#form-1 #password').value;
            }, 'Mật khẩu nhập lại không trùng khớp'),
        ]
    });
</script>