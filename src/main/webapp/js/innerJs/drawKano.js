//获取表格数据
function getTableData() {
	var kanoTable = document.getElementById('myBootstrapTtable');
	var kanoTableData = kanoTable.outerText.split('\n');
	kanoTableData.splice(0, 11);

	var data = [];
	for (var i = 0; i < kanoTableData.length - 1; i++) {
		var kanoData = kanoTableData[i].split('	');
		kanoData.splice(1,1);
		for (var j = 2; j < 8; j++) {
			kanoData[j] = Number(kanoData[j]);
		}
		var kanoTotal = (kanoData[2] + kanoData[3] + kanoData[4] + kanoData[5]);
		var kanoSi = (kanoData[2] + kanoData[3]) / kanoTotal;
		var kanoDsi = (kanoData[3] + kanoData[4]) / kanoTotal;
		var resultData = [ kanoData[1], kanoDsi, kanoSi, kanoSi - 0.05,
				kanoSi + 0.05, kanoDsi - 0.05, kanoDsi + 0.05 ];
		data.push(resultData);
	}
	if(kanoDsi==0||kanoSi==0||kanoTotal==0){
		alert("数据有问题，请重新编辑");
	}else{
		return data;
	}
}

function drawKano() {
	$('#main').remove();
	$('#solveResult').append('<div id="main" style="width: 600px; height: 600px;"></div>');
	data = getTableData();
	var myChart = echarts.init(document.getElementById('main'));
	var dimensions = [ 'name', 'Price', 'Prime cost', 'Prime cost min',
			'Prime cost max', 'Price min', 'Price max' ];

	function renderItem(params, api) {
		var children = [];
		var coordDims = [ 'x', 'y' ];
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
				stroke : api.visual('color'),
				fill : null
			});
			children.push({
				type : 'line',
				shape : makeShape(baseDimIdx,
						highPoint[baseDimIdx] - halfWidth,
						highPoint[otherDimIdx], highPoint[baseDimIdx]
								+ halfWidth, highPoint[otherDimIdx]),
				style : style
			}, {
				type : 'line',
				shape : makeShape(baseDimIdx, highPoint[baseDimIdx],
						highPoint[otherDimIdx], lowPoint[baseDimIdx],
						lowPoint[otherDimIdx]),
				style : style
			},
					{
						type : 'line',
						shape : makeShape(baseDimIdx, lowPoint[baseDimIdx]
								- halfWidth, lowPoint[otherDimIdx],
								lowPoint[baseDimIdx] + halfWidth,
								lowPoint[otherDimIdx]),
						style : style
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
			type : 'group',
			children : children
		};
	}
	option = {
		title : {
			text : 'kano分析结果'
		},
		toolbox : {
			show : true,
			orient : 'vertical',
			left : 'right',
			top : 'center',
			feature : {
				saveAsImage : {}
			}
		},
		legend : {
			data : [ 'bar' ]
		},
		grid : {
			bottom : 80
		},
		xAxis : {
			splitLine : {
				show : false
			}
		},
		yAxis : {
			splitLine : {
				show : false
			}
		},
		series : [ {
			symbolSize : 20,
			type : 'scatter',
			name : 'error',
			markLine : {
				data : [ {
					type : 'average',
					name : '平均值'
				}, {
					xAxis : 0.6
				}, ]
			},
			data : data,
			dimensions : dimensions,
			encode : {
				x : 2,
				y : 1,
				tooltip : [ 2, 1, 3, 4, 5, 6 ],
				itemName : 0
			},
			itemStyle : {
				normal : {
					color : '#77bef7'
				}
			}
		}, {
			type : 'custom',
			name : 'error',
			renderItem : renderItem,
			dimensions : dimensions,
			encode : {
				x : [ 2, 3, 4 ],
				y : [ 1, 5, 6 ],
				tooltip : [ 2, 1, 3, 4, 5, 6 ],
				itemName : 0
			},
			data : data,
			z : 100
		}, {
			type : 'scatter',
			symbolSize : 1,
			symbol : 'roundRect',
			data : [ [ 0.25, 0.55 ] ],
			label : {
				normal : {
					position : 'left',
					distance : 10,
					show : true,
					formatter : [ '无差异需求', ].join('\n'),
					backgroundColor : '#FFFFFF',
					borderColor : '#FFFFFF',
					borderWidth : 0.5,
					borderRadius : 8,
					padding : 8,
					fontSize : 14,
					shadowBlur : 3,
					shadowColor : '#888',
					shadowOffsetX : 0,
					shadowOffsetY : 3,
					textBorderColor : '	#00BFFF',
					textBorderWidth : 1,
					color : '#00BFFF'
				}
			}
		}, {
			type : 'scatter',
			symbolSize : 1,
			symbol : 'roundRect',
			data : [ [ 0.25, 1.05 ] ],
			label : {
				normal : {
					position : 'left',
					distance : 10,
					show : true,
					formatter : [ '基本需求', ].join('\n'),
					backgroundColor : '#FFFFFF',
					borderColor : '#FFFFFF',
					borderWidth : 0.5,
					borderRadius : 8,
					padding : 8,
					fontSize : 14,
					shadowBlur : 3,
					shadowColor : '#888',
					shadowOffsetX : 0,
					shadowOffsetY : 3,
					textBorderColor : '	#00BFFF',
					textBorderWidth : 1,
					color : '#00BFFF'
				}
			}
		}, {
			type : 'scatter',
			symbolSize : 1,
			symbol : 'roundRect',
			data : [ [ 0.85, 0.55 ] ],
			label : {
				normal : {
					position : 'left',
					distance : 10,
					show : true,
					formatter : [ '魅力需求', ].join('\n'),
					backgroundColor : '#FFFFFF',
					borderColor : '#FFFFFF',
					borderWidth : 0.5,
					borderRadius : 8,
					padding : 8,
					fontSize : 14,
					shadowBlur : 3,
					shadowColor : '#888',
					shadowOffsetX : 0,
					shadowOffsetY : 3,
					textBorderColor : '	#00BFFF',
					textBorderWidth : 1,
					color : '#00BFFF'
				}
			}
		}, {
			type : 'scatter',
			symbolSize : 1,
			symbol : 'roundRect',
			data : [ [ 0.85, 1.05 ] ],
			label : {
				normal : {
					position : 'left',
					distance : 10,
					show : true,
					formatter : [ '期望需求', ].join('\n'),
					backgroundColor : '#FFFFFF',
					borderColor : '#FFFFFF',
					borderWidth : 0.5,
					borderRadius : 8,
					padding : 8,
					fontSize : 14,
					shadowBlur : 3,
					shadowColor : '#888',
					shadowOffsetX : 0,
					shadowOffsetY : 3,
					textBorderColor : '	#00BFFF',
					textBorderWidth : 1,
					color : '#00BFFF'
				}
			}
		}, {
			type : 'scatter',
			symbolSize : 1,
			symbol : 'roundRect',
			data : [ [ 1.2, 1.2 ] ],
			label : {
				normal : {
					position : 'left',
					distance : 10,
					show : false,
				}
			}
		},{
			type : 'scatter',
			symbolSize : 1,
			symbol : 'roundRect',
			data : [ [ 0.5, 1.2 ] ],
			label : {
				normal : {
					position : 'left',
					distance : 10,
					show : false,
				}
			}
		},{
			type : 'scatter',
			symbolSize : 1,
			symbol : 'roundRect',
			data : [ [ 0.5, 0.5 ] ],
			label : {
				normal : {
					position : 'left',
					distance : 10,
					show : false,
				}
			}
		},{
			type : 'scatter',
			symbolSize : 1,
			symbol : 'roundRect',
			data : [ [ 1.2, 0.5 ] ],
			label : {
				normal : {
					position : 'left',
					distance : 10,
					show : false,
				}
			}
		}
		]
	};
	//添加文本框
	for (var i = 0; i < data.length; i++) {
		var textObj = {//基础文本框
			type : 'scatter',
			symbolSize : 1,
			symbol : 'roundRect',
			data : [],
			label : {
				normal : {
					position : 'left',
					distance : 10,
					show : true,
					formatter : [ '', ].join('\n'),
				}
			}
		};
		textObj.label.normal.formatter = [ data[i][0] ].join('\n');//定义文本内容
		textObj.data = [ [ data[i][2] + 0.15, data[i][1] - 0.04 ] ];
		option.series.push(textObj);
	}
	myChart.setOption(option);
}
