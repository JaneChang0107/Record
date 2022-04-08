<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<style type="text/css">
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

body, html {
	background-position: right top;
	-o-background-size: 640px 875px; /*x軸y軸寬高*/
	-webkit-background-size: 640px 875px;
	-moz-background-size: 640px 875px;
	background-color: #ffffff;
}

#contentTable {
	overflow-x: auto;
	margin-right: $grid-gutter-width/2; // 利用 margin 推回去原本 padding 的空間
	margin-left : $ grid-gutter-width/ 2;
	padding-right: 0;
	padding-left: 0;
}

table {
	margin: auto;
	border-collapse: separate;
	border-spacing: 0;
}

tr {
	border: 1px solid #000;
}

td {
	border: 1px solid #000;
	padding: 10px 30px;
	background-color: #fff;
	color: #fff;
}

/*第一欄第一列：左上*/
/* table:first-child tr:first-child td:first-child{
  border-top-left-radius: 10px;
} */
/*第一欄最後列：左下*/
tr:last-child td:first-child {
	border-bottom-left-radius: 10px;
}
/*最後欄第一列：右上*/
/* tr:first-child td:last-child{
  border-top-right-radius: 10px;
} */
/*最後欄第一列：右下*/
tr:last-child td:last-child {
	border-bottom-right-radius: 10px;
}
</style>
</head>



<body>
<form id="myform" class="form-register" method="post" name="registerForm">
	<div class="container">
		<div class="py-5">
			<h2>作業時間紀錄</h2>
			<%
			Date date = new Date();
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
			out.print(ft.format(date));
			%>

		</div>

		<div class="form-group" align=left>
			<div class="col-md-2 mb-3">
				<label for="time">日期</label> <input type="text" class="form-control"
					id="datepicker" name="timetable.time" placeholder="" required>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-1 mb-3">
				<label for="hour">時數</label> <input type="text" class="form-control"
					id="hour" name="timetable.hour" placeholder="" value="" required>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-5 mb-3">
				<label for="comment">概要</label> <input type="text"
					class="form-control" id="comment" name="timetable.comment"
					style="min-width: 50%" required>
			</div>

		</div>


		<div class="form-group col-md-2">
			<label for="type"> 活動類型</label><select id="type" class="form-control"
				name="timetable.type" required>
				<option value="">請選擇</option>
				<option value="運動">運動</option>
				<option value="閱讀">閱讀</option>
				<option value="繪圖">繪圖</option>
				<option value="電玩">電玩</option>
			</select>
		</div>
	</div>
	<div class="col-md-9" align="center">


		<button class="btn-outline-secondary btn" type="button" id="addData">填完送出</button>
		<button class="btn-outline-secondary btn" Type="Button"
			onClick="history.go(0)">重新整理</button>


	</div>
