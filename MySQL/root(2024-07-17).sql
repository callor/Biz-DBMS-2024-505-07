-- root 접속화면

-- MySQL의 데이터 저장소(Schema) 생성하기
CREATE DATABASE mydb;

--  myDB 데이터 저장소 사용승인 받기
USE mydb;
/*
MySQL의 데이터 칼럼 type
문자열은 CHAR, VARCHAR 가 있다
CHAR : 고정문자열, VARCHAR(가변문자열)
한글, 영문 구분없이 같은 type으로 저장 가능

정수형 TINYINT, SMALLINT, MEDIUMINT, INT, BIGINT
	   1Byte    2Byte    3Byte      4Byte 8Byte
실수형 FLOAT		DOUBLE, REAL

*/
CREATE TABLE tbl_student (
	st_num VARCHAR(6) PRIMARY KEY,
    st_name VARCHAR(20) NOT NULL,
    st_dept VARCHAR(20) NOT NULL,
    st_grade TINYINT NOT NULL,
    st_tel VARCHAR(20),
    st_addr VARCHAR(125)
);
-- 시스템에 어떤 데이터베이스(저장소)가 있는가
SHOW DATABASES;
-- mydb 데이터베이스를 사용하겠다
USE mydb;
-- mydb 데이터베이스에 어떤 테이블이 있는가
SHOW TABLES;
-- tbl_student 테이블의 구조를 보고싶다
DESCRIBE tbl_student;tbl_studenttbl_student
DESC tbl_student;

-- localhost 에서만 접근 가능한 user1 사용자를 생성하라
CREATE user 'user1'@'localhost' 
IDENTIFIED BY '12341234';
-- locahost 의 user1 은 mydb DATABASE의 모든 테이블(*)에
-- CRUD와 테이블생성, 테이블삭제 등 모든 권한을 실행할 수 있다.
GRANT ALL PRIVILEGES ON mydb.* 
TO 'user1'@'localhost' ;

DROP USER 'user'@'localhost';




