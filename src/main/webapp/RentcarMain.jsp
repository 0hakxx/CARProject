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
        // Top.jsp ���� ���� �Ķ���� Center���� ���� �߾� �������� �ٸ��� �߱� ����
        // ó�� ����ÿ��� center���� �Ѿ���� �ʱ⿡ null�̶��,
        if(center==null){
            center = "Center.jsp"; //����Ʈ Center.jsp ���� ����
        }
    %>
    <table width="1000" >
        <!--Top �κ� -->
        <tr height="140" align="center">
            <td align="center" width="1000"><jsp:include page="Top.jsp"/></td>
        </tr>
    </table>

    <!--Center �κ� -->
    <tr height="470" align="center">
<%--        ������ ���� jsp�� ���� ���ε�--%>
        <td align="center" width="1000"><jsp:include page="<%=center%>"/></td>
    </tr>
    </table>

    <!-- Bottom �κ� -->
    <tr height="100" align="center">
        <td align="center" width="1000"><jsp:include page="Bottom.jsp"/></td>
    </tr>
    </table>
</center>
</body>
</html>