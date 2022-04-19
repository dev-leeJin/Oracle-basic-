CREATE TABLE reply_tbl(
    rno number(10,0),
    bno number(10,0) NOT NULL,
    reply varchar2(1000) NOT NULL,
    replyer varchar2(50) NOT NULL,
    replyDate date default sysdate,
    updateDate date default sysdate
    );
CREATE SEQUENCE reply_num;
alter table reply_tbl add CONSTRAINT pk_reply PRIMARY KEY(rno);

alter table reply_tbl add constraint 
    fk_reply foreign key (bno) references board_tbl(bno);
commit;