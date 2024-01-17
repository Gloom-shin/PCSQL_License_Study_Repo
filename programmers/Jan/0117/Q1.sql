-- 유저 정보 테이블, 온라인 판매 테이블
-- 년, 월, 성별 별로 상품을 구매한 회원수를 집계하는 SQL
-- 결과는 년, 월, 성별을 기준으로 오름차순 성별 정보가 없는 경우 결과에서 제외
-- 먼저 년월로 나눠서, user_id를 추출
with sale AS (
    SELECT DISTINCT YEAR(sales_date) as YEAR, MONTH(sales_date) as MONTH, USER_ID FROM ONLINE_SALE
    )
SELECT YEAR, MONTH, gender, count(u.USER_ID) as USERS FROM USER_INFO u
    JOIN sale
ON u.USER_ID = sale.USER_ID
WHERE gender IS NOT NULL
GROUP BY  YEAR, MONTH, gender
ORDER BY YEAR, MONTH, gender
