function solveModel(){
	var mytable = document.getElementById('modelTable');
    var tableData = mytable.outerText.split('\n');
    
    var projectName = tableData[0].split('	')[1];
    if(projectName===''){
    	alert('请输入评价类别');
    }else{
    	var tableArr = [[],[],[],[],[]];
    for(var i=0;i<5;i++){
    	var rowData = tableData[3+i].split('	');
    	for(var j=0;j<5;j++){
    		if(isNaN(Number(rowData[rowData.length+j-5])) || rowData[rowData.length+j-5]===''){
    			alert("输入数据不规范");
    			tableArr = [[],[],[],[],[]];
    			continue;
    		}else{
    			tableArr[i].push(Number(rowData[rowData.length+j-5]));
    		}
    	}
    }
    tableArr.push(projectName);
    }
    var charmValue = tableArr[0][1]+tableArr[0][2]+tableArr[0][3];
    var exceptValue = tableArr[0][4];
    var mustValue = tableArr[1][4]+tableArr[2][4]+tableArr[3][4];
    var indifferentValue = cal(tableArr);
    var reverseValue = tableArr[1][0]+tableArr[2][0]+tableArr[3][0]+tableArr[4][0]+
				tableArr[4][1]+tableArr[4][2]+tableArr[4][3];
    var problemValue = tableArr[0][0]+tableArr[4][4];
    
    function cal(tableArr){
    	var tempValue = 0;
    	for(var i=0;i<3;i++){
    		for(var j=0;j<3;j++){
    			tempValue +=tableArr[1+i][1+j];
    		}
    	}
    	return tempValue;
    }
    
    var resultArr = [charmValue,'魅力型需求',exceptValue,'期望型需求',mustValue,'基本型需求',
    				indifferentValue,'无差异需求',reverseValue,'反向型需求',mustValue,'问题问卷'];
    var maxValue = 0;
    var maxName = '意向不明';
    for(var i=0;i<3;i++){
    	if(resultArr[2*i]>maxValue){
    		maxValue = resultArr[2*i];
    		maxName = resultArr[2*i+1];
    	}
    }
//    var modelStr =$('.modal-body-modify').html();
    return [tableArr[5],charmValue,exceptValue,mustValue,indifferentValue,reverseValue,problemValue,maxName];
}