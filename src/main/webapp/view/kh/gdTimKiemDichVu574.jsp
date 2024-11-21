<%@ page import="java.util.ArrayList" %>
<%@ page import="com.pttk.garaman.model.DichVu574" %>
<%@ page import="com.pttk.garaman.dao.DichVuDAO574" %>
<%@ page import="com.pttk.garaman.dao.PhuTungDAO574" %>
<%@ page import="com.pttk.garaman.model.PhuTung574" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm Kiếm Thông Tin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
            background-color: #f2f2f2;
        }

        .search-container {
            margin: 20px 0;
        }

        .search-container input[type="text"] {
            padding: 8px;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .search-container button {
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .search-container button:hover {
            background-color: #45a049;
        }

        .tables-container {
            display: flex;
            justify-content: space-around;
            gap: 20px;
            margin-top: 20px;
        }

        table {
            width: 100%;
            margin: 0;
            border-collapse: collapse;
            background-color: white;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        table th {
            background-color: #4CAF50;
            color: white;
        }

        table caption {
            margin: 10px 0;
            font-weight: bold;
            font-size: 18px;
        }
    </style>
</head>
<body>
<form action="gdTimKiemDichVu574.jsp" method="POST" class="search-container">
    <input type="text" name="keyword"/>
    <button type="submit">Tìm kiếm</button>
</form>
<%
    String keyword = request.getParameter("keyword");
    if (keyword != null) {
        DichVuDAO574 dichVuDAO574 = new DichVuDAO574();
        ArrayList<DichVu574> dsDichVu = dichVuDAO574.timKiemDichVuTheoTen(keyword);
        request.setAttribute("dsDichVu", dsDichVu);
    }
%>

<div class="tables-container">
    <table>
        <caption>Dịch Vụ</caption>
        <thead>
        <tr>
            <th>Tên Dịch Vụ</th>
            <th>Giá</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="dichVu" items="${dsDichVu}">
            <tr>
                <td>
                    <a href="gdChiTietDichVu574.jsp?id=${dichVu.id}">${dichVu.ten}</a>
                </td>
                <td><fmt:formatNumber value="${dichVu.gia}" type="number" maxFractionDigits="0"/> VND</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<a href="gdChinhKH574.jsp">Quay lại</a>
</body>
</html>
