# 기부 도서관 (SKU Library) 📚

## 주요 설명
- 데이터베이스를 활용한 도서관 시스템: MSSQL을 활용한 도서 관리, 대출/반납, 회원 관리가 가능한 종합 도서관 관리 시스템
- 해당 프로젝트는 미디어소프트웨어학과 기말고사 대체시험으로 8개의 팀 중 1등(만점)을 달성.

### 팀 구성
- **팀장**: 김민석
- **팀원**: 송채현, 이도현

### 작업 기간
- 2024년 11월 한 달

### 개발 환경
- Windows

---

## 기술 스택
- **Backend**:
  - MSSQL (데이터베이스)
  - JDBC (데이터베이스 연동)
  - Apache Tomcat (웹 서버)
  - JSP (Java Server Pages)

---

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

---

## 데이터베이스 설계

### ERD 구조
![ERD 설계](https://github.com/user-attachments/assets/c45b4547-efb8-4b18-a0ed-41eeddc08e39)

### 데이터베이스 스키마
![DB 스키마 1](https://github.com/user-attachments/assets/06571362-2d76-4377-8780-cad53eb15bc3)
![DB 스키마 2](https://github.com/user-attachments/assets/cd9a1198-ec35-4172-b269-ea73cd46ac60)
![DB 스키마 3](https://github.com/user-attachments/assets/5b6c0850-3eec-4964-b153-c933f3ef33ce)

---

## 주요 화면 구성

### 1. 메인 화면 및 조회 기능
| 메인 화면 |  |
|-----------|----------------|
| ![메인 화면](https://github.com/user-attachments/assets/6bf7c99f-46b6-46cb-b554-8b1080ed4b26) |

### 2. 회원 가입 및 로그인 기능
| 회원 가입 | 로그인 화면 |
|-----------|--------------|
| ![회원 가입](https://github.com/user-attachments/assets/55ce6f97-dbd3-4ad5-b0ed-7c1a83b7070b) | ![로그인 화면](https://github.com/user-attachments/assets/1f512b21-080c-4612-a607-23903474e286) |

### 3. 도서 관리 및 검색 기능
| 도서 검색 | 도서 추가 |
|-----------|------------|
| ![도서 검색](https://github.com/user-attachments/assets/748f684b-d80c-407f-a719-de0b5e57dab1) | ![도서 추가](https://github.com/user-attachments/assets/e2a93ad7-d971-4eb7-bd1c-c6a7af601108) |
| 추가된 책 조회 | 책 수정 |
|----------------|------------|
| ![추가된 책 조회](https://github.com/user-attachments/assets/63eab0bb-17d7-4e97-8026-0aa6cbeb5bbc) | ![책 수정](https://github.com/user-attachments/assets/ca1c4ed8-b6e5-4ffa-b266-b99208332088) |

### 4. 책 삭제 및 대출 기능
| 책 삭제 | 도서 대출 |
|---------|-----------|
| ![책 삭제](https://github.com/user-attachments/assets/4dc13413-bb3b-4e37-8e29-e27aac794893) | ![도서 대출](https://github.com/user-attachments/assets/e2b428c1-3406-42b1-a526-14b90fd9bbad) |

### 5. 대출 이력 및 대출 책 조회
| 대출 이력 | 대출 책 조회 |
|-----------|--------------|
| ![대출 이력](https://github.com/user-attachments/assets/98e2ef43-6e9d-4ad4-8728-3ac484ac6545) | ![대출 책 조회](https://github.com/user-attachments/assets/57a86683-caf0-4305-b670-8196e227d8c9) |

