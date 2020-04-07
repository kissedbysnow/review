function validateEmployeeNo() {
    return validateRegex("employeeNo",/^\d{4}$/);
}
function validateEmployeeName() {
    return validateEmpty("employeeName");
}
function validatePosition() {
    return validateEmpty("position");
}
function validateHireDate() {
    return validateRegex("hireDate",/^\d{4}-\d{2}-\d{2}$/);
}
function validateBaseWage() {
    return validateRegex("baseWage",/^\d+(\.\d{1,2})?$/);
}
function validateCommission() {
    return validateRegex("commission",/^\d+(\.\d{1,2})?$/);
}

function validate(){
	return validateEmployeeNo() &&
		   validateEmployeeName() &&
		   validatePosition() &&
		   validateHireDate() &&
		   validateBaseWage() &&
		   validateCommission();
}

window.onload= function(){
	document.getElementById("employeeNo").addEventListener("blur",validateEmployeeNo,false);
	document.getElementById("employeeName").addEventListener("blur",validateEmployeeName,false);
	document.getElementById("position").addEventListener("blur",validatePosition,false);
	document.getElementById("hireDate").addEventListener("blur",validateHireDate,false);
	document.getElementById("baseWage").addEventListener("blur",validateBaseWage,false);
	document.getElementById("commission").addEventListener("blur",validateCommission,false);
}