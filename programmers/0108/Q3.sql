-- 코드를 입력하세요
-- 조건:  게시물 3건 이상
-- 조회: 사용자 ID, 닉네임, 전체주소(시 ,도로명, 상세주소), 전화번호 (xxx-xxxx-xxxx)
-- 정렬 : USER_ID 내림차순
SELECT USER_ID , NICKNAME, CONCAT(CITY, " ",STREET_ADDRESS1," ", STREET_ADDRESS2) AS 전체주소 , CONCAT(SUBSTRING(TLNO,1,3) ,'-', SUBSTRING(TLNO,4,4) ,'-',SUBSTRING(TLNO,8)) AS 전화번호
FROM USED_GOODS_USER
WHERE EXISTS(USED_GOODS_USER.USER_ID =
             (
                 SELECT WRITER_ID
                 FROM USED_GOODS_BOARD
                 GROUP BY WRITER_ID
                 HAVING COUNT(USED_GOODS_BOARD.WRITER_ID) >= 3
             )
)
ORDER BY USER_ID DESC