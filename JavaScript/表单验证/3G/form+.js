//失去焦点onblur事件，获得焦点onfocus
window.onload=function(){
	
	document.getElementById("uid").addEventListener("blur",validateUid,false);
	document.getElementById("password").addEventListener("blur",validatePassword,false);	
	document.getElementById("conf").addEventListener("blur",validateConf,false);
	
	document.getElementById("loginForm").addEventListener("submit",function(e){
		if (validateUid()&&validatePassword()) {
			this.submit();//可以提交
		}else{
			formStop(e);
		}
	},false)
}
function validateUid(){
	return validateEmail("uid");
}
function validatePassword(){
	return validateEmpty("password");
}
function validateConf(){
	return validateRepeat("password","conf");
}