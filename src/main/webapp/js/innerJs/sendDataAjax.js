function saveProject(){
	var data = JSON.stringify($('#myBootstrapTtable').bootstrapTable('getData'));
	$.ajax({
		  type: 'POST',
		  url: 'getAjaxData',
		  data: data,
		  success: function(data){
			  console.log("this is a test");
		  }
//		  dataType: dataType
		});
}