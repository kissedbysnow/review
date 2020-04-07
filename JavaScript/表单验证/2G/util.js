//本文件是一个JS工具文件 里面提供一系列的属性、函数、方法
//本方法主要是验证指定元素的内容是否为空
 function validateEmpty(eleId){
 	var obj = document.getElementById(eleId);
 	var spanObj = document.getElementById(eleId+"Span");
	 if(obj!=null){
	 	if(obj.value==""){
	 		obj.className="failure";
	 		spanObj.innerHTML="<font color='red'>×</font>";//设置元素内部内容
	 		return false;
	 	}else{
	 		obj.className="success";
	 		spanObj.innerHTML="<font color='green'>√</font>";//设置元素内部内容
	 		return true;
	 	}
	 }
	 return false;
 }

//阻止表单在出现问题时进行提交
 function formStop(e){
 	if(e && e.preventDefault){//现在是W3C标准下执行
		e.preventDefault();//阻止浏览器的动作
	}else{//专门针对于IE浏览器的处理
		window.event.returnValue = false;
	}
 }