<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Insert title here</title>
</head>
<body>
<center>
    <%
        String center = request.getParameter("center");
        // Top.jsp 에서 받은 파라미터 Center값에 따라 중앙 페이지가 다르게 뜨기 위함
        // 처음 실행시에는 center값이 넘어오지 않기에 null이라면,
        if(center==null){
            center = "Center.jsp"; //디폴트 Center.jsp 으로 지정
        }
    %>
    <table width="1000" >
        <!--Top 부분 -->
        <tr height="140" align="center">
            <td align="center" width="1000"><jsp:include page="Top.jsp"/></td>
        </tr>
    </table>

    <!--Center 부분 -->
    <tr height="470" align="center">
<%--        위에서 받은 jsp를 동적 바인딩--%>
        <td align="center" width="1000"><jsp:include page="<%=center%>"/></td>
    </tr>
    </table>

    <!-- Bottom 부분 -->
    <tr height="100" align="center">
        <td align="center" width="1000"><jsp:include page="Bottom.jsp"/></td>
    </tr>
    </table>
</center>
</body>
</html>