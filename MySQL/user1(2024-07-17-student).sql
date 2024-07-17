-- 여기는 USER1 으로 접속한 화면
USE mydb;
SELECT * 
FROM tbl_student;
-- S00001, 홍길동, 정보통신, 3, 
-- 010-1111-1111, 서울틀별시 데이터를
-- tbl_student 테이블에 INSERT 
DESC tbl_student;
INSERT INTO tbl_student(
	st_num,st_name,st_dept,st_grade,st_tel,st_addr
) VALUES (
	'S00001','홍길동','정보통신','3','010-1111-1111','서울특별시'
);
SELECT * FROM tbl_student;

-- 학번이 S00001 인 학생의 주소를
-- 서울특별시에서 '강원도 원주' 로 변경하기
UPDATE tbl_student
SET 
st_name = #{st_name},
st_dept = #{st_dept},
st_grade = '',
st_tel = '',
st_addr = ''
WHERE st_num = #{st_num};


