<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid">
		<h1>QNA관리</h1>
		<table class="table">
			<thead class="table-dark">
				<tr>
					<td>질문</td>
					<td>답변</td>
					<td>등록일</td>
					<td>조회수</td>
					<td>기능</td>
				</tr>
			</thead>
			<tbody>
			
				<c:if test="${qna.size() < 1}">				
					<tr>
						<td colspan="5">등록된 질문이 없습니다.</td>
					</tr>
				</c:if>
				
				<c:forEach var="item" items="${qna}">				
					<tr>
						<td>${item.question}</td>
						<td>${item.answer}</td>
						<td>${item.regdate}</td>
						<td>${item.hit}</td>
						<td><a class="btn btn-sm btn-danger" href="delete?question_id=${item.question_id}">삭제</a><a class="btn btn-sm btn-success" href="update?question_id=${item.question_id}">답변하기</a></td>				
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr class="justify-content-center">
					<td colspan="5" class="pagination">
						<div class="page-item"><a href="?page=1" class="page-link">처음</a></div>
						<div class="page-item"><a href="?page=${pager.prev}" class="page-link">이전</a></div>
							<c:forEach var="page" items="${pager.list}">
								<div class="page-item ${page == pager.page ? 'active' : ''}"><a href="?page=${page}" class="page-link">${page}</a></div>
							</c:forEach>
						<div class="page-item"><a href="?page=${pager.next}" class="page-link">다음</a></div>
						<div class="page-item"><a href="?page=${pager.last}" class="page-link">마지막</a></div>
					</td>
				</tr>
			</tfoot>
		</table>
		<div>
			<a class="btn btn-sm btn-primary mb-2" href="index">처음으로</a>
		</div>
	</div>
</body>
</html>