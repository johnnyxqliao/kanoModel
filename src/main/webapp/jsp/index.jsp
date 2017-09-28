<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = "http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/";
	String appPath = "http://innovation.xjtu.edu.cn:80/InnovationToolsPlatform/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Kano分析</title>
<link href="./img/kano.ico" rel="shortcut icon">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />


<link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.full.min.css" />
<link rel="stylesheet" href="assets/css/datepicker.css" />
<link rel="stylesheet" href="css/bootstrap-table.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="assets/js/respond.min.js"></script>
<script src="js/outerJs/echarts.js"></script>
<script src="assets/js/ace-extra.min.js"></script>

<link rel="stylesheet" href="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/css/ace-modify.css" />
<script src="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/js/typeahead-bs2.min.js"></script>

<script src="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/js/chosen.jquery.min.js"></script>
<script src="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/js/fuelux/fuelux.spinner.min.js"></script>
<script src="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/js/date-time/bootstrap-timepicker.min.js"></script>
<script src="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/js/date-time/moment.min.js"></script>
<script src="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/js/date-time/daterangepicker.min.js"></script>
<script src="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/js/bootstrap-colorpicker.min.js"></script>
<script src="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/js/jquery.knob.min.js"></script>
<script src="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/js/jquery.autosize.min.js"></script>
<script src="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
<script src="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/js/jquery.maskedinput.min.js"></script>
<script src="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/js/bootstrap-tag.min.js"></script>

<!--ace scripts -->

<script src="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/js/ace-elements.min.js"></script>
<script src="http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/assets/js/ace.min.js"></script>

</head>

<%
    String userName = (String) request.getAttribute("username");
