<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bean.RentcarDAO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="bean.RentcarBean" %>

<!DOCTYPE html>
<html>
<head>
  <title>예약하기</title>
  <style>
    /* CSS styles for the page layout and elements */
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 20px;
    }
    .container {
      max-width: 1000px;
      margin: 0 auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    h1, h2 {
      color: #333;
      text-align: center;
    }
    .car-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 20px;
      margin-bottom: 30px;
      justify-items: center;
    }
    .car-item {
      text-align: center;
      background-color: #f9f9f9;
      padding: 15px;
      border-radius: 8px;
      transition: transform 0.3s ease;
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    .car-item img {
      width: 300px;
      height: 200px;
      object-fit: cover;
      object-position: center;
      border-radius: 8px;
      margin-bottom: 10px;
    }
    .search-section {
      background-color: #e9e9e9;
      padding: 20px;
      border-radius: 8px;
    }
    select, input[type="submit"], button {
      padding: 10px;
      margin: 5px;
      border: none;
      border-radius: 4px;
    }
    input[type="submit"], button {
      background-color: #4CAF50;
      color: white;
      cursor: pointer;
    }
    input[type="submit"]:hover, button:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>최신형 자동차</h1>

  <%--  Top.jsp에서 예약하기 클릭 시 동작하는 페이지
        DB에서 최신순 3개의 자동차 객체를 얻어 사용자에게 보여준다.--%>
  <%
    // RentcarDAO 객체 생성 - 데이터베이스 작업을 위한 객체
    RentcarDAO rdao = new RentcarDAO();
    // getSelectCar() 메서드를 호출하여 최신 3개의 자동차 정보를 Vector에 저장
    // Vector는 동적 배열로, 여러 RentcarBean 객체를 저장할 수 있음
    Vector<RentcarBean> v = rdao.getSelectCar();
  %>

  <!-- 자동차 정보를 그리드 형태로 표시하는 div -->
  <div class="car-grid">
    <%
      // Vector에 저장된 자동차 정보를 순회하며 표시
      for (int i = 0; i < v.size(); i++) {
        // Vector에서 i번째 RentcarBean 객체를 가져옴
        RentcarBean bean = v.get(i);
    %>
    <!-- 각 자동차 정보를 표시하는 div -->
    <div class="car-item">
      <!-- 자동차 이미지를 클릭하면 해당 자동차의 상세 정보 페이지로 이동 -->
      <a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>" class="car-link">
        <!-- 자동차 이미지 표시 -->
        <img src="images/<%=bean.getImg()%>" alt="<%=bean.getName()%>" class="car-image">
      </a>
      <!-- 자동차 이름 표시 -->
      <p class="car-name"><%=bean.getName()%></p>
    </div>
    <% } %>
  </div>

  <!-- 차량 검색 섹션 -->
  <div class="search-section">
    <h2>차량 검색 하기</h2>
    <!-- 차량 카테고리별 검색 폼 -->
    <form action="RentcarMain.jsp?center=CarCategoryList.jsp" method="post">
      <!-- 차량 카테고리 선택 드롭다운 -->
      <select name="category">
        <option value="1">소형</option>
        <option value="2">중형</option>
        <option value="3">대형</option>
      </select>
      <!-- 검색 버튼 -->
      <input type="submit" value="검색">
    </form>
    <!-- 전체 차량 검색 버튼 -->
    <button onclick="location.href='RentcarMain.jsp?center=CarAllList.jsp'">전체 검색</button>
  </div>
</div>
</body>
</html>
