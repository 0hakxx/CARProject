<%@ page import="bean.RentcarDAO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="bean.RentcarBean" %>
<%--
  Created by IntelliJ IDEA.
  User: yeong
  Date: 2024-12-20
  Time: 오전 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //CarReserverMain.jsp(예약하기) 페이지에서 [검색] 클릭 시  1 : 소형/ 2:중형/ 3:대형 카테고리 파라미터를 받는다.
    String category = request.getParameter("category");
    String temp = "";
    // 카테고리 번호에 따라 차량 크기 분류
    if(category.equals("1")) temp = "소형";
    else if(category.equals("2")) temp = "중형";
    else if(category.equals("3")) temp = "대형";
%>
<center>
    <table width="1000" border="1" bordercolor="gray">
        <tr height="100">
            <td align="center" colspan="3">
                <font size="7" color="gray"><%=temp%> 자동차</font>
            </td>
        </tr>

        <%
            RentcarDAO rdao = new RentcarDAO();
            //1 : 소형/ 2:중형/ 3:대형 카테고리 파라미터를 전달하여 DB에 조회하는 메서드
            Vector<RentcarBean> vec = rdao.getCategoryCar(category);
            //tr를 3개씩 보여주고 다시 tr을 실행 할수 있도록 하는 변수 선언
            int j=0;

            // ===== JSP 반복문 시작 =====
            for(int i = 0; i < vec.size(); i++){
                //벡터에 저장되어 있는 빈클래스를 추출
                RentcarBean bean = vec.get(i);

                // 3개의 차량 정보마다 새로운 행 시작
                if(j % 3 == 0){ //IF 시작
        %>
        <tr height="220">
            <%
                } //IF 끝 } 부분
            %>
            <td width="333" align="center">
                <!-- 이미지 클릭 시 차량 상세 정보 페이지로 링크, DB의 PK인 no 전달 -->
                <a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
                    <!-- 차량 이미지 표시 -->
                    <img alt="" src="images/<%=bean.getImg()%>" width="300" height="200">
                </a>

                <p>
                    <!-- 차량 이름 표시 -->
                    <font size="3" color="gray"><b>차량명 : <%=bean.getName()%></b></font>
                </p>
            </td>
            <%
                j = j+1;//j값을 가하여 하나의 행에 총 3개의 차량정보를 보여주기 위해서 증가
            %>
        </tr>
        <%
            } //  ===== JSP 반복문 종료 } 부분=====
        %>
    </table>
</center>
</body>
</html>
