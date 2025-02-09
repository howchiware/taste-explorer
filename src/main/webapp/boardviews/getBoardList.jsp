<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- 부트스트랩 CSS 라이브버리-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- 부트스트랩 Js 라이브러리-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
	<title>나만의 맛집 리스트</title>
	<style>

		body {
			background-image: url('/images/u13.jpg');
			background-repeat: no-repeat; /* 배경 노반복 */
			background-size: cover; /* 배경이미지 사이즈 */
			margin-top: 40px;
			padding: 32px;
			font-family: 'GumiRomanceTTF', sans-serif;
			font-size: 16px; 
			color: #333;
		}
				
		@font-face {
			font-family: 'GumiRomanceTTF';
			src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-1@1.0/GumiRomanceTTF.woff2') format('woff2');
			font-weight: normal;
			font-style: normal;
				}	
				
		.mtitle {
			font-size:50px;
		}
		
		.unButton {
			width:90px;
			height:70px;
			position: fixed; 
			top: 10px; 
			left: 10px; 
			background-color: #fafb8a; 
			border-radius: 50%; /* 모서리 둥글게 */
			cursor: pointer; /* 커서 변경되는 */
		}
		.btn-2 {
			font-size:22px;
			width:180px;
			height:60px;
			background-color: #ffb555; 
			cursor: pointer; /* 커서 변경되는 */
		}
		.form-select {
			font-size:22px;
		}
		
		.btn-3 {
			font-size:16px;
			width:100px;
			height:35px;
			background-color: #e9932d; 
			cursor: pointer; /* 커서 변경되는 */
		}
		
		.ment {
			position: fixed; 
			top: 10px;
			right : 50px; 
			font-size: 18px; 
		}
		.modiButton {
			font-size:16px;
			width:100px;
			height:35px;
			background-color: #e9932d; 
			cursor: pointer;
			position: fixed; 
			top: 50px; 
			right : 50px;
		}

	</style>
</head>
<body>
	
	<div class="container my-containter">

		<div class = "mtitle">
			<p onclick="location.href='getBoardList.do'" style="cursor: pointer; text-decoration: none; color: inherit;">
				나만의 맛집 리스트
			</p>
		</div>
		
		<div class="ment">
			<span>반갑습니다 ${sessionScope.loginName.name} 님!</span>
		</div>
	
		<div>
			<button class="modiButton" onclick="location.href='modifyMember.do?name=${memberboard.name}'">회원수정</button>
		</div>

		<div>
			<button class="unButton" onclick="location.href='mainBoard.do'">로그아웃</button>
		<div>
		
		<nav class="navbar navbar-light bg-light">
		  <div class="container-fluid">
		   <button class="btn btn-2" onclick="location.href='insertBoard.do'">맛집 추가</button>
		   <button class="btn btn-2" onclick="location.href='rouletteBoard.do'">셰프님...!</button>
		    <form class="d-flex" action="searchBoardList.do">
				<select name="searchCon" class="form-select" arial-label="Default select example">
					<option value="title">가게 이름</option>
					<option value="menu">메뉴</option>
					<option value="review">한줄평</option>
				</select>
		      <!--<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">-->
			  <input name="searchKey" class="form-control me-2" type="search" aria-label="Search" placeholder="👨‍🍳👩‍🍳🧑‍🍳">	
			  <div style="width: 100%; max-width: 300px;">
			      <button class="btn btn-2" type="submit">검색</button>
			  </div>
			</form>
		  </div>
		</nav>
	
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col">번호</th>
		      <th scope="col">가게 이름</th>
		      <th scope="col">메뉴</th>
		      <th scope="col">한줄평</th>
			  <th scope="col">별점</th>
		    </tr>
		  </thead>
		  <tbody>
			
			
			<c:forEach var="foodboard" items="${bList}">
				<tr>
					<th scope="row"> ${foodboard.num} </th> <!--객체명.멤버변수 -->
					<td>${foodboard.title}</td>
					<td>${foodboard.menu}</td>
					<td>${foodboard.review}</td>
					<td>
					    <c:choose>
					        <c:when test="${foodboard.grade == 1}">⭐</c:when>
					        <c:when test="${foodboard.grade == 2}">⭐⭐</c:when>
					        <c:when test="${foodboard.grade == 3}">⭐⭐⭐</c:when>
					        <c:when test="${foodboard.grade == 4}">⭐⭐⭐⭐</c:when>
					        <c:when test="${foodboard.grade == 5}">⭐⭐⭐⭐⭐</c:when>
					        <c:otherwise> </c:otherwise>
					    </c:choose>
					</td>
					<td>
						<button class="btn btn-3" onclick="location.href='modifyBoard.do?num=${foodboard.num}'">수정</button>
					</td>
				</tr>
			</c:forEach>
		    
			
			
			
		   
		  </tbody>
		</table>
		
		
	</div>
    
</body>
</html>