<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>Kano分析</title>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
<script type="text/javascript" class="init">
	$(document).ready(function() {
		var table = $('#example').DataTable();
		$('#example tbody').on('click', 'tr', function() {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('selected');
			} else {
				table.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		});

		$('#button').click(function() {
			table.row('.selected').remove().draw(false);
		});
	});
</script>
	<script>
		$(document).ready(function() {
		    var t = $('#example').DataTable();
		    var counter = 1;
		 
		    $('#addRow').on( 'click', function () {
		        t.row.add( [
		            counter +'.1',
		            counter +'.2',
		            counter +'.3',
		            counter +'.4',
		            counter +'.5',
		            counter +'.6'
		        ] ).draw( false );
		        counter++;
		    } );
		    $('#addRow').click();
		} );
	</script>
</head>
<body>
	<table id="example" class="table table-striped table-bordered"
		cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>Name</th>
				<th>Position</th>
				<th>Office</th>
				<th>Age</th>
				<th>Start date</th>
				<th>Salary</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Tiger Nixon</td>
				<td>System Architect</td>
				<td>Edinburgh</td>
				<td>61</td>
				<td>2011/04/25</td>
				<td>$320,800</td>
			</tr>
			<tr>
				<td>Garrett Winters</td>
				<td>Accountant</td>
				<td>Tokyo</td>
				<td>63</td>
				<td>2011/07/25</td>
				<td>$170,750</td>
			</tr>
			<tr>
				<td>Ashton Cox</td>
				<td>Junior Technical Author</td>
				<td>San Francisco</td>
				<td>66</td>
				<td>2009/01/12</td>
				<td>$86,000</td>
			</tr>
			<tr>
				<td>Cedric Kelly</td>
				<td>Senior Javascript Developer</td>
				<td>Edinburgh</td>
				<td>22</td>
				<td>2012/03/29</td>
				<td>$433,060</td>
			</tr>
			<tr>
				<td>Airi Satou</td>
				<td>Accountant</td>
				<td>Tokyo</td>
				<td>33</td>
				<td>2008/11/28</td>
				<td>$162,700</td>
			</tr>
		</tbody>
	</table>
	<script>
		$(document).ready(function() {
			$('#example').DataTable();
		});
	</script>
	<button type="button" class="btn btn-primary" onclick="addrow1()" id="addRow">
		<i class="glyphicon glyphicon-plus"></i>添加
	</button>
	
	<button type="button" class="btn btn-primary" onclick="addrow1()" id="button">
		<i class="glyphicon glyphicon-plus"></i>删除
	</button>


</body>
</html>
