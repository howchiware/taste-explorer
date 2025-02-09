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
    
	<title>메뉴 룰렛</title>
	<style>
		body {
			background-image: url('/images/u14.jpg');
			background-repeat: no-repeat; /* 배경 노반복 */
			background-size: cover; /* 배경이미지 사이즈 */
			max-width: 1400px;
			max-height: 800px;
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
		.r {
			margin-left : 50px;
			margin-top : -50px;
			font-size : 70px;
		}
		.r2 {
			font-size:50px;
			margin-left : 430px;
			margin-top : 30px;
			font-size : 68px;
		}
		.r3 {
			margin-left : 10px;
			margin-top : 100px;
		}
		
		.unButton {
			width:70px;
			height:70px;
			position: fixed;
			top: 10px;
			left: 10px;
			background-color: #776af1; 
			border-radius: 50%;
			cursor: pointer;
		}
		.btn {
			width: 80px;
			height: 80px;
			margin-right: 20px;
			border-radius: 50%;
			cursor: pointer;
			border: none;
		}
		.r3 .btn-primary {
		    background: none;
		    border: none;
		    outline: none;
		    box-shadow: none;
		}


		.r3 .btn-primary img {
		    width: 300px;
		    height: 300px;
		    object-fit: contain;

		}			

	</style>
</head>
<body>
		<div class="r">
			<p>오늘의 메뉴는?</p>
		</div>
		<div class="r2">
		    <p>${rMenu}~~ <br>!!!!!!!!!!!!</p>
		</div>
		
		<div>
			<button class="unButton" onclick="location.href='getBoardList.do'"></button>
		<div>
			
		<div class="r3">
		    <button class="btn btn-primary" onclick="location.href='rouletteBoard.do?'">
				<img src="/images/u15.png" alt="룰렛 다시 돌리기 버튼">
			</button>
		</div>
	
	
</body>
</html>