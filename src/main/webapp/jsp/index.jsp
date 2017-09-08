<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8" />
		<title>Kano分析</title>
		
		<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.full.min.css" />
		<link rel="stylesheet" href="assets/css/datepicker.css" />
		<link rel="stylesheet" href="assets/css/ui.jqgrid.css" />
		<link rel="stylesheet" href="assets/css/ace.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<script src="assets/js/ace-extra.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
	</head>
	<body>
		<div class="navbar navbar-default" id="navbar">
		</div>
		<div class="main-container" id="main-container">
			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
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
							<span class="btn btn-success"></span>

							<span class="btn btn-info"></span>

							<span class="btn btn-warning"></span>

							<span class="btn btn-danger"></span>
						</div>
					</div>

					<ul class="nav nav-list">
						<li>
							<a href="#" class="dropdown-toggle">
								<i class="icon-desktop"></i>
								<span class="menu-text">历史数据 </span>

								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li>
									<a href="elements.html">
										<i class="icon-double-angle-right"></i>
										数据1
									</a>
								</li>
							</ul>
						</li>
					</ul>
					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>
				</div>
				<div class="main-content">
					<div class="page-content">
						<div class="page-header">
							<h1>
								Kano分析
								<small>
									<i class="icon-double-angle-right"></i>
									数据处理
								</small>
							</h1>
						</div>
						<div>
							<div style="height: 40px;">
								<span style="font-size:16px">当前工程名称：</span>
								<input type="text" style="font-size:14px;height:24px" id="projectName">
							</div>
							<div>
								<button type="button" class="btn btn-primary" style="float:left;padding-top: 0px;padding-bottom: 0px;padding-right: 0px;margin-top: 10px;padding-left: 0px;margin-right: 5px;margin-left: 5px;" onclick="downloadFile()">
							        <i class="glyphicon glyphicon-download-alt">下载模板</i>
							    </button>
							</div>
						  <table class="table table-hover table-bordered">
						    <thead>
								<tr class="success">
									<th>类别</th>
									<th>魅力型需求</th>
									<th>期望型需求</th>
									<th>基本型需求</th>
									<th>无差异需求</th>
									<th>反向型需求</th>
									<th>问题问卷</th>
									<th>分类结果</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Tanmay</td>
									<td>Bangalore</td>
									<td>560001</td>
									<td>Tanmay</td>
									<td>Bangalore</td>
									<td>560001</td>
									<td>Bangalore</td>
									<td>560001</td>
									<td>Tanmay</td>
								</tr>
								<tr>
									<td>Sachin</td>
									<td>Mumbai</td>
									<td>400003</td>
									<td>Tanmay</td>
									<td>Bangalore</td>
									<td>560001</td>
									<td>Bangalore</td>
									<td>560001</td>
									<td>Tanmay</td>
								</tr>
								<tr>
									<td>Uma</td>
									<td>Pune</td>
									<td>411027</td>
									<td>Tanmay</td>
									<td>Bangalore</td>
									<td>560001</td>
									<td>411027</td>
									<td>Tanmay</td>
									<td>
									<a href="#">
							          <span class="glyphicon glyphicon-trash"></span>
							        </a>
									</td>
								</tr>
							</tbody>
						  </table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- <script type="text/javascript" src="assets/js/bootstrap.min.js"></script> -->
		<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="assets/js/typeahead-bs2.min.js"></script>
		<script type="text/javascript" src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
		<script type="text/javascript" src="assets/js/jqGrid/jquery.jqGrid.min.js"></script>
		<script type="text/javascript" src="assets/js/jqGrid/i18n/grid.locale-en.js"></script>
		<script type="text/javascript" src="assets/js/ace-elements.min.js"></script>
		<script type="text/javascript" src="assets/js/ace.min.js"></script>
</body>
</html>
