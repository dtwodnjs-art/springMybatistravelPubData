<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 완료</title>
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-color: #f0f2f5;
        font-family: 'Malgun Gothic', sans-serif;
    }
    .result-box {
        text-align: center;
        background: white;
        padding: 50px;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }
    .icon { font-size: 50px; color: #34a853; margin-bottom: 20px; }
    h2 { color: #333; margin-bottom: 10px; }
    p { color: #666; margin-bottom: 30px; }
    
    .btn-home {
        padding: 12px 30px;
        background-color: #1a73e8;
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-weight: bold;
        transition: 0.3s;
    }
    .btn-home:hover { background-color: #1557b0; }
</style>
</head>
<body>
    <div class="result-box">
        <div class="icon">✅</div>
        <h2>등록 성공!</h2>
        <p>${message}</p>
        <a href="/travel/list" class="btn-home">목록으로 돌아가기</a>
    </div>
</body>
</html>