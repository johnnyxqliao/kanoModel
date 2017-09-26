//添加数据
function addrow() {
	$(".table-editable").remove();
	$("#tableBody").append(originTable);
	$('#itemAdd').modal('show');
}

//工序自动生成，选择行的index为工序号
function generateId(value,row,index) {
	return index+1;
}

//添加表格数据
var modelTableArr = [];
function addItem() {
	var datanum = $('#myBootstrapTtable').bootstrapTable('getData').length;
//	console.log(JSON.stringify($('#myBootstrapTtable').bootstrapTable('getData')));
	var modelTableData = solveModel();
	modelTableArr.push($('.modal-body').html());
	var rowdata= {
			procedureIdForDelete:datanum+1,
			type:modelTableData[0],
			charmValue:modelTableData[1],
			exceptValue:modelTableData[2],
			mustValue:modelTableData[3],
			indifferentValue:modelTableData[4],
			reverseValue:modelTableData[5],
			problemValue:modelTableData[6],
			result:modelTableData[7],
	    };
	$('#myBootstrapTtable').bootstrapTable('append', rowdata);
}

//更新表格数据
function updataItem() {
	var modelTableData = solveModel();
	modelTableArr.splice(updateindex, 1, $('.modal-body-modify').html());
	var rowdata= {
			type:modelTableData[0],
			charmValue:modelTableData[1],
			exceptValue:modelTableData[2],
			mustValue:modelTableData[3],
			indifferentValue:modelTableData[4],
			reverseValue:modelTableData[5],
			problemValue:modelTableData[6],
			result:modelTableData[7],
	    };
	$('#myBootstrapTtable').bootstrapTable('updateRow', {index: updateindex, row: rowdata});
}

//编辑表格
function actionFormatter(value, row, index) {
    return [
        '<a class="edit ml10" href="javascript:void(0)" title="Edit">',
        '<i class="glyphicon glyphicon-edit"></i>',
        '</a>'
    ].join('');
}
var updateindex = 1;
window.actionEvents = {
    'click .edit': function (e, value, row, index) {
    	$(".table-editable").remove();
    	$("#tableBodyModify").append(modelTableArr[index]);
    	$('#modifyItem').modal('show');
    	updateindex = index;
     }
 };

//删除某一行
function deleterow() {
	// 遍历数组中的每个元素，并按照return中的计算方式 形成一个新的元素，放入返回的数组中
	var ids = $.map($('#myBootstrapTtable').bootstrapTable('getSelections'),
			function(row) {
				return row.procedureIdForDelete;
			});
	$('#myBootstrapTtable').bootstrapTable('remove', {
		field : 'procedureIdForDelete',
		values : ids
	});
}