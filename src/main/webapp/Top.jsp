<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>렌트카 서비스</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f2f5;
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .header {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            background-color: #4a69bd;
            color: white;
        }
        .logo img {
            transition: transform 0.3s ease;
            max-width: 100%;
            height: auto;
        }
        .logo img:hover {
            transform: scale(1.1);
        }
        .nav-menu {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            background-color: #4a69bd;
            padding: 10px;
        }
        .nav-menu a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            font-weight: 500;
            transition: all 0.3s ease;
            text-align: center;
            flex-grow: 1;
        }
        .nav-menu a:hover {
            background-color: #3c5aa6;
            transform: translateY(-2px);
        }
        .button {
            background-color: #2ecc71;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 0;
            cursor: pointer;
            border-radius: 5px;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 200px;
        }
        .button:hover {
            background-color: #27ae60;
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.15);
        }
        .user-welcome {
            font-size: 18px;
            font-weight: 500;
            margin-bottom: 10px;
            text-align: center;
        }
        .user-section {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }

        @media (min-width: 768px) {
            .header {
                flex-direction: row;
                justify-content: space-between;
                padding: 20px 40px;
            }
            .nav-menu {
                justify-content: flex-start;
            }
            .nav-menu a {
                flex-grow: 0;
            }
            .user-section {
                flex-direction: row;
                justify-content: flex-end;
                align-items: center;
            }
            .user-welcome {
                margin-right: 15px;
                margin-bottom: 0;
            }
            .button {
                width: auto;
                margin: 0;
            }
        }
    </style>
</head>
<body>

<%-- 세션을 이용한 로그인 처리 --%>
<%
    // 요청 파라미터에서 'id' 값을 가져옴
    String id = request.getParameter("id");
    // 로그인이 되어 있지 않을 때 (id가 null일 때)
    if(id == null){
        // 기본값으로 "GUEST" 설정
        id = "GUEST";
    }
%>

<div class="container">
    <div class="header">
        <%-- 로고 이미지 링크. 클릭 시 메인 페이지로 이동 --%>
        <a href="RentcarMain.jsp" class="logo">
            <img alt="렌트카 로고" src="images/RENT.png" height="65" width="70">
        </a>
        <div class="user-section">
            <%-- 사용자 환영 메시지 표시 --%>
            <span class="user-welcome"><%=id%> 님 반갑습니다.</span>
            <%
                // GUEST 사용자일 경우 로그인 버튼 표시
                if(id.equals("GUEST")){
            %>
            <button class="button" onclick="location.href='RentcarMain.jsp?center=MemberLogin.jsp'">로그인</button>
            <%
            } else {
                // 로그인된 사용자일 경우 로그아웃 버튼 표시
            %>
            <button class="button" onclick="location.href='RentcarMain.jsp?center=MemberLogout.jsp'">로그아웃</button>
            <%
                }
            %>
        </div>
    </div>

    <%-- 네비게이션 메뉴 항목들 --%>
    <nav class="nav-menu">
        <a href="RentcarMain.jsp?center=CarReserveMain.jsp">예약 하기</a>
        <a href="RentcarMain.jsp?center=CarReserveView.jsp">예약 확인</a>
        <a href="#">자유 게시판</a>
        <a href="#">이벤트</a>
        <a href="#">고객 센터</a>
    </nav>
</div>
</body>
</html>
