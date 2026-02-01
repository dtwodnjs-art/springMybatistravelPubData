<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 여행 계획 목록</title>
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
        width: 90%;
        max-width: 1100px;
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

    h2 { color: #1a73e8; margin: 0; font-size: 28px; }
    h2 span { color: #34a853; }
    
    /* 검색 바 스타일 */
    .search-area {
        background-color: #f8f9fa;
        padding: 20px;
        border-radius: 12px;
        margin-bottom: 30px;
        text-align: center;
    }

    .search-area select, .search-area input {
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 14px;
        outline: none;
    }

    .search-area input[type="text"] {
        width: 300px;
    }

    /* 버튼 스타일 */
    .btn {
        padding: 10px 20px;
        border-radius: 8px;
        font-weight: bold;
        text-decoration: none;
        cursor: pointer;
        transition: 0.3s;
        border: none;
        display: inline-block;
    }

    .btn-add { background-color: #1a73e8; color: white; }
    .btn-search { background-color: #5f6368; color: white; }
    .btn:hover { opacity: 0.8; transform: translateY(-1px); }

    /* 테이블 스타일 */
    table {
        width: 100%;
        border-collapse: collapse;
    }

    th {
        background-color: #f8f9fa;
        color: #555;
        padding: 15px;
        border-bottom: 2px solid #eee;
    }

    td {
        padding: 15px;
        text-align: center;
        border-bottom: 1px solid #eee;
        color: #333;
    }

    tr:hover { background-color: #fcfcfc; }

    .title-link {
        text-decoration: none;
        color: #1a73e8;
        font-weight: bold;
    }

    .title-link:hover { text-decoration: underline; }

    .no-data {
        padding: 100px 0;
        color: #888;
        font-size: 1.1em;
    }
</style>
</head>
<body>

    <div class="container">
        <div class="header-box">
            <h2>✈️ 나의 <span>여행 계획</span></h2>
            <a href="/travel/insertForm" class="btn btn-add">새 여행 등록</a>
        </div>

        <div class="search-area">
            <form action="/travel/search" method="get">
                <select name="searchType">
                    <option value="all" ${param.searchType == 'all' ? 'selected' : ''}>전체</option>
                    <option value="title" ${param.searchType == 'title' ? 'selected' : ''}>제목</option>
                    <option value="destination" ${param.searchType == 'destination' ? 'selected' : ''}>목적지</option>
                </select>
                <input type="text" name="keyword" value="${param.keyword}" placeholder="검색어를 입력하세요">
                <button type="submit" class="btn btn-search">검색하기</button>
                <c:if test="${not empty param.keyword}">
                    <a href="/travel/list" class="btn" style="background:#eee; color:#666; font-size:12px;">초기화</a>
                </c:if>
            </form>
        </div>

        <table>
            <thead>
                <tr>
                    <th width="8%">ID</th>
                    <th width="40%">여행 제목</th>
                    <th width="20%">목적지</th>
                    <th width="17%">여행 날짜</th>
                    <th width="15%">등록일</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty travelList}">
                        <c:forEach items="${travelList}" var="travel">
                            <tr>
                                <td>${travel.tno}</td>
                                <td style="text-align: left; padding-left: 30px;">
                                    <a href="/travel/detail?tno=${travel.tno}" class="title-link">
                                        ${travel.title}
                                    </a>
                                </td>
                                <td>📍 ${travel.destination}</td>
                                <td>📅 <fmt:formatDate value="${travel.tripDate}" pattern="yyyy-MM-dd" /></td>
                                <td><fmt:formatDate value="${travel.regDate}" pattern="yyyy-MM-dd" /></td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="5" class="no-data">
                                <c:if test="${not empty param.keyword}">
                                    '${param.keyword}'에 대한 검색 결과가 없습니다.
                                </c:if>
                                <c:if test="${empty param.keyword}">
                                    아직 등록된 여행 계획이 없습니다. 첫 번째 계획을 세워보세요!
                                </c:if>
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>

</body>
</html>