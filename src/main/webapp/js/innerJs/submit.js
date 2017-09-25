function drawKano() {
//	var mytable1 = document.getElementById('myBootstrapTtable');
	TableToJson('myBootstrapTtable');
	document.getElementById("formid").submit();
}

/*
 * 将表格数据转换为json
 */
var keysArr = new Array("type", "charmNeed","expectNeed", "basicNeed", "indifferentNeed", "reverseNeed", "problem", "result");
    function TableToJson(tableid) { //tableid是你要转化的表的表名，是一个字符串，如"example"  
//    	var tableid = 'myBootstrapTtable';
        var rows = document.getElementById(tableid).rows.length; //获得行数(包括thead)  
        var colums = document.getElementById(tableid).rows[0].cells.length; //获得列数  
        var json = "[";  
        var tdValue;  
        for (var i = 1; i < rows; i++) { //每行  
            json += "{";  
            for (var j = 0; j < colums; j++) {  
                tdName = keysArr[j]; //Json数据的键  
                json += "\""; //加上一个双引号  
                json += tdName;  
                json += "\"";   
                json += ":";  

                tdValue = document.getElementById(tableid).rows[i].cells[j].innerHTML;//Json数据的值  
//                if (j === 1) {//第1列是日期格式，需要按照json要求做如下添加  
//                    tdValue = "\/Date(" + tdValue + ")\/";  
//                }  
                json += "\"";   
                json += tdValue;  
                json += "\"";   
                json += ",";  
            }  
            json = json.substring(0, json.length - 1);  
            json += "}";  
            json += ",";  
        }  
        json = json.substring(0, json.length - 1);  
        json += "]";  
        console.log(json);
        return json;  
    }
    
//	<script src="js/outerJs/jquery.min.js"></script>
//	<script src="js/outerJs/bootstrap-table.min.js"></script>
//	<script src="js/outerJs/bootstrap-table-zh-CN.min.js"></script>
//	<script src='js/outerJs/jquery-ui.min.js'></script>
//	<script src='js/outerJs/underscore.js'></script>
//	<script src="js/innerJs/solveData.js"></script>
//	<script src="js/innerJs/tableFeature.js"></script>
//	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
//	<script type="text/javascript" src="assets/js/typeahead-bs2.min.js"></script>
//	<script type="text/javascript" src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
//	<script type="text/javascript" src="assets/js/jqGrid/jquery.jqGrid.min.js"></script>
//	<script type="text/javascript" src="assets/js/jqGrid/i18n/grid.locale-en.js"></script>
//	<script type="text/javascript" src="assets/js/ace-elements.min.js"></script>
//	<script type="text/javascript" src="assets/js/ace.min.js"></script>
//	<script src="js/innerJs/modelPop.js"></script>
//	<script src="js/innerJs/buttonFeature.js"></script>
//	<script src="js/innerJs/submit.js"></script>