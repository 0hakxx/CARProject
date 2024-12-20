<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>렌트카 예약 - 메인</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }
        .hero-image {
            position: relative;
            width: 100%;
            height: 470px;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .hero-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
        }
        h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
        }
        .cta-button {
            background-color: #ff6600;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .cta-button:hover {
            background-color: #e65c00;
        }
        .features {
            display: flex;
            justify-content: space-around;
            margin-top: 30px;
        }
        .feature {
            text-align: center;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="hero-image">
        <img src="images/Main.jpg" alt="렌트카 이미지">
        <div class="overlay">
            <h1>최고의 렌트카 서비스를 경험하세요</h1>
        </div>
    </div>
    <div class="features">
        <div class="feature">
            <h3>다양한 차종</h3>
            <p>경차부터 고급 세단까지 다양한 선택</p>
        </div>
        <div class="feature">
            <h3>편리한 예약</h3>
            <p>온라인으로 쉽고 빠르게 예약</p>
        </div>
        <div class="feature">
            <h3>24/7 고객 지원</h3>
            <p>언제든 문의 가능한 고객 서비스</p>
        </div>
    </div>
</div>
</body>
</html>
