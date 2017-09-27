function saveProject(){
	var data = JSON.stringify($('#myBootstrapTtable').bootstrapTable('getData'));
//	var data = $('#myBootstrapTtable').bootstrapTable('getData');
	$.ajax({
		  type: 'POST',
		  url: 'getAjaxData',
		  data: {json:data},
		  dataType:'json',
		  contentType: "application/json; charset=utf-8",
		  success: function(data){
			  console.log("this is a test");
		  }
//		  dataType: dataType
		});
}