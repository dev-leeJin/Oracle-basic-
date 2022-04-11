alter sequence board_num nocache;
-- 20�� �����ϴ°� ����. 

SELECT * FROM board_tbl ORDER BY bno desc;

SELECT * FROM board_tbl WHERE bno=5;

INSERT INTO board_tbl(bno, title, content, writer)
(SELECT board_num.nextval, title, content, writer from board_tbl);
-- ����¡ ó���� ���� �Խù� ���� ���ϱ޼������� �ø���.

commit;

SELECT
/*+ INDEX_DESC(board_tbl pk_board) */
* FROM board_tbl;

SELECT
/*+ INDEX_DESC(board_tbl pk_board) */
rownum, rowid, board_tbl.* FROM board_tbl WHERE bno BETWEEN 327674 AND 327684;


SELECT /*+ INDEX_DESC(board_tbl pk_board) */
rownum rn, board_tbl.* from board_tbl WHERE rownum <=20;
-- rownum�� 20�� �̸��� ������ �ϴ� ����
-- rn���� �������� ������ ��� �ٲ��� ����

SELECT * FROM
(SELECT /*+ INDEX_DESC(board_tbl pk_board) */
rownum rn, board_tbl.* from board_tbl WHERE rownum <=10) --(���� * ��������۰���)
WHERE rn > 0;-- ((����-1)*�������� �۰���)
-- ����¡ ó���� ���� ���� (1������) 