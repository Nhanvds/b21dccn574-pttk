<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.pttk.garaman.model.TKKhachHang574" %>
<%@ page import="com.pttk.garaman.dao.TKKhachHangDAO574" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thống Kê Khách Hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        .container {
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        form label {
            font-size: 14px;
            font-weight: bold;
        }

        form input[type="date"] {
            padding: 8px;
            margin: 0 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        form button {
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        form button:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
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
            margin-bottom: 10px;
            font-size: 18px;
            font-weight: bold;
        }

        table a {
            color: #007bff;
            text-decoration: none;
        }

        table a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%
    LocalDate ngayBatDau = null;
    LocalDate ngayKetThuc = null;
    ArrayList<TKKhachHang574> dsTKKhachHang = new ArrayList<>();
    if (request.getParameter("ngayBatDau") != null && request.getParameter("ngayKetThuc") != null) {
        try {
            ngayBatDau = LocalDate.parse(request.getParameter("ngayBatDau"));
            ngayKetThuc = LocalDate.parse(request.getParameter("ngayKetThuc"));
            TKKhachHangDAO574 tkKhachHangDAO = new TKKhachHangDAO574();
            dsTKKhachHang = tkKhachHangDAO.layTKKhachHangTheoDoanhThu(ngayBatDau, ngayKetThuc);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    request.setAttribute("dsTKKhachHang", dsTKKhachHang);
    request.setAttribute("ngayBatDau", ngayBatDau);
    request.setAttribute("ngayKetThuc", ngayKetThuc);
%>

<div class="container">
    <h1>Thống Kê Khách Hàng Theo Doanh Thu</h1>
    <form action="gdTKKhachHangTheoDoanhThu574.jsp" method="GET">
        <label for="ngayBatDau">Ngày Bắt Đầu:</label>
        <input type="date" id="ngayBatDau" name="ngayBatDau" value="${ngayBatDau}" required>
        <label for="ngayKetThuc">Ngày Kết Thúc:</label>
        <input type="date" id="ngayKetThuc" name="ngayKetThuc" value="${ngayKetThuc}" required>
        <button type="submit">Xem Thống Kê</button>
    </form>


    <table>
        <caption>Danh Sách Khách Hàng</caption>
        <thead>
        <tr>
            <th>STT</th>
            <th>Tên Tài Khoản</th>
            <th>Tên Khách Hàng</th>
            <th>Số Điện Thoại</th>
            <th>Số Lần Mua Hàng</th>
            <th>Tổng Doanh Thu</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="khachHang" items="${dsTKKhachHang}" varStatus="status">
            <tr onclick="window.location.href='gdDanhSachHoaDon574.jsp?id=${khachHang.id}&ngayBatDau=${ngayBatDau}&ngayKetThuc=${ngayKetThuc}&doanhThu=${khachHang.doanhThu}'" style="cursor: pointer;">
                <td>${status.index+1}</td>
                <td>${khachHang.username}</td>
                <td>${khachHang.hoTen}</td>
                <td>${khachHang.soDienThoai}</td>
                <td>${khachHang.soLuong}</td>
                <td><fmt:formatNumber value="${khachHang.doanhThu}" type="number" maxFractionDigits="0" /> VND</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
<a href="gdChonTK574.jsp">Quay lại</a>
</body>
</html>
