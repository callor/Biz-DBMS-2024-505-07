-- ORACLE 12 에서 사용할 수 있는 AUTO INCREMENT
CREATE TABLE tbl_test (
  ID NUMBER GENERATED ALWAYS AS IDENTITY
  (START WITH 1000 INCREMENT BY 1),
  name nvarchar2(100)

);

insert into tbl_test(name) values('홍길동');
insert into tbl_test(name) values('이몽룡');
insert into tbl_test(name) values('성춘향');
insert into tbl_test(name) values('장길산');

commit ;
SELECT * FROM tbl_test ;

--  system guid를 활용한 임의의 값 설정
-- raw 이진데이터 최대 2000 byte
-- raw(16) : 16진수 이진 데이터

SELECT LENGTH(SYS_GUID()) FROM DUAL;

DROP TABLE tbl_guid ;
CREATE TABLE tbl_guid (
  -- emp_id RAW(16) DEFAULT SYS_GUID() PRIMARY KEY,
  emp_id nVARCHAR2(32) DEFAULT SYS_GUID() PRIMARY KEY,
  name nVARCHAR2(30)
);

insert into tbl_guid(name) values('홍길동');
insert into tbl_guid(name) values('이몽룡');
insert into tbl_guid(name) values('성춘향');
insert into tbl_guid(name) values('장길산');

select * from tbl_guid ;
