# ✈️ Travel Planning System (여행 계획 관리 시스템)

Spring Boot와 MyBatis를 활용하여 여행 계획을 세우고 상세 일정을 관리하는 웹 애플리케이션입니다. 
부모 테이블(기본 정보)과 자식 테이블(상세 정보)의 1:1 관계를 활용한 데이터 처리가 핵심입니다.

---

## 🚀 주요 기능

### 1. 여행 일정 관리 (CRUD)
- **등록**: 여행 제목, 목적지, 날짜 및 상세 이동수단과 계획을 동시에 저장합니다. (`@Transactional` 적용)
- **목록**: 등록된 모든 여행 계획을 최신순으로 확인합니다.
- **상세 보기**: 테이블 조인(Join)을 통해 기본 정보와 상세 일정을 한 화면에 보여줍니다.
- **수정**: 기존에 등록된 여행 정보를 자유롭게 수정합니다.
- **삭제**: 여행 계획 삭제 시 상세 정보까지 안전하게 함께 삭제됩니다. (Cascading Delete)

### 2. 스마트 검색
- **동적 SQL**: MyBatis의 `<if>` 태그를 사용하여 제목, 목적지, 전체 항목별 맞춤 검색 기능을 제공합니다.

---

## 🛠 사용 기술 스택

### Backend
- **Framework**: Spring Boot 3.x
- **Language**: Java 17
- **ORM/Library**: MyBatis, Lombok
- **Database**: Oracle Database

### Frontend
- **View**: JSP (JavaServer Pages)
- **Tag Library**: JSTL, Formatting (fmt)
- **Style**: CSS3 (White Clean Theme)

---

## 🗄 데이터베이스 구조 (ERD)

### 1. TRAVEL_INFO (부모 테이블)
| 컬럼명 | 타입 | 설명 |
| :--- | :--- | :--- |
| TNO | NUMBER (PK) | 여행 번호 (Sequence 사용) |
| TITLE | VARCHAR2(200) | 여행 제목 |
| DESTINATION | VARCHAR2(200) | 목적지 |
| TRIP_DATE | DATE | 여행 예정 날짜 |
| REGDATE | DATE | 등록일 |

### 2. TRAVEL_DETAIL (자식 테이블)
| 컬럼명 | 타입 | 설명 |
| :--- | :--- | :--- |
| TNO | NUMBER (PK/FK) | 여행 번호 (TRAVEL_INFO 참조) |
| TRANSPORT | VARCHAR2(50) | 이동 수단 (비행기, 기차 등) |
| DESCRIPTION | VARCHAR2(2000) | 상세 계획 및 메모 |

---

Oracle SQL Devloper
-- 1. 여행지 기본 정보 테이블 (부모)
CREATE TABLE travel_info (
    tno NUMBER PRIMARY KEY,            -- 여행 번호 (기본키)
    title VARCHAR2(200) NOT NULL,      -- 여행 제목 (예: 제주도 3박 4일)
    destination VARCHAR2(100) NOT NULL, -- 목적지 (예: 제주도 서귀포)
    trip_date DATE,                    -- 여행 예정일
    regdate DATE DEFAULT SYSDATE,      -- 등록일
    moddate DATE DEFAULT SYSDATE       -- 수정일
);

-- 2. 여행 상세 및 이동수단 테이블 (자식)
CREATE TABLE travel_detail (
    tno NUMBER,                        -- 여행 번호 (외래키)
    transport VARCHAR2(50),            -- 이동 수단 (비행기, 기차, 자동차, 배 등)
    description VARCHAR2(1000),        -- 상세 메모/계획
    CONSTRAINT fk_travel_detail FOREIGN KEY(tno) 
    REFERENCES travel_info(tno) ON DELETE CASCADE 
);

-- 3. 시퀀스 생성 
CREATE SEQUENCE seq_travel START WITH 1 INCREMENT BY 1;

select * from travel_info;

-- 첫 번째 여행 등록 (부모)
INSERT INTO travel_info (tno, title, destination, trip_date)
VALUES (seq_travel.NEXTVAL, '우정 가득 제주도 여행', '제주도 서귀포시', TO_DATE('2025-05-10', 'YYYY-MM-DD'));

-- 상세 정보 등록 (자식)
INSERT INTO travel_detail (tno, transport, description) 
VALUES (1, '비행기', '흑돼지 맛집 가기, 성산일출봉 가서 해돋이 보기');

-- 전체 목록 조회
SELECT tno, title, destination, trip_date, regdate FROM travel_info ORDER BY tno DESC;

-- 상세 정보 조인 조회
SELECT i.*, d.transport, d.description FROM travel_info i, travel_detail d 
WHERE i.tno = d.tno AND i.tno = 1;


-- 기본 정보 수정
UPDATE travel_info SET title = '수정된 제주도 여행', moddate = SYSDATE WHERE tno = 1;

-- 상세 정보 수정
UPDATE travel_detail SET transport = '렌터카' WHERE tno = 1;

-- 삭제 
DELETE FROM travel_info WHERE tno = 1;


## 💡 핵심 학습 포인트

1. **데이터 정합성**: `@Transactional`을 사용하여 두 개의 테이블에 데이터가 동시에 입력되거나 수정될 때의 안정성을 확보했습니다.
2. **MyBatis selectKey**: 부모 테이블에서 생성된 시퀀스 번호를 즉시 가져와 자식 테이블 등록 시 사용하는 로직을 구현했습니다.
3. **날짜 데이터 바인딩**: `@DateTimeFormat`을 활용하여 브라우저의 날짜 문자열을 자바의 `Date` 객체로 자동 변환하는 법을 익혔습니다.
4. **사용자 경험(UX)**: `confirm()` 함수를 통한 삭제 재확인, 검색 키워드 유지 기능 등을 통해 사용 편의성을 높였습니다.
