![image](https://github.com/user-attachments/assets/1f512b21-080c-4612-a607-23903474e286)# 기부 도서관(SKU Library) 📚

## 주요 설명
- **데이터베이스를 활용한 도서관 시스템**: MSSQL을 활용한 도서 관리, 대출/반납, 회원 관리가 가능한 종합 도서관 관리 시스템
- 해당 프로젝트는 미디어소프트웨어학과 기말고사 대체시험으로 8개의 팀중 1등(만점)을 달성.
- **팀 구성**: 
  - 팀장: 김민석
  - 팀원: 송채현, 이도현
- **작업 기간**: 2024-11월 한달.
- **개발 환경**: Windows

## 기술 스택
- **Backend**:
  - MSSQL (데이터베이스)
  - JDBC (데이터베이스 연동)
  - Apache Tomcat (웹 서버)
  - JSP (Java Server Pages)

## 주요 기능
### 1. 도서 관리 시스템
- 도서 등록, 수정, 삭제 기능
- 도서 검색 (제목, 저자, 장르별)
- 도서 상태 관리 (대출 가능/불가)

### 2. 회원 관리 시스템
- 회원 가입 및 로그인
- 회원 정보 관리
- 사용자별 대출 이력 관리

### 3. 대출/반납 시스템
- 도서 대출 처리
- 반납 처리
- 대출 현황 조회

### 4. 데이터베이스 구조
- **Books123 테이블**: 
  - 도서 정보 (ID, 제목, 저자, 장르, ISBN 등)
  - 도서 상태 관리
- **Users 테이블**: 
  - 회원 정보 관리
  - 로그인 인증
- **Loans 테이블**:
  - 대출 정보 관리
  - 대출 이력 추적

## 프로젝트 특징
1. **체계적인 DB 설계**
   - FDD(Feature Driven Development) 방식의 데이터베이스 설계
   - 정규화를 통한 데이터 무결성 보장
   - 외래키를 활용한 테이블 간 관계 설정

2. **사용자 중심 인터페이스**
   - 직관적인 도서 검색 시스템
   - 효율적인 대출/반납 프로세스
   - 사용자 친화적 UI/UX

3. **보안 기능**
   - 사용자 인증 시스템
   - 접근 권한 관리

## MSSQL 서버 연결 문제 해결

-TCP/IP 포트 충돌 문제 발생 시:
  SQL Server Configuration Manager에서 TCP/IP 프로토콜 활성화
-VMWARE나 HYPER-V가 활성화되어 있을 경우 연결 충돌 발생 → 비활성화 필요


## 시스템 아키텍처
1. 프론트엔드: JSP 페이지
2. 백엔드: Java 기반 비즈니스 로직
3. 데이터베이스: MSSQL Server

이 프로젝트는 도서관의 효율적인 운영을 위한 종합 관리 시스템으로, 도서 관리부터 회원 관리, 대출/반납까지 모든 도서관 운영에 필요한 핵심 기능들을 포함하고 있습니다.

## 데이터베이스 설계
### ERD 구조
<div align="center">
  <img src="./images/erd.png" alt="ERD 설계" width="800"/>
</div>

### 데이터베이스 스키마
<div align="center">
  <img src="./images/db_schema1.png" alt="DB 스키마1" width="800"/>
  <img src="./images/db_schema2.png" alt="DB 스키마2" width="800"/>
  <img src="./images/db_schema3.png" alt="DB 스키마3" width="800"/>
</div>

## 주요 기능

### 1. 메인 화면 및 조회 기능
<div align="center">
  <img src="./images/main_screen.png" alt="메인 화면" width="600"/>
</div>

### 2. 회원 가입 기능
<div align="center">
  <img src="./images/signup.png" alt="회원가입" width="600"/>
</div>

### 3. 로그인 기능
<div align="center">
  <img src="./images/login.png" alt="로그인" width="600"/>
</div>

### 4. 검색 기능
<div align="center">
  <img src="./images/search.png" alt="검색" width="600"/>
</div>

### 5. 책 추가 기능
<div align="center">
  <img src="./images/add_book.png" alt="책 추가" width="600"/>
</div>

### 6. 내가 추가한 책 조회 기능
<div align="center">
  <img src="./images/my_books.png" alt="내 책 조회" width="600"/>
</div>

### 7. 추가한 책 수정 기능
<div align="center">
  <img src="./images/edit_book.png" alt="책 수정" width="600"/>
</div>

### 8. 추가한 책 삭제 기능
<div align="center">
  <img src="./images/delete_book.png" alt="책 삭제" width="600"/>
</div>

### 9. 대출 기능
<div align="center">
  <img src="./images/loan1.png" alt="대출1" width="600"/>
  <img src="./images/loan2.png" alt="대출2" width="600"/>
</div>

### 10. 내가 대출한 책 조회 기능
<div align="center">
  <img src="./images/my_loans.png" alt="대출 조회" width="600"/>
</div>