</form> 
	<div class="container">
		<div class="py-5">

			</br>
			<div class="py-5">
				<div>

					<table id="contentTable" class="table table-dark table-hover"
						border="0" width="30%">
						<thead class="table-dark">
							<tr align=center>
								<th>ID</th>
								<th>時間</th>
								<th>類型</th>
								<th>時數</th>
								<th>概要</th>
								<th>刪除</th>
								<th>修改</th>
							</tr>
						</thead>
						
						<c:forEach var="TimeTable" items="${TimeTable}" varStatus="loop">
						

							<tr align=center>
								<td><c:out value="${TimeTable.pk}" /><input type="hidden"
									id="pk${TimeTable.pk}" value="${TimeTable.pk}" /></td>
								<td><c:out value="${TimeTable.time}" /></td>
								<td><c:out value="${TimeTable.type}" /></td>
								<td><c:out value="${TimeTable.hour}" /></td>
								<td><c:out value="${TimeTable.comment}" /></td>

								<td>
									<button class="btn-danger btn" Type="button" id="delete"
										onclick="del(${TimeTable.pk})">刪除</button>
								</td>
								<td>
									<button class="btn-success btn" type="button"
										data-bs-toggle="modal" onclick="getUpdateRecord(${TimeTable.pk})"
										data-bs-target="#exampleModal">修改</button>
								</td>
							</tr>

						</c:forEach>
					
					</table>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">修改記錄</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<input type="text" id="updateId"/>
					<div class="form-group" align=left>
						<div class="col-md-6 mb-3">
							<label for="time">日期</label> <input type="text"
								class="form-control" id="updateDatepicker" name="timetable.time"
								placeholder="" required>
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-1 mb-3">
							<label for="hour">時數</label> <input type="text"
								class="form-control" id="updateHour" name="timetable.hour"
								placeholder="" value="" required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6 mb-3">
							<label for="comment">概要</label> <input type="text"
								class="form-control" id="updateComment" name="timetable.comment"
								style="min-width: 50%" required>
						</div>
					</div>
					<div class="form-group col-md-2">
						<label for="type"> 活動類型</label> <select id="updateType"
							class="form-control" name="timetable.type" required>
							<option value="">請選擇</option>
							<option value="運動">運動</option>
							<option value="閱讀">閱讀</option>
							<option value="繪圖">繪圖</option>
							<option value="電玩">電玩</option>
						</select>
					</div>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" style="float: right">取消</button>
					<button type="button" id="save" class="btn btn-primary"
						style="float: right">儲存</button>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		$(function() {
			$("#datepicker").datepicker({
				dateFormat : "yy-mm-dd",
				showMonthAfterYear : true
			});
		});
		$(function() {
			$("#updateDatepicker").datepicker({
				dateFormat : "yy-mm-dd",
				showMonthAfterYear : true
			});
		});
		
		$("#addData").click(function() {

			var data = {
				"time" : $("#datepicker").val(),
				"hour" : $("#hour").val(),
				"comment" : $("#comment").val(),
				"type" : $("#type").val(),
			};
			$.ajax({
				url : "/AddRecord", // 資料請求的網址
				type : "POST", // GET | POST | PUT | DELETE | PATCH
				data : JSON.stringify(data), // 傳送資料到指定的 url
				dataType : "json",
				contentType : "application/json",
				success : function(e) { // request 成功取得回應後執行
				}
			});
		});
	});
	
	function del(data) {
		var data = {"id":data};
		$.ajax({
			url : "/DeleteRecord", // 資料請求的網址
			type : "POST", // GET | POST | PUT | DELETE | PATCH
			data : JSON.stringify(data), // 傳送資料到指定的 url
			dataType : "json",
			contentType : "application/json",
			success : function(data) { // request 成功取得回應後執行
				console.log(data);
			}
		});		
	};
		function getUpdateRecord(id) {	
		var data = {"id":id};
		$.ajax({
			url : "/GetUpdateRecord", // 資料請求的網址
			type : "POST", // GET | POST | PUT | DELETE | PATCH
			data :  JSON.stringify(data), // 傳送資料到指定的 url
			contentType : "application/json",
			success : function(QueryData) { // request 成功取得回應後執行
				$("#updateId").val(id);
				$("#updateDatepicker").val(QueryData.time);
				$("#updateType").val(QueryData.type);
				$("#updateHour").val(QueryData.hour);
				$("#updateComment").val(QueryData.comment);
			}
		});
	}
		
		$("#save").click(function() {
			var data = {
				"pk" : $("#updateId").val(),
				"time" : $("#updateDatepicker").val(),
				"hour" : $("#updateHour").val(),
				"comment" : $("#updateComment").val(),
				"type" : $("#updateType").val(),
			};
			$.ajax({
				url : "/UpdateRecord", // 資料請求的網址
				type : "POST", // GET | POST | PUT | DELETE | PATCH
				data : JSON.stringify(data), // 傳送資料到指定的 url
				dataType : "json",
				contentType : "application/json",
				success : function(data) { // request 成功取得回應後執行
					
				}
			});
			$("#exampleModal").modal("hide");
			location.reload();
		});


</script>