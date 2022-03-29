// Contructer function
function Validator(options) {
    var selectorRules = {};
    // Hàm thực hiện validate
    function validate(inputElement, rule) {
        var errorElement = inputElement.parentElement.querySelector(options.errorSelector);
        var errorMsg;
        // Layas ra cac rule cua selector
        var rules = selectorRules[rule.selector];
        // Lap qua tung rule & kiem tra
        // Neu co loi thi break
        for (var i = 0; i < rules.length; ++i){
            errorMsg = rules[i](inputElement.value);
            if(errorMsg) break;
        }
        if(errorMsg) {
            errorElement.innerText = errorMsg;
            inputElement.parentElement.classList.add('invalid');
        }else {
            errorElement.innerText = '';
            inputElement.parentElement.classList.remove('invalid')
        }
        return !errorMsg;
    }
    // Hàm thực hiện check oninput
    function oninputFunc(inputElement) {
        var errorElement = inputElement.parentElement.querySelector(options.errorSelector);
        errorElement.innerText = '';
        inputElement.parentElement.classList.remove('invalid')
    }
    // Lấy element của form
    var formElement = document.querySelector(options.form);
    if(formElement){
        //  khi submit form
        formElement.onsubmit = function (e) {
            e.preventDefault();
            var isFormValid = true;
            // Lặp qua từng rule và validate
            options.rules.forEach(function(rule) {
                var inputElement = formElement.querySelector(rule.selector);
                var isValid = validate(inputElement, rule);
                if(!isValid){
                    isFormValid = false;
                }
            });
            if(isFormValid){
                // Submit với TH mặc định
                formElement.submit();
            }
        }
        // Lặp qua mỗi rule và xử lý (lắng nghe sự kiện: blur, oninput)
        options.rules.forEach(function(rule) {
            // Lưu lại các rules cho mỗi input
            if(Array.isArray(selectorRules[rule.selector])) {
                selectorRules[rule.selector].push(rule.test);
            }else {
                selectorRules[rule.selector] = [rule.test];
            }
            var inputElement = formElement.querySelector(rule.selector);
            if(inputElement){
                //  Xử lý trường hợp blur
                inputElement.onblur = function() {
                    validate(inputElement, rule);
                };
                // Xử lý trường hợp mỗi khi ng dùng nhập vào inputElement
                inputElement.oninput = function() {
                    oninputFunc(inputElement);
                };
            }
        });
    }
}
// Định nghĩa các rules
// Nguyeen tắc rule: khi có lỗi -> trả msg lỗi
// hợp lệ -> không trả ra gì cả
Validator.isRequired = function(selector, msg) {
    return {
        selector: selector,
        test: function (value) {
            return value.trim() ? undefined :  msg ;
        }
    }
}

Validator.isEmail = function(selector, msg) {
    return {
        selector: selector,
        test: function (value) {
            var regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return regex.test(value) ? undefined :  msg ;
        }
    }
}
Validator.minLength = function(selector, min, msg) {
    return {
        selector: selector,
        test: function (value) {
            return value.length >= min? undefined :  msg;
        }
    }
}

Validator.isConfirmed = function(selector, getConfirmPassword, msg) {
    return {
        selector: selector,
        test: function (value) {
            return value === getConfirmPassword() ? undefined : msg ;
        }
    }
}