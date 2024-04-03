/************************* 시퀀스 *************************/
DROP SEQUENCE USER_SEQ;
DROP SEQUENCE ACCESS_HISTORY_SEQ;
DROP SEQUENCE LEAVE_USER_SEQ;
DROP SEQUENCE BBS_SEQ;

CREATE SEQUENCE USER_SEQ NOCACHE;
CREATE SEQUENCE ACCESS_HISTORY_SEQ NOCACHE;
CREATE SEQUENCE LEAVE_USER_SEQ NOCACHE;
CREATE SEQUENCE BBS_SEQ NOCACHE;


/************************* 테이블 *************************/
DROP TABLE BBS_T;
DROP TABLE LEAVE_USER_T;
DROP TABLE ACCESS_HISTORY_T;
DROP TABLE USER_T;



-- 회원
CREATE TABLE USER_T (
  /* 회원번호(PK) */               USER_NO     NUMBER             NOT NULL,
  /* 이메일(인증수단) */           EMAIL       VARCHAR2(100 BYTE) NOT NULL UNIQUE,
  /* 암호화(SHA-256) */            PW          VARCHAR2(64 BYTE),
  /* 이름 */                       NAME        VARCHAR2(100 BYTE),
  /* 성별 */                       GENDER      VARCHAR2(5 BYTE),
  /* 휴대전화 */                   MOBILE      VARCHAR2(20 BYTE),
  /* 이벤트동의(0:안함,1:함) */    EVENT_AGREE NUMBER,
  /* 가입형태(0:직접,1:네이버) */  SIGNUP_KIND NUMBER,
  /* 비밀번호수정일 */             PW_MODIFY_DT DATE,
  /* 가입일 */                     SIGNUP_DT DATE,
  CONSTRAINT PK_USER PRIMARY KEY(USER_NO)
);

-- 접속 기록
CREATE TABLE ACCESS_HISTORY_T (
  ACCESS_HISTORY_NO NUMBER             NOT NULL,
  EMAIL             VARCHAR2(100 BYTE),
  IP                VARCHAR2(50 BYTE),
  USER_AGENT        VARCHAR2(150 BYTE),
  SESSION_ID        VARCHAR2(32 BYTE),
  SIGNIN_DT         DATE,
  SIGNOUT_DT        DATE,
  CONSTRAINT PK_ACCESS_HISTORY PRIMARY KEY(ACCESS_HISTORY_NO),
  CONSTRAINT FK_ACCESS_HISTORY_USER
    FOREIGN KEY(EMAIL)
      REFERENCES USER_T(EMAIL)
        ON DELETE CASCADE
);

-- 탈퇴 회원
CREATE TABLE LEAVE_USER_T (
  LEAVE_USER_NO NUMBER             NOT NULL,
  EMAIL         VARCHAR2(100 BYTE) NOT NULL UNIQUE,
  LEAVE_DT      DATE,
  CONSTRAINT PK_LEAVE_USER PRIMARY KEY(LEAVE_USER_NO)
);

-- 계층형 게시판 (N차 답글)
CREATE TABLE BBS_T (
  BBS_NO      NUMBER              NOT NULL,
  CONTENTS    VARCHAR2(4000 BYTE) NOT NULL,
  USER_NO     NUMBER              NOT NULL,
  CREATE_DT   DATE                NULL,
  STATE       NUMBER              NULL,  -- 0:삭제, 1:정상
  DEPTH       NUMBER              NULL,  -- 0:원글, 1:댓글, 2:대댓글, ...
  GROUP_NO    NUMBER              NULL,  -- 원글과 원글에 달린 모든 댓글들은 동일한 GROUP_NO를 가짐
  GROUP_ORDER NUMBER              NULL,  -- 같은 GROUP_NO 내부에서 표시할 순서
  CONSTRAINT PK_BBS PRIMARY KEY(BBS_NO),
  CONSTRAINT FK_BBS_USER FOREIGN KEY(USER_NO)
    REFERENCES USER_T(USER_NO) ON DELETE CASCADE
);




-- 댓글형 게시판
/*
CREATE TABLE BLOG_T (
  BLOG_NO  NUMBER               NOT NULL,
  TITLE    VARCHAR2(1000 BYTE)  NOT NULL,
  CONTENTS VARCHAR2(4000 BYTE),
  HIT      NUMBER               DEFAULT 0,
  USER_NO  NUMBER               NOT NULL,
  CREATE_DT DATE,
  MODIFY_DT DATE,
  CONSTRAINT PK_BLOG PRIMARY KEY(BLOG_NO),
  CONSTRAINT FK_BLOG_USER FOREIGN KEY(USER_NO)
      REFERENCES USER_T(USER_NO) ON DELETE CASCADE
);
*/













/************************* 트리거 *************************/
/*
  1. DML (INSERT, UPDATE, DELETE) 작업 이후 자동으로 실행되는 데이터베이스 객체이다.
  2. 행 (ROW) 단위로 동작한다.
  3. 종류
    1) BEFORE : DML 동작 이전에 실행되는 트리거
    2) AFTER  : DML 동작 이후에 실행되는 트리거
  4. 형식
    CREATE [OR REPLACE] TRIGGER 트리거명
    BEFORE | AFTER
    INSERT OR UPDATE OR DELETE
    ON 테이블명
    FOR EACH ROW
    BEGIN
      트리거본문
    END;
*/

/*
  USER_T 테이블에서 삭제된 회원정보를 LEAVE_USER_T 테이블에 자동으로 삽입하는
  LEAVE_TRIGGER 트리거 생성하기
*/
CREATE OR REPLACE TRIGGER LEAVE_TRIGGER
  AFTER
  DELETE
  ON USER_T
  FOR EACH ROW
BEGIN
  INSERT INTO LEAVE_USER_T (
      LEAVE_USER_NO
    , EMAIL
    , LEAVE_DT
  ) VALUES (
      LEAVE_USER_SEQ.NEXTVAL
    , :OLD.EMAIL
    , CURRENT_DATE
  );
  -- COMMIT;  트리거 내에서는 오류가 있으면 ROLLBACK, 없으면 COMMIT 자동 처리
END;