<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 계획 목록</title>
<style>
    body {
        display: flex;
        justify-content: center;
        padding-top: 50px;
        min-height: 100vh;
        margin: 0;
        background-color: #f0f2f5;
        font-family: 'Malgun Gothic', sans-serif;
    }

    .container {
        width: 80%;
        max-width: 1000px;
        background-color: #ffffff;
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }

    .header-box {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
    }

    h2 { color: #1a73e8; margin: 0; }
    
    .btn-add {
        padding: 12px 25px;
        background-color: #1a73e8;
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-weight: bold;
        transition: 0.3s;
    }

    .btn-add:hover { background-color: #1557b0; }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        padding: 15px;
        text-align: center;
        border-bottom: 1px solid #eee;
    }

    th { background-color: #f8f9fa; color: #555; }

    .no-data {
        padding: 80px 0;
        color: #888;
        font-size: 1.1em;
    }
</style>
</head>
<body>

    <div class="container">
        <div class="header-box">
            <h2>✈️ 나의 <span>여행 계획</span></h2>
            <a href="/travel/insertForm" class="btn-add">새 여행 등록</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th width="10%">번호</th>
                    <th width="40%">여행 제목</th>
                    <th width="20%">목적지</th>
                    <th width="15%">여행 날짜</th>
                    <th width="15%">등록일</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty travelList}">
                        <c:forEach items="${travelList}" var="travel">
                            <tr>
                                <td>${travel.tno}</td>
                                <td>
                                    <a href="/travel/detail?tno=${travel.tno}" style="text-decoration:none; color:#1a73e8; font-weight:bold;">
                                        ${travel.title}
                                    </a>
                                </td>
                                <td>${travel.destination}</td>
                                <td><fmt:formatDate value="${travel.tripDate}" pattern="yyyy-MM-dd" /></td>
                                <td><fmt:formatDate value="${travel.regDate}" pattern="yyyy-MM-dd" /></td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="5" class="no-data">아직 등록된 여행 계획이 없습니다. 첫 여행을 등록해보세요!</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>

</body>
</html>