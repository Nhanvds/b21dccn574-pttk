<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng nhập</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .login-container {
            text-align: center;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        table {
            margin: 0 auto;
        }
        h4 {
            color: red;
        }
        h2 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="login-container">
    <%
        if (request.getParameter("err") != null &&
                request.getParameter("err").equalsIgnoreCase("timeout")) {
    %> <h4>Hết phiên làm việc. Làm ơn đăng nhập lại!</h4><%
} else if (request.getParameter("err") != null &&
        request.getParameter("err").equalsIgnoreCase("fail")) {
%> <h4>Sai tên đăng nhập/mật khẩu!</h4><%
    }
%>
    <h2>Đăng nhập</h2>
    <form name="dangnhap" action="doLogin.jsp" method="post">
        <table border="0">
            <tr>
                <td>Tên đăng nhập:</td>
                <td><input type="text" name="username" id="username" required/></td>
            </tr>
            <tr>
                <td>Mật khẩu:</td>
                <td><input type="password" name="password" id="password" required/></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Đăng nhập"/></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
