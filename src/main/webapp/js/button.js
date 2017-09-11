
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
//删除表格中的某行
function deleterow(){
	$("input[name='btSelectAll']:checked").each(function() { // 遍历选中的checkbox
        n = $(this).parents("tr").index();  // 获取checkbox所在行的顺序
        $("table#myBootstrapTtable").find("tr:eq("+n+")").remove();
    });
}
//绘制Kano模型
function drawKano(){
	 // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
 // Prime Costs and Prices for ACME Fashion\nCollection "Spring-Summer, 2016"
 // Data from https://playground.anychart.com/gallery/7.12.0/Error_Charts/Marker_Chart
 var dimensions = [
     'name', 'Price', 'Prime cost', 'Prime cost min', 'Prime cost max', 'Price min', 'Price max'
 ];
 var data = [
     ['Blouse "Blue Viola"', 100, 100, 76.75, 116.75, 80, 110],
     ['Dress "Daisy"', 155.8, 144.03, 126.03, 156.03, 129.8, 188.8],

     ['Sweater "Fluffy Comfort"', 790.34, 678.34, 660.34, 690.34, 762.34, 824.34]
 ];

 function renderItem(params, api) {
     var children = [];
     var coordDims = ['x', 'y'];

     for (var baseDimIdx = 0; baseDimIdx < 2; baseDimIdx++) {
         var otherDimIdx = 1 - baseDimIdx;
         var encode = params.encode;
         var baseValue = api.value(encode[coordDims[baseDimIdx]][0]);
         var param = [];
         param[baseDimIdx] = baseValue;
         param[otherDimIdx] = api.value(encode[coordDims[otherDimIdx]][1]);
         var highPoint = api.coord(param);
         param[otherDimIdx] = api.value(encode[coordDims[otherDimIdx]][2]);
         var lowPoint = api.coord(param);
         var halfWidth = 5;

         var style = api.style({
             stroke: api.visual('color'),
             fill: null
         });

         children.push({
             type: 'line',
             shape: makeShape(
                 baseDimIdx,
                 highPoint[baseDimIdx] - halfWidth, highPoint[otherDimIdx],
                 highPoint[baseDimIdx] + halfWidth, highPoint[otherDimIdx]
             ),
             style: style
         }, {
             type: 'line',
             shape: makeShape(
                 baseDimIdx,
                 highPoint[baseDimIdx], highPoint[otherDimIdx],
                 lowPoint[baseDimIdx], lowPoint[otherDimIdx]
             ),
             style: style
         }, {
             type: 'line',
             shape: makeShape(
                 baseDimIdx,
                 lowPoint[baseDimIdx] - halfWidth, lowPoint[otherDimIdx],
                 lowPoint[baseDimIdx] + halfWidth, lowPoint[otherDimIdx]
             ),
             style: style
         });
     }

     function makeShape(baseDimIdx, base1, value1, base2, value2) {
         var shape = {};
         shape[coordDims[baseDimIdx] + '1'] = base1;
         shape[coordDims[1 - baseDimIdx] + '1'] = value1;
         shape[coordDims[baseDimIdx] + '2'] = base2;
         shape[coordDims[1 - baseDimIdx] + '2'] = value2;
         return shape;
     }

     return {
         type: 'group',
         children: children
     };
 }

 option = {
     tooltip: {
     },
     legend: {
         data: ['bar', 'error']
     },
     dataZoom: [{
         type: 'slider',
         height: 8,
         bottom: 20,
         borderColor: 'transparent',
         backgroundColor: '#e2e2e2',
         handleIcon: 'M10.7,11.9H9.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4h1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7v-1.2h6.6z M13.3,22H6.7v-1.2h6.6z M13.3,19.6H6.7v-1.2h6.6z', // jshint ignore:line
         handleSize: 20,
         handleStyle: {
             shadowBlur: 6,
             shadowOffsetX: 1,
             shadowOffsetY: 2,
             shadowColor: '#aaa'
         }
     }, {
         type: 'inside'
     }],
     grid: {
         bottom: 80
     },
     xAxis: {},
     yAxis: {},
     series: [{
         symbolSize: 20,
         type: 'scatter',
         name: 'error',
         data: data,
         dimensions: dimensions,
         encode: {
             x: 2,
             y: 1,
             tooltip: [2, 1, 3, 4, 5, 6],
             itemName: 0
         },
         itemStyle: {
             normal: {
                 color: '#77bef7'
             }
         }
     }, {
         type: 'custom',
         name: 'error',
         renderItem: renderItem,
         dimensions: dimensions,
         encode: {
             x: [2, 3, 4],
             y: [1, 5, 6],
             tooltip: [2, 1, 3, 4, 5, 6],
             itemName: 0
         },
         data: data,
         z: 100
     },
     {
         type: 'scatter',
         symbolSize: 1,
         symbol: 'roundRect',
         data: [[1, 1],[0.5, 1],[1.5, 1]],
         label: {
             normal: {
                 position: 'left',
                 distance: 10,
                 show: true,
                 formatter: [
                     'Label Text',
                 ].join('\n'),
                 backgroundColor: '#eee',
                 borderColor: '#555',
                 borderWidth: 2,
                 borderRadius: 5,
                 padding: 10,
                 fontSize: 18,
                 shadowBlur: 3,
                 shadowColor: '#888',
                 shadowOffsetX: 0,
                 shadowOffsetY: 3,
                 textBorderColor: '#000',
                 textBorderWidth: 3,
                 color: '#fff'
             }
         }
     }]
 };
    myChart.setOption(option);
}