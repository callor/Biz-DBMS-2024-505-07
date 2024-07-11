-- 여기는 Student TableSpace 를 관리하는 user1 화면입니다
/*
tbl_student table 을 다음 속성으로 테이블 생성하기

    학번 : st_num 문자열(10) PK
    이름 : st_name 한글문자열(20) NOT NULL
    학과 : st_dept 한글문자열(20) NOT NULL
    학년 : st_grade 숫자
    전화번호 : st_tel 문자열(20) NOT NULL

오라클의 문자열 type
CHAR, VARCHAR2, nVARCHAR2 
CHAR : 고정문자열, 길이가 일정한 문자열 데이터를 저장하기
    CHAR type 에 순수 숫자형문자열을 저장하면 SELECT 에서 문제를 일으키는 경우가 많다

VARCHAR2 : 순수 영,숫자형 문자열, 가변문자열, 저장하는 문자열이 칼럼의 크기보다 작으면
    공백을 제거하여 공간 낭비를 막는 형식
nVARCHAR2 : UTF-8 방식 영,숫자, 한글 등 2byte 문자열을 효과적으로 저장하기 위한 type

지금 현재의 DBMS 들은 대체로 영문, 한글 문자열을 특별히 구분하지 않고 처리를 한다.
현업에서 사용하는 오라클 DBMS 는 지금도 7,8,9 정도의 버전을 많이 사용한다

오라클 9 이하의 버전에 문자열의 type VARCHAR2, nVARCHAR2 로 명확히 구분을 하는데
만약 칼럼에 한글 "홍길동" 이 저장되어 있다면
VARCHAR2 는 문자열의 길이가 6으로 nVARCHAR2 는 문자열의 길이가 3으로 표현된다

현재 사용하는 21c 버전에서는 한글이나 영문의 문자열 길이를 실제 문자열의 개수로 표현한다
하지만 9 이전버전은 VARCHAR2 는 byte 크기로 표현하고, nVHARCHAR2 는 문자열의 길이로 표현하여
혼란을 준다
현재 버전에서 VARCHAR2 와 nVARCHAR2 를 구분하는 것은 호환성등을 위한 것이다

DB 버전에 따라 VARCHAR2 는 실제 길이보다 한글 문자열을 절반밖에 저장못하는 경우도 있디

*/
DROP TABLE tbl_student;
CREATE TABLE tbl_student (
    st_num VARCHAR2(10) PRIMARY KEY,
    st_name nVARCHAR2(20) NOT NULL,
    st_dept nVARCHAR2(20) NOT NULL,
    st_grade NUMBER,
    st_tel VARCHAR2(20) NOT NULL
);

/*
테이블에 다음 3개의 데이터 추가
    2400001, 홍길동, 정보통신, 3학년, 010-1111-1111
    2400002, 성춘향, 법학과, 2학년, 010-2222-2222
    2400003, 이몽룡, 행정학과, 4학년, 010-3333-3333
*/
/*
INSERT INTO 를 실행할때 전체칼럼에 일치하는 데이터를 추가할때
INSERT 되는 칼럼 리스트를 생략할수 있지만,
이는 데이터 무결성을 해칠수 있는 아주 위험한 코드이다 절대 사용 금지
*/
INSERT INTO tbl_student(st_num,st_name, st_dept, st_grade,st_tel)
VALUES('2400001', '홍길동', '정보통신', '3', '010-1111-1111');

INSERT INTO tbl_student(st_num,st_name, st_dept, st_grade,st_tel)
VALUES('2400002', '성춘향', '법학과', '2', '010-2222-2222');

INSERT INTO tbl_student(st_num,st_name, st_dept, st_grade,st_tel)
VALUES('2400003', '이몽룡', '행정학과', '4', '010-3333-3333');


SELECT LENGTH(st_name), LENGTH(st_dept) FROM tbl_student;

-- 아래의 INSERT 코드는 절대 사용하지 말자
-- INSERT INTO tbl_student 
-- VALUES('2400001', '010-1111-1111', '홍길동', '3', '정보통신');

SELECT st_name, st_grade FROM tbl_student;
SELECT * FROM tbl_student;


/*
학생테이블(tbl_student)에서 이몽룡 학생의 전화번호를
010-3333-3333 에서 010-333-3456 으로 변경하는 SQL 을 작성

UPDATE, DELETE 명령문은 2개이상의 레코드가 변경되지 않도록 실행해야 한다
학생테이블에서 이몽룡 학생의 전화번호를 변경하려면

1. 학생테이블에서 이몽룡 학생의 정보를 SELECT 한다
2. 변경하고자 하는 학생의 전화번호를 확인하고
3. 변경하고자 하는 학생의 학번을 확인한다
4. 학번을 기준으로 UPDATE, DELETE 실행한다
*/
SELECT * 
FROM tbl_student
WHERE st_name = '이몽룡' AND st_tel = '010-3333-3333';

-- 첫번째 SELECT 에서 데이터가 없으면
-- 이름으로 다시한번 SELECT 를 해 본다
SELECT *
FROM tbl_student
WHERE st_name = '이몽룡';

-- st_name 칼럼은 PK 도 아니며, UNIQUE 칼럼도 아니다
-- 이러한 일반적인 칼럼을 WHERE 절에 사용하여 UPDATE, DELETE 를 실행하면
-- 데이터 무결성을 보장 할수 없다
UPDATE tbl_student
SET st_tel = '010-3333-3456'
WHERE st_name = '이몽룡';

-- UPDATE, DELETE 를 실행하고자 하는 데이터의 PK 칼럼 값을 반드시 먼저 확인 한 후
-- PK 칼럼을 WHERE 절에 사용하여 실행해야 한다.
UPDATE tbl_student
SET st_tel = '010-3333-3456'
WHERE st_num = '240003';


DROP TABLE tbl_student;
CREATE TABLE tbl_student (
    st_num	VARCHAR2(5)		PRIMARY KEY,
    st_name	nVARCHAR2(20)	NOT NULL,	
    st_dept	nVARCHAR2(20)	NOT NULL,	
    st_grade	NUMBER,		
    st_tel	VARCHAR2(20)	NOT NULL,	
    st_addr	nVARCHAR2(125)		
);

SELECT * FROM tbl_student;
SELECT COUNT(*) FROM tbl_student;

-- 학생데이터 중에서 학과가 국사학과 인 학생의 리스트를 보여라
-- 전체 데이터중에서 특정한 조건(WHERE)을 부여하여 
-- 리스트의 일부만 출력하는 것을 SELECTION 이라고 한다
SELECT *
FROM tbl_student
WHERE st_dept = '국사학과';

-- 학생데이터 중에서 학생이름, 전화번호 항목만 보여주고 이름 순으로 정렬하여 보여라
-- 학생테이블 전체 칼럼(속성, Attribute)중에서 
-- 특정한 칼럼만 지정하여 화면에 보이도록 하는 것을 Projection 이라고 한다
SELECT st_name, st_tel
FROM tbl_student
ORDER BY st_name;









