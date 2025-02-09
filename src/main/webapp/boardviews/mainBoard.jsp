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
    
	<title>우사기 셰프의 음식 추천</title>
	<style>
		
		body {
			background-image: url('/images/u4.jpg');
			background-repeat: no-repeat; /* 이미지 반복금지 */
			background-size: cover; /* 배경이미지 사이즈 */
			width: 1400px;
			height: 800px;
			margin-top: 40px;
			padding: 32px;
			overflow: hidden;
			
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

		.text-center {
			text-align: center;
			font-size: 60px;
			margin-top: -20px;
		}

		.intro-text {
		            text-align: center;
		            font-size: 20px;
		            margin-top: 50px;
		        }
		.input-group {
			width: 400px;
			height: 50px;
			border-radius: 40px;
			padding: 8px;
			font-size: 16px;
		}

		.input-group.mb-3 {
			position: absolute;
			left: 500px;
			top:490px;
		}
		
		.input-group.mb-4 {
			position: absolute;
			left: 500px;
			top:500px;
			margin: 50px 0;
		}
		
		.cls2 {
			position: absolute;
			left: 600px;
			margin: 50px 0;
			top:610px;
		}
		
		.cls3 {
			position: absolute; /* 절대 위치 */
			right: 30px;
			top: 380px;
		}
		
		.btn {
			margin-right: 20px;
			border-radius: 50%;
			cursor: pointer;
		}
		
		.btn-primary {
			width: 80px;
			height: 80px;
			background-color: #746dff; 
			margin-top: -50px;
		}
				
		.btn-danger {
			width: 80px;
			height: 80px;
			background-color: #ff6d6d;
			margin-top: -50px;
		}	
		
		.btn-jButton {
			width: 100px;
			height: 50px;
			background-color: #ff6d6d;
			border-radius: 40%;
		}	
		
	</style>
</head>
<body>
	
	
	<div class="container my-container">
		<h1 class="text-center">우사기 셰프의 음식 추천</h1>
		<p class="intro-text">
			해당 사이트는 입이 짧은 사람, 새로운 음식에 잘 도전하지 않는 사람, 한 가지 메뉴만 먹는 사람 등등 <br>
								여러가지 사유를 가진 대식가 지망생을 환영합니다. <br><br>
								음식 메뉴를 고르는데 시간을 쓰기는 싫고...... <br>
								어차피 항상 같은 메뉴만 먹을건데 가게를 생각해야하고...... <br><br>
								우사기 셰프가 여러분의 <고정 메뉴> 중 하나를 골라줄 것입니다. <br>
								아무튼 지망생 여러분들 환영합니다.
		</p>

	  	<form action="loginBoardProc.do" method="post">

			<div class="input-group mb-3">
			  <span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
			  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
			  	name="id">
			</div>
			<div class="input-group mb-4">
				<span class="input-group-text" id="inputGroup-sizing-default">비밀번호</span>
				<input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
					name="pwd">
			</div>


	  	  <div class="cls2">
	  		<button type="submit" class="btn btn-primary">로그인</button>
	  		<button type="reset" class="btn btn-danger">초기화</button>
	  	  </div>
		  <div class="cls3">
		  	<button class="btn btn-jButton" type="button" onclick="location.href='joinBoard.do'">회원가입</button>
		  </div>
	  	</form>			
	  </div>
	  


	
	
	
	
	
	
	
</body>
</html>