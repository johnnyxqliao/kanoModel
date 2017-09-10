//添加类别
function addItem(){
	var mytable = document.getElementById('table');
    var tableData = mytable.outerText.split('\n');
    
    var projectName = tableData[0].split('	')[1];
    if(projectName===''){
    	alert('请输入评价类别');
    }else{
    	var tableArr = [[],[],[],[],[]];
    for(var i=0;i<5;i++){
    	var rowData = tableData[3+i].split('	');
    	for(var j=0;j<5;j++){
    		if(isNaN(Number(rowData[rowData.length-j-1])) && rowData[rowData.length-j-1]===''){
    			alert("输入数据不规范");
    			tableArr = [[],[],[],[],[]];
    			break;
    		}else{
    			tableArr[i].push(rowData[rowData.length-j-1]);
    		}
    		
    	}
    }
    tableArr.push(projectName);
    console.log(tableArr);
    }
    
}