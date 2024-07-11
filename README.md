# DBMS(DataBase Management System)

- DB(데이터 저장소)를 관리하는 시스템, 서버
- DB Server 라고도 한다.
- Oralce, MySQL, MSSQL, Progress, Cubrid 등과 같은 이름으로 배포되는 소프트웨어이며, 데이터 저장소를 관리하는 SW 시스템

## 데이터 모델링

- DBMS 를 사용하여 데이터를 관리하기 위하여 데이터 저장소에 저장할 Table 을 설계하는 것

### 데이터 모델링 단계

1. 데이터 추상화 : Table 을 만들때 어떤 항목을 모아서 테이블을 만들 것인가
2. 개념적 모델링 : Diagram을 그려서 데이터의 모양을 그림으로 표현하는 것
3. 논리적 모델링 : 자연어를 사용하여 테이블을 만들어 보는 것
4. 물리적 모델링 : 실제 Table 을 만들기 위하여 생성하는 것

## DB 개념모델링

- 추상화된 DB Table 을 `Diagram` 으로 표현하는 설계 모델링
- 개념모델링에서 그리는 Diagram을 `Entity-Relation Diagram`, 줄여서 `ERD` 또는 `ER-Diargam` 이라고 한다.
- `Entity` : DBMS 에서 Table 에 해당하는 개념
- `Attribute` : Table 에 소속 각 칼럼
- `Relation` : `Entity`와 `Entity` 가 서로 연결된 상태의 Table

## DB 논리적 모델링

- 개념적 모델링된 데이터 정보를 물리적 모델링하기 전에 자연어로 칼럼을 설정해보는 단계
