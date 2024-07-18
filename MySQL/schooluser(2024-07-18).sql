-- schooluser 로 접속한 화면
-- 학생정보테이블명세의 학생정보 sheet 를 다음조건으로 완성
-- 학번 : PK, 학생이름, 학과, 전화번호는 NOT NULL 로
-- 학생정보테이블명세.학생정보 sheet 를 기준으로
-- tbl_student 테이블을 생성
USE schoolDB;
CREATE TABLE tbl_student (
	st_num	VARCHAR(5)		PRIMARY KEY,
	st_name	VARCHAR(20)	NOT NULL,	
	st_dept	VARCHAR(20)	NOT NULL,	
	st_grade	TINYINT,		
	st_tel	VARCHAR(20)	NOT NULL,	
	st_addr	VARCHAR(125)		
);
DROP TABLE tbl_subject;
CREATE TABLE tbl_subject (
	sb_code	VARCHAR(5)	PRIMARY KEy,
	sb_name	VARCHAR(20)	NOT NULL,	
	sb_prof	VARCHAR(20)
);
CREATE TABLE tbl_score (
	sc_stnum VARCHAR(5),		
	sc_sbcode VARCHAR(5),	
	sc_score INT NOT NULL,		
	PRIMARY KEY(sc_stnum, sc_sbcode)	
);

SELECT * FROM tbl_student;
SELECT COUNT(*) FROM tbl_student;

SELECT * FROM tbl_subject;
SELECT * FROM tbl_score;
SELECT COUNT(*) FROM tbl_score;
/* 
학생정보, 성적정보, 과목정보 3개의 Table 을 JOIN 하여

학번 S0001 인 학생의 성적을 출력 : SELECTION
학번, 이름, 학과, 학년, 과목코드, 과목명, 점수 : PROJECTION
*/
CREATE VIEW view_scores
AS
(SELECT st_num AS 학번, st_name AS 이름, 
		st_dept AS 학과, st_grade AS 학년,
        sc_sbcode AS 과목코드,
        sb_name AS 과목명,
        sc_score AS 점수
FROM tbl_student ST
	LEFT JOIN tbl_score SC
		ON ST.st_num = SC.sc_stnum
	LEFT JOIN tbl_subject SB
		ON SC.sc_sbcode = SB.sb_code
);

SELECT *
FROM view_Scores
WHERE 학번 = 'S0001';

/*
전체 학생에 대한
각 학생별 총점을 계산하여 다음과 같이 출력

학번, 이름, 학과, 학년, 총점
*/
SELECT st_num, st_name, st_dept, st_grade,
		SUM(sc_score) 총점, AVG(sc_score) AS 평균
FROM tbl_student ST
	LEFT JOIN tbl_score SC
		ON ST.st_num = SC.sc_stnum
GROUP BY st_num,st_name, st_dept, st_grade;

-- 위(1)의 SQL 을 응용하여 각 학생의 평균이
-- 60점 이상, 69점 이하 인 학생들만 나열
-- 성적순으로 내림 차순정렬  
SELECT st_num, st_name, st_dept, st_grade,
		SUM(sc_score) 총점, AVG(sc_score) AS 평균
FROM tbl_student ST
	LEFT JOIN tbl_score SC
		ON ST.st_num = SC.sc_stnum
GROUP BY st_num,st_name, st_dept, st_grade
HAVING 평균 BETWEEN 60 AND 69;

-- 위(1) SQL 을 응용하여
-- 학년 3학년인 학생들의 
-- 학생별 총점과 평균을 구하고
-- 평균이 60 이상 69 이하인 리스트만 출력
SELECT st_num, st_name, st_dept, st_grade,
		SUM(sc_score) 총점, AVG(sc_score) AS 평균
FROM tbl_student ST
	LEFT JOIN tbl_score SC
		ON ST.st_num = SC.sc_stnum
WHERE st_grade = 3        
GROUP BY st_num,st_name, st_dept, st_grade
HAVING 평균 BETWEEN 60 AND 69;