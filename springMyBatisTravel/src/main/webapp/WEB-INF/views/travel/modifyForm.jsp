<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 계획 수정</title>
<style>
    /* insertForm과 동일한 스타일 사용 */
    body { display: flex; justify-content: center; padding-top: 50px; background-color: #f0f2f5; font-family: 'Malgun Gothic'; }
    .container { width: 80%; max-width: 700px; background: white; padding: 40px; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
    h2 { color: #34a853; text-align: center; }
    .form-group { margin-bottom: 20px; }
    label { display: block; margin-bottom: 8px; font-weight: bold; }
    input, select, textarea { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 8px; box-sizing: border-box; }
    .btn-area { text-align: center; margin-top: 30px; }
    .btn { padding: 12px 30px; border-radius: 8px; font-weight: bold; cursor: pointer; border: none; text-decoration: none; display: inline-block; }
    .btn-submit { background-color: #34a853; color: white; }
    .btn-cancel { background-color: #9e9e9e; color: white; }
</style>
</head>
<body>
    <div class="container">
        <h2>📝 여행 계획 <span>수정하기</span></h2>
        <form action="/travel/modify" method="post">
            <input type="hidden" name="tno" value="${travel.tno}">

            <div class="form-group">
                <label>여행 제목</label>
                <input type="text" name="title" value="${travel.title}" required>
            </div>
            <div class="form-group">
                <label>목적지</label>
                <input type="text" name="destination" value="${travel.destination}" required>
            </div>
            <div class="form-group">
                <label>여행 날짜</label>
                <fmt:formatDate value="${travel.tripDate}" pattern="yyyy-MM-dd" var="fDate"/>
                <input type="date" name="tripDate" value="${fDate}" required>
            </div>
            <div class="form-group">
                <label>이동 수단</label>
                <select name="transport">
                    <option value="비행기" ${detail.transport == '비행기' ? 'selected' : ''}>비행기 ✈️</option>
                    <option value="기차" ${detail.transport == '기차' ? 'selected' : ''}>기차 🚂</option>
                    <option value="자동차" ${detail.transport == '자동차' ? 'selected' : ''}>자동차 🚗</option>
                    <option value="버스" ${detail.transport == '버스' ? 'selected' : ''}>버스 🚌</option>
                    <option value="배" ${detail.transport == '배' ? 'selected' : ''}>배 🚢</option>
                    <option value="기타" ${detail.transport == '기타' ? 'selected' : ''}>기타</option>
                </select>
            </div>
            <div class="form-group">
                <label>상세 계획</label>
                <textarea name="description">${detail.description}</textarea>
            </div>
            <div class="btn-area">
                <button type="submit" class="btn btn-submit">수정 완료</button>
                <a href="/travel/detail?tno=${travel.tno}" class="btn btn-cancel">취소</a>
            </div>
        </form>
    </div>
</body>
</html>