<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1 class="mt-3">회원 정보 변경</h1>
		<form method="post">
		<div>
			<input type="hidden" name="member_id" value="${member.member_id }">
			<input type="hidden" name="password" value="${member.password }">
			<div class="mb-3">
				<label class="form-Label">id : </label>
				<input class="form-control" name="id" type="number" value="${member.id}" readonly>
			</div>
			<div class="mb-3">
				<label class="form-Label">name: </label>
				<input class="form-control" name="name" type="text" value="${member.name}">
			</div>
			<div class="mb-3">
				<label class="form-Label">phone : </label>
				<input class="form-control" name="phone" type="text" value="${member.phone}">
			</div>
			<div class="mb-3">
				<label class="form-Label">email : </label>
				<input class="form-control" name="email" type="text" value="${member.email}">
			</div>
			<div class="mb-3">
				<label class="form-Label">addr : </label>
				<input class="form-control" name="addr" type="text" value="${member.addr}">
			</div>
			<input class="btn btn-sm btn-primary" type="submit" value="변경">
		</div>
		</form>
		<a href="list">목록</a>
		</div>
	
	
</body>
</html>