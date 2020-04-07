window.onload = function() { //在页面加载以后进行动态事件绑定
    document.getElementById("loginForm").addEventListener("submit", function(e) {
        console.log(e);
        var email = document.getElementById("email");
        if (email.value == "") {
            email.className = "failure";
            skip(e);
        } else { //输入正确，可以提交
            if (/^\w+@\w+\.\w+$/.test(email.value)) {
                this.submit(); //当前元素提交表单
            } else {
                email.className = "failure";
         		skip(e);
            }
        }
    }, false);
}

function skip(e) {
    if (e && e.preventDefault) { //现在是W3C标准下执行
        e.preventDefault(); //阻止浏览器的动作
    } else { //专门针对于IE浏览器的处理
        window.event.returnValue = false;
    }
}