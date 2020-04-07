//本文件是一个JS工具文件 里面提供一系列的属性、函数、方法

//四舍五入工具类 round(1.123,2)=1.12
function round(number, scale) {
    var magnitude = Math.pow(10, scale);
    return Math.round(number * magnitude) / magnitude;
}