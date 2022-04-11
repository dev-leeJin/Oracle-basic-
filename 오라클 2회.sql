alter sequence board_num nocache;
-- 20씩 증가하는걸 막음. 

SELECT * FROM board_tbl ORDER BY bno desc;

SELECT * FROM board_tbl WHERE bno=5;

INSERT INTO board_tbl(bno, title, content, writer)
(SELECT board_num.nextval, title, content, writer from board_tbl);
-- 페이징 처리를 위해 게시물 글을 기하급수적으로 늘리기.

commit;

SELECT
/*+ INDEX_DESC(board_tbl pk_board) */
* FROM board_tbl;

SELECT
/*+ INDEX_DESC(board_tbl pk_board) */
rownum, rowid, board_tbl.* FROM board_tbl WHERE bno BETWEEN 327674 AND 327684;


SELECT /*+ INDEX_DESC(board_tbl pk_board) */
rownum rn, board_tbl.* from board_tbl WHERE rownum <=20;
-- rownum이 20개 미만만 나오게 하는 구문
-- rn으로 정해주지 않으면 계속 바껴서 나옴

SELECT * FROM
(SELECT /*+ INDEX_DESC(board_tbl pk_board) */
rownum rn, board_tbl.* from board_tbl WHERE rownum <=10) --(숫자 * 페이지당글개수)
WHERE rn > 0;-- ((숫자-1)*페이지당 글갯수)
-- 페이징 처리를 위한 구문 (1페이지) 