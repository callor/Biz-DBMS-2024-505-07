-- 여기는 root 로 접속한 화면

/*
SQL 명령의 3(4) 가지 종류

DDL(Data Definition Lang.) : 데이터 정의어
	DBA 권한의 사용자 주로 사용하는 명령
	CREATE * : 객체(Database, Table, Index.. 등)를 생성하는 명령
	DROP * : 객체를 제거하는 명령
DML(Data mnipulation Lang.) : 데이터 조작어
	CRUD(select, insert, update, delete)
DCL(Data Control Lang.) : 데이터 제어어
	GRANT, REVOKE
TCL(Transaction Control Lang.) :트랜잭션 제어어
	COMMIT, ROLLBACK, SAVEPOINT

*/


-- schoolDB 라는 Database 를 생성
CREATE DATABASE schoolDB;
-- database 가 잘 생성되었는지 확인
SHOW DATABASES;
-- schoolUser 라는 새로운 사용자를 생성하고
-- 비밀번호는 s1234 로 설정
-- 단, localhost 에서만 접근 가능
CREATE USER 'schooluser'@'localhost'
IDENTIFIED BY 's1234';
-- scholUser 사용자에게 
-- schoolDB의 모든 테이블에 대하여
-- 관리자 권한을 부여하기
GRANT ALL PRIVILEGES ON schoolDB.*
TO 'schooluser'@'localhost';
-- 사용자의 권한이 무엇인가 확인하기
SHOW GRANTS FOR 'schooluser'@'localhost';
-- 사용자의 권한을 회수하기
REVOKE ALL PRIVILEGES ON schoolDB.* 
FROM 'schooluser'@'localhost';

-- workbench 홈 화면에 schooluser 의 
-- 접속 프로파일을 생성


