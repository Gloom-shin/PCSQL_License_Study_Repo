-- 코드를 입력하세요

-- 상태가 DONE이것만 모아서, WRITER_ID기준으로 SUM(PRICE)를 해야된다.
-- 이렇게 한 테이블의 반환값은 사용자 ID와 총금액

-- User 테이블과 Join하고, 총금액 기준 오름차순으로 반환해야됨.

SELECT USER_ID, NICKNAME , TOTAL_SALES FROM USED_GOODS_USER
                                                JOIN
                                            (
                                                SELECT WRITER_ID, SUM(PRICE) AS TOTAL_SALES FROM USED_GOODS_BOARD
                                                WHERE (USED_GOODS_BOARD.STATUS = 'DONE')
                                                GROUP BY WRITER_ID
                                                HAVING TOTAL_SALES >= 700000
                                            ) AS TOTAL ON USED_GOODS_USER.USER_ID = TOTAL.WRITER_ID

ORDER BY TOTAL_SALES