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
    
	<title>회원 정보 수정</title>
	<style>
		body {
					background-image: url('/images/u11.jpg');
					background-repeat: no-repeat; /* 배경 노반복 */
					background-size: cover; /* 배경이미지 사이즈 */
					max-width: 1400px;
					max-height: 800px;
					margin-top: 40px;
					padding: 32px;
					overflow: hidden;
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
					top: 50px;
					margin: 10px 0;
					width: 700px;
					height: 5rem;
					padding: 0.5rem;
				}
				
				.input-group-text {
					background-color: #eb377b; 
				}
				
				.unButton {
					width:70px;
					height:70px;
					position: fixed;
					top: 10px;
					left: 10px;
					background-color: #9d0c0c; 
					border-radius: 50%;
					cursor: pointer;
				}
				
				.btn {
					width: 80px;
					height: 80px;
					margin-right: 20px;
					border-radius: 50%;
					cursor: pointer;
					margin-top: 100px;
				}
				.btn-primary {
				    background-color: #18a86d; 
					position: fixed;
					top: 450px;
					left: 550px;
				}
				
				.btn-danger {
					background-color: #cfcd3f;
					position: fixed;
					top: 450px;
					left: 650px;
				}	
					
	</style>
</head>
<body>
	<div class="container my-containter">
		
		<div class = "text-center">
			<p class>회원 정보 수정</p>
		</div>

		<div>
			<button class="unButton" onclick="location.href='getBoardList.do'"></button>
		<div>	

		<form action="modifyMemberProc.do" method="post">
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
				 <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
				  	name="id" value="${memberboard.id}" readonly>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default">비밀번호</span>
				<input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
					name="pwd" value="${memberboard.pwd}">
			</div>	
			<div class="input-group mb-3">
				<span class="input-group-text" id="inputGroup-sizing-default">닉네임</span>
				<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
					name="name" value="${memberboard.name}">
			</div>			

	
		  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
			  <button type="submit" class="btn btn-primary">수정</button>
			  <button type="reset" class="btn btn-danger">초기화</button>
		  </div>
		</form>		
		
		
		
		
	</div>
</body>
</html>