<%@ page import="com.pttk.garaman.model.DichVu574" %>
<%@ page import="com.pttk.garaman.model.PhuTung574" %>
<%@ page import="com.pttk.garaman.dao.DichVuDAO574" %>
<%@ page import="com.pttk.garaman.dao.PhuTungDAO574" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chi Tiết</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f9f9f9;
        }

        .container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            color: #555;
            margin: 10px 0;
        }

        a.back-button {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            font-size: 16px;
            color: #4CAF50;
            border: 1px solid #4CAF50;
            padding: 10px 20px;
            border-radius: 5px;
            transition: all 0.3s ease-in-out;
        }

        a.back-button:hover {
            background-color: #4CAF50;
            color: #fff;
        }
    </style>
</head>
<body>
<%
    PhuTungDAO574 phuTungDAO574 = new PhuTungDAO574();
    PhuTung574 phuTung = phuTungDAO574.layChiTietPhuTungTheoId(Integer.parseInt(request.getParameter("id")));
    request.setAttribute("chiTiet", phuTung);

%>
<button type="button" name="back" onclick="history.back()">Quay lại</button>
<div class="container">
    <h1>Chi Tiết</h1>
    <p><strong>Tên Phụ Tùng:</strong> ${chiTiet.ten}</p>
    <p><strong>Giá:</strong> <fmt:formatNumber value="${chiTiet.gia}" type="number" maxFractionDigits="0"/> VND
    </p>
    <p><strong>Số Lượng Còn Lại:</strong> ${chiTiet.slCon}</p>
    <p><strong>Mô tả:</strong> ${chiTiet.moTa}</p>

</div>
</body>
</html>