%>
<body>

	<div class="navbar navbar-default" id="navbar">
		<script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>

		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a id="href0"
					href="http://innovation.xjtu.edu.cn/InnovationToolsPlatform/index"
					class="navbar-brand"> <small><i class="icon-leaf"></i>
						小微企业多创新方法融合与集成应用平台 </small>
				</a> <a id="href1" href="#" class="navbar-brand"> <small> <small>
							Kano分析 </small>
				</small>
				</a>
				<!-- /.brand -->
			</div>
			<!-- /.navbar-header -->
			<div class="navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">
					<li class="grey"><a id="href2" data-toggle="dropdown"
						href="<%=appPath%>appList" onclick="gotoHref(this)"
						class="dropdown-toggle"> <img class="nav-user-photo"
							src="<%=basePath%>assets/avatars/platform.png"
							alt="Jason's Photo" /> 平台主页
					</a></li>


					<li class="purple"><a data-toggle="dropdown" href="#"
						onclick="gotoHref(this)" class="dropdown-toggle"> <img
							class="nav-user-photo"
							src="<%=basePath%>assets/avatars/process.png" alt="Jason's Photo" />
							模板层 <i class="icon-caret-down"></i>
					</a>
						<ul id="templateList"
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li><a data-toggle="dropdown" href="#"
								onclick="gotoHref(this)" class="dropdown-toggle"> <img
									class="nav-user-photo"
									src="<%=basePath%>assets/avatars/manage.png"
									alt="Jason's Photo" /> DMAIC模板
							</a></li>
							<li><a data-toggle="dropdown" href="#"
								onclick="gotoHref(this)" class="dropdown-toggle"> <img
									class="nav-user-photo"
									src="<%=basePath%>assets/avatars/manage.png"
									alt="Jason's Photo" /> 知识工程模板
							</a></li>
							<li><a data-toggle="dropdown"
								href="https://innovation.xjtu.edu.cn:8443/vsm"
								onclick="gotoHref(this)" class="dropdown-toggle"> <img
									class="nav-user-photo"
									src="<%=basePath%>assets/avatars/manage.png"
									alt="Jason's Photo" /> 价值流模板
							</a></li>
							<li><a data-toggle="dropdown" href="#"
								onclick="gotoHref(this)" class="dropdown-toggle"> <img
									class="nav-user-photo"
									src="<%=basePath%>assets/avatars/manage.png"
									alt="Jason's Photo" /> 5S模板
							</a></li>
							<li><a data-toggle="dropdown" href="#"
								onclick="gotoHref(this)" class="dropdown-toggle"> <img
									class="nav-user-photo"
									src="<%=basePath%>assets/avatars/manage.png"
									alt="Jason's Photo" /> TRIZ模板
							</a></li>
						</ul></li>
					<li class="green"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <img class="nav-user-photo"
							src="<%=basePath%>assets/avatars/tool.png" alt="Jason's Photo" />
							工具集 <i class="icon-caret-down"></i>
					</a>

						<ul
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">

							<li><a id="href3" data-toggle="dropdown" href="#"
								onclick="gotoHref(this)" class="dropdown-toggle"> <img
									class="nav-user-photo"
									src="<%=basePath%>assets/avatars/manage.png"
									alt="Jason's Photo" /> 创新管理工具
							</a></li>
							<li><a id="href4" data-toggle="dropdown" href="#"
								onclick="gotoHref(this)" class="dropdown-toggle"> <img
									class="nav-user-photo"
									src="<%=basePath%>assets/avatars/knowledge.png"
									alt="Jason's Photo" /> 创新知识服务
							</a></li>
							<li><a id="href5" data-toggle="dropdown" href="#"
								onclick="gotoHref(this)" class="dropdown-toggle"> <img
									class="nav-user-photo"
									src="<%=basePath%>assets/avatars/monitor.png"
									alt="Jason's Photo" /> 创新方法导入与过程监控
							</a></li>
							<li><a id="href6" data-toggle="dropdown" href="#"
								onclick="gotoHref(this)" class="dropdown-toggle"> <img
									class="nav-user-photo"
									src="<%=basePath%>assets/avatars/assess.png"
									alt="Jason's Photo" /> 创新方法评估
							</a></li>
							<li><a id="href7" data-toggle="dropdown" href="#"
								onclick="gotoHref(this)" class="dropdown-toggle"> <img
									class="nav-user-photo"
									src="<%=basePath%>assets/avatars/support.png"
									alt="Jason's Photo" /> 产业链协同创新支持
							</a></li>
						</ul></li>

					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <img id="userAvatar"
							class="nav-user-photo"
							src="<%=basePath%>assets/avatars/avatar2.png" alt="Jason's Photo" />
							<span class="user-info"> <small>欢迎光临,</small> <%
                            if (userName==null||userName.equals("anon")) {
                        %> 匿名游客 <%
                        } else {
                        %> ${username} <%
                            }
                        %>
						</span> <i class="icon-caret-down"></i>
					</a>
						<ul
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<%
                            if (userName==null||userName.equals("anon")) {
                        %>
							<li><a href="#" onclick="gotoLogin()"> <i
									class="icon-key"></i>登录
							</a></li>
							<li><a href="#" onclick="gotoRegister()"> <i
									class="icon-plus"></i>注册
							</a></li>
							<%
                        } else {
                        %>
							<li><a href="#" onclick="gotoUserInfo()"> <i
									class="icon-user"></i> 个人资料
							</a></li>
							<li class="divider"></li>
							<li><a onclick="logout()" style="cursor: pointer;"> <i
									class="icon-off"></i> 退出
							</a></li>
							<%
                            }
                        %>
						</ul></li>

				</ul>
				<!-- /.ace-nav -->
			</div>
			<!-- /.navbar-header -->
		</div>
		<!-- /.container -->
	</div>

	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try {
				ace.settings.check('breadcrumbs', 'fixed')
			} catch (e) {
			}
		</script>

		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a
				href="http://innovation.xjtu.edu.cn/InnovationToolsPlatform/appList">创新方法工具平台</a>
			</li>

			<li><a href="#">Kano分析</a></li>

		</ul>
		<!-- .breadcrumb -->

		<div class="nav-search" id="nav-search">
			<span id="greeting"> <!-- 占用搜索框进行页面提示 --> <script
					language="JavaScript">
				var mess1 = "";
				var mess2 = "欢迎光临！"
				day = new Date()
				hr = day.getHours()
				if ((hr >= 0) && (hr <= 4))
					mess1 = "深夜了，注意身体哦... "
				if ((hr >= 4) && (hr < 7))
					mess1 = "清晨好，起得真早啊... "
				if ((hr >= 7) && (hr < 12))
					mess1 = "早上好，"
				if ((hr >= 12) && (hr <= 13))
					mess1 = "午饭时间喔，"
				if ((hr >= 13) && (hr <= 17))
					mess1 = "外面的太阳猛烈吗? "
				if ((hr >= 17) && (hr <= 18))
					mess1 = "进入傍晚了，"
				if ((hr >= 18) && (hr <= 19))
					mess1 = "我大概在吃晚饭了，"
				if ((hr >= 19) && (hr <= 23))
					mess1 = "又到晚上黄金上网时间了，"
				document.write(mess1)
				document.write(mess2)
			</script>
			</span>

		</div>
		<!-- #nav-search -->
	</div>

	<!-- 主要部分 -->
	<div class="main-container" id="main-container">
		<div id="mainContent"
			style="padding-left: 125px; padding-right: 125px;padding-top: 30px;">
			<ul class="nav nav-tabs">
				<li><a data-toggle="tab" href="#originData">原始数据</a></li>
				<li><a data-toggle="tab" href="#solveResult" onclick="testData()">分析结果</a></li>
			</ul>
			<div class="tab-content">
				<div id="originData" class="tab-pane in active">
					<div id="toolbar" class="btn-group">
						<button type="button" class="btn btn-primary" onclick="addrow()">
							<i class="glyphicon glyphicon-plus"></i>添加
						</button>

						<button type="button" class="btn btn-primary"
							onclick="deleterow()">
							<i class="glyphicon glyphicon-trash"></i>删除
						</button>

						<button type="button" class="btn btn-primary" onclick="drawKano()">
							<i class="glyphicon glyphicon-wrench"></i>分析
						</button>
					</div>
					<div class="fixed-table-container" style="padding-bottom: 0px;">
						<table id="myBootstrapTtable" data-toggle="table"
							data-search="true" data-show-refresh="true"
							data-show-toggle="true" data-toolbar="#toolbar"
							data-pagination="true" data-side-pagination="client">
							<thead>
								<tr>
									<th data-field="state" data-checkbox="true"></th>
									<th data-field="procedureIdForDelete" data-visible="false">procedureId</th>
									<th data-field="procedureId" data-formatter="generateId">工序号</th>
									<th data-field="type">分析类别</th>
									<th data-field="charmValue">魅力型需求(A)</th>
									<th data-field="exceptValue">期望型需求(O)</th>
									<th data-field="mustValue">基本型需求(M)</th>
									<th data-field="indifferentValue">无差异需求(I)</th>
									<th data-field="reverseValue">反向型需求(R)</th>
									<th data-field="problemValue">问题问卷(Q)</th>
									<th data-field="result" style="display: none">分类结果(R)</th>
									<th data-field="action" data-formatter="actionFormatter"
										data-events="actionEvents">编辑</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<div id="solveResult" class="tab-pane">
					<div id="main" style="width: 600px; height: 600px;"></div>
				</div>
			</div>
		</div>
	</div>

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
				<div id='tableBody' class="modal-body">
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
				<div id='tableBodyModify' class="modal-body-modify">
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

	<script
		src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/outerJs/bootstrap-table.min.js"></script>
	<script type="text/javascript"
		src="js/outerJs/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src='js/outerJs/jquery-ui.min.js'></script>
	<script type="text/javascript" src='js/outerJs/underscore.js'></script>
	<script type="text/javascript" src="js/innerJs/solveData.js"></script>
	<script type="text/javascript" src="js/innerJs/tableFeature.js"></script>
	<!-- 	<script type="text/javascript" src="js/outerJs/bootstrap.min.js"></script> -->
	<script
		src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/typeahead-bs2.min.js"></script>
	<script type="text/javascript"
		src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript"
		src="assets/js/jqGrid/jquery.jqGrid.min.js"></script>
	<script type="text/javascript"
		src="assets/js/jqGrid/i18n/grid.locale-en.js"></script>
	<script type="text/javascript" src="assets/js/ace-elements.min.js"></script>
	<script type="text/javascript" src="assets/js/ace.min.js"></script>
	<script type="text/javascript" src="js/innerJs/modelPop.js"></script>
	<script type="text/javascript" src="js/innerJs/buttonFeature.js"></script>
	<script type="text/javascript" src="js/innerJs/drawKano.js"></script>
	<script type="text/javascript" src="js/innerJs/sendDataAjax.js"></script>

	<%-- <jsp:include page="/decorators/copyright.jsp"></jsp:include> --%>
</body>
</html>
