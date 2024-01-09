-- 코드를 입력하세요
-- 조회수 가장 높은 게시물을 찾아 -> 경로+file_iid+file_name+ext
SELECT concat("/home/grep/src/", BOARD_ID, "/", FILE_ID, FILE_NAME, FILE_EXT) AS FILE_PATH
FROM USED_GOODS_FILE
WHERE USED_GOODS_FILE.BOARD_ID = (SELECT USED_GOODS_BOARD.BOARD_ID FROM USED_GOODS_BOARD ORDER BY VIEWS DESC LIMIT 1)
ORDER BY FILE_ID DESC
