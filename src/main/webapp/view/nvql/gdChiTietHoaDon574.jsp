<%@ page import="com.pttk.garaman.dao.HoaDonThanhToanDAO574" %>
<%@ page import="com.pttk.garaman.model.HoaDonThanhToan574" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chi Tiết Hóa Đơn</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
            text-align: left;
        }

        .section-title {
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
</head>

<body>
<%
    HoaDonThanhToanDAO574 hoaDonThanhToanDAO = new HoaDonThanhToanDAO574();
    HoaDonThanhToan574 hoaDonThanhToan = hoaDonThanhToanDAO.layHoaDonChiTietTheoId(Integer.parseInt(request.getParameter("id")));
    request.setAttribute("hoaDon", hoaDonThanhToan);
%>
<h1>Chi Tiết Hóa Đơn</h1>

<div>
    <p><strong>Thời gian:</strong>
        <fmt:formatDate value="${hoaDon.thoiGian}" pattern="dd-MM-yyyy HH:mm:ss" />
    </p>
    <p><strong>Trạng thái:</strong> ${hoaDon.trangThai}</p>
    <p><strong>Nhân viên bán hàng:</strong> ${hoaDon.nvBanHang.hoTen} (${hoaDon.nvBanHang.username})</p>
    <p><strong>Khách hàng:</strong> ${hoaDon.khachHang.hoTen} (${hoaDon.khachHang.username})</p>
    <p><strong>Xe:</strong> Biển số - ${hoaDon.xe.bienSo}, Mô tả - ${hoaDon.xe.moTa}</p>
</div>

<div>
    <p class="section-title">Danh Sách Dịch Vụ</p>
    <table>
        <thead>
        <tr>
            <th>STT</th>
            <th>Tên Dịch Vụ</th>
            <th>Giá</th>
            <th>Số Lượng</th>
            <th>Tổng Tiền</th>
            <th>Kỹ Thuật Viên</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="hoaDonDichVu" items="${hoaDon.dsHoaDonDichVu}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${hoaDonDichVu.dichVu.ten}</td>
                <td><fmt:formatNumber value="${hoaDonDichVu.dichVu.gia}" type="number" maxFractionDigits="0" /> VND</td>
                <td>${hoaDonDichVu.soLuong}</td>
                <td><fmt:formatNumber value="${hoaDonDichVu.tongTien}" type="number" maxFractionDigits="0" /> VND</td>
                <td>${hoaDonDichVu.nvKyThuat.hoTen}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div>
    <p class="section-title">Danh Sách Phụ Tùng</p>
    <table>
        <thead>
        <tr>
            <th>STT</th>
            <th>Tên Phụ Tùng</th>
            <th>Giá</th>
            <th>Số Lượng</th>
            <th>Tổng Tiền</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="hoaDonPhuTung" items="${hoaDon.dsHoaDonPhuTung}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${hoaDonPhuTung.phuTung.ten}</td>
                <td><fmt:formatNumber value="${hoaDonPhuTung.phuTung.gia}" type="number" maxFractionDigits="0" /> VND</td>
                <td>${hoaDonPhuTung.soLuong}</td>
                <td><fmt:formatNumber value="${hoaDonPhuTung.tongTien}" type="number" maxFractionDigits="0" /> VND$</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<p><strong>Tổng hóa đơn:</strong>
    <fmt:formatNumber value="${hoaDon.tongTien}" type="number" maxFractionDigits="0" /> VND
</p>
<button type="button" name="back" onclick="history.back()">Quay lại</button>
</body>

</html>
