var user_Boolean = false;

var password_Boolean = false;

var varconfirm_Boolean = false;

var emaile_Boolean = false;

var Mobile_Boolean = false;

$('#name').blur(function(){

  if ((/^[a-z0-9_-]{4,8}$/).test($("#name").val())){

    $('.user_hint').html("✔").css("color","green");

    user_Boolean = true;

  }else {

    $('.user_hint').html("×").css("color","red");

    user_Boolean = false;

  }

});

$('#password').blur(function(){

  if ((/^[a-z0-9_-]{6,16}$/).test($("#password").val())){

    $('.password_hint').html("✔").css("color","green");

    password_Boolean = true;

  }else {

    $('.password_hint').html("×").css("color","red");

    password_Boolean = false;

  }

});

$('#repassword').blur(function(){

  if (($(".reg_password").val())==($("#repassword").val())){

    $('.repassword_hint').html("✔").css("color","green");

    varconfirm_Boolean = true;

  }else {

    $('.repassword_hint').html("×").css("color","red");

    varconfirm_Boolean = false;

  }

});


$('#phone').blur(function(){

  if ((/^1[34578]\d{9}$/).test($("#phone").val())){

    $('.phone_hint').html("✔").css("color","green");

    Mobile_Boolean = true;

  }else {

    $('.phone_hint').html("×").css("color","red");

    Mobile_Boolean = false;

  }

});

$('.auth-form__button').click(function(){

  if(user_Boolean && password_Boolea && varconfirm_Boolean && emaile_Boolean && Mobile_Boolean == true){

    alert("注册成功");

  }else {

    alert("请完善信息");

  }

});