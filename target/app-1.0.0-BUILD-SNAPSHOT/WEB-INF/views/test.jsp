<%--
  Created by IntelliJ IDEA.
  User: hangy
  Date: 2024-05-31
  Time: 오전 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>test</title>

    <link rel="stylesheet" href="<c:url value='/css/test.css'/> ">
</head>
<body>
<div id="wrap">

    <div class="outer">
        <img src="<c:url value='/img/test.jpg'/>" alt="">

        <div class="pan"></div>
        <div class="pan2"></div>
        <div class="border_box"></div>
        <h1>Warm Oscar</h1>
        <p>Oscar is a decet man. He used to clean porches with pleasure</p>
    </div>

</div>
</body>
</html>
