CREATE SEQUENCE board_num;  --오라클에 0으로 저장하는 변수를 생성
-- My sql에서는 SET @myval=5; 문법으로 변수를 생성했었음. 

CREATE TABLE board_tbl (
    bno number(10,0),
    title varchar2(200) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate
    );
alter table board_tbl add constraint pk_board primary key(bno);

INSERT INTO board_tbl (bno, title, content, writer) VALUES
    (board_num.nextval, '테스트글', '테스트본문', '글쓴이');
    -- .nextval을 통해 0부터 1씩 증가함. 

SELECT * FROM board_tbl;

-- commit 구문을 실행해야 비로서 데이터가 박재됨
commit; 

