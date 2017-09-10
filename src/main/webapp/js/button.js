
//添加按钮模态弹出框
function addrow() {
	$('#itemAdd').modal('show');
}
//加载模态框表格
$(document).ready(function(){
	var arr = ["不喜欢","能忍受","无所谓","理应如此","喜欢"];
	$('<tr>'+
	'<td rowspan="8" width="5px" style="text-align:center;font:	Microsoft YaHei">正向问题（具有该项功能）</td>'+
	'<td>'+arr[4]+'</td>'+
	'<td contenteditable="true">0</td>'+
	'<td contenteditable="true">0</td>'+
	'<td contenteditable="true">0</td>'+
	'<td contenteditable="true">0</td>'+
	'<td contenteditable="true">0</td>'+
	'<tr>').insertAfter($('#table tr:eq(2)'));
	for(var i=0;i<4;i++){
		$('<tr>'+
		'<td>'+arr[i]+'</td>'+
		'<td contenteditable="true">0</td>'+
		'<td contenteditable="true">0</td>'+
		'<td contenteditable="true">0</td>'+
		'<td contenteditable="true">0</td>'+
		'<td contenteditable="true">0</td>'+
		'<tr>').insertAfter($('#table tr:eq(3)'));
	}
	});