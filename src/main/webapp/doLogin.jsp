<%@ page import="com.pttk.garaman.model.ThanhVien574" %>
<%@ page import="com.pttk.garaman.dao.ThanhVienDAO574" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 11/16/2024
  Time: 8:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  String username = (String)request.getParameter("username");
  String password = (String)request.getParameter("password");
  ThanhVien574 tv = new ThanhVien574();
  tv.setUsername(username);
  tv.setPassword(password);
  ThanhVienDAO574 thanhVienDAO = new ThanhVienDAO574();
  ThanhVien574 thanhVien = thanhVienDAO.login(tv);
  if(Objects.nonNull(thanhVien) && (thanhVien.getVaiTro().equalsIgnoreCase("khachhang"))){
    session.setAttribute("khachhang", thanhVien);
    response.sendRedirect("view/kh/gdChinhKH574.jsp");
  }else if(Objects.nonNull(thanhVien) && (thanhVien.getVaiTro().equalsIgnoreCase("nv"))){
    session.setAttribute("nv", thanhVien);
    response.sendRedirect("view/nvql/gdChinhQL574.jsp");
  }else{
    response.sendRedirect("login.jsp?err=fail");
  }
%>

</body>
</html>
