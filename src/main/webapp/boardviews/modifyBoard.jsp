<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- 부트스트랩 CSS 라이브버리-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- 부트스트랩 Js 라이브러리-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
	<title>맛집 수정</title>
	<style>
		body {
			background-image: url('/images/k8.jpg');
			background-repeat: no-repeat; /* 배경 노반복 */
			background-size: cover; /* 배경이미지 사이즈 */
			max-width: 1400px;
			max-height: 800px;
			margin-top: 40px;
			padding: 32px;
			overflow: hidden; /* 스크롤 비활성화 */
			font-family: 'GumiRomanceTTF', sans-serif;
			color: #333; 
		}
				
		@font-face {
			font-family: 'GumiRomanceTTF';
			src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-1@1.0/GumiRomanceTTF.woff2') format('woff2');
			font-weight: normal;
			font-style: normal;
		}		
		
		.text-center {
			margin-left:-1000px;
			margin-top: 30px;
			font-size:50px;
		}
		
		.input-group.mb-3 {
			left: 10px;
			top: 30px;
			margin: 10px 0;
			width: 1000px;
			height: 5rem;
			padding: 0.5rem;
		}
		
		.input-group-text {
			background-color: #6af17a; 
		}
		
		.unButton {
			width:70px;
			height:70px;
			position: fixed;
			top: 10px;
			left: 10px;
			background-color: #6af17a; 
			border-radius: 50%;
			cursor: pointer; 
		}
		
		.btn {
			width: 80px;
			height: 80px;
			margin-right: 20px;
			border-radius: 50%;
			cursor: pointer;
			margin-top: -70px;
		}
		.btn-primary {
		    background-color: #33bd50; 
		}
		
		.btn-danger {
			background-color: #a46227;
		}
		.btn-danger2 {
			background-color: #994fc4;
		}
		.button-container {
			margin-right: -70px;
		}
				
				
				
				
		
		

	</style>
</head>
<body>
	
	<div class="container my-containter">
		<!-- 제목-->
		<div class = "text-center">
			<p>맛집 수정</p> 
		</div>
		
		<div>
			<button class="unButton" onclick="location.href='getBoardList.do'"></button>
		<div>
			
		<form action="modifyBoardProc.do" method="get">
			<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">번호</span>
					    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
					    	name="num" value="${foodboard.num}" readonly>
					  </div>			
			<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">가게 이름</span>
					    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
					    	name="title" value="${foodboard.title}">
					  </div>
					  <div class="input-group mb-3">
					  	<span class="input-group-text" id="inputGroup-sizing-default">메뉴</span>
					  	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
					  		name="menu" value="${foodboard.menu}">
					  </div>
					  <div class="input-group mb-3">
					  	<span class="input-group-text" id="inputGroup-sizing-default">한줄평</span>
					  	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
					  	name="review" value="${foodboard.review}">
					 </div>
					  <div class="input-group mb-3">
					      <span class="input-group-text" id="inputGroup-sizing-default">별점</span>
					      <select class="form-select" aria-label="별점 선택" name="grade">
					          <option value="" disabled selected>별점을 선택하세요</option>
					          <option value="1" ${foodboard.grade == 1 ? 'selected' : ''}>⭐</option>
					          <option value="2" ${foodboard.grade == 2 ? 'selected' : ''}>⭐⭐</option>
					          <option value="3" ${foodboard.grade == 3 ? 'selected' : ''}>⭐⭐⭐</option>
					          <option value="4" ${foodboard.grade == 4 ? 'selected' : ''}>⭐⭐⭐⭐</option>
					          <option value="5" ${foodboard.grade == 5 ? 'selected' : ''}>⭐⭐⭐⭐⭐</option>
					      </select>
					  </div>

		    <div class="td-grid gap-2 d-md-flex justify-content-md-end button-container">
		        <button type="submit" class="btn btn-primary">수정</button>
		        <button type="reset" class="btn btn-danger">초기화</button>
				<button class="btn btn-danger2" onclick="location.href='deleteBoard.do?num=${foodboard.num}'">삭제</button>
		    </div>
		</form>
	</div>
    
</body>
</html>