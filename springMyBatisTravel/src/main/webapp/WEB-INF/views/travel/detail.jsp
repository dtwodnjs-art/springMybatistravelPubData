<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 상세 정보</title>
<style>
    body { display: flex; justify-content: center; padding-top: 50px; background-color: #f0f2f5; font-family: 'Malgun Gothic'; }
    .container { width: 70%; background: white; padding: 40px; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
    h2 { color: #1a73e8; border-bottom: 2px solid #1a73e8; padding-bottom: 10px; }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    th { width: 20%; background-color: #f8f9fa; padding: 15px; border: 1px solid #ddd; text-align: left; }
    td { padding: 15px; border: 1px solid #ddd; }
    .btn-area { margin-top: 30px; text-align: right; }
    .btn { padding: 10px 20px; border-radius: 5px; text-decoration: none; font-weight: bold; margin-left: 5px; cursor: pointer; border: none; }
    .btn-modify { background-color: #34a853; color: white; }
    .btn-delete { background-color: #ea4335; color: white; }
    .btn-list { background-color: #5f6368; color: white; }
</style>
</head>
<body>
    <div class="container">
        <h2>📍 여행 상세 계획</h2>
        <table>
            <tr>
                <th>여행 제목</th>
                <td>${travel.title}</td>
            </tr>
            <tr>
                <th>목적지</th>
                <td>${travel.destination}</td>
            </tr>
            <tr>
                <th>여행 날짜</th>
                <td><fmt:formatDate value="${travel.tripDate}" pattern="yyyy년 MM월 dd일" /></td>
            </tr>
            <tr>
                <th>이동 수단</th>
                <td>${detail.transport}</td>
            </tr>
            <tr>
                <th>상세 계획</th>
                <td style="height: 100px; vertical-align: top;">${detail.description}</td>
            </tr>
            <tr>
                <th>등록일</th>
                <td><fmt:formatDate value="${travel.regDate}" pattern="yyyy-MM-dd HH:mm" /></td>
            </tr>
        </table>

        <div class="btn-area">
            <a href="/travel/modifyForm?tno=${travel.tno}" class="btn btn-modify">수정하기</a>
            <a href="/travel/remove?tno=${travel.tno}" class="btn btn-delete" onclick="return confirm('정말 삭제하시겠습니까?')">삭제하기</a>
            <a href="/travel/list" class="btn btn-list">목록으로</a>
        </div>
    </div>
</body>
</html>