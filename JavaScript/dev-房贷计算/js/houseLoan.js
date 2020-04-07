function validateUnitPrice() {
    return validateRegex("unitPrice", /^\d+(\.\d{1,2})?$/);
}

function validateRent() {
    return validateRegex("rent", /^\d+(\.\d{1,2})?$/);
}

function validatePropertyFee() {
    return validateRegex("propertyFee", /^\d+(\.\d{1,2})?$/);
}

function validateArea() {
    return validateRegex("area", /^\d+(\.\d{1,2})?$/);
}

function validateLoanRate() {
    return validateRegex("loanRate", /^\d+(\.\d{1,2})?$/);
}

function validate() {
    return validateUnitPrice() &&
        validateRent() &&
        validatePropertyFee() &&
        validateArea() &&
        validateLoanRate();
}

function calculate() {
    if (validate()) {
        var unitPrice = parseFloat(getValue("unitPrice"));
        var rent = parseFloat(getValue("rent"));
        var propertyFee = parseFloat(getValue("propertyFee"));
        var area = parseFloat(getValue("area"));
        var downPayment = parseFloat(getValue("downPayment"));
        var loanRate = parseInt(getValue("loanRate"))/100;

        document.getElementById("downPaymentAmount").innerHTML = "￥" + round(unitPrice * area * downPayment, 2);

        var totalLoan = unitPrice * area * (1 - downPayment);
        document.getElementById("totalLoan").innerHTML = "￥" + round(totalLoan,2);
        document.getElementById("monthlyPayInterest").innerHTML = "￥" + round(totalLoan * loanRate / 12, 2);
        document.getElementById("monthPayTheRent").innerHTML = "￥" + round(rent * area, 2);
        document.getElementById("monthlyPropertyFee").innerHTML = "￥" + round(propertyFee * area, 2);
    }
}

function getValue(element) {
    return document.getElementById(element).value;
}

window.onload = function () {
    document.getElementById("unitPrice").addEventListener("blur", validateUnitPrice, false);
    document.getElementById("rent").addEventListener("blur", validateRent, false);
    document.getElementById("propertyFee").addEventListener("blur", validatePropertyFee, false);
    document.getElementById("area").addEventListener("blur", validateArea, false);
    document.getElementById("loanRate").addEventListener("blur", validateLoanRate, false);
    document.getElementById("calculate").addEventListener("click", calculate, false);
}
