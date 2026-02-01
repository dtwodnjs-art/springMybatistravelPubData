<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 실패</title>
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-color: #fff5f5;
        font-family: 'Malgun Gothic', sans-serif;
    }
    .result-box {
        text-align: center;
        background: white;
        padding: 50px;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }
    .icon { font-size: 50px; color: #e74c3c; margin-bottom: 20px; }
    h2 { color: #333; margin-bottom: 10px; }
    p { color: #e74c3c; font-weight: bold; margin-bottom: 30px; }
    
    .btn-retry {
        padding: 12px 30px;
        background-color: #555;
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-weight: bold;
    }
</style>
</head>
<body>
    <div class="result-box">
        <div class="icon">❌</div>
        <h2>등록에 실패했습니다.</h2>
        <p>${message}</p>
        <a href="javascript:history.back();" class="btn-retry">다시 입력하기</a>
    </div>
</body>
</html>