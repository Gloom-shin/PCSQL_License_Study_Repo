-- FOOD_PRODUCT, FOOD_ORDER 테이블
-- PRODUCE_DATE => 생산일자가 2022/05
-- 식품 ID, 식품 이름, 총매출을 조회하는 SQL문
-- 총매출(AMOUNT * PRICE)


with am as (SELECT PRODUCT_ID, sum(AMOUNT) as AMOUNT
            FROM FOOD_ORDER
            WHERE DATE_FORMAT(PRODUCE_DATE, '%Y-%m') = '2022-05'
            GROUP BY PRODUCT_ID)
SELECT f.PRODUCT_ID, PRODUCT_NAME, (AMOUNT * price) as TOTAL_SALES
FROM FOOD_PRODUCT f
         JOIN am
              ON f.PRODUCT_ID = am.PRODUCT_ID
ORDER BY TOTAL_SALES desc, PRODUCT_ID