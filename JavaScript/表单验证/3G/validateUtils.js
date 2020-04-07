//本文件是一个JS工具文件 里面提供一系列的属性、函数、方法
//本方法主要是验证指定元素的内容是否为空




 function validateEmpty(eleId){//非空验证
 	var obj = document.getElementById(eleId);
	 if(obj!=null){
	 	if(obj.value==""){
	 		setFailureStyle(obj);
	 		return false;
	 	}else{
	 		setSuccesStyle(obj);
	 		return true;
	 	}
	 }
	 return false;
 }
 function validateRegex(eleId,regex){//正则验证
 	if(validateEmpty(eleId)){//通过不为空验证
 		var obj=document.getElementById(eleId);
 		var spanObj=document.getElementById(eleId+"Span");
 		if(!regex.test(obj.value)){
			setFailureStyle(obj);
	 		return false;
	 	}else{
	 		setSuccesStyle(obj);
	 		return true;
	 	}
 	}
 	return false;
 }
function validateEmail(eleId){//调用正则验证，完善email验证
	return validateRegex(eleId,/^\w+@\w+\.\w+$/);
}
// function validateNumber(eleId){//调用正则验证，完善number验证（没用上）
// 	return validateRegex(eleId,/^\d+(\.\d+)?$/);
// }
function validateRepeat(srcId,distId){//密码确认验证，两个密码比较。调用非空验证
	if(validateEmpty(srcId)&& validateEmpty(distId)){
		var srcObj=document.getElementById(srcId);
		var distObj=document.getElementById(distId);
		if(srcObj.value!=distObj.value){
			setFailureStyle(distObj);
			return false;
		}else{
			setSuccesStyle(distObj);
			return true;
		}
	}
	return false;
}
function setSuccesStyle(obj){//组件，正确
	obj.className="success";
	var spanObj = document.getElementById(obj.id+"Span");
	if (spanObj!=null){
		spanObj.innerHTML="<font color='green'>√</font>";//设置元素内部内容
	}
}
function setFailureStyle(obj){//组件，错误
	obj.className="failure";
 	var spanObj = document.getElementById(obj.id+"Span");
	if(spanObj!=null){
		spanObj.innerHTML="<font color='red'>×</font>";//设置元素内部内容
	}
}


//阻止表单在出现问题时进行提交
 function formStop(e){
 	if(e && e.preventDefault){//现在是W3C标准下执行
		e.preventDefault();//阻止浏览器的动作
	}else{//专门针对于IE浏览器的处理
		window.event.returnValue = false;
	}
 }