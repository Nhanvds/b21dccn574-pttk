<%@ page import="com.pttk.garaman.model.KhachHang574" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.pttk.garaman.model.HoaDonThanhToan574" %>
<%@ page import="com.pttk.garaman.dao.HoaDonThanhToanDAO574" %>
<%@ page import="com.pttk.garaman.dao.ThanhVienDAO574" %>
<%@ page import="com.pttk.garaman.dao.KhachHangDAO574" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Thông Tin Khách Hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .customer-info {
            margin-bottom: 30px;
        }

        .customer-info label {
            font-weight: bold;
        }

        .customer-info p {
            margin: 5px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        table th {
            background-color: #4CAF50;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

<%
    KhachHangDAO574 khachHangDAO = new KhachHangDAO574();
    KhachHang574 khachHang = khachHangDAO.layThongTinKhachHangTheoId(Integer.parseInt(request.getParameter("id")));
    LocalDate ngayBatDau = LocalDate.parse(request.getParameter("ngayBatDau"));
    LocalDate ngayKetThuc = LocalDate.parse(request.getParameter("ngayKetThuc"));
    float doanhThu = Float.parseFloat(request.getParameter("doanhThu"));
    HoaDonThanhToanDAO574 hoaDonThanhToanDAO = new HoaDonThanhToanDAO574();
    ArrayList<HoaDonThanhToan574> dsHoaDon = hoaDonThanhToanDAO.layDsHoaDonTheoKhachHang(khachHang.getId(), ngayBatDau, ngayKetThuc);
    request.setAttribute("dsHoaDon", dsHoaDon);
    request.setAttribute("doanhThu",doanhThu);
    request.setAttribute("ngayBatDau",ngayBatDau);
    request.setAttribute("ngayKetThuc", ngayKetThuc);
    request.setAttribute("khachHang",khachHang);
%>

<div class="container">
    <h1>Thông Tin Khách Hàng</h1>
    <div class="customer-info">
        <p><label>Tên tài khoản:</label> ${khachHang.username}</p>
        <p><label>Tên khách hàng:</label> ${khachHang.hoTen}</p>
        <p><label>Số điện thoại:</label> ${khachHang.soDienThoai}</p>
        <p><label>Địa chỉ:</label> ${khachHang.diaChi}</p>
        <p><label>Ngày bắt đầu:</label> ${ngayBatDau}</p>
        <p><label>Ngày kết thúc:</label> ${ngayKetThuc}</p>
        <p><label>Tổng doanh thu:</label> <fmt:formatNumber value="${doanhThu}" type="number" maxFractionDigits="0" /> VND</p>
    </div>

    <table>
        <thead>
        <tr>
            <th>STT</th>
            <th>Thời gian</th>
            <th>Trạng thái</th>
            <th>Tổng tiền</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="hoaDon" items="${dsHoaDon}" varStatus="status">
            <tr onclick="window.location.href='gdChiTietHoaDon574.jsp?id=${hoaDon.id}'" style="cursor: pointer;">
                <td>${status.index + 1}</td>
                <td>${hoaDon.thoiGian}</td>
                <td>${hoaDon.trangThai}</td>
                <td><fmt:formatNumber value="${hoaDon.tongTien}" type="number" maxFractionDigits="0" /> VND</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<button type="button" name="back" onclick="history.back()">Quay lại</button>
</body>
</html>
