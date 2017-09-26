//function saveProject() {
//	if ( $("#projectName").val()=="") {
//		alert("请输入当前工程名");
//	} else {
//		
//		var alldata = $('#myBootstrapTtable').bootstrapTable('getData');
//		//由于Struts不能解析"[]"表示的对象，所以对上面的对象数组进行转换
//		var param = {};
//		for(var i=0;i<alldata.length;i++){
//			 param["linelist[" + i + "].projectName"] = $("#projectName").val();
//			 param["linelist[" + i + "].procedureName"] = alldata[i].procedureName;
//			 param["linelist[" + i + "].worksationName"] = alldata[i].worksationName;
//			 param["linelist[" + i + "].pNumber"] = alldata[i].pNumber;
//			 param["linelist[" + i + "].workTime"] = alldata[i].workTime;
//			 param["linelist[" + i + "].preWork"] = alldata[i].preWork;
//			 param["linelist[" + i + "].nonValueTime"] = alldata[i].nonValueTime;
//			 param["linelist[" + i + "].changeTime"] = alldata[i].changeTime;
//			 param["linelist[" + i + "].procedureId"] = i+1;
//		}
//		
//		$.ajax({
//			 type: 'post',
//	         url: 'saveProject',
//	         data: param,
//	        
//	         success: function(data){
//	        	 alert("保存成功");
//	         }
//		});
//	}
//}
