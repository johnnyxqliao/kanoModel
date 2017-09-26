<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>Kano分析</title>
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.full.min.css" />
<link rel="stylesheet" href="assets/css/datepicker.css" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-table.min.css">
<script src="assets/js/ace-extra.min.js"></script>
<script src="assets/js/respond.min.js"></script>
<script src="js/outerJs/echarts.js"></script>
</head>
<body>
	<div class="main-container" id="main-container">
		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span>
			</a>
			<div class="sidebar" id="sidebar">

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="icon-signal"></i>
						</button>

						<button class="btn btn-info">
							<i class="icon-pencil"></i>
						</button>

						<button class="btn btn-warning">
							<i class="icon-group"></i>
						</button>

						<button class="btn btn-danger">
							<i class="icon-cogs"></i>
						</button>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span> <span class="btn btn-info"></span>
						<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
					</div>
				</div>

				<ul class="nav nav-list">
					<li><a href="#" class="dropdown-toggle"> <i
							class="icon-desktop"></i> <span class="menu-text">历史数据 </span> <b
							class="arrow icon-angle-down"></b>
					</a>
						<ul class="submenu">
							<li><a href="elements.html"> <i
									class="icon-double-angle-right"></i> 数据1
							</a></li>
						</ul></li>
				</ul>
				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"
						data-icon1="icon-double-angle-left"
						data-icon2="icon-double-angle-right"></i>
				</div>
			</div>
		</div>
	</div>
	<div class="main-container">

		<div id="toolbar" class="btn-group">

			<button type="button" class="btn btn-primary" onclick="addrow()">
				<i class="glyphicon glyphicon-plus"></i>添加
			</button>

			<button type="button" class="btn btn-primary"
				style="margin-right: 40px" onclick="deleterow()">
				<i class="glyphicon glyphicon-trash"></i>删除
			</button>

			<button type="button" class="btn btn-primary"
				style="margin-right: 40px" onclick="drawKano()">
				<i class="glyphicon glyphicon-wrench"></i>分析
			</button>

			<button type="button" class="btn btn-primary" style="align: right"
				onclick="saveProject()">
				<i class="glyphicon glyphicon-cloud">保存工程</i>
			</button>
		</div>
	</div>
	<div class="fixed-table-container" style="padding-bottom: 0px;">
		<table id="myBootstrapTtable" data-toggle="table" data-search="true"
			data-show-refresh="true" data-show-toggle="true"
			data-toolbar="#toolbar" data-pagination="true"
			data-side-pagination="client">
			<thead>
				<tr>
					<th data-field="state" data-checkbox="true"></th>
					<th data-field="procedureIdForDelete" data-visible="false">procedureId</th>
					<th data-field="procedureId" data-formatter="generateId">工序号</th>
					<th data-field="type">分析类别</th>
					<th data-field="charmValue">魅力型需求(A)</th>
					<th data-field="exceptValue">期望型需求(O)</th>
					<th data-field="mustValue">基本型需求(B)</th>
					<th data-field="indifferentValue">无差异需求(I)</th>
					<th data-field="reverseValue">反向型需求(R)</th>
					<th data-field="problemValue">问题问卷(Q)</th>
					<th data-field="result">分类结果(R)</th>
					<th data-field="action" data-formatter="actionFormatter"
						data-events="actionEvents">编辑</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="main" style="width: 600px; height: 600px;"></div>
	
<!-- 添加问卷结果模态框 -->
	<div class="modal fade" id="itemAdd" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Kano模型分类结果统计</h4>
				</div>
				<div id='tableBody'class="modal-body">
					<div id="modelTable" class="table-editable">
						<table class="table-hover table-bordered table">
							<tr>
								<th colspan="2" style="text-align: center;">评价类别：</th>
								<th colspan="5" style="text-align: center;"
									contenteditable="true"></th>
							</tr>
							<tr>
								<th colspan="2" style="text-align: center;">产品/服务需求</th>
								<th colspan="5" style="text-align: center;">负向问题（没有该项功能）</th>
							</tr>
							<tr>
								<th></th>
								<th>量表</th>
								<th>喜欢</th>
								<th>理应如此</th>
								<th>无所谓</th>
								<th>能忍受</th>
								<th>不喜欢</th>
							</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						id="export-btn" onclick="addItem()">确定</button>
					<p id="export"></p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 编辑问卷结果模态框 -->
	<div class="modal fade" id="modifyItem" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Kano模型分类结果统计</h4>
				</div>
				<div id='tableBodyModify'class="modal-body-modify">
					<div id="modelTable" class="table-editable">
						<table class="table-hover table-bordered table">
							<tr>
								<th colspan="2" style="text-align: center;">评价类别：</th>
								<th colspan="5" style="text-align: center;"
									contenteditable="true"></th>
							</tr>
							<tr>
								<th colspan="2" style="text-align: center;">产品/服务需求</th>
								<th colspan="5" style="text-align: center;">负向问题（没有该项功能）</th>
							</tr>
							<tr>
								<th></th>
								<th>量表</th>
								<th>喜欢</th>
								<th>理应如此</th>
								<th>无所谓</th>
								<th>能忍受</th>
								<th>不喜欢</th>
							</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						id="export-btn" onclick="updataItem()">更新</button>
					<p id="export"></p>
				</div>
			</div>
		</div>
	</div>
	<script src="js/outerJs/jquery.min.js"></script>
	<!-- <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script> -->
	<script src="js/outerJs/bootstrap-table.min.js"></script>
	<script src="js/outerJs/bootstrap-table-zh-CN.min.js"></script>
	<script src='js/outerJs/jquery-ui.min.js'></script>
	<script src='js/outerJs/underscore.js'></script>
	<script src="js/innerJs/solveData.js"></script>
	<script src="js/innerJs/tableFeature.js"></script>
	<script src="js/outerJs/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/typeahead-bs2.min.js"></script>
	<script type="text/javascript" src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="assets/js/jqGrid/jquery.jqGrid.min.js"></script>
	<script type="text/javascript" src="assets/js/jqGrid/i18n/grid.locale-en.js"></script>
	<script type="text/javascript" src="assets/js/ace-elements.min.js"></script>
	<script type="text/javascript" src="assets/js/ace.min.js"></script>
	<script src="js/innerJs/modelPop.js"></script>
	<script src="js/innerJs/buttonFeature.js"></script>
	<script src="js/innerJs/submit.js"></script>
	<script src="js/innerJs/sendDataAjax.js"></script>
</body>
</html>
