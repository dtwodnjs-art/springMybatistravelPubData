<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 여행 계획 등록</title>
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        background-color: #f0f2f5;
        font-family: 'Malgun Gothic', sans-serif;
    }

    .container {
        width: 80%;
        max-width: 700px;
        background-color: #ffffff;
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }

    h2 { text-align: center; color: #1a73e8; margin-bottom: 30px; }
    h2 span { color: #34a853; }

    .form-group { margin-bottom: 20px; }
    label { display: block; margin-bottom: 8px; font-weight: bold; color: #555; }
    
    input[type="text"], 
    input[type="date"], 
    select, 
    textarea {
        width: 100%;
        padding: 12px;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-sizing: border-box;
        font-size: 16px;
    }

    textarea { height: 120px; resize: none; }

    .btn-area { text-align: center; margin-top: 30px; }
    
    .btn {
        padding: 12px 35px;
        margin: 0 5px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
        text-decoration: none;
        display: inline-block;
    }

    .btn-submit { background-color: #1a73e8; color: white; }
    .btn-cancel { background-color: #9e9e9e; color: white; }

    .btn:hover { opacity: 0.8; transform: translateY(-2px); }
</style>
</head>
<body>

    <div class="container">
        <h2>✈️ 새 여행 <span>계획 세우기</span></h2>
        <hr style="border: 0; height: 1px; background: #eee; margin-bottom: 30px;">

        <form action="/travel/insert" method="post">
            
            <div class="form-group">
                <label>여행 제목</label>
                <input type="text" name="title" placeholder="예: 우정 가득 제주도 여행" required>
            </div>

            <div class="form-group">
                <label>목적지</label>
                <input type="text" name="destination" placeholder="예: 제주도 서귀포시" required>
            </div>

            <div class="form-group">
                <label>여행 날짜</label>
                <input type="date" name="tripDate" required>
            </div>

            <div class="form-group">
                <label>이동 수단</label>
                <select name="transport">
                    <option value="비행기">비행기 ✈️</option>
                    <option value="기차">기차 🚂</option>
                    <option value="자동차">자동차 🚗</option>
                    <option value="버스">버스 🚌</option>
                    <option value="배">배 🚢</option>
                    <option value="기타">기타</option>
                </select>
            </div>

            <div class="form-group">
                <label>상세 계획 / 메모</label>
                <textarea name="description" placeholder="꼭 가야 할 맛집이나 관광지를 적어보세요!"></textarea>
            </div>

            <div class="btn-area">
                <button type="submit" class="btn btn-submit">등록하기</button>
                <a href="/travel/list" class="btn btn-cancel">취소</a>
            </div>
        </form>
    </div>

</body>
</html>